using UnityEngine;

namespace Code.World_Objects.User {
  
  //A BaseWorldObject that has the potential to navigate somewhere
  public abstract class Navigator : BaseWorldObject {
    [SerializeField] private GameObject _currentNavTarget;

    //---------------------------------------------------------------------------
    //Get or set a Navigate Target for this object
    public GameObject CurrentNavTarget {
      get => _currentNavTarget;
      set => _currentNavTarget = value;
    }
  }
}