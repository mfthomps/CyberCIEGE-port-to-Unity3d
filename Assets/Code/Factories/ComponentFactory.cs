using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using UnityEngine;

namespace Code.Factories {
  //A base Factor that handles the ComponentBehavior loading
  public class ComponentFactory : MonoBehaviour{
    public static Dictionary<string, ComponentBehavior> computer_dict = new Dictionary<string, ComponentBehavior>();
    
    //--------------------------------------------------------------------------
    protected void LoadComponent(string filePath, ComponentBehavior component, ref ComponentDataObject data) {
      
      try {
        StreamReader reader = new StreamReader(filePath, Encoding.Default);
        using (reader) {
          string tag;
      
          ccUtils.PositionAfter(reader, "Component");
          string value = null;
          do {
            value = ccUtils.SDTNext(reader, out tag);
            if (value == null)
              continue;
      
            switch (tag) {
              case "Name":
                data.component_name = value;
                computer_dict.Add(data.component_name, component);
                break;
              case "PosIndex":
                if (!int.TryParse(value, out data.position)) {
                  Debug.Log("Error: LoadComponent position " + value);
                }

                break;
              case "Network":
                MemoryStream stream = new MemoryStream(Encoding.UTF8.GetBytes(value ?? ""));
                string network_name = ccUtils.SDTField(stream, "Name");
                data.ConnectToNetwork(network_name);
                break;
            }
          } while (value != null);
        }
      }
      catch (Exception e) {
        Debug.LogError(e.ToString());
      }
    }
    
  }
}