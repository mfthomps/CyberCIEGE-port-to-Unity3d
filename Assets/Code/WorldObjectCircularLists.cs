using System.Collections.Generic;
using Code.World_Objects;

namespace Code {
  //Used to manage mapping of WorkObjectTypes to CircularLists of those objects
  public class WorldObjectCircularLists {
    private readonly Dictionary<WorldObjectType, CircularList<BaseWorldObject>> _circularLists = new Dictionary<WorldObjectType, CircularList<BaseWorldObject>>();

    //--------------------------------------------------------------------------
    //Supply the list of objects (by reference) and what type they are
    public void SetList(IEnumerable<BaseWorldObject> objects, WorldObjectType type) {
      var circList =  new CircularList<BaseWorldObject>();
      circList.SetList(objects);
      _circularLists[type] = circList;
    }

    //--------------------------------------------------------------------------
    //Get the next object in the list, give the type of WorldObject. 
    public BaseWorldObject GetNext(WorldObjectType type) {
      return _circularLists[type].GetNext();
    }

    //--------------------------------------------------------------------------
    //Get the previous object in the list, give the type of WorldObject
    public BaseWorldObject GetPrev(WorldObjectType type) {
      return _circularLists[type].GetPrev();
    }
  }
}