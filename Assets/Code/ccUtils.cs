using System;
using System.IO;
using System.Text;
using UnityEngine;

public class ccUtils : MonoBehaviour {
  //static float GRID_SIZE = 3.0f;
  private static readonly float GRID_SIZE = 1.0f;

  // --------------------------------------------------------------------------
  public static void ParseSDFFile(string filename, Action<string, string> elementCallback) {
    try {
      StreamReader reader = new StreamReader(filename, Encoding.Default);
      using (reader) {
        string value = SDTNext(reader, out string tag);
        while (value != null) {
          elementCallback(tag, value);
          value = SDTNext(reader, out tag);
        }
      }
    }
    catch (Exception e) {
      Debug.LogError(e);
    }
  }

  // --------------------------------------------------------------------------
  public static void ParseSDFFileSubElement(string elementData, Action<string, string> subelementCallback) {
    try {
      var stream = new MemoryStream(Encoding.UTF8.GetBytes(elementData ?? ""));
      var substream = new StreamReader(stream);
      var value = SDTNext(substream, out string tag);
      while (value != null) {
        subelementCallback(tag, value);
        value = SDTNext(substream, out tag);
      }
    }
    catch (Exception e) {
      Debug.LogError(e);
    }
  }

  public static string SDTField(string line, string token) {
    line = line.Trim();
    if (!line.StartsWith(token + ":")) {
      Debug.Log("SDTField, did not find " + token);
      return null;
    }

    if (!line.EndsWith(":end")) {
      Debug.Log("SDTField, did not find end in " + line);
      return null;
    }

    int len = line.Length - token.Length - 6;
    string retval = line.Substring(token.Length + 2, len);
    return retval.Trim();
  }

  public static string SDTField(StreamReader reader, string token) {
    string line = "";
    string retval = null;
    string full_line = "";
    while (retval == null && line != null) {
      line = reader.ReadLine();
      if (line == null)
        break;
      line = line.Trim();
      //Debug.Log("SDTField line is " + line);
      if (line.StartsWith(token + ":"))
        full_line = line;
      else if (full_line.Length > 0) full_line = full_line + line;

      if (full_line.Trim().EndsWith(":end")) retval = SDTField(full_line, token);
    }

    return retval;
  }

  public static string SDTField(Stream stream, string token, bool origin = true) {
    if (origin)
      stream.Seek(0, SeekOrigin.Begin);
    StreamReader reader = new StreamReader(stream);
    return SDTField(reader, token);
  }

  /*
  public static string SDTField(string sdf_text, string token)
  {
    MemoryStream stream = new MemoryStream(Encoding.UTF8.GetBytes(sdf_text ?? ""));
    return SDTField(stream, token);
  }
  */
  public static bool SDTFieldDefault(Stream stream, string token, bool default_value) {
    string value = SDTField(stream, token);
    if (value == null) {
      return default_value;
    }

    bool retval = false;
    if (!bool.TryParse(value, out retval)) Debug.Log("Error SDTFieldDefault parse " + value);

    return retval;
  }

  public static void PositionAfter(StreamReader reader, string tag) {
    //Debug.Log("PositionAfter " + tag);
    string line = "";
    while (line != tag + ":" && line != null) line = reader.ReadLine();
    //Debug.Log("PositionAfter got " + line);
  }

  public static int SubstringCount(string source, string substring) {
    int count = 0, n = 0;

    if (substring != "")
      while ((n = source.IndexOf(substring, n, StringComparison.InvariantCulture)) != -1) {
        n += substring.Length;
        ++count;
      }

    return count;
  }

  private static string ReaderCutComment(StreamReader reader) {
    string line = "";
    do {
      line = reader.ReadLine();
      if (line == null)
        continue;
      line = line.Trim();
      //Debug.Log("line in cutComment <" + line + ">");
      if (line.Length > 0) {
        int index = line.IndexOf("//");
        if (index >= 0) line = line.Substring(0, index).Trim();
      }
    } while (line != null && line.Length == 0);

    return line;
  }

  public static string SDTNext(StreamReader reader, out string tag) {
    /* read a complete block from the reader.  the block may contan many subblocks */
    string line = null;
    string retval = null;
    tag = null;
    //Debug.Log("SDTNext");
    do {
      line = ReaderCutComment(reader);
      if (line == null) //Debug.Log("line is null");
        return null;
      if (retval == null && line == ":end") return "end";
      //Debug.Log("SDTNext first line is <" + line + ">");

      int coffset = line.IndexOf(':');
      retval = line.Substring(coffset + 1).Trim('\n', '\r', ' ');
      tag = line.Substring(0, coffset).Trim();

      //Debug.Log("retval is <" + retval + ">"+" tag is "+tag);

      if (retval == ":end") return "";

      //Debug.Log("SDTNext retval <" + retval + "> tag " + tag);
      if (retval.EndsWith(":end")) {
        if (retval.Length > 0) {
          //Debug.Log("wtf");
          int len = retval.Length - 4;
          retval = retval.Substring(0, len);
          //Debug.Log("SDTNext retval " + retval);
        }
      }
      else {
        int colon_count = 99;
        //Debug.Log("this <" + retval + "> does not end with end:");
        int level = 0;
        //while ((level != 0 || !(colon_count == 0 && line.EndsWith(":end"))) && line != null)
        while (line != null && (level > 0 || !(colon_count == 0 && line.EndsWith(":end")))) {
          line = ReaderCutComment(reader);
          if (line == null) continue;

          if (line.EndsWith(":")) {
            /* assume new subblock */
            level++;
            //Debug.Log("New level now " + level + " for " + line);
            retval = retval + "\n" + line + "\n";
          }
          else {
            colon_count = SubstringCount(line, ": ");
            //Debug.Log("inner colon_count is " + colon_count + " cutline was <" + line + ">");
            if (level == 0 && colon_count == 0 && line.EndsWith(":end")) {
              retval = retval + "\n" + line.Substring(0, line.Length - 4);
            }
            else {
              if (line.StartsWith(":end") && level > 0) {
                level--;
                //Debug.Log("dec level to " + level + " for line " + line);
                retval = retval + "\n" + line;
                line = "";
              }
              else if (colon_count == 0) {
                retval = retval + " " + line;
              }
              else {
                if (!line.Trim().EndsWith(":end")) level++;

                retval = retval + "\n" + line;
              }
            }
          }

          //Debug.Log("end loop level is " + level + " line " + line);
        }
      }
    } while (retval == null && line != null && line != ":end");

    return retval.Trim();
  }

  public static void GridTo3dPos(int xcoord, int ycoord, out float xout, out float yout) {
    //	*xout = (0.5f+ (float)xcoord) * GRID_SIZE; 
    //	*yout = (0.5f+ (float)ycoord) * GRID_SIZE;
    // xout = (0.48f + xcoord) * GRID_SIZE;
    // yout = (0.48f + ycoord) * GRID_SIZE;
    xout = xcoord;
    yout = ycoord;
  }

  public static void PosToGrid(out int xcoord, out int ycoord, float xin, float yin) {
    xcoord = (int) (xin / GRID_SIZE + 0.5);
    ycoord = (int) (yin / GRID_SIZE + 0.5);
  }

  public static Vector2 GetMouseGrid(Vector2 screenPosition) {
    //Debug.Log("mouse down on floor");
    Plane plane = new Plane(Vector3.up, Vector3.zero);
    Vector2 retval = new Vector2(0.0f, 0.0f);
    Ray ray = Camera.main.ScreenPointToRay(screenPosition);
    float distance;
    if (plane.Raycast(ray, out distance)) {
      Vector3 point = ray.GetPoint(distance);
      //Debug.Log("grid: x " + point.x + " y " + point.y + " z " + point.z);
      retval.x = point.x;
      retval.y = point.z;
    }

    return retval;
  }

  public static string GetCommand(string s, out string command) {
    int first_colon = s.IndexOf(':');
    command = s.Substring(0, first_colon);
    string retval = s.Substring(first_colon + 1);
    return retval;
  }
}