using UnityEngine;
using Code.Game_Events;
using Code.World_Objects;

namespace Code.User_Interface.Office {
  // This class is only necessary because functions with enum parameters don't work in UnityEvents in the inspector
  public class WorldObjectTypeEventButton : MonoBehaviour {
    [Header("Output Events")]
    [Tooltip("Event to fire with our object type")]
    public WorldObjectTypeGameEvent gameEvent;
    [Header("Customization")]
    [Tooltip("What type of world object to move the camera to")]
    public WorldObjectType objectType;

    // ------------------------------------------------------------------------
    public void FireEvent() {
      gameEvent?.Raise(objectType);
    }
  }
}
