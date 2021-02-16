using Code;
using Code.Scriptable_Variables;
using Code.World_Objects;
using UnityEngine;

public abstract class ComponentBehavior : BaseWorldObject {
  [Header("Setup")]
  [Tooltip("The SkinnedMeshRender to use for rendering this Computer")]
  [SerializeField] private SkinnedMeshRenderer _renderer;
  
  [Header("Input Variables")]
  [SerializeField] private StringStringVariable _organizationDict;
  [Tooltip("The variable containing the list of all the Networks currently in the scenario.")]
  [SerializeField] private NetworkListVariable networkListVariable;

  public virtual ComponentDataObject Data { get; set; }

  //----------------------------------------------------------------------------
  public SkinnedMeshRenderer GetRenderer() {
    return _renderer;
  }
  
  // --------------------------------------------------------------------------
  public bool IsActiveComponent() {
    return true;
  }

  // ------------------------------------------------------------------------
  public void ConnectToNetwork(string network) {
    Data.ConnectToNetwork(network);
    ValueChanged();
  }

  // ------------------------------------------------------------------------
  public void DisconnectFromNetwork(string network) {
    Data.DisconnectFromNetwork(network);
    ValueChanged();
  }
}
