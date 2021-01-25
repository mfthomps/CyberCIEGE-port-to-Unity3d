using UnityEngine;
using TMPro;

namespace Code.User_Interface.Main {
  public class UserObjectPropertyPanel : GenericObjectPropertyPanel<UserBehavior> {
    [Header("UI Elements")]
    [Tooltip("Label for selected object's name")]
    public TMP_Text nameLabel;

    // ------------------------------------------------------------------------
    protected override void DisplayProperties(UserBehavior component) {
      nameLabel.text = component.Data.user_name;
    }
  }
}
