using UnityEngine;
using Code.World_Objects.Asset;

namespace Code.Scriptable_Variables {
  [CreateAssetMenu(menuName = "Scriptable Objects/Variables/CC/Asset List")]
  public class AssetListVariable : ListVariable<AssetBehavior> {
    //---------------------------------------------------------------------------
    [ContextMenu("Reset To Default Value")]
    public void ContextMenuReset() {
      Reset();
    }

    //---------------------------------------------------------------------------
    public AssetBehavior FindAsset(string assetName) {
      return Value.Find(asset => asset.Data.AssetName == assetName);
    }
  }
  
#if UNITY_EDITOR
//-----------------------------------------------------------------------------
  [UnityEditor.CustomEditor(typeof(AssetListVariable))]
  [UnityEditor.CanEditMultipleObjects]
  public class AssetListVariableVariableEditor : AssetListVariable.BaseScriptableVariableEditor {
  }
#endif
 
}