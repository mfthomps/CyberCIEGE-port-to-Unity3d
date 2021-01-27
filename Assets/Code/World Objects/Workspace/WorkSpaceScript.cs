using UnityEngine;

namespace Code.World_Objects.Workspace {
  public class WorkSpaceScript : MonoBehaviour {
    [SerializeField] private WorkSpace _data;

    public WorkSpace Data {
      get => _data;
      set => _data = value;
    }
  }
}