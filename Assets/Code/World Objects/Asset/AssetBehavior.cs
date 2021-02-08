using UnityEngine;

namespace Code.World_Objects.Asset {
  public class AssetBehavior : BaseWorldObject {
    [SerializeField] private AssetDataObject _data;

    //----------------------------------------------------------------------------
    public override WorldObjectType Type() {
      return WorldObjectType.Asset;
    }

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
  }
}