using System;
using System.Collections.Generic;
using NaughtyAttributes;
using Shared.ScriptableVariables;
using UnityEngine;
using UnityEngine.AI;

namespace Code {
  public class CharacterPauser : MonoBehaviour {
    [Header("Input")]
    [SerializeField] private BooleanVariable _activeVariable;
    
    [Header("Options")]
    [Tooltip("Will consider the objects active if this value equals the boolean variable value. Not active otherwise.")]
    [SerializeField] private bool _activeIfTrue = true;
    
    [Header("References")]
    [Tooltip("The list of GameObjects that should be activated/deactived")]
    [SerializeField] private List<GameObject> _gameObjects = new List<GameObject>();

    [Tooltip("The NavMeshAgent that should be activated/deactived.")]
    [SerializeField] private NavMeshAgent _agent;
    
    private Vector3 _lastAgentSpeed;
    private NavMeshPath _lastAgentPath;
    private bool _isDialogUp;
    private bool _wasActive;

    //-------------------------------------------------------------------------
    private void OnEnable() {
      _activeVariable.OnValueChanged += ActivateAgent;
      ActivateAgent();
    }
    
    //-------------------------------------------------------------------------
    private void OnDisable() {
      _activeVariable.OnValueChanged -= ActivateAgent;
    }

    //-------------------------------------------------------------------------
    public void DialogUp(bool dialogIsUp) {
      _isDialogUp = dialogIsUp;
      ActivateAgent();
    }

    //-------------------------------------------------------------------------
    private void ActivateAgent() {
      var active = ((_activeVariable.Value || _isDialogUp) == _activeIfTrue) ? true : false;
      foreach (GameObject o in _gameObjects) {
        o.SetActive(active);
      }
      
      ActivateAgent(_agent, active);
    }

    //-------------------------------------------------------------------------
    private void ActivateAgent(NavMeshAgent agent, bool active) {
      if (active && !_wasActive) {
        _wasActive = true;
        _agent.velocity = _lastAgentSpeed;
        if (_lastAgentPath != null && _agent.isOnNavMesh) {
          _agent.SetPath(_lastAgentPath);
        }
      }
      else if (!active && _wasActive) {
        _wasActive = false;
        _lastAgentSpeed = _agent.velocity;
        _agent.velocity = Vector3.zero;
        _lastAgentPath = _agent.path;
        if (_agent.isOnNavMesh) {
          _agent.ResetPath();
        }
      }
    }
  }
}