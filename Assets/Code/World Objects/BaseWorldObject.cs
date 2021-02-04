using UnityEngine;

namespace Code.World_Objects {
  //represents the base class of all the world objects
  public abstract class BaseWorldObject : MonoBehaviour {
    public abstract WorldObjectType Type();
  }
}