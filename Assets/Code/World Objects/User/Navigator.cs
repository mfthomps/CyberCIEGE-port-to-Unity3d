using UnityEngine;

namespace Code.World_Objects.User {
  
  //A BaseWorldObject that has the potential to navigate somewhere
  public abstract class Navigator : BaseWorldObject {
    //---------------------------------------------------------------------------
    //Get or set a Navigate Target for this object
    public GameObject CurrentNavTarget { get; set; }
  }
}