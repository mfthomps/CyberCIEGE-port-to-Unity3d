using UnityEngine;

namespace Code.World_Objects.Workspace {
  public class WorkSpaceScript : BaseWorldObject {
    [SerializeField] private WorkSpace _data;

    // ------------------------------------------------------------------------
    public override WorldObjectType Type() {
      return WorldObjectType.Workspace;
    }
    
    // ------------------------------------------------------------------------
    public WorkSpace Data {
      get => _data;
      set => _data = value;
    }
  }
}