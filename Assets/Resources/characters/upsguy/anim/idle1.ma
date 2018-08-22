//Maya ASCII 4.0 scene
//Name: idle1.ma
//Last modified: Thu, Aug 07, 2003 11:07:59 PM
requires maya "4.0";
currentUnit -l foot -a degree -t ntsc;
createNode animClip -n "upsguy_idle1Source";
	setAttr ".ihi" 0;
	setAttr ".du" 36;
	setAttr ".ci" no;
createNode animCurveTA -n "thumb_left_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "thumb_left_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "thumb_left_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTL -n "thumb_left_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.16430999490215384 1 0.16430999490215384 
		36 0.16430999490215384;
createNode animCurveTL -n "thumb_left_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.021367626705573833 1 -0.021367626705573833 
		36 -0.021367626705573833;
createNode animCurveTL -n "thumb_left_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.14914715485223029 1 0.14914715485223029 
		36 0.14914715485223029;
createNode animCurveTA -n "finger_left_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 -27.140428088416062 36 -27.140428088416062;
createNode animCurveTA -n "finger_left_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "finger_left_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTL -n "finger_left_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.00029745665729269557 1 0.00029745665729269557 
		36 0.00029745665729269557;
createNode animCurveTL -n "finger_left_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.057029061149125149 1 -0.057029061149125149 
		36 -0.057029061149125149;
createNode animCurveTL -n "finger_left_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.18260718015612401 1 0.18260718015612401 
		36 0.18260718015612401;
createNode animCurveTA -n "hand_left_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "hand_left_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "hand_left_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTL -n "hand_left_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.0035235082619942278 1 -0.0035235082619942278 
		36 -0.0035235082619942278;
createNode animCurveTL -n "hand_left_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.039019063716156099 1 0.039019063716156099 
		36 0.039019063716156099;
createNode animCurveTL -n "hand_left_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.28986958056898454 1 0.28986958056898454 
		36 0.28986958056898454;
createNode animCurveTA -n "wrist_left_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 -33.883285524581652 10 -36.836740182068155 
		30 -36.836740182068155 36 -33.883285524581652;
createNode animCurveTA -n "wrist_left_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 30 0 36 0;
createNode animCurveTA -n "wrist_left_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 30 0 36 0;
createNode animCurveTL -n "wrist_left_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.0024400558294913025 1 -0.0024400558294913025 
		10 -0.0024400558294913025 30 -0.0024400558294913025 36 -0.0024400558294913025;
createNode animCurveTL -n "wrist_left_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.10269978896502402 1 -0.10269978896502402 
		10 -0.10269978896502402 30 -0.10269978896502402 36 -0.10269978896502402;
createNode animCurveTL -n "wrist_left_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.73249323469681127 1 0.73249323469681127 
		10 0.73249323469681127 30 0.73249323469681127 36 0.73249323469681127;
createNode animCurveTL -n "elbow_left_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.0017131555043803633 1 0.0017131555043803633 
		10 0.0017131555043803633 30 0.0017131555043803633 36 0.0017131555043803633;
createNode animCurveTL -n "elbow_left_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.15845217628075944 1 -0.15845217628075944 
		10 -0.15845217628075944 30 -0.15845217628075944 36 -0.15845217628075944;
createNode animCurveTL -n "elbow_left_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.91811741387675505 1 0.91811741387675505 
		10 0.91811741387675505 30 0.91811741387675505 36 0.91811741387675505;
createNode animCurveTA -n "elbow_left_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 -128.63578961050959 
		30 -128.63578961050959 36 0;
createNode animCurveTA -n "elbow_left_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 131.69422636581163 30 
		131.69422636581163 36 0;
createNode animCurveTA -n "elbow_left_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -3.0732511460237366 1 -16.348937491115738 
		10 -52.382968748984936 30 -52.382968748984936 36 -16.348937491115738;
createNode animCurveTL -n "shoulder_left_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.056999999999999933 1 0.056999999999999933 
		10 0.056999999999999933 30 0.056999999999999933 36 0.056999999999999933;
createNode animCurveTL -n "shoulder_left_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.10714841630883915 1 -0.10714841630883915 
		10 -0.10714841630883915 30 -0.10714841630883915 36 -0.10714841630883915;
createNode animCurveTL -n "shoulder_left_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.28728579794589165 1 0.28728579794589165 
		10 0.28728579794589165 30 0.28728579794589165 36 0.28728579794589165;
createNode animCurveTA -n "shoulder_left_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 -52.634265191115517 10 -57.190237002053657 
		30 -57.190237002053657 36 -52.634265191115517;
createNode animCurveTA -n "shoulder_left_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 10.698045849911855 10 -44.051119924532173 
		30 -44.051119924532173 36 10.698045849911855;
createNode animCurveTA -n "shoulder_left_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 8.0920332954860906e-016 10 
		-13.177716650043296 30 -13.177716650043296 36 8.0920332954860906e-016;
createNode animCurveTA -n "clavicle_left_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "clavicle_left_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "clavicle_left_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTL -n "clavicle_left_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -2.9139711932418806e-017 1 -2.9139711932418806e-017 
		36 -2.9139711932418806e-017;
createNode animCurveTL -n "clavicle_left_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.33091059758804958 1 0.33091059758804958 
		36 0.33091059758804958;
createNode animCurveTL -n "clavicle_left_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.33044267739609295 1 0.33044267739609295 
		36 0.33044267739609295;
createNode animCurveTA -n "thumb_right_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "thumb_right_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "thumb_right_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTL -n "thumb_right_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.16908329324942506 1 0.16908329324942506 
		36 0.16908329324942506;
createNode animCurveTL -n "thumb_right_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.03714502168210064 1 -0.03714502168210064 
		36 -0.03714502168210064;
createNode animCurveTL -n "thumb_right_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.16098660498435005 1 -0.16098660498435005 
		36 -0.16098660498435005;
createNode animCurveTA -n "finger_right_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 31.329102540698578 36 31.329102540698578;
createNode animCurveTA -n "finger_right_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "finger_right_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTL -n "finger_right_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.0091075418007267716 1 0.0091075418007267716 
		36 0.0091075418007267716;
createNode animCurveTL -n "finger_right_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.025320795114106148 1 -0.025320795114106148 
		36 -0.025320795114106148;
createNode animCurveTL -n "finger_right_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.20917951837829155 1 -0.20917951837829155 
		36 -0.20917951837829155;
createNode animCurveTA -n "hand_right_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "hand_right_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "hand_right_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTL -n "hand_right_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.01651729723149873 1 0.01651729723149873 
		36 0.01651729723149873;
createNode animCurveTL -n "hand_right_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.0097732238467947031 1 -0.0097732238467947031 
		36 -0.0097732238467947031;
createNode animCurveTL -n "hand_right_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.27190156392604997 1 -0.27190156392604997 
		36 -0.27190156392604997;
createNode animCurveTA -n "wrist_right_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 29.053076091276672 10 31.585502961828624 
		30 31.585502961828624 36 29.053076091276672;
createNode animCurveTA -n "wrist_right_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 30 0 36 0;
createNode animCurveTA -n "wrist_right_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 30 0 36 0;
createNode animCurveTL -n "wrist_right_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.014830030414647996 1 -0.014830030414647996 
		10 -0.014830030414647996 30 -0.014830030414647996 36 -0.014830030414647996;
createNode animCurveTL -n "wrist_right_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.11329578622106977 1 -0.11329578622106977 
		10 -0.11329578622106977 30 -0.11329578622106977 36 -0.11329578622106977;
createNode animCurveTL -n "wrist_right_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.77342116732434862 1 -0.77342116732434862 
		10 -0.77342116732434862 30 -0.77342116732434862 36 -0.77342116732434862;
createNode animCurveTL -n "elbow_right_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.0053030358499027335 1 -0.0053030358499027335 
		10 -0.0053030358499027335 30 -0.0053030358499027335 36 -0.0053030358499027335;
createNode animCurveTL -n "elbow_right_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.12361479975304626 1 -0.12361479975304626 
		10 -0.12361479975304626 30 -0.12361479975304626 36 -0.12361479975304626;
createNode animCurveTL -n "elbow_right_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.87722972217562512 1 -0.87722972217562512 
		10 -0.87722972217562512 30 -0.87722972217562512 36 -0.87722972217562512;
createNode animCurveTA -n "elbow_right_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 129.49997823758744 30 
		129.49997823758744 36 0;
createNode animCurveTA -n "elbow_right_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 3.6203166823868802 1 25.128856905055912 
		10 54.337639414575442 30 54.337639414575442 36 25.128856905055912;
createNode animCurveTA -n "elbow_right_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 134.20068467648426 30 
		134.20068467648426 36 0;
createNode animCurveTL -n "shoulder_right_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.057241855325225459 1 0.057241855325225459 
		10 0.057241855325225459 30 0.057241855325225459 36 0.057241855325225459;
createNode animCurveTL -n "shoulder_right_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.10178333036701184 1 -0.10178333036701184 
		10 -0.10178333036701184 30 -0.10178333036701184 36 -0.10178333036701184;
createNode animCurveTL -n "shoulder_right_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.29624780759410069 1 -0.29624780759410069 
		10 -0.29624780759410069 30 -0.29624780759410069 36 -0.29624780759410069;
createNode animCurveTA -n "shoulder_right_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 57.232613560836185 10 54.233390708571115 
		30 54.233390708571115 36 57.232613560836185;
createNode animCurveTA -n "shoulder_right_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 -15.144392717477311 10 37.309766029665596 
		30 37.309766029665596 36 -15.144392717477311;
createNode animCurveTA -n "shoulder_right_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 8.2374698941527556e-016 10 
		-6.3175273418467315 30 -6.3175273418467315 36 8.2374698941527556e-016;
createNode animCurveTA -n "clavicle_right_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "clavicle_right_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "clavicle_right_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTL -n "clavicle_right_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -8.7419135797256413e-017 1 -8.7419135797256413e-017 
		36 -8.7419135797256413e-017;
createNode animCurveTL -n "clavicle_right_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.31766507651326437 1 0.31766507651326437 
		36 0.31766507651326437;
createNode animCurveTL -n "clavicle_right_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.36073943542208103 1 -0.36073943542208103 
		36 -0.36073943542208103;
createNode animCurveTA -n "head_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "head_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "head_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTL -n "head_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.10764813792004362;
createNode animCurveTL -n "head_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.11389818575106291;
createNode animCurveTL -n "head_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 5.6093945469906199e-016;
createNode animCurveTA -n "neck_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "neck_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "neck_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTL -n "neck_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.035105873750921439 1 0.035105873750921439 
		36 0.035105873750921439;
createNode animCurveTL -n "neck_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.52542850736584423 1 0.52542850736584423 
		36 0.52542850736584423;
createNode animCurveTL -n "neck_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.0082292523803426838 1 0.0082292523803426838 
		36 0.0082292523803426838;
createNode animCurveTA -n "chest_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "chest_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "chest_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTL -n "chest_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.0015492958015011305 1 -0.0015492958015011305 
		36 -0.0015492958015011305;
createNode animCurveTL -n "chest_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.42576161611501867 1 0.42576161611501867 
		36 0.42576161611501867;
createNode animCurveTL -n "chest_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1.0927391974657027e-017 1 1.0927391974657027e-017 
		36 1.0927391974657027e-017;
createNode animCurveTA -n "spine_2_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 5 -5.7983401191321349 30 
		-5.7983401191321349 36 0;
createNode animCurveTA -n "spine_2_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 5 0 30 0 36 0;
createNode animCurveTA -n "spine_2_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 5 0 30 0 36 0;
createNode animCurveTL -n "spine_2_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.11191009313517927 1 -0.11191009313517927 
		5 -0.11191009313517927 30 -0.11191009313517927 36 -0.11191009313517927;
createNode animCurveTL -n "spine_2_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.3844017636138306 1 0.3844017636138306 
		5 0.3844017636138306 30 0.3844017636138306 36 0.3844017636138306;
createNode animCurveTL -n "spine_2_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -1.1655884772967523e-016 1 -1.1655884772967523e-016 
		5 -1.1655884772967523e-016 30 -1.1655884772967523e-016 36 -1.1655884772967523e-016;
createNode animCurveTL -n "spine_1_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.050812307136364379 1 0.050812307136364379 
		36 0.050812307136364379;
createNode animCurveTL -n "spine_1_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.33510738703344928 1 0.33510738703344928 
		36 0.33510738703344928;
createNode animCurveTL -n "spine_1_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1.2869016594960968e-016 1 1.2869016594960968e-016 
		36 1.2869016594960968e-016;
createNode animCurveTA -n "spine_1_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "spine_1_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "spine_1_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTL -n "ankle_left_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.038286618964745486 1 -0.038286618964745486 
		5 -0.038286618964745486 30 -0.038286618964745486 36 -0.038286618964745486;
createNode animCurveTL -n "ankle_left_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -1.2169345099188382 1 -1.2169345099188382 
		5 -1.2169345099188382 30 -1.2169345099188382 36 -1.2169345099188382;
createNode animCurveTL -n "ankle_left_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.0079999999999999585 1 -0.0079999999999999585 
		5 -0.0079999999999999585 30 -0.0079999999999999585 36 -0.0079999999999999585;
createNode animCurveTA -n "ankle_left_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 5 -2.5436772700682278e-015 
		30 -2.5436772700682278e-015 36 0;
createNode animCurveTA -n "ankle_left_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 5 -7.3510294684490063 30 
		-7.3510294684490063 36 0;
createNode animCurveTA -n "ankle_left_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 71.784363378499449 1 71.784363378499449 
		5 71.784363378499492 30 71.784363378499492 36 71.784363378499449;
createNode animCurveTA -n "knee_left_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 5 -14.824994482785337 30 
		-14.824994482785337 36 0;
createNode animCurveTA -n "knee_left_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 5 0.43506555657400087 30 
		0.43506555657400087 36 0;
createNode animCurveTA -n "knee_left_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 5 4.7690781306135266 30 
		4.7690781306135266 36 0;
createNode animCurveTL -n "knee_left_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.023822093173111656 1 -0.023822093173111656 
		5 -0.023822093173111656 30 -0.023822093173111656 36 -0.023822093173111656;
createNode animCurveTL -n "knee_left_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -1.2249996198000104 1 -1.2249996198000104 
		5 -1.2249996198000104 30 -1.2249996198000104 36 -1.2249996198000104;
createNode animCurveTL -n "knee_left_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.037699684636603482 1 0.037699684636603482 
		5 0.037699684636603482 30 0.037699684636603482 36 0.037699684636603482;
createNode animCurveTA -n "hip_left_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -6.0721448104379636 1 -6.0721448104379636 
		5 18.87053368017752 30 18.87053368017752 36 -6.0721448104379636;
createNode animCurveTA -n "hip_left_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -72.035129951249189 1 -72.035129951249189 
		5 -65.135891537226954 30 -65.135891537226954 36 -72.035129951249189;
createNode animCurveTA -n "hip_left_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 5.4313262474489026 1 5.4313262474489026 
		5 -14.904866199653048 30 -14.904866199653048 36 5.4313262474489026;
createNode animCurveTL -n "hip_left_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.094950786553192251 1 0.094950786553192251 
		5 0.094950786553192251 30 0.094950786553192251 36 0.094950786553192251;
createNode animCurveTL -n "hip_left_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.15851464961087289 1 -0.15851464961087289 
		5 -0.15851464961087289 30 -0.15851464961087289 36 -0.15851464961087289;
createNode animCurveTL -n "hip_left_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.37323675097279557 1 0.37323675097279557 
		5 0.37323675097279557 30 0.37323675097279557 36 0.37323675097279557;
createNode animCurveTL -n "ankle_right_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 -0.026923648939266787 1 -0.026923648939266787 
		3 -0.026923648939266787 5 -0.026923648939266787 30 -0.026923648939266787 
		36 -0.026923648939266787;
createNode animCurveTL -n "ankle_right_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 -1.2226146828522801 1 -1.2226146828522801 
		3 -1.2226146828522801 5 -1.2226146828522801 30 -1.2226146828522801 36 -1.2226146828522801;
createNode animCurveTL -n "ankle_right_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0.0082292523803425104 1 0.0082292523803425104 
		3 0.0082292523803425104 5 0.0082292523803425104 30 0.0082292523803425104 
		36 0.0082292523803425104;
createNode animCurveTA -n "ankle_right_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 1 0 3 34.852032772248009 5 
		59.805263132990333 30 59.805263132990333 36 0;
createNode animCurveTA -n "ankle_right_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 1 0 3 -37.503743168300282 5 
		-64.355534943785642 30 -64.355534943785642 36 0;
createNode animCurveTA -n "ankle_right_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 -83.167953174900831 1 -83.167953174900831 
		3 -77.893843767824805 5 -74.117706261140256 30 -74.117706261140256 36 -83.167953174900831;
createNode animCurveTA -n "knee_right_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 1 0 3 72.966433729519608 5 
		4.9530311768070856 30 4.9530311768070856 36 0;
createNode animCurveTA -n "knee_right_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 1 0 3 -1.5324787817353196 5 
		-0.10402612263972506 30 -0.10402612263972506 36 0;
createNode animCurveTA -n "knee_right_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 1 0 3 11.044938491836922 5 
		0.74974096854966399 30 0.74974096854966399 36 0;
createNode animCurveTL -n "knee_right_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 -0.023678357251657407 1 -0.023678357251657407 
		3 -0.023678357251657407 5 -0.023678357251657407 30 -0.023678357251657407 
		36 -0.023678357251657407;
createNode animCurveTL -n "knee_right_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 -1.2251556112475279 1 -1.2251556112475279 
		3 -1.2251556112475279 5 -1.2251556112475279 30 -1.2251556112475279 36 -1.2251556112475279;
createNode animCurveTL -n "knee_right_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 -0.013562745817422698 1 -0.013562745817422698 
		3 -0.013562745817422698 5 -0.013562745817422698 30 -0.013562745817422698 
		36 -0.013562745817422698;
createNode animCurveTA -n "hip_right_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 8.3157752709031634 1 8.3157752709031634 
		3 -88.027770787066629 5 -68.22316945194477 30 -68.22316945194477 36 8.3157752709031634;
createNode animCurveTA -n "hip_right_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 81.141130548017273 1 81.141130548017273 
		3 38.267111544456469 5 84.421258660161527 30 84.421258660161527 36 81.141130548017273;
createNode animCurveTA -n "hip_right_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 7.3375026966032495 1 7.3375026966032495 
		3 -89.146817188696915 5 -59.41005496617263 30 -59.41005496617263 36 7.3375026966032495;
createNode animCurveTL -n "hip_right_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0.094614605088345211 1 0.094614605088345211 
		3 0.094614605088345211 5 0.094614605088345211 30 0.094614605088345211 36 
		0.094614605088345211;
createNode animCurveTL -n "hip_right_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 -0.15893499118290558 1 -0.15893499118290558 
		3 -0.15893499118290558 5 -0.15893499118290558 30 -0.15893499118290558 36 
		-0.15893499118290558;
createNode animCurveTL -n "hip_right_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 -0.36191217906970619 1 -0.36191217906970619 
		3 -0.36191217906970619 5 -0.36191217906970619 30 -0.36191217906970619 36 
		-0.36191217906970619;
createNode animCurveTA -n "god_joint_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 5 2.566415458073644 30 
		2.566415458073644 36 0;
createNode animCurveTA -n "god_joint_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 5 0 30 0 36 0;
createNode animCurveTA -n "god_joint_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 5 0 30 0 36 0;
createNode animCurveTL -n "god_joint_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.14696976978282683 1 -0.14696976978282683 
		5 -0.14696976978282683 30 -0.14696976978282683 36 -0.14696976978282683;
createNode animCurveTL -n "god_joint_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 2.842653204584348 1 2.842653204584348 
		5 2.8001010046864536 30 2.8001010046864536 36 2.842653204584348;
createNode animCurveTL -n "god_joint_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 5 -0.22694506612210708 
		30 -0.22694506612210708 36 0;
createNode clipLibrary -n "clipLibrary1";
	setAttr -s 156 ".cel[0].cev";
	setAttr ".cd[0].cm" -type "characterMapping" 156 "thumb_left.rotateZ" 
		2 1 "thumb_left.rotateY" 2 2 "thumb_left.rotateX" 2 
		3 "thumb_left.translateZ" 1 1 "thumb_left.translateY" 1 
		2 "thumb_left.translateX" 1 3 "finger_left.rotateZ" 2 
		4 "finger_left.rotateY" 2 5 "finger_left.rotateX" 2 6 "finger_left.translateZ" 
		1 4 "finger_left.translateY" 1 5 "finger_left.translateX" 
		1 6 "hand_left.rotateZ" 2 7 "hand_left.rotateY" 2 
		8 "hand_left.rotateX" 2 9 "hand_left.translateZ" 1 7 "hand_left.translateY" 
		1 8 "hand_left.translateX" 1 9 "wrist_left.rotateZ" 2 
		10 "wrist_left.rotateY" 2 11 "wrist_left.rotateX" 2 12 "wrist_left.translateZ" 
		1 10 "wrist_left.translateY" 1 11 "wrist_left.translateX" 
		1 12 "elbow_left.translateZ" 1 13 "elbow_left.translateY" 
		1 14 "elbow_left.translateX" 1 15 "elbow_left.rotateZ" 
		2 13 "elbow_left.rotateX" 2 14 "elbow_left.rotateY" 2 
		15 "shoulder_left.translateZ" 1 16 "shoulder_left.translateY" 
		1 17 "shoulder_left.translateX" 1 18 "shoulder_left.rotateZ" 
		2 16 "shoulder_left.rotateY" 2 17 "shoulder_left.rotateX" 
		2 18 "clavicle_left.rotateZ" 2 19 "clavicle_left.rotateY" 
		2 20 "clavicle_left.rotateX" 2 21 "clavicle_left.translateZ" 
		1 19 "clavicle_left.translateY" 1 20 "clavicle_left.translateX" 
		1 21 "thumb_right.rotateZ" 2 22 "thumb_right.rotateY" 2 
		23 "thumb_right.rotateX" 2 24 "thumb_right.translateZ" 1 
		22 "thumb_right.translateY" 1 23 "thumb_right.translateX" 1 
		24 "finger_right.rotateZ" 2 25 "finger_right.rotateY" 2 
		26 "finger_right.rotateX" 2 27 "finger_right.translateZ" 1 
		25 "finger_right.translateY" 1 26 "finger_right.translateX" 
		1 27 "hand_right.rotateZ" 2 28 "hand_right.rotateY" 2 
		29 "hand_right.rotateX" 2 30 "hand_right.translateZ" 1 
		28 "hand_right.translateY" 1 29 "hand_right.translateX" 1 
		30 "wrist_right.rotateZ" 2 31 "wrist_right.rotateY" 2 32 "wrist_right.rotateX" 
		2 33 "wrist_right.translateZ" 1 31 "wrist_right.translateY" 
		1 32 "wrist_right.translateX" 1 33 "elbow_right.translateZ" 
		1 34 "elbow_right.translateY" 1 35 "elbow_right.translateX" 
		1 36 "elbow_right.rotateZ" 2 34 "elbow_right.rotateY" 2 
		35 "elbow_right.rotateX" 2 36 "shoulder_right.translateZ" 1 
		37 "shoulder_right.translateY" 1 38 "shoulder_right.translateX" 
		1 39 "shoulder_right.rotateZ" 2 37 "shoulder_right.rotateY" 
		2 38 "shoulder_right.rotateX" 2 39 "clavicle_right.rotateZ" 
		2 40 "clavicle_right.rotateY" 2 41 "clavicle_right.rotateX" 
		2 42 "clavicle_right.translateZ" 1 40 "clavicle_right.translateY" 
		1 41 "clavicle_right.translateX" 1 42 "head.rotateZ" 2 
		43 "head.rotateY" 2 44 "head.rotateX" 2 45 "head.translateZ" 
		1 43 "head.translateY" 1 44 "head.translateX" 1 45 "neck.rotateZ" 
		2 46 "neck.rotateY" 2 47 "neck.rotateX" 2 48 "neck.translateZ" 
		1 46 "neck.translateY" 1 47 "neck.translateX" 1 48 "chest.rotateZ" 
		2 49 "chest.rotateY" 2 50 "chest.rotateX" 2 51 "chest.translateZ" 
		1 49 "chest.translateY" 1 50 "chest.translateX" 1 
		51 "spine_2.rotateZ" 2 52 "spine_2.rotateY" 2 53 "spine_2.rotateX" 
		2 54 "spine_2.translateZ" 1 52 "spine_2.translateY" 1 
		53 "spine_2.translateX" 1 54 "spine_1.translateZ" 1 55 "spine_1.translateY" 
		1 56 "spine_1.translateX" 1 57 "spine_1.rotateZ" 2 
		55 "spine_1.rotateY" 2 56 "spine_1.rotateX" 2 57 "ankle_left.translateZ" 
		1 58 "ankle_left.translateY" 1 59 "ankle_left.translateX" 
		1 60 "ankle_left.rotateZ" 2 58 "ankle_left.rotateX" 2 
		59 "ankle_left.rotateY" 2 60 "knee_left.rotateZ" 2 61 "knee_left.rotateY" 
		2 62 "knee_left.rotateX" 2 63 "knee_left.translateZ" 1 
		61 "knee_left.translateY" 1 62 "knee_left.translateX" 1 
		63 "hip_left.rotateZ" 2 64 "hip_left.rotateY" 2 65 "hip_left.rotateX" 
		2 66 "hip_left.translateZ" 1 64 "hip_left.translateY" 1 
		65 "hip_left.translateX" 1 66 "ankle_right.translateZ" 1 
		67 "ankle_right.translateY" 1 68 "ankle_right.translateX" 1 
		69 "ankle_right.rotateZ" 2 67 "ankle_right.rotateX" 2 68 "ankle_right.rotateY" 
		2 69 "knee_right.rotateZ" 2 70 "knee_right.rotateY" 2 
		71 "knee_right.rotateX" 2 72 "knee_right.translateZ" 1 
		70 "knee_right.translateY" 1 71 "knee_right.translateX" 1 
		72 "hip_right.rotateZ" 2 73 "hip_right.rotateY" 2 74 "hip_right.rotateX" 
		2 75 "hip_right.translateZ" 1 73 "hip_right.translateY" 
		1 74 "hip_right.translateX" 1 75 "god_joint.rotateZ" 2 
		76 "god_joint.rotateY" 2 77 "god_joint.rotateX" 2 78 "god_joint.translateZ" 
		1 76 "god_joint.translateY" 1 77 "god_joint.translateX" 
		1 78  ;
	setAttr ".cd[0].cim" -type "Int32Array" 156 0 1 2 3
		 4 5 6 7 8 9 10 11 12 13 14
		 15 16 17 18 19 20 21 22 23 24 25
		 26 27 28 29 30 31 32 33 34 35 36
		 37 38 39 40 41 42 43 44 45 46 47
		 48 49 50 51 52 53 54 55 56 57 58
		 59 60 61 62 63 64 65 66 67 68 69
		 70 71 72 73 74 75 76 77 78 79 80
		 81 82 83 84 85 86 87 88 89 90 91
		 92 93 94 95 96 97 98 99 100 101 102
		 103 104 105 106 107 108 109 110 111 112 113
		 114 115 116 117 118 119 120 121 122 123 124
		 125 126 127 128 129 130 131 132 133 134 135
		 136 137 138 139 140 141 142 143 144 145 146
		 147 148 149 150 151 152 153 154 155 ;
createNode lightLinker -n "lightLinker1";
select -ne :time1;
	setAttr ".o" 0;
select -ne :renderPartition;
	setAttr -s 3 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 3 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :lightList1;
select -ne :defaultTextureList1;
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultRenderGlobals;
	setAttr ".top" 239;
	setAttr ".rght" 319;
	setAttr ".fs" 1;
	setAttr ".ef" 10;
select -ne :characterPartition;
select -ne :hyperGraphLayout;
	setAttr ".cch" no;
	setAttr ".ihi" 2;
	setAttr ".nds" 0;
	setAttr ".img" -type "string" "";
	setAttr ".ims" 1;
connectAttr "upsguy_idle1Source.st" "clipLibrary1.st[0]";
connectAttr "upsguy_idle1Source.du" "clipLibrary1.du[0]";
connectAttr "thumb_left_rotateZ.a" "clipLibrary1.cel[0].cev[0].cevr";
connectAttr "thumb_left_rotateY.a" "clipLibrary1.cel[0].cev[1].cevr";
connectAttr "thumb_left_rotateX.a" "clipLibrary1.cel[0].cev[2].cevr";
connectAttr "thumb_left_translateZ.a" "clipLibrary1.cel[0].cev[3].cevr";
connectAttr "thumb_left_translateY.a" "clipLibrary1.cel[0].cev[4].cevr";
connectAttr "thumb_left_translateX.a" "clipLibrary1.cel[0].cev[5].cevr";
connectAttr "finger_left_rotateZ.a" "clipLibrary1.cel[0].cev[6].cevr";
connectAttr "finger_left_rotateY.a" "clipLibrary1.cel[0].cev[7].cevr";
connectAttr "finger_left_rotateX.a" "clipLibrary1.cel[0].cev[8].cevr";
connectAttr "finger_left_translateZ.a" "clipLibrary1.cel[0].cev[9].cevr"
		;
connectAttr "finger_left_translateY.a" "clipLibrary1.cel[0].cev[10].cevr"
		;
connectAttr "finger_left_translateX.a" "clipLibrary1.cel[0].cev[11].cevr"
		;
connectAttr "hand_left_rotateZ.a" "clipLibrary1.cel[0].cev[12].cevr";
connectAttr "hand_left_rotateY.a" "clipLibrary1.cel[0].cev[13].cevr";
connectAttr "hand_left_rotateX.a" "clipLibrary1.cel[0].cev[14].cevr";
connectAttr "hand_left_translateZ.a" "clipLibrary1.cel[0].cev[15].cevr";
connectAttr "hand_left_translateY.a" "clipLibrary1.cel[0].cev[16].cevr";
connectAttr "hand_left_translateX.a" "clipLibrary1.cel[0].cev[17].cevr";
connectAttr "wrist_left_rotateZ.a" "clipLibrary1.cel[0].cev[18].cevr";
connectAttr "wrist_left_rotateY.a" "clipLibrary1.cel[0].cev[19].cevr";
connectAttr "wrist_left_rotateX.a" "clipLibrary1.cel[0].cev[20].cevr";
connectAttr "wrist_left_translateZ.a" "clipLibrary1.cel[0].cev[21].cevr"
		;
connectAttr "wrist_left_translateY.a" "clipLibrary1.cel[0].cev[22].cevr"
		;
connectAttr "wrist_left_translateX.a" "clipLibrary1.cel[0].cev[23].cevr"
		;
connectAttr "elbow_left_translateZ.a" "clipLibrary1.cel[0].cev[24].cevr"
		;
connectAttr "elbow_left_translateY.a" "clipLibrary1.cel[0].cev[25].cevr"
		;
connectAttr "elbow_left_translateX.a" "clipLibrary1.cel[0].cev[26].cevr"
		;
connectAttr "elbow_left_rotateZ.a" "clipLibrary1.cel[0].cev[27].cevr";
connectAttr "elbow_left_rotateX.a" "clipLibrary1.cel[0].cev[28].cevr";
connectAttr "elbow_left_rotateY.a" "clipLibrary1.cel[0].cev[29].cevr";
connectAttr "shoulder_left_translateZ.a" "clipLibrary1.cel[0].cev[30].cevr"
		;
connectAttr "shoulder_left_translateY.a" "clipLibrary1.cel[0].cev[31].cevr"
		;
connectAttr "shoulder_left_translateX.a" "clipLibrary1.cel[0].cev[32].cevr"
		;
connectAttr "shoulder_left_rotateZ.a" "clipLibrary1.cel[0].cev[33].cevr"
		;
connectAttr "shoulder_left_rotateY.a" "clipLibrary1.cel[0].cev[34].cevr"
		;
connectAttr "shoulder_left_rotateX.a" "clipLibrary1.cel[0].cev[35].cevr"
		;
connectAttr "clavicle_left_rotateZ.a" "clipLibrary1.cel[0].cev[36].cevr"
		;
connectAttr "clavicle_left_rotateY.a" "clipLibrary1.cel[0].cev[37].cevr"
		;
connectAttr "clavicle_left_rotateX.a" "clipLibrary1.cel[0].cev[38].cevr"
		;
connectAttr "clavicle_left_translateZ.a" "clipLibrary1.cel[0].cev[39].cevr"
		;
connectAttr "clavicle_left_translateY.a" "clipLibrary1.cel[0].cev[40].cevr"
		;
connectAttr "clavicle_left_translateX.a" "clipLibrary1.cel[0].cev[41].cevr"
		;
connectAttr "thumb_right_rotateZ.a" "clipLibrary1.cel[0].cev[42].cevr";
connectAttr "thumb_right_rotateY.a" "clipLibrary1.cel[0].cev[43].cevr";
connectAttr "thumb_right_rotateX.a" "clipLibrary1.cel[0].cev[44].cevr";
connectAttr "thumb_right_translateZ.a" "clipLibrary1.cel[0].cev[45].cevr"
		;
connectAttr "thumb_right_translateY.a" "clipLibrary1.cel[0].cev[46].cevr"
		;
connectAttr "thumb_right_translateX.a" "clipLibrary1.cel[0].cev[47].cevr"
		;
connectAttr "finger_right_rotateZ.a" "clipLibrary1.cel[0].cev[48].cevr";
connectAttr "finger_right_rotateY.a" "clipLibrary1.cel[0].cev[49].cevr";
connectAttr "finger_right_rotateX.a" "clipLibrary1.cel[0].cev[50].cevr";
connectAttr "finger_right_translateZ.a" "clipLibrary1.cel[0].cev[51].cevr"
		;
connectAttr "finger_right_translateY.a" "clipLibrary1.cel[0].cev[52].cevr"
		;
connectAttr "finger_right_translateX.a" "clipLibrary1.cel[0].cev[53].cevr"
		;
connectAttr "hand_right_rotateZ.a" "clipLibrary1.cel[0].cev[54].cevr";
connectAttr "hand_right_rotateY.a" "clipLibrary1.cel[0].cev[55].cevr";
connectAttr "hand_right_rotateX.a" "clipLibrary1.cel[0].cev[56].cevr";
connectAttr "hand_right_translateZ.a" "clipLibrary1.cel[0].cev[57].cevr"
		;
connectAttr "hand_right_translateY.a" "clipLibrary1.cel[0].cev[58].cevr"
		;
connectAttr "hand_right_translateX.a" "clipLibrary1.cel[0].cev[59].cevr"
		;
connectAttr "wrist_right_rotateZ.a" "clipLibrary1.cel[0].cev[60].cevr";
connectAttr "wrist_right_rotateY.a" "clipLibrary1.cel[0].cev[61].cevr";
connectAttr "wrist_right_rotateX.a" "clipLibrary1.cel[0].cev[62].cevr";
connectAttr "wrist_right_translateZ.a" "clipLibrary1.cel[0].cev[63].cevr"
		;
connectAttr "wrist_right_translateY.a" "clipLibrary1.cel[0].cev[64].cevr"
		;
connectAttr "wrist_right_translateX.a" "clipLibrary1.cel[0].cev[65].cevr"
		;
connectAttr "elbow_right_translateZ.a" "clipLibrary1.cel[0].cev[66].cevr"
		;
connectAttr "elbow_right_translateY.a" "clipLibrary1.cel[0].cev[67].cevr"
		;
connectAttr "elbow_right_translateX.a" "clipLibrary1.cel[0].cev[68].cevr"
		;
connectAttr "elbow_right_rotateZ.a" "clipLibrary1.cel[0].cev[69].cevr";
connectAttr "elbow_right_rotateY.a" "clipLibrary1.cel[0].cev[70].cevr";
connectAttr "elbow_right_rotateX.a" "clipLibrary1.cel[0].cev[71].cevr";
connectAttr "shoulder_right_translateZ.a" "clipLibrary1.cel[0].cev[72].cevr"
		;
connectAttr "shoulder_right_translateY.a" "clipLibrary1.cel[0].cev[73].cevr"
		;
connectAttr "shoulder_right_translateX.a" "clipLibrary1.cel[0].cev[74].cevr"
		;
connectAttr "shoulder_right_rotateZ.a" "clipLibrary1.cel[0].cev[75].cevr"
		;
connectAttr "shoulder_right_rotateY.a" "clipLibrary1.cel[0].cev[76].cevr"
		;
connectAttr "shoulder_right_rotateX.a" "clipLibrary1.cel[0].cev[77].cevr"
		;
connectAttr "clavicle_right_rotateZ.a" "clipLibrary1.cel[0].cev[78].cevr"
		;
connectAttr "clavicle_right_rotateY.a" "clipLibrary1.cel[0].cev[79].cevr"
		;
connectAttr "clavicle_right_rotateX.a" "clipLibrary1.cel[0].cev[80].cevr"
		;
connectAttr "clavicle_right_translateZ.a" "clipLibrary1.cel[0].cev[81].cevr"
		;
connectAttr "clavicle_right_translateY.a" "clipLibrary1.cel[0].cev[82].cevr"
		;
connectAttr "clavicle_right_translateX.a" "clipLibrary1.cel[0].cev[83].cevr"
		;
connectAttr "head_rotateZ.a" "clipLibrary1.cel[0].cev[84].cevr";
connectAttr "head_rotateY.a" "clipLibrary1.cel[0].cev[85].cevr";
connectAttr "head_rotateX.a" "clipLibrary1.cel[0].cev[86].cevr";
connectAttr "head_translateZ.a" "clipLibrary1.cel[0].cev[87].cevr";
connectAttr "head_translateY.a" "clipLibrary1.cel[0].cev[88].cevr";
connectAttr "head_translateX.a" "clipLibrary1.cel[0].cev[89].cevr";
connectAttr "neck_rotateZ.a" "clipLibrary1.cel[0].cev[90].cevr";
connectAttr "neck_rotateY.a" "clipLibrary1.cel[0].cev[91].cevr";
connectAttr "neck_rotateX.a" "clipLibrary1.cel[0].cev[92].cevr";
connectAttr "neck_translateZ.a" "clipLibrary1.cel[0].cev[93].cevr";
connectAttr "neck_translateY.a" "clipLibrary1.cel[0].cev[94].cevr";
connectAttr "neck_translateX.a" "clipLibrary1.cel[0].cev[95].cevr";
connectAttr "chest_rotateZ.a" "clipLibrary1.cel[0].cev[96].cevr";
connectAttr "chest_rotateY.a" "clipLibrary1.cel[0].cev[97].cevr";
connectAttr "chest_rotateX.a" "clipLibrary1.cel[0].cev[98].cevr";
connectAttr "chest_translateZ.a" "clipLibrary1.cel[0].cev[99].cevr";
connectAttr "chest_translateY.a" "clipLibrary1.cel[0].cev[100].cevr";
connectAttr "chest_translateX.a" "clipLibrary1.cel[0].cev[101].cevr";
connectAttr "spine_2_rotateZ.a" "clipLibrary1.cel[0].cev[102].cevr";
connectAttr "spine_2_rotateY.a" "clipLibrary1.cel[0].cev[103].cevr";
connectAttr "spine_2_rotateX.a" "clipLibrary1.cel[0].cev[104].cevr";
connectAttr "spine_2_translateZ.a" "clipLibrary1.cel[0].cev[105].cevr";
connectAttr "spine_2_translateY.a" "clipLibrary1.cel[0].cev[106].cevr";
connectAttr "spine_2_translateX.a" "clipLibrary1.cel[0].cev[107].cevr";
connectAttr "spine_1_translateZ.a" "clipLibrary1.cel[0].cev[108].cevr";
connectAttr "spine_1_translateY.a" "clipLibrary1.cel[0].cev[109].cevr";
connectAttr "spine_1_translateX.a" "clipLibrary1.cel[0].cev[110].cevr";
connectAttr "spine_1_rotateZ.a" "clipLibrary1.cel[0].cev[111].cevr";
connectAttr "spine_1_rotateY.a" "clipLibrary1.cel[0].cev[112].cevr";
connectAttr "spine_1_rotateX.a" "clipLibrary1.cel[0].cev[113].cevr";
connectAttr "ankle_left_translateZ.a" "clipLibrary1.cel[0].cev[114].cevr"
		;
connectAttr "ankle_left_translateY.a" "clipLibrary1.cel[0].cev[115].cevr"
		;
connectAttr "ankle_left_translateX.a" "clipLibrary1.cel[0].cev[116].cevr"
		;
connectAttr "ankle_left_rotateZ.a" "clipLibrary1.cel[0].cev[117].cevr";
connectAttr "ankle_left_rotateX.a" "clipLibrary1.cel[0].cev[118].cevr";
connectAttr "ankle_left_rotateY.a" "clipLibrary1.cel[0].cev[119].cevr";
connectAttr "knee_left_rotateZ.a" "clipLibrary1.cel[0].cev[120].cevr";
connectAttr "knee_left_rotateY.a" "clipLibrary1.cel[0].cev[121].cevr";
connectAttr "knee_left_rotateX.a" "clipLibrary1.cel[0].cev[122].cevr";
connectAttr "knee_left_translateZ.a" "clipLibrary1.cel[0].cev[123].cevr"
		;
connectAttr "knee_left_translateY.a" "clipLibrary1.cel[0].cev[124].cevr"
		;
connectAttr "knee_left_translateX.a" "clipLibrary1.cel[0].cev[125].cevr"
		;
connectAttr "hip_left_rotateZ.a" "clipLibrary1.cel[0].cev[126].cevr";
connectAttr "hip_left_rotateY.a" "clipLibrary1.cel[0].cev[127].cevr";
connectAttr "hip_left_rotateX.a" "clipLibrary1.cel[0].cev[128].cevr";
connectAttr "hip_left_translateZ.a" "clipLibrary1.cel[0].cev[129].cevr";
connectAttr "hip_left_translateY.a" "clipLibrary1.cel[0].cev[130].cevr";
connectAttr "hip_left_translateX.a" "clipLibrary1.cel[0].cev[131].cevr";
connectAttr "ankle_right_translateZ.a" "clipLibrary1.cel[0].cev[132].cevr"
		;
connectAttr "ankle_right_translateY.a" "clipLibrary1.cel[0].cev[133].cevr"
		;
connectAttr "ankle_right_translateX.a" "clipLibrary1.cel[0].cev[134].cevr"
		;
connectAttr "ankle_right_rotateZ.a" "clipLibrary1.cel[0].cev[135].cevr";
connectAttr "ankle_right_rotateX.a" "clipLibrary1.cel[0].cev[136].cevr";
connectAttr "ankle_right_rotateY.a" "clipLibrary1.cel[0].cev[137].cevr";
connectAttr "knee_right_rotateZ.a" "clipLibrary1.cel[0].cev[138].cevr";
connectAttr "knee_right_rotateY.a" "clipLibrary1.cel[0].cev[139].cevr";
connectAttr "knee_right_rotateX.a" "clipLibrary1.cel[0].cev[140].cevr";
connectAttr "knee_right_translateZ.a" "clipLibrary1.cel[0].cev[141].cevr"
		;
connectAttr "knee_right_translateY.a" "clipLibrary1.cel[0].cev[142].cevr"
		;
connectAttr "knee_right_translateX.a" "clipLibrary1.cel[0].cev[143].cevr"
		;
connectAttr "hip_right_rotateZ.a" "clipLibrary1.cel[0].cev[144].cevr";
connectAttr "hip_right_rotateY.a" "clipLibrary1.cel[0].cev[145].cevr";
connectAttr "hip_right_rotateX.a" "clipLibrary1.cel[0].cev[146].cevr";
connectAttr "hip_right_translateZ.a" "clipLibrary1.cel[0].cev[147].cevr"
		;
connectAttr "hip_right_translateY.a" "clipLibrary1.cel[0].cev[148].cevr"
		;
connectAttr "hip_right_translateX.a" "clipLibrary1.cel[0].cev[149].cevr"
		;
connectAttr "god_joint_rotateZ.a" "clipLibrary1.cel[0].cev[150].cevr";
connectAttr "god_joint_rotateY.a" "clipLibrary1.cel[0].cev[151].cevr";
connectAttr "god_joint_rotateX.a" "clipLibrary1.cel[0].cev[152].cevr";
connectAttr "god_joint_translateZ.a" "clipLibrary1.cel[0].cev[153].cevr"
		;
connectAttr "god_joint_translateY.a" "clipLibrary1.cel[0].cev[154].cevr"
		;
connectAttr "god_joint_translateX.a" "clipLibrary1.cel[0].cev[155].cevr"
		;
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[0].llnk";
connectAttr ":initialShadingGroup.msg" "lightLinker1.lnk[0].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[1].llnk";
connectAttr ":initialParticleSE.msg" "lightLinker1.lnk[1].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[4].llnk";
connectAttr "lightLinker1.msg" ":lightList1.ln" -na;
// End of idle1.ma
