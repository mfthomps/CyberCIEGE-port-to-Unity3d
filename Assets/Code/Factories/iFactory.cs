using UnityEngine;

namespace Code.Factories {
  //Interface to a set of Factories that create specific types of gameObjects
  public interface iFactory {
    
    //create one instance using the supplied filename
    void Create(string filename);
    
    //create all using the supplied path
    void CreateAll(string path);
  }
}