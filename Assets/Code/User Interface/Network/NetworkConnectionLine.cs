using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Vectrosity;
using Code.World_Objects.Network;

namespace Code.User_Interface.Network {
  public class NetworkConnectionLine : MonoBehaviour {
    [Header("UI Elements")]
    [Tooltip("Canvas to put lines in")]
    public Canvas canvas;
    [Header("Customization")]
    [Tooltip("Line width")]
    public float lineWidth = 2.0f;

    private VectorLine _line;

    // ------------------------------------------------------------------------
    public void DrawConnection(RectTransform start, RectTransform end, NetworkBehavior network, float uiSize, float uiSpacing, float maxNetworkOffset, float networkOffset) {
      _line = new VectorLine("Connection Line", new List<Vector2>(), lineWidth, LineType.Continuous, Joins.Fill);
      _line.SetCanvas(canvas, false);
      _line.color = network.Data.color;

      if (end != null) {
        this.name = $"{start.name} <=> {end.name}";
        StartCoroutine(UpdateConnectionPoints(start, end, uiSize, uiSpacing, maxNetworkOffset, networkOffset));
      }
      else {
        this.name = $"{start.name} one sided connection";
        StartCoroutine(UpdateConnectionPoints(start, uiSize, uiSpacing, maxNetworkOffset, networkOffset));
      }
    }

    // ------------------------------------------------------------------------
    private IEnumerator UpdateConnectionPoints(RectTransform start, RectTransform end, float uiSize, float uiSpacing, float maxNetworkOffset, float networkOffset) {
      // Wait a frame so layouts can size things properly
      yield return null;
      var startPosition = GetLocalPosition(start.position);
      var endPosition = GetLocalPosition(end.position);
      var firstPoint = startPosition - new Vector2(networkOffset - maxNetworkOffset * 0.5f, uiSize / 2.0f);
      var secondPoint = firstPoint + (new Vector2(0.0f, -uiSpacing / 2.0f - networkOffset));
      var lastPoint = endPosition - new Vector2(networkOffset - maxNetworkOffset * 0.5f, uiSize / 2.0f);
      var penultimatePoint = lastPoint + (new Vector2(0.0f, -uiSpacing / 2.0f - networkOffset));
      _line.points2.Add(firstPoint);
      _line.points2.Add(secondPoint);

      // If the two items aren't in the same row, then we need two additional points in our line
      if (startPosition.y != endPosition.y) {
        var thirdPosition = secondPoint;
        thirdPosition.x += (endPosition.x >= startPosition.x ? 0.5f : -0.5f) * (uiSize + uiSpacing);
        var fourthPosition = thirdPosition;
        fourthPosition.y = penultimatePoint.y;
        _line.points2.Add(thirdPosition);
        _line.points2.Add(fourthPosition);
      }

      _line.points2.Add(penultimatePoint);
      _line.points2.Add(lastPoint);
      _line.Draw();
    }

    // ------------------------------------------------------------------------
    private IEnumerator UpdateConnectionPoints(RectTransform start, float uiSize, float uiSpacing, float maxNetworkOffset, float networkOffset) {
      // Wait a frame so layouts can size things properly
      yield return null;
      var startPosition = GetLocalPosition(start.position);
      var firstPoint = startPosition - new Vector2(networkOffset - maxNetworkOffset * 0.5f, uiSize / 2.0f);
      var secondPoint = firstPoint + (new Vector2(0.0f, -uiSpacing / 2.0f - networkOffset));
      _line.points2.Add(firstPoint);
      _line.points2.Add(secondPoint);
      _line.Draw();
    }

    // ------------------------------------------------------------------------
    private Vector2 GetLocalPosition(Vector2 worldPosition) {
      var localPosition = worldPosition - (Vector2)transform.position;
      localPosition.x /= transform.lossyScale.x;
      localPosition.y /= transform.lossyScale.y;
      return localPosition;
    }
  }
}
