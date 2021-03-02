using UnityEngine;
using Shared.ScriptableVariables;
using Code.User_Interface.View;
using Code.World_Objects.Computer;
using Code.World_Objects.Staff;
using Code.World_Objects.User;
using Code.World_Objects.Zone;

namespace Code.User_Interface.Office {
  public class SceneSelector : MonoBehaviour {
    [Header("Output Variables")]
    [Tooltip("Currently selected object in game to show properties for")]
    public GameObjectVariable selectedObject;
    [Tooltip("The current view type we have selected")]
    public ViewTypeVariable currentViewType;

    // ------------------------------------------------------------------------
    public void SelectScene(Vector2 screenPosition) {
      // If we aren't trying to place hardware, then select an object at the given position
      if (enabled) {
        TryToSelectObject(screenPosition);
      }
    }

    // ------------------------------------------------------------------------
    public void SceneDoubleClick(Vector2 screenPosition) {
      TryToOpenView(screenPosition);
    }

    // --------------------------------------------------------------------------
    public void OnBuyHardware(string hardwareID) {
      enabled = string.IsNullOrEmpty(hardwareID);
    }

    // --------------------------------------------------------------------------
    private void TryToSelectObject(Vector2 screenPosition) {
      Ray ray = UnityEngine.Camera.main.ScreenPointToRay(screenPosition);
      var hits = Physics.RaycastAll(ray, 100);
      var clickHandled = false;
      foreach (var hit in hits) {
        // Debug.Log("raycast on " + hit.collider.gameObject.name);
        if (hit.collider.gameObject.GetComponent<SpeechBubble>() != null) {
          var speechBubble = hit.collider.gameObject.GetComponent<SpeechBubble>();
          if (speechBubble.Active) {
            speechBubble.OnClick();
            clickHandled = true;
            break;
          }
        }
        else if (HasSelectableComponent(hit.collider.gameObject)) {
          selectedObject.Value = hit.transform.gameObject;
          clickHandled = true;
          break;
        }
      }
      
      if (!clickHandled) {
        selectedObject.Value = null;
      }
    }

    // --------------------------------------------------------------------------
    private bool HasSelectableComponent(GameObject gameObject) {
      if (gameObject.GetComponent<ComponentBehavior>() != null) {
        return true;
      }
      else if (gameObject.GetComponent<UserBehavior>() != null) {
        return true;
      }
      else if (gameObject.GetComponent<StaffBehavior>() != null) {
        return true;
      }
      return false;
    }

    // --------------------------------------------------------------------------
    private void TryToOpenView(Vector2 screenPosition) {
      Ray ray = UnityEngine.Camera.main.ScreenPointToRay(screenPosition);
      var hits = Physics.RaycastAll(ray, 100);
      var newViewType = ViewType.Invalid;
      GameObject doubleClickedObject = null;
      foreach (var hit in hits) {
        newViewType = GetSelectedObjectViewType(hit.collider.gameObject);
        if (newViewType != ViewType.Invalid) {
          doubleClickedObject = hit.collider.gameObject;
          break;
        }
      }
      
      if (newViewType != ViewType.Invalid) {
        // Zones aren't selectable by single clicking on them, but we do want
        // to select the zone we are about to go to the ZoneView for
        if (newViewType == ViewType.Zone) {
          selectedObject.Value = doubleClickedObject;
        }
        currentViewType.SetView(newViewType);
      }
    }

    // --------------------------------------------------------------------------
    private ViewType GetSelectedObjectViewType(GameObject gameObject) {
      if (gameObject.GetComponent<ComputerBehavior>() != null) {
        return ViewType.Component;
      }
      else if (gameObject.GetComponent<UserBehavior>() != null) {
        return ViewType.User;
      }
      else if (gameObject.GetComponent<StaffBehavior>() != null) {
        return ViewType.ITStaff;
      }
      else if (gameObject.GetComponent<ZoneBehavior>() != null) {
        return ViewType.Zone;
      }
      return ViewType.Invalid;
    }
  }
}
