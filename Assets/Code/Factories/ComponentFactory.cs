using System.Collections.Generic;
using System.Text.RegularExpressions;
using UnityEngine;
using Code.AccessControlGroup;

namespace Code.Factories {
  //A base Factor that handles the ComponentBehavior loading
  public class ComponentFactory : MonoBehaviour{
    
    
    //--------------------------------------------------------------------------
    protected void LoadComponent(string filePath, ComponentBehavior component, ComponentDataObject data) {
      ccUtils.ParseSDFFile(filePath, (tag, value) => {
        if (tag == "Component") {
          ccUtils.ParseSDFFileSubElement(value, (subTag, subValue) => {
            ProcessComponentProperty(component, data, subTag, subValue);
          });
        }
      });
    }

    //--------------------------------------------------------------------------
    protected virtual void ProcessComponentProperty(ComponentBehavior component, ComponentDataObject data, string tag, string value) {
      switch (tag) {
        case "Name":
          data.component_name = value;
          break;
        case "PosIndex":
          if (!int.TryParse(value, out data.position)) {
            Debug.Log($"Error: LoadComponent position {value}");
          }
          break;
        case "HW":
          data.hw = value;
          break;
        case "Network":
          string networkName = null;
          var accessors = new List<DACAccess>();
          ccUtils.ParseSDFFileSubElement(value, (subTag, subValue) => {
            switch (subTag) {
              case "Name":
                networkName = subValue;
                break;
              case "AccessList":
                var accessorStringMatches = Regex.Matches(subValue, @"(\w+)[ :end AccessMode: ]+(\w+)");
                foreach (Match accessor in accessorStringMatches) {
                  var accessorName = accessor.Groups[1].ToString();
                  var permissionsString = accessor.Groups[2].ToString();
                  accessors.Add(new DACAccess(accessorName, permissionsString));
                }
                break;
            }
          });
          if (!string.IsNullOrEmpty(networkName)) {
            data.ConnectToNetwork(networkName);
            data.networkDACAccessors.Add(networkName, accessors);
          }
          break;
      }
    }
  }
}