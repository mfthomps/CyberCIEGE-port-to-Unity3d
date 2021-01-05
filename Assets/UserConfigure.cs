using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UserConfigure : MonoBehaviour {
  public Dropdown user_dropdown;
  public Button little_training;
  public Button med_training;
  public Button lots_training;
  public Button close_button;

  UserBehavior current_user = null;

  // Use this for initialization
  void Start() {
    this.little_training.onClick.AddListener(delegate { AddTraining(1); });
    this.med_training.onClick.AddListener(delegate { AddTraining(5); });
    this.lots_training.onClick.AddListener(delegate { AddTraining(10); });
    this.close_button.onClick.AddListener(CloseClicked);
    //this.med_training.onClick.AddListener(NoClicked);
    //this.lots_training.onClick.AddListener(NoClicked);
    menus.screen_dict[this.gameObject.name] = menus.UI_SCREEN_USER;
  }

  void CloseClicked() {
    //Debug.Log("Component menu closed");
    this.gameObject.SetActive(false);
    menus.ClosedScreen(this.gameObject.name);
  }

  void AddTraining(int amount) {
    current_user.AddTraining(amount);
  }

  public void SetUser(UserBehavior user) {
    user_dropdown.ClearOptions();
    List<Dropdown.OptionData> ddo = new List<Dropdown.OptionData>();
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

  // Update is called once per frame
  void Update() {
  }
}