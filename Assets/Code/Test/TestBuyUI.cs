using UnityEngine;
using Code.User_Interface.View;

namespace Code.Test {
  public class TestBuyUI : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("Current view type the user is viewing")]
    public ViewTypeVariable currentViewType;

    // --------------------------------------------------------------------------
    void Start() {
      currentViewType.SetView(ViewType.Buy);
      currentViewType.OnValueChanged += OnCurrentViewChanged;
    }

    // --------------------------------------------------------------------------
    void OnDestroy() {
      currentViewType.OnValueChanged -= OnCurrentViewChanged;
      currentViewType.Reset();
    }

    // --------------------------------------------------------------------------
    public void OnBuyHardware(string hardwareID) {
      Debug.Log($"Started buy process for {hardwareID}");
    }

    // --------------------------------------------------------------------------
    private void OnCurrentViewChanged() {
      Debug.Log($"Current view changed to {currentViewType.TopView()}");
    }
  }
}
