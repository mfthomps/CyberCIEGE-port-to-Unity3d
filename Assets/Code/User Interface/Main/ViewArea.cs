using UnityEngine;

namespace Code.User_Interface.Main {
  public class ViewArea : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("The current view type we have selected")]
    public ViewTypeVariable currentViewType;
    [Header("Customization")]
    [Tooltip("What view type this toggle represents")]
    public ViewType viewType = ViewType.Office;

    // ------------------------------------------------------------------------
    void Awake() {
      currentViewType.OnValueChanged += OnCurrentViewChanged;
      OnCurrentViewChanged();
    }

    // ------------------------------------------------------------------------
    void OnDestroy() {
      currentViewType.OnValueChanged -= OnCurrentViewChanged;
    }

    // ------------------------------------------------------------------------
    private void OnCurrentViewChanged() {
      gameObject.SetActive(currentViewType.Value == viewType);
    }
  }
}
