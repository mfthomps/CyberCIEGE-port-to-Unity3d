using System.Collections.Generic;
using UnityEngine;

namespace Code.User_Interface.View {
  // A ViewType value to share across components, scenes, and prefabs
  [CreateAssetMenu(menuName = "Scriptable Objects/CC/View Type")]
  public class ViewTypeVariable : ScriptableObject {
    public delegate void ValueChangeHandler();
    public event ValueChangeHandler OnValueChanged;

    private Stack<ViewType> _viewStack = new Stack<ViewType>();

    //---------------------------------------------------------------------------
    void OnValidate() {
      EnsureNonEmptyStack();
    }

    //---------------------------------------------------------------------------
    public void SetView(ViewType view) {
      _viewStack.Clear();
      IPCManagerScript.DialogClosed();
      AddView(view);
    }

    //---------------------------------------------------------------------------
    public void AddView(ViewType view) {
      _viewStack.Push(view);
      IPCManagerScript.DialogUp();
      IPCManagerScript.SendRequest($"on_screen:{(int)view}");
      OnValueChanged?.Invoke();
    }

    //---------------------------------------------------------------------------
    public void Back() {
      _viewStack.Pop();
      EnsureNonEmptyStack();
      IPCManagerScript.DialogClosed();
      IPCManagerScript.SendRequest($"on_screen:{(int)TopView()}");
      OnValueChanged?.Invoke();
    }

    //---------------------------------------------------------------------------
    public bool IsVisible(ViewType view) {
      return _viewStack.Contains(view);
    }

    //---------------------------------------------------------------------------
    public ViewType TopView() {
      // If our view stack has any elements, return the topmost
      if (_viewStack.Count > 0) {
        return _viewStack.Peek();
      }
      // Otherwise, something is wrong
      return ViewType.Invalid;
    }

    //---------------------------------------------------------------------------
    public void Reset() {
      _viewStack.Clear();
      EnsureNonEmptyStack();
    }

    //---------------------------------------------------------------------------
    private void EnsureNonEmptyStack() {
      if (_viewStack.Count == 0) {
        _viewStack.Push(ViewType.Office);
      }
    }
  }
}
