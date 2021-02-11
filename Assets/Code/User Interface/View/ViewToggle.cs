using UnityEngine;
using UnityEngine.UI;

namespace Code.User_Interface.View {
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
    [Tooltip("Whether this toggle is in charge of a mutually exclusive ViewType or not")]
    public bool isMutuallyExclusive;

    [SerializeField] private SwapAnimators _animatorSwap;

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
      // If our toggle is on and this view type isn't visible, modify the view stack
      if (isOn && !currentViewType.IsVisible(viewType)) {
        if (isMutuallyExclusive) {
          currentViewType.SetView(viewType);
        }
        else {
          currentViewType.AddView(viewType);
        }
      }
      // If we're turned off and this view type is visible, go back a view type
      else if (!isOn && currentViewType.IsVisible(viewType)) {
        currentViewType.Back();
      }

      if (_animatorSwap) {
        _animatorSwap.IsUsingAlternateAnimator = isOn;
      }

    }

    // ------------------------------------------------------------------------
    private void OnCurrentViewChanged() {
      // If something else changed the current view type, make sure the UI matches
      if (currentViewType.IsVisible(viewType) && !input.isOn) {
        input.isOn = true;
      }
      else if (!currentViewType.IsVisible(viewType) && input.isOn) {
        input.isOn = false;
      }
    }
  }
}
