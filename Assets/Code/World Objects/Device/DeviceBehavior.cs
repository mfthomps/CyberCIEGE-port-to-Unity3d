using UnityEngine;

namespace Code.World_Objects.Device {
  public class DeviceBehavior : ComponentBehavior {
    [SerializeField] private DeviceDataObject _data;

    //---------------------------------------------------------------------------
    public override ComponentDataObject Data {
      get => _data;
      set {
        base.Data = value;
        _data = value as DeviceDataObject;
      }
    }

    //---------------------------------------------------------------------------
    public override WorldObjectType Type() {
      return WorldObjectType.Device;
    }
  }
}