using Code.Scriptable_Variables;
using UnityEngine;

//Manager of the attack log and when it gets displayed.
namespace Code.AttackLog {
  public class AttackLogScript : MonoBehaviour {
    [Tooltip("The AttackLogDisplay component used to display the attack logs")]
    [SerializeField] private AttackLogDisplay attackLogPanel;
    [SerializeField] private AttackLogButton attackLogButton;

    [SerializeField] private StringListVariable attackLogVariable;
    
  
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
    private void AttackLogChanged() {
      //update the look of the attack log button to indicate there are new logs
      if (attackLogButton) {
        attackLogButton.SetHasNewLogs(true);
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
    public void ShowDialog() {
      menus.ActiveScreen("AttackLog");
      if (attackLogPanel) {
        attackLogPanel.ShowDialog(attackLogVariable.Value);
      }
    }

    //----------------------------------------------------------------------------
    public void HideDialog() {
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