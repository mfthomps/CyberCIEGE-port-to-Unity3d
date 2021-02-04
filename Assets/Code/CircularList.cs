using System.Collections.Generic;
using System.Linq;

namespace Code {
  //Utility class that wraps a List and provides methods to get the next/prev
  //item in the list.
  public class CircularList<T> where T : class {
    private IEnumerable<T> _list;
    private int _currIndex = -1;

    //-------------------------------------------------------------------------
    public void SetList(IEnumerable<T> items) {
      _list = items;
      _currIndex = _list.Any() ? 0 : -1;
    }
    
    //-------------------------------------------------------------------------
    public T GetNext() {
      Inc();
      return _currIndex >= _list.Count() ? null : _list.ElementAt(_currIndex);
    }

    //-------------------------------------------------------------------------
    public T GetPrev() {
      Dec();
      return _currIndex > -1 ? _list.ElementAt(_currIndex) : null;
    }

    //-------------------------------------------------------------------------
    private void Inc() {
      _currIndex++;
      if (_currIndex >= _list.Count()) {
        _currIndex = _list.Any() ? 0 : -1;
      }
    }
    
    //-------------------------------------------------------------------------
    private void Dec() {
      _currIndex--;
      if (_currIndex < 0) {
        _currIndex = _list.Count() - 1;
      }
    }

  }
}