using UnityEngine;
using UnityEngine.UI;
using Shared.SEUI;
using TMPro;
using Code.AccessControlGroup;

namespace Code.User_Interface.AccessControlGroup {
  //Represents one selectable Asset item in the Asset DAC List UI screen
  public class DACAccessListItem : DynamicListItem<DACAccess> {
    // called when a permission should change
    public delegate void OnChangedDelegate();
    public OnChangedDelegate onClear;
    public OnChangedDelegate onChangeRead;
    public OnChangedDelegate onChangeWrite;
    public OnChangedDelegate onChangeControl;
    public OnChangedDelegate onChangeExecute;

    [Header("UI Elements")]
    [Tooltip("The label that should display the item's accessor.")]
    [SerializeField]
    private TMP_Text accessorLabel;
    [Tooltip("Press to clear access")]
    [SerializeField]
    private Button clearButton;
    [Tooltip("Toggle to alter read access")]
    [SerializeField]
    private Toggle readToggle;
    [Tooltip("Toggle to alter write access")]
    [SerializeField]
    private Toggle writeToggle;
    [Tooltip("Toggle to alter control access")]
    [SerializeField]
    private Toggle controlToggle;
    [Tooltip("Toggle to alter execute access")]
    [SerializeField]
    private Toggle executeToggle;

    //-------------------------------------------------------------------------
    public override void SetItem(DACAccess item) {
      this.name = item.accessor;
      accessorLabel.text = item.accessor;
      clearButton.gameObject.SetActive(item.permissions.Count > 0);
      SetUIState(item, DACAccess.PermissionType.Read, readToggle);
      SetUIState(item, DACAccess.PermissionType.Write, writeToggle);
      SetUIState(item, DACAccess.PermissionType.Control, controlToggle);
      SetUIState(item, DACAccess.PermissionType.Execute, executeToggle);
    }

    //-------------------------------------------------------------------------
    public void SetInteractable(bool interactable) {
      // If we can't modify things, then make sure the clear button is hiding
      if (!interactable) {
        clearButton.gameObject.SetActive(false);
      }
    }

    //-------------------------------------------------------------------------
    public void Clear() {
      onClear?.Invoke();
    }

    //-------------------------------------------------------------------------
    public void ToggleRead() {
      onChangeRead?.Invoke();
    }

    //-------------------------------------------------------------------------
    public void ToggleWrite() {
      onChangeWrite?.Invoke();
    }

    //-------------------------------------------------------------------------
    public void ToggleControl() {
      onChangeControl?.Invoke();
    }

    //-------------------------------------------------------------------------
    public void ToggleExecute() {
      onChangeExecute?.Invoke();
    }

    //-------------------------------------------------------------------------
    private void SetUIState(DACAccess item, DACAccess.PermissionType permissionType, Toggle toggle) {
      if (!item.permissions.ContainsKey(permissionType)) {
        toggle.gameObject.SetActive(false);
      }
      else {
        toggle.gameObject.SetActive(true);
        toggle.isOn = item.permissions[permissionType];
      }
    }
  }
}