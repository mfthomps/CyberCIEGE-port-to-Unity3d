using System;
using System.Collections.Generic;
using Code.World_Objects.Character;


namespace Code.World_Objects.User {
  [Serializable]
  //Data related to a single User instance
  public class UserDataObject : CharacterDataObject {
    public string gender = "";
    public int position = -1;
    public string department = "";
    public int training;
    public HashSet<string> failed_goals = new HashSet<string>();
    public string secrecyClearance;
    public string integrityClearance;
    public HashSet<string> groups = new HashSet<string>();
    public HashSet<string> assetGoals = new HashSet<string>();
    public BackgroundCheck.Level highestBackgroundCheck;
    public int assetUsage;
    public string assignedZone;

    //-------------------------------------------------------------------------
    public UserGender Gender {
      get {
        switch (gender) {
          case "male":
            return UserGender.Male;
          case "female":
            return UserGender.Female;
          default:
            return UserGender.Unknown;
        }
      }
    }
  }
}