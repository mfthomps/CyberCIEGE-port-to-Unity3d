//
//Filename: maxCamera.cs
//
// original: http://www.unifycommunity.com/wiki/index.php?title=MouseOrbitZoom
//
// --01-18-2010 - create temporary target, if none supplied at start

using UnityEngine;


//[AddComponentMenu("Camera-Control/3dsMax Camera Style")]
public class MaxCamera : MonoBehaviour {
  public Transform target;
  public Vector3 targetOffset = Vector3.zero;
  public float distance = 35.0f;
  public float maxDistance = 35;
  public float minDistance = .6f;
  public float xSpeed = 200.0f;
  public float ySpeed = 200.0f;
  public int yMinLimit = -80;
  public int yMaxLimit = 80;
  public int zoomRate = 40;
  public float panSpeed = 0.3f;
  public float zoomDampening = 0.05f;

  public float perspectiveZoomSpeed = 0.5f; // The rate of change of the field of view in perspective mode.
  public float orthoZoomSpeed = 0.5f; // The rate of change of the orthographic size in orthographic mode.
  private float currentDistance;
  private Quaternion currentRotation;
  private float desiredDistance;
  private Quaternion desiredRotation;
  private bool flyCamera;

  private Vector3 flyFrom;
  private readonly float flySpeed = 5.0f;
  private float flyStartTime;
  private Vector3 flyTo;
  private float journeyLength;

  private bool noObject = true;
  private Transform originalTransform;
  private Vector3 position;
  private Quaternion rotation;

  private float xDeg;
  private float yDeg;

  private void Start() {
    Init();
  }

  /*
     * Camera logic on LateUpdate to only update after all character movement logic has been handled. 
     */
  private void LateUpdate() {
    return;
    //checkMulti ();
    //if(Input.GetMouseButton(1)){
    //	Debug.Log ("mouse 2");
    //}

    //if(Input.GetKey(KeyCode.LeftAlt)){
    //	Debug.Log ("leftAlt");
    //}
    if (checkFly()) return;

    //Debug.Log("LiveUpdate desired distance is " + desiredDistance);
    // If Control and Alt and Middle button? ZOOM!
    if (Input.GetMouseButton(2) && Input.GetKey(KeyCode.LeftAlt) && Input.GetKey(KeyCode.LeftControl)) {
      desiredDistance -= Input.GetAxis("Mouse Y") * Time.deltaTime * zoomRate * 0.125f * Mathf.Abs(desiredDistance);
    }
    // If middle mouse and left alt are selected? ORBIT
    //else if (Input.GetKey(KeyCode.LeftAlt))
    else if (Input.GetMouseButton(0) && Input.GetKey(KeyCode.LeftAlt)) {
      xDeg += Input.GetAxis("Mouse X") * xSpeed * 0.02f;
      yDeg -= Input.GetAxis("Mouse Y") * ySpeed * 0.02f;
      //Debug.Log("xDeg " + xDeg + " yDeg " + yDeg);
      ////////OrbitAngle

      //Clamp the vertical axis for the orbit
      yDeg = ClampAngle(yDeg, yMinLimit, yMaxLimit);
      //Debug.Log("after clamp yDeg " + yDeg);
      // set camera rotation 
      desiredRotation = Quaternion.Euler(yDeg, xDeg, 0);
      currentRotation = transform.rotation;

      rotation = Quaternion.Lerp(currentRotation, desiredRotation, Time.deltaTime * zoomDampening);
      transform.rotation = rotation;
      //return;
    }
    // otherwise if middle mouse is selected, we pan by way of transforming the target in screenspace
    else if (Input.GetMouseButton(2) || Input.GetKey(KeyCode.LeftAlt)) {
      //grab the rotation of the camera so we can move in a psuedo local XY space
      target.rotation = transform.rotation;
      target.Translate(Vector3.right * -Input.GetAxis("Mouse X") * panSpeed);
      target.Translate(transform.up * -Input.GetAxis("Mouse Y") * panSpeed, Space.World);
    }

    ////////Orbit Position

    // affect the desired Zoom distance if we roll the scrollwheel
    //if(!hackcheck)
    desiredDistance -= Input.GetAxis("Mouse ScrollWheel") * Time.deltaTime * zoomRate * Mathf.Abs(desiredDistance);
    //Debug.Log ("desired distance " + desiredDistance);
    //clamp the zoom min/max
    if (!noObject) //Debug.Log ("clamping distance");
      desiredDistance = Mathf.Clamp(desiredDistance, minDistance, maxDistance);

    // For smoothing of the zoom, lerp distance
    float damp = Time.deltaTime * zoomDampening;
    //Debug.Log ("currrent distance: "+currentDistance+" desired "+desiredDistance+" damp is " + damp);
    //if(!hackcheck)
    currentDistance = Mathf.Lerp(currentDistance, desiredDistance, damp);

    // calculate position based on the new currentDistance 
    if (targetOffset != Vector3.zero) {
      //Debug.Log("target offset "+targetOffset);
    }

    //if(!hackcheck){
    position = target.position - (rotation * Vector3.forward * currentDistance + targetOffset);
    //}else{
    //	position = target.position;
    //	hackcheck = false;
    //}
    //position = target.position - (rotation * Vector3.forward * currentDistance);
    if (transform.position != position)
      Debug.Log("moving from " + transform.position + " to " + position + " currentDistance " + currentDistance +
                " desired " + desiredDistance);

    transform.position = position;
  }

  private void OnEnable() {
    Init();
  }

  public void setObject(Vector3 pos) {
    target.position = pos;
    noObject = false;
    distance = 5;
    currentDistance = distance;
    desiredDistance = distance;
  }

  public void setPosition(Vector3 pt) {
    target.position = pt;
    distance = 20.0f;
    pt.z = pt.z + distance;
    pt.y = pt.y + 8;
    transform.position = pt;
    currentDistance = distance;
    desiredDistance = distance;
    //Vector3 rot = new Vector3 (0.0f,  0, 0);
    //rotation = Quaternion.Euler (rot);
    rotation = transform.rotation;

    //rotation = Quaternion.Euler (Vector3.zero);
    //Debug.Log ("maxCamera target position " + pt);
    //hackcheck = false;
    noObject = true;
    transform.LookAt(target.transform.position);
    currentRotation = transform.rotation;
    desiredRotation = transform.rotation;
    //Debug.Log("maxCamera camera set to " + pt+" desiredDistance is "+desiredDistance);
  }

  public void restore() {
    target = originalTransform;
    noObject = true;
  }

  public void moveY(int delta) {
    Vector3 pos = target.position;
    pos.y = pos.y + delta;
    target.position = pos;
  }

  public void moveX(int delta) {
    Vector3 pos = target.position;
    pos.x = pos.x + delta;
    target.position = pos;
  }

  public void moveZ(int delta) {
    Debug.Log("moving z");
    Vector3 pos = target.position;
    pos.z = pos.z + delta;
    target.position = pos;
  }

  public void Init() {
    noObject = true;
    //If there is no target, create a temporary target at 'distance' from the cameras current viewpoint
    if (!target) {
      Debug.Log("MaxCamera create temp cam target, distance of " + distance + "forward is" + transform.forward);
      GameObject go = new GameObject("Cam Target");
      go.transform.position = transform.position + transform.forward * distance;
      target = go.transform;
      originalTransform = target;
    }
    else {
      distance = Vector3.Distance(transform.position, target.position);
    }

    currentDistance = 0;
    desiredDistance = distance;

    //be sure to grab the current rotations as starting points.
    position = transform.position;
    rotation = transform.rotation;
    currentRotation = transform.rotation;
    desiredRotation = transform.rotation;

    xDeg = Vector3.Angle(Vector3.right, transform.right);
    yDeg = Vector3.Angle(Vector3.up, transform.up);
    Debug.Log("xDeg in init " + xDeg);
    Debug.Log("Init desiredDistance is " + desiredDistance);
    //xDeg = 0;
  }

  private void checkMulti() {
    Debug.Log("touchcount is " + Input.touchCount);
    if (Input.touchCount == 2) {
      Debug.Log("touchcount is 2");
      // Store both touches.
      Touch touchZero = Input.GetTouch(0);
      Touch touchOne = Input.GetTouch(1);

      // Find the position in the previous frame of each touch.
      Vector2 touchZeroPrevPos = touchZero.position - touchZero.deltaPosition;
      Vector2 touchOnePrevPos = touchOne.position - touchOne.deltaPosition;

      // Find the magnitude of the vector (the distance) between the touches in each frame.
      float prevTouchDeltaMag = (touchZeroPrevPos - touchOnePrevPos).magnitude;
      float touchDeltaMag = (touchZero.position - touchOne.position).magnitude;

      // Find the difference in the distances between each frame.
      float deltaMagnitudeDiff = prevTouchDeltaMag - touchDeltaMag;

      // If the camera is orthographic...
      if (GetComponent<Camera>().orthographic) {
        // ... change the orthographic size based on the change in distance between the touches.
        GetComponent<Camera>().orthographicSize += deltaMagnitudeDiff * orthoZoomSpeed;

        // Make sure the orthographic size never drops below zero.
        GetComponent<Camera>().orthographicSize = Mathf.Max(GetComponent<Camera>().orthographicSize, 0.1f);
      }
      else {
        // Otherwise change the field of view based on the change in distance between the touches.
        GetComponent<Camera>().fieldOfView += deltaMagnitudeDiff * perspectiveZoomSpeed;

        // Clamp the field of view to make sure it's between 0 and 180.
        GetComponent<Camera>().fieldOfView = Mathf.Clamp(GetComponent<Camera>().fieldOfView, 0.1f, 179.9f);
      }
    }
  }

  private static float ClampAngle(float angle, float min, float max) {
    if (angle < -360)
      angle += 360;
    if (angle > 360)
      angle -= 360;
    return Mathf.Clamp(angle, min, max);
  }

  public void lookAt(Vector3 pt) {
    transform.LookAt(pt);
  }

  public void absoluteMove(Vector3 pt) {
    transform.position = pt;
    Debug.Log("camera set to " + pt);
    //currentDistance = 0;
    //desiredDistance = 0;
    //rotation = transform.rotation;
  }

  private bool checkFly() {
    bool retval = false;
    //Debug.Log("checkFly");
    if (flyCamera) {
      float now = Time.time;
      float distCovered = (now - flyStartTime) * flySpeed;
      float fracJourney = distCovered / journeyLength;
      //Debug.Log("speed " + this.flySpeed + " dist covered is " + distCovered + " len is " + journeyLength + " now is " + Time.time + " frac is " + fracJourney);
      if (fracJourney < 1.0) {
        transform.position = Vector3.Lerp(flyFrom, flyTo, fracJourney);
        retval = true;
      }
      else {
        flyCamera = false;
      }
    }

    return retval;
  }

  public void flyCameraTo(Vector3 from, Vector3 to, bool reverse = false) {
    flyStartTime = Time.time;
    flyFrom = from;
    flyTo = to;
    journeyLength = Vector3.Distance(from, to);
    flyCamera = true;
    transform.position = from;
    Vector3 lookAt = to;
    if (reverse) lookAt = Vector3.Lerp(to, from, 1.5f);

    transform.LookAt(lookAt);
  }
}