using UnityEngine;

namespace Code.AssetGoal {
  public class AssetGoalBehavior : MonoBehaviour {
    [SerializeField] private AssetGoalDataObject _data;

    public AssetGoalDataObject Data {
      get => _data;
      set => _data = value;
    }
  }
}
