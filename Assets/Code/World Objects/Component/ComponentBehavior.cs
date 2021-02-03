using Code;
using Code.Scriptable_Variables;
using Code.World_Objects;
using UnityEngine;

public abstract class ComponentBehavior : BaseWorldObject {
  [Header("Input Variables")]
  [SerializeField] private StringStringVariable _organizationDict;
  [Tooltip("The variable containing the list of all the Networks currently in the scenario.")]
  [SerializeField] private NetworkListVariable networkListVariable;

  public virtual ComponentDataObject Data { get; set; }
  
  private static ComponentBehavior current_component;

  // --------------------------------------------------------------------------
  // public static ComponentBehavior GetNextComponent() {
  //   ComponentBehavior first_component = null;
  //   bool gotit = false;
  //   foreach (KeyValuePair<string, ComponentBehavior> entry in ComponentFactory.computer_dict) {
  //     ComponentBehavior component = entry.Value;
  //     if (!component.IsActiveComponent())
  //       continue;
  //     if (gotit) {
  //       current_component = component;
  //       return component;
  //     }
  //
  //     if (first_component == null)
  //       first_component = component;
  //     if (current_component == null) {
  //       current_component = component;
  //       return component;
  //     }
  //
  //     if (component == current_component)
  //       gotit = true;
  //   }
  //   
  //   current_component = first_component;
  //   return first_component;
  // }

  // --------------------------------------------------------------------------
  public bool IsActiveComponent() {
    return true;
  }
}