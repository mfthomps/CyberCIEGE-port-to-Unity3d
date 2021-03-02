using UnityEngine;
using Shared.ScriptableVariables;
using Code.World_Objects.Staff;
using Code.World_Objects.User;

namespace Code.User_Interface.Office {
  public class SceneSelector : MonoBehaviour {
    [Header("Output Events/Variables")]
    [Tooltip("Currently selected object in game to show properties for")]
    public GameObjectVariable selectedObject;

    // ------------------------------------------------------------------------
    public void SelectScene(Vector2 screenPosition) {
      // If we aren't trying to place hardware, then select an object at the given position
      if (enabled) {
        TryToSelectObject(screenPosition);
      }
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
  }
}
