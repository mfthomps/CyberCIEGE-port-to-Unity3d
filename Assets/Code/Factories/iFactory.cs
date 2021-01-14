using UnityEngine;

namespace Code.Factories {
  //Interface to a set of Factories that create specific types of gameObjects
  public interface iFactory {
    
    GameObject Create(Transform parent = null);
    
    void CreateAll(string path, Transform parent = null);
  }
}