using UnityEngine;

namespace Code {
  public class AssetBehavior : MonoBehaviour {
    [SerializeField] private AssetDataObject _data;
  
    //----------------------------------------------------------------------------
    public string AssetName => Data.AssetName;

    //----------------------------------------------------------------------------
    public AssetDataObject Data {
      get => _data;
      set => _data = value;
    }

    //----------------------------------------------------------------------------
    public void SetComputer(ComputerBehavior computer) {
      Data.Computer = computer;
    }
  
    //----------------------------------------------------------------------------
    public string GetDACString() {
      return Data.DACAccess.ToString();
    }

    //----------------------------------------------------------------------------
    public DACAccess GetDACAccess() {
      return Data.DACAccess;
    }
  }
}