using Code.Factories;
using Code.Scriptable_Variables;
using Code.World_Objects.Workspace;
using UnityEngine;

//Just a testing class to visualize different configurations of WorkSpace furniture.
public class WorkSpaceFactoryTestHarness : MonoBehaviour {
  [SerializeField] private  WorkspaceFactory _factory;
  [SerializeField] private StringStringVariable _organizationVariable;
  [SerializeField] private string _officeVersion = "MS3A";
  [SerializeField] private char _usage = 'A';
  [SerializeField] private int  _staringWorkSpaceIndex = 0;

  private void Awake() {
    _organizationVariable["MainOfficeVersion"] = _officeVersion;
  }

  //--------------------------------------------------------------------------
  private void Start() {
    int x = 0;
    int y = 0;
    char dir = 'W';
    char usage = _usage;
    
    
    Create(x, y, dir, usage, _staringWorkSpaceIndex, 1, 2);

    x += 10;
    y += 10;
    dir = 'N';
    _staringWorkSpaceIndex++;
    Create(x, y, dir, usage,  _staringWorkSpaceIndex, 2, 1);    
    
    x += 10;
    y -= 10;
    dir = 'E';
    _staringWorkSpaceIndex++;
    Create(x, y, dir, usage,  _staringWorkSpaceIndex, 1, 1);
    
    x -= 10;
    y -= 10;
    dir = 'S';
    _staringWorkSpaceIndex++;
    Create(x, y, dir, usage,  _staringWorkSpaceIndex, 2, 2);

  }

  //---------------------------------------------------------------------------
  private void Create(int x, int y, char dir, char usage, int workSpaceIndex, int random1, int random2) {
    var go = new GameObject();
    var behavior = go.AddComponent<WorkSpaceScript>();

    WorkSpace ws = new WorkSpace(x, y, dir, usage);
    behavior.Data = ws;

    var wsData = new WorkspaceFactory.WorkSpaceData(workSpaceIndex, false, random1, random2);
    _factory.SetupGameObject(behavior, wsData, workSpaceIndex);
  }
}
