using Code;
using UnityEngine;

public class DeviceBehavior : ComponentBehavior {
  [SerializeField] private DeviceDataObject _data;

  public DeviceDataObject Data {
    get => _data;
    set => _data = value;
  }
}