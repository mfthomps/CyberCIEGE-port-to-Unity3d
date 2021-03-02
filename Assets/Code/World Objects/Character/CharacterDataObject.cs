using System;

namespace Code.World_Objects.Character {
  //Contains the shared fields of all Characters
  [Serializable]
  public class CharacterDataObject {
    public string Visiting = "";
    public bool Stay;
    public int happiness;
    public int productivity;
    public string description;
    public string current_thought = "";
    public string user_name = "";
  }
}