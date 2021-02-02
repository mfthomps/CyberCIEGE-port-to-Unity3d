using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Shared.ScriptableVariables;
using Code.Scriptable_Variables;
using Code.World_Objects.User;

namespace Code.User_Interface.User {
  public class UserView : MonoBehaviour {
    [Header("Input Variables")]
    [Tooltip("List of users in the given scenario")]
    public UserListVariable users;
    [Header("Output Events/Variables")]
    [Tooltip("Currently selected GameObject")]
    public GameObjectVariable selectedObject;
    [Tooltip("Add training to the currently selected user")]
    public IntGameEvent addTraining;
    [Header("UI Elements")]
    [Tooltip("List of users to display")]
    public UserList userList;
    [Tooltip("GameObject for settings section")]
    public GameObject settingsSection;
    [Tooltip("Text to display a user's description")]
    public TMP_Text descriptionText;
    [Tooltip("GameObject for clearance section")]
    public GameObject clearanceSection;
    [Tooltip("Text to display a user's secrecy clearance")]
    public TMP_Text secrecyClearanceText;
    [Tooltip("Text to display a user's integrity clearance")]
    public TMP_Text integrityClearanceText;
    [Tooltip("GameObject for group section")]
    public GameObject groupSection;
    [Tooltip("List of all the groups a user belongs to")]
    public StringList groupList;
    [Tooltip("GameObject for asset goal section")]
    public GameObject assetGoalSection;
    [Tooltip("List of all the asset goals a user belongs to")]
    public AssetGoalList assetGoalList;
    [Tooltip("Button to do low cost training to the user")]
    public Button lowTrainingButton;
    [Tooltip("Button to do medium cost training to the user")]
    public Button mediumTrainingButton;
    [Tooltip("Button to do high cost training to the user")]
    public Button highTrainingButton;

    // ------------------------------------------------------------------------
    void OnEnable() {
      users.OnValueChanged += UpdateUserList;
      selectedObject.OnValueChanged += UpdateSelection;
      UpdateUserList();
    }

    // ------------------------------------------------------------------------
    void OnDisable() {
      users.OnValueChanged -= UpdateUserList;
      selectedObject.OnValueChanged -= UpdateSelection;
    }

    // ------------------------------------------------------------------------
    public void SelectUser(UserBehavior UserBehavior) {
      selectedObject.Value = UserBehavior.gameObject;
    }

    // ------------------------------------------------------------------------
    public void LowTraining() {
      addTraining?.Raise(1);
    }

    // ------------------------------------------------------------------------
    public void MediumTraining() {
      addTraining?.Raise(5);
    }

    // ------------------------------------------------------------------------
    public void HighTraining() {
      addTraining?.Raise(25);
    }

    // ------------------------------------------------------------------------
    private void UpdateUserList() {
      userList.SetItems(users.Value);
      UpdateSelection();
    }

    // ------------------------------------------------------------------------
    private void UpdateSelection() {
      // Set the selected state for each of the items
      foreach (var user in users.Value) {
        if (user != null) {
          userList.SetSelected(user, user.gameObject == selectedObject.Value);
        }
      }

      if (selectedObject.Value != null) {
        DisplayUserInformation(selectedObject.Value.GetComponent<UserBehavior>());
      }
      else {
        DisplayUserInformation(null);
      }

      lowTrainingButton.interactable = selectedObject.Value != null;
      mediumTrainingButton.interactable = selectedObject.Value != null;
      highTrainingButton.interactable = selectedObject.Value != null;
    }

    // ------------------------------------------------------------------------
    private void DisplayUserInformation(UserBehavior user) {
      descriptionText.text = user != null ? user.Data.description : "";
      secrecyClearanceText.text = user != null ? user.Data.secrecyClearance : "";
      integrityClearanceText.text = user != null ? user.Data.integrityClearance : "";
      if (user != null) {
        groupList.SetItems(user.Data.groups);
        assetGoalList.SetItems(user.Data.assetGoals);
      }
      else {
        groupList.ClearItems();
        assetGoalList.ClearItems();
      }

      // Hide sections that have no content in them
      clearanceSection.SetActive(!string.IsNullOrEmpty(secrecyClearanceText.text) ||
        !string.IsNullOrEmpty(integrityClearanceText.text));
      groupSection.SetActive(groupList.listItems.Count > 0);
      assetGoalSection.SetActive(assetGoalList.listItems.Count > 0);
      settingsSection.SetActive(clearanceSection.activeSelf || groupSection.activeSelf || assetGoalSection.activeSelf);
    }
  }
}
