using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UserConfigure : MonoBehaviour {
  public Dropdown user_dropdown;
  public Button little_training;
  public Button med_training;
  public Button lots_training;
  public Button close_button;

  private UserBehavior current_user;

  // Use this for initialization
  private void Start() {
    little_training.onClick.AddListener(delegate { AddTraining(1); });
    med_training.onClick.AddListener(delegate { AddTraining(5); });
    lots_training.onClick.AddListener(delegate { AddTraining(10); });
    close_button.onClick.AddListener(CloseClicked);
    //this.med_training.onClick.AddListener(NoClicked);
    //this.lots_training.onClick.AddListener(NoClicked);
    menus.screen_dict[gameObject.name] = menus.UI_SCREEN_USER;
  }

  private void CloseClicked() {
    //Debug.Log("Component menu closed");
    gameObject.SetActive(false);
    menus.ClosedScreen(gameObject.name);
  }

  private void AddTraining(int amount) {
    current_user.AddTraining(amount);
  }

  public void SetUser(UserBehavior user) {
    user_dropdown.ClearOptions();
    var ddo = new List<Dropdown.OptionData>();
    int count = 0;
    int value = 0;
    foreach (string key in UserBehavior.user_dict.Keys) {
      Dropdown.OptionData new_data = new Dropdown.OptionData(key);
      ddo.Add(new_data);
      if (key == user.user_name)
        value = count;
      count++;
    }

    user_dropdown.AddOptions(ddo);
    user_dropdown.value = value;
    current_user = user;
  }
}