using UnityEngine;
using Code.Scriptable_Variables;

namespace Code.User_Interface.Office {
  public class BuildingCameraControls : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("List of ViewPoints that represent the different buildings available.")]
    [SerializeField] private ViewPointListVariable _buildings;

    [Header("UI Elements")]
    [Tooltip("The root of the controls UI.")]
    [SerializeField] private GameObject _controlsRoot;

    // ------------------------------------------------------------------------
    void OnEnable() {
      _buildings.OnValueChanged += UpdateControlVisibility;
      UpdateControlVisibility();
    }

    // ------------------------------------------------------------------------
    void OnDisable() {
      _buildings.OnValueChanged -= UpdateControlVisibility;
    }

    // ------------------------------------------------------------------------
    private void UpdateControlVisibility() {
      _controlsRoot.SetActive(_buildings.Value.Count > 1);
    }
  }
}
