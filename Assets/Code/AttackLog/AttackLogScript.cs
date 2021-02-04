using Code.Scriptable_Variables;
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
    private void Start() {
      if (attackLogPanel) {
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
        Debug.Log("Swapped");
      }
    }

    //----------------------------------------------------------------------------
    private void OnDialogClosed() {
      if (attackLogButton) {
        attackLogButton.SetHasNewLogs(false);
        Debug.Log("Swapped");
      }
    }
  }
}