using UnityEngine;

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
          ccUtils.ParseSDFFileSubElement(value, (subTag, subValue) => {
            switch (subTag) {
              case "Name":
                data.ConnectToNetwork(subValue);
                break;
            }
          });
          break;
      }
    }
  }
}