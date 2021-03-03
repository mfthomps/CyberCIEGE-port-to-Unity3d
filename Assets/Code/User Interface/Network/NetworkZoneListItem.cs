using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Shared.SEUI;
using Code.World_Objects.Zone;

namespace Code.User_Interface.Network {
  public class NetworkZoneListItem : DynamicListItem<ZoneBehavior> {
    [Header("UI Elements")]
    [Tooltip("Label for the zone this item represents")]
    public TMP_Text zoneLabel;
    [Tooltip("List of all networkable devices")]
    public ComponentList networkableList;
    [Tooltip("Vertical layout group for this list item's content")]
    public VerticalLayoutGroup contentVerticalLayoutGroup;
    [Tooltip("Grid layout group for the networkable's list")]
    public GridLayoutGroup gridLayout;

    // ------------------------------------------------------------------------
    public override void SetItem(ZoneBehavior item) {
      zoneLabel.text = $"Zone: {item.Data.ZoneName}";
      this.name = zoneLabel.text;
    }

    // ------------------------------------------------------------------------
    public void SetNetworkables(List<ComponentBehavior> networkables, float componentSize, float componentSpacing) {
      networkableList.SetItems(networkables);

      // If we don't have any networkables, then hide ourselves
      gameObject.SetActive(networkableList.listItems.Count > 0);

      // Set the spacing for our various layouts
      contentVerticalLayoutGroup.padding.bottom = (int) componentSpacing;
      gridLayout.cellSize = Vector2.one * componentSize;
      gridLayout.spacing = Vector2.one * componentSpacing;
    }

    // ------------------------------------------------------------------------
    public void UpdateSelectedComponent(ComponentBehavior selectedComponent) {
      foreach (var listItem in networkableList.listItems) {
        listItem.Value.SetSelected(listItem.Key == selectedComponent);
      }
    }

    // ------------------------------------------------------------------------
    public ComponentListItem GetComponentUI(ComponentBehavior component) {
      return networkableList.listItems[component];
    }
  }
}
