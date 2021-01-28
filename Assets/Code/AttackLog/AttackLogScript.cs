﻿using Code.Scriptable_Variables;
using UnityEngine;

//Manager of the attack log and when it gets displayed.
namespace Code.AttackLog {
  // Logic class for handling attack logs
  public class AttackLogScript : MonoBehaviour {
    [Tooltip("The AttackLogDisplay component used to display the attack logs")]
    [SerializeField] private AttackLogDisplay attackLogPanel;
    [SerializeField] private AttackLogButton attackLogButton;

    [SerializeField] private StringListVariable attackLogVariable;
    
    //----------------------------------------------------------------------------
    //Show or hide the Attack Log Dialog
    public void Show(bool showDialog) {
      if (showDialog) {
        ShowDialog();
      }
      else {
        HideDialog();
      }
    }
    
    //----------------------------------------------------------------------------
    private void Start() {
      if (attackLogPanel) {
        //auto-hide the attack log display
        attackLogPanel.HideDialog();
        attackLogPanel.OnDialogClosed += OnDialogClosed;
      }

      if (attackLogVariable) {
        attackLogVariable.OnValueChanged += AttackLogChanged;
      }
    }
    
    //----------------------------------------------------------------------------
    private void OnDestroy() {
      if (attackLogPanel) {
        attackLogPanel.OnDialogClosed -= OnDialogClosed;
      }

      if (attackLogVariable) {
        attackLogVariable.OnValueChanged -= AttackLogChanged;
      }
    }

    //----------------------------------------------------------------------------
    private void AttackLogChanged() {
      if (attackLogPanel) {
        attackLogPanel.SetLogItems(attackLogVariable.Value);
      }
      //update the look of the attack log button to indicate there are new logs
      if (attackLogButton) {
        attackLogButton.SetHasNewLogs(true);
      }
    }

    //----------------------------------------------------------------------------
    private void ShowDialog() {
      menus.ActiveScreen("AttackLog");
      if (attackLogPanel) {
        attackLogPanel.ShowDialog();
      }
    }

    //----------------------------------------------------------------------------
    private void HideDialog() {
      if (attackLogPanel) {
        attackLogPanel.HideDialog();
      }
    }
    
    //----------------------------------------------------------------------------
    private void OnDialogClosed() {
      menus.ClosedScreen("not used");
      if (attackLogButton) {
        attackLogButton.SetHasNewLogs(false);
      }
    }

  }
}