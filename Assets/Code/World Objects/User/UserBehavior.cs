using System;
using UnityEngine;

namespace Code.World_Objects.User {
  public class UserBehavior : BaseWorldObject {
    [SerializeField] private GameObject _maleChildGameObject;
    [SerializeField] private GameObject _femaleChildGameObject;

    [SerializeField] private UserDataObject _data;

    //---------------------------------------------------------------------------
    public override WorldObjectType Type() {
      return WorldObjectType.User;
    }
    //---------------------------------------------------------------------------
    public UserDataObject Data {
      get => _data;
      set {
        _data = value;
        if (_data.gender == "female") {
          _femaleChildGameObject.SetActive(true);
        }
        else if (_data.gender == "male") {
          _maleChildGameObject.SetActive(true);
        }
      }
    }
    
    //---------------------------------------------------------------------------
    private void Awake() {
      if (_maleChildGameObject) {_maleChildGameObject.SetActive(false);} 
      if (_femaleChildGameObject) {_femaleChildGameObject.SetActive(false);}
    }

    //---------------------------------------------------------------------------
    public bool IsActiveUser() {
      if (Data.department != "Security" && Data.department != "Tech")
        return true;
      return false;
    }
    
    //---------------------------------------------------------------------------
    // Returns true if the training value actually changed
    public bool AddTraining(int add_amount) {
      // adjust training based on given amount, using old game engine algorithm
      // and advise engine of new training value.
      if (Data.training <= 95) {
        Data.training = Math.Max(add_amount * 4, 5) + Data.training;
        if (Data.training > 95) {
          Data.training = 95;
        }
        return true;
      }
      return false;
    }
  }
}
