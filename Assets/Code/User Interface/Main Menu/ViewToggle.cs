using UnityEngine;
using UnityEngine.UI;

namespace Code.User_Interface.MainMenu {
  public class ViewToggle : MonoBehaviour {
    [Header("Output Variables")]
    [Tooltip("The current view type we have selected")]
    public ViewTypeVariable currentViewType;
    [Header("UI Elements")]
    [Tooltip("Toggle this class is wrapped around")]
    public Toggle input;
    [Header("Customization")]
    [Tooltip("What view type this toggle represents")]
    public ViewType viewType = ViewType.Office;

    // ------------------------------------------------------------------------
    void OnEnable() {
      input.onValueChanged.AddListener(OnToggleValueChanged);
      currentViewType.OnValueChanged += OnCurrentViewChanged;
    }

    // ------------------------------------------------------------------------
    void OnDisable() {
      input.onValueChanged.RemoveListener(OnToggleValueChanged);
      currentViewType.OnValueChanged -= OnCurrentViewChanged;
    }

    // ------------------------------------------------------------------------
    private void OnToggleValueChanged(bool isOn) {
      // If our toggle is on and it's not the current view type, set the current view type to us
      if (isOn && currentViewType.Value != viewType) {
        currentViewType.Value = viewType;
      }
      // If we're turned off and the current view is ours, reset it to the office view
      else if (!isOn && currentViewType.Value == viewType) {
        currentViewType.Value = ViewType.Office;
      }
    }

    // ------------------------------------------------------------------------
    private void OnCurrentViewChanged() {
      // If something else changed the current view type, make sure the UI matches
      if (currentViewType.Value == viewType && !input.isOn) {
        input.isOn = true;
      }
      else if (currentViewType.Value != viewType && input.isOn) {
        input.isOn = false;
      }
    }
  }
}
