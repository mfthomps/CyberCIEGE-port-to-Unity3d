//Maya ASCII 4.0 scene
//Name: idle1.ma
//Last modified: Tue, Jul 08, 2003 12:07:30 PM
requires maya "4.0";
currentUnit -l foot -a degree -t ntsc;
createNode animClip -n "idle1Source";
	setAttr ".ihi" 0;
	setAttr ".du" 36;
	setAttr ".ci" no;
createNode animCurveTA -n "thumb_end_rotateZ1";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "thumb_end_rotateY1";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "thumb_end_rotateX1";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTL -n "thumb_end_translateZ1";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.067693830884163239 1 0.067693830884163239 
		36 0.067693830884163239;
createNode animCurveTL -n "thumb_end_translateY1";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.073770217834585317 1 -0.073770217834585317 
		36 -0.073770217834585317;
createNode animCurveTL -n "thumb_end_translateX1";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.10545852369943436 1 0.10545852369943436 
		36 0.10545852369943436;
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
	setAttr -s 3 ".ktv[0:2]"  0 0.28933627738548062 1 0.28933627738548062 
		36 0.28933627738548062;
createNode animCurveTL -n "thumb_left_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.16232249710710275 1 -0.16232249710710275 
		36 -0.16232249710710275;
createNode animCurveTL -n "thumb_left_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.091776815023168049 1 0.091776815023168049 
		36 0.091776815023168049;
createNode animCurveTA -n "finger_end_left_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "finger_end_left_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "finger_end_left_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTL -n "finger_end_left_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.036959957026618889 1 0.036959957026618889 
		36 0.036959957026618889;
createNode animCurveTL -n "finger_end_left_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.084010168265919116 1 -0.084010168265919116 
		36 -0.084010168265919116;
createNode animCurveTL -n "finger_end_left_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.099787614529651375 1 0.099787614529651375 
		36 0.099787614529651375;
createNode animCurveTA -n "finger_left_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
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
	setAttr -s 3 ".ktv[0:2]"  0 0.045404672816972427 1 0.045404672816972427 
		36 0.045404672816972427;
createNode animCurveTL -n "finger_left_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.057029061149123282 1 -0.057029061149123282 
		36 -0.057029061149123282;
createNode animCurveTL -n "finger_left_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.12511039243068253 1 0.12511039243068253 
		36 0.12511039243068253;
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
	setAttr -s 3 ".ktv[0:2]"  0 0.11541913849791476 1 0.11541913849791476 
		36 0.11541913849791476;
createNode animCurveTL -n "hand_left_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.0042292211302663377 1 -0.0042292211302663377 
		36 -0.0042292211302663377;
createNode animCurveTL -n "hand_left_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.24875739553546583 1 0.24875739553546583 
		36 0.24875739553546583;
createNode animCurveTA -n "wrist_left_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 25 0 36 0;
createNode animCurveTA -n "wrist_left_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 25 0 36 0;
createNode animCurveTA -n "wrist_left_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 25 0 36 0;
createNode animCurveTL -n "wrist_left_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.1214319352513185 1 0.1214319352513185 
		10 0.1214319352513185 25 0.1214319352513185 36 0.1214319352513185;
createNode animCurveTL -n "wrist_left_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.16553917685056299 1 -0.16553917685056299 
		10 -0.16553917685056299 25 -0.16553917685056299 36 -0.16553917685056299;
createNode animCurveTL -n "wrist_left_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 1.0761982946799671 1 1.0761982946799671 
		10 1.0761982946799671 25 1.0761982946799671 36 1.0761982946799671;
createNode animCurveTL -n "elbow_left_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.075444022644649861 1 0.075444022644649861 
		10 0.075444022644649861 25 0.075444022644649861 36 0.075444022644649861;
createNode animCurveTL -n "elbow_left_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 1.0941829975146715 1 1.0941829975146715 
		10 1.0941829975146715 25 1.0941829975146715 36 1.0941829975146715;
createNode animCurveTL -n "elbow_left_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.11464267087123899 1 -0.11464267087123899 
		10 -0.11464267087123899 25 -0.11464267087123899 36 -0.11464267087123899;
createNode animCurveTA -n "elbow_left_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 -87.741355407355385 
		25 -87.741355407355385 36 0;
createNode animCurveTA -n "elbow_left_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 55.331013325599528 25 
		55.331013325599528 36 0;
createNode animCurveTA -n "elbow_left_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 -27.439893857405028 10 -33.297444100575539 
		25 -33.297444100575539 36 -27.439893857405028;
createNode animCurveTL -n "shoulder_left_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.057000000000000141 1 0.057000000000000141 
		10 0.057000000000000141 25 0.057000000000000141 36 0.057000000000000141;
createNode animCurveTL -n "shoulder_left_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.15900000000000253 1 -0.15900000000000253 
		10 -0.15900000000000253 25 -0.15900000000000253 36 -0.15900000000000253;
createNode animCurveTL -n "shoulder_left_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.49139492237208066 1 0.49139492237208066 
		10 0.49139492237208066 25 0.49139492237208066 36 0.49139492237208066;
createNode animCurveTA -n "shoulder_left_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 -63.304988079915184 10 -39.828225529197994 
		25 -39.828225529197994 36 -63.304988079915184;
createNode animCurveTA -n "shoulder_left_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 18.118534051247892 10 16.705693946909811 
		25 16.705693946909811 36 18.118534051247892;
createNode animCurveTA -n "shoulder_left_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 1.6732448798548116e-015 10 
		7.1165933890691848 25 7.1165933890691848 36 1.6732448798548116e-015;
createNode animCurveTA -n "clavicle_left_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 25 0 36 0;
createNode animCurveTA -n "clavicle_left_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 25 0 36 0;
createNode animCurveTA -n "clavicle_left_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 25 0 36 0;
createNode animCurveTL -n "clavicle_left_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -2.9139711932418806e-017 1 -2.9139711932418806e-017 
		10 -2.9139711932418806e-017 25 -2.9139711932418806e-017 36 -2.9139711932418806e-017;
createNode animCurveTL -n "clavicle_left_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.3571899072136614 1 0.3571899072136614 
		10 0.3571899072136614 25 0.3571899072136614 36 0.3571899072136614;
createNode animCurveTL -n "clavicle_left_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.56138269497052595 1 0.56138269497052595 
		10 0.56138269497052595 25 0.56138269497052595 36 0.56138269497052595;
createNode animCurveTA -n "thumb_end_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "thumb_end_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "thumb_end_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTL -n "thumb_end_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.04227433746456892 1 0.04227433746456892 
		36 0.04227433746456892;
createNode animCurveTL -n "thumb_end_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.077183326903607366 1 -0.077183326903607366 
		36 -0.077183326903607366;
createNode animCurveTL -n "thumb_end_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.11584676025343214 1 -0.11584676025343214 
		36 -0.11584676025343214;
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
	setAttr -s 3 ".ktv[0:2]"  0 0.28197590383146315 1 0.28197590383146315 
		36 0.28197590383146315;
createNode animCurveTL -n "thumb_right_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.20475634163158851 1 -0.20475634163158851 
		36 -0.20475634163158851;
createNode animCurveTL -n "thumb_right_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.09954165477155516 1 -0.09954165477155516 
		36 -0.09954165477155516;
createNode animCurveTA -n "finger_end_right_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "finger_end_right_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "finger_end_right_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTL -n "finger_end_right_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.045882800134553571 1 0.045882800134553571 
		36 0.045882800134553571;
createNode animCurveTL -n "finger_end_right_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.086775501125412449 1 -0.086775501125412449 
		36 -0.086775501125412449;
createNode animCurveTL -n "finger_end_right_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.12492837884731278 1 -0.12492837884731278 
		36 -0.12492837884731278;
createNode animCurveTA -n "finger_right_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
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
	setAttr -s 3 ".ktv[0:2]"  0 0.045835128298432073 1 0.045835128298432073 
		36 0.045835128298432073;
createNode animCurveTL -n "finger_right_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.061864753308029881 1 -0.061864753308029881 
		36 -0.061864753308029881;
createNode animCurveTL -n "finger_right_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.12190444154987563 1 -0.12190444154987563 
		36 -0.12190444154987563;
createNode animCurveTA -n "hand_right_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "hand_right_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "hand_right_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTL -n "hand_right_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.053244883729203524 1 0.053244883729203524 
		36 0.053244883729203524;
createNode animCurveTL -n "hand_right_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.0097732238467965679 1 -0.0097732238467965679 
		36 -0.0097732238467965679;
createNode animCurveTL -n "hand_right_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.26976932020805461 1 -0.26976932020805461 
		36 -0.26976932020805461;
createNode animCurveTA -n "wrist_right_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 25 0 36 0;
createNode animCurveTA -n "wrist_right_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 25 0 36 0;
createNode animCurveTA -n "wrist_right_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 25 0 36 0;
createNode animCurveTL -n "wrist_right_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.17873053632472652 1 0.17873053632472652 
		10 0.17873053632472652 25 0.17873053632472652 36 0.17873053632472652;
createNode animCurveTL -n "wrist_right_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.12868271598693451 1 -0.12868271598693451 
		10 -0.12868271598693451 25 -0.12868271598693451 36 -0.12868271598693451;
createNode animCurveTL -n "wrist_right_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -1.0521375612712704 1 -1.0521375612712704 
		10 -1.0521375612712704 25 -1.0521375612712704 36 -1.0521375612712704;
createNode animCurveTL -n "elbow_right_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.088802627789248231 1 0.088802627789248231 
		10 0.088802627789248231 25 0.088802627789248231 36 0.088802627789248231;
createNode animCurveTL -n "elbow_right_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.17609010976960762 1 -0.17609010976960762 
		10 -0.17609010976960762 25 -0.17609010976960762 36 -0.17609010976960762;
createNode animCurveTL -n "elbow_right_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -1.0895977557391539 1 -1.0895977557391539 
		10 -1.0895977557391539 25 -1.0895977557391539 36 -1.0895977557391539;
createNode animCurveTA -n "elbow_right_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 96.227209308701859 25 
		96.227209308701859 36 0;
createNode animCurveTA -n "elbow_right_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 109.04059413821564 25 
		109.04059413821564 36 0;
createNode animCurveTA -n "elbow_right_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 24.267113484843872 10 50.226636793387613 
		25 50.226636793387613 36 24.267113484843872;
createNode animCurveTL -n "shoulder_right_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.057241855325225785 1 0.057241855325225785 
		10 0.057241855325225785 25 0.057241855325225785 36 0.057241855325225785;
createNode animCurveTL -n "shoulder_right_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.15947126744699208 1 -0.15947126744699208 
		10 -0.15947126744699208 25 -0.15947126744699208 36 -0.15947126744699208;
createNode animCurveTL -n "shoulder_right_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.47617824102458756 1 -0.47617824102458756 
		10 -0.47617824102458756 25 -0.47617824102458756 36 -0.47617824102458756;
createNode animCurveTA -n "shoulder_right_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 61.332966717093711 10 39.105104319241264 
		25 39.105104319241264 36 61.332966717093711;
createNode animCurveTA -n "shoulder_right_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 -18.780136341632883 10 -17.472510879255573 
		25 -17.472510879255573 36 -18.780136341632883;
createNode animCurveTA -n "shoulder_right_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 -1.6797031786863234e-015 
		10 6.995191726449451 25 6.995191726449451 36 -1.6797031786863234e-015;
createNode animCurveTA -n "clavicle_right_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 25 0 36 0;
createNode animCurveTA -n "clavicle_right_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 25 0 36 0;
createNode animCurveTA -n "clavicle_right_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 25 0 36 0;
createNode animCurveTL -n "clavicle_right_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -8.7419135797256413e-017 1 -8.7419135797256413e-017 
		10 -8.7419135797256413e-017 25 -8.7419135797256413e-017 36 -8.7419135797256413e-017;
createNode animCurveTL -n "clavicle_right_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.35711229848368564 1 0.35711229848368564 
		10 0.35711229848368564 25 0.35711229848368564 36 0.35711229848368564;
createNode animCurveTL -n "clavicle_right_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.58671554086065503 1 -0.58671554086065503 
		10 -0.58671554086065503 25 -0.58671554086065503 36 -0.58671554086065503;
createNode animCurveTA -n "head_end_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "head_end_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "head_end_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTL -n "head_end_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTL -n "head_end_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.70282742499326278 1 0.70282742499326278 
		36 0.70282742499326278;
createNode animCurveTL -n "head_end_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "head_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "head_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "head_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTL -n "head_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.13133322422558635 1 0.13133322422558635 
		36 0.13133322422558635;
createNode animCurveTL -n "head_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.19220161891613993 1 0.19220161891613993 
		36 0.19220161891613993;
createNode animCurveTL -n "head_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 5.6276068669483824e-016 1 5.6276068669483824e-016 
		36 5.6276068669483824e-016;
createNode animCurveTA -n "neck_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 0 1 0 10 0 12 0 16 0 18 0 23 
		0 25 0 36 0;
createNode animCurveTA -n "neck_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 0 1 0 10 0 12 -19.997876687381137 
		16 -19.997876687381137 18 25.703609184693633 23 25.703609184693633 25 0 36 
		0;
createNode animCurveTA -n "neck_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 0 1 0 10 0 12 0 16 0 18 0 23 
		0 25 0 36 0;
createNode animCurveTL -n "neck_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 0.032928887641260923 1 0.032928887641260923 
		10 0.032928887641260923 12 0.032928887641260923 16 0.032928887641260923 18 
		0.032928887641260923 23 0.032928887641260923 25 0.032928887641260923 36 0.032928887641260923;
createNode animCurveTL -n "neck_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 0.48119372296916313 1 0.48119372296916313 
		10 0.48119372296916313 12 0.48119372296916313 16 0.48119372296916313 18 0.48119372296916313 
		23 0.48119372296916313 25 0.48119372296916313 36 0.48119372296916313;
createNode animCurveTL -n "neck_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 0.0082292523803426838 1 0.0082292523803426838 
		10 0.0082292523803426838 12 0.0082292523803426838 16 0.0082292523803426838 
		18 0.0082292523803426838 23 0.0082292523803426838 25 0.0082292523803426838 
		36 0.0082292523803426838;
createNode animCurveTA -n "chest_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 25 0 36 0;
createNode animCurveTA -n "chest_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 25 0 36 0;
createNode animCurveTA -n "chest_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 25 0 36 0;
createNode animCurveTL -n "chest_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.048530798985532905 1 -0.048530798985532905 
		10 -0.048530798985532905 25 -0.048530798985532905 36 -0.048530798985532905;
createNode animCurveTL -n "chest_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.58411191666879003 1 0.58411191666879003 
		10 0.58411191666879003 25 0.58411191666879003 36 0.58411191666879003;
createNode animCurveTL -n "chest_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 1.0927391974657027e-017 1 1.0927391974657027e-017 
		10 1.0927391974657027e-017 25 1.0927391974657027e-017 36 1.0927391974657027e-017;
createNode animCurveTA -n "spine_2_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 25 0 36 0;
createNode animCurveTA -n "spine_2_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 25 0 36 0;
createNode animCurveTA -n "spine_2_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 25 0 36 0;
createNode animCurveTL -n "spine_2_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.11191009313517924 1 -0.11191009313517924 
		10 -0.11191009313517924 25 -0.11191009313517924 36 -0.11191009313517924;
createNode animCurveTL -n "spine_2_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.47708808834663891 1 0.47708808834663891 
		10 0.47708808834663891 25 0.47708808834663891 36 0.47708808834663891;
createNode animCurveTL -n "spine_2_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -1.1655884772967518e-016 1 -1.1655884772967518e-016 
		10 -1.1655884772967518e-016 25 -1.1655884772967518e-016 36 -1.1655884772967518e-016;
createNode animCurveTA -n "spine_1_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 0 1 0 10 0 12 4.5255636127123902 
		16 4.5255636127123902 18 -4.4796788738602507 23 -4.4796788738602507 25 0 
		36 0;
createNode animCurveTA -n "spine_1_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 0 1 0 10 0 12 -12.325899334468494 
		16 -12.325899334468494 18 5.2402038809873082 23 5.2402038809873082 25 0 36 
		0;
createNode animCurveTA -n "spine_1_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 0 1 0 10 0 12 0 16 0 18 -0.23255540886558324 
		23 -0.23255540886558324 25 0 36 0;
createNode animCurveTL -n "spine_1_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 0.12766935089065309 1 0.12766935089065309 
		10 0.12766935089065309 12 0.12766935089065309 16 0.12766935089065309 18 0.12766935089065309 
		23 0.12766935089065309 25 0.12766935089065309 36 0.12766935089065309;
createNode animCurveTL -n "spine_1_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 0.558757340808401 1 0.558757340808401 
		10 0.558757340808401 12 0.558757340808401 16 0.558757340808401 18 0.558757340808401 
		23 0.558757340808401 25 0.558757340808401 36 0.558757340808401;
createNode animCurveTL -n "spine_1_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 3.233427269638568e-016 1 3.233427269638568e-016 
		10 3.233427269638568e-016 12 3.233427269638568e-016 16 3.233427269638568e-016 
		18 3.233427269638568e-016 23 3.233427269638568e-016 25 3.233427269638568e-016 
		36 3.233427269638568e-016;
createNode animCurveTA -n "toe_left_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "toe_left_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "toe_left_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTL -n "toe_left_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.50261554175463674 1 0.50261554175463674 
		36 0.50261554175463674;
createNode animCurveTL -n "toe_left_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.072806051950216125 1 -0.072806051950216125 
		36 -0.072806051950216125;
createNode animCurveTL -n "toe_left_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "foot_left_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "foot_left_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "foot_left_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTL -n "foot_left_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.31633769016001967 1 0.31633769016001967 
		36 0.31633769016001967;
createNode animCurveTL -n "foot_left_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.31925102969774066 1 -0.31925102969774066 
		36 -0.31925102969774066;
createNode animCurveTL -n "foot_left_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTL -n "ankle_left_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 -0.31467227901395023 1 -0.31467227901395023 
		5 -0.31467227901395023 10 -0.31467227901395023 25 -0.31467227901395023 30 
		-0.31467227901395023 36 -0.31467227901395023;
createNode animCurveTL -n "ankle_left_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 -1.3477978397522195 1 -1.3477978397522195 
		5 -1.3477978397522195 10 -1.3477978397522195 25 -1.3477978397522195 30 -1.3477978397522195 
		36 -1.3477978397522195;
createNode animCurveTL -n "ankle_left_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 -0.0080000000000004234 1 -0.0080000000000004234 
		5 -0.0080000000000004234 10 -0.0080000000000004234 25 -0.0080000000000004234 
		30 -0.0080000000000004234 36 -0.0080000000000004234;
createNode animCurveTA -n "ankle_left_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0 1 0 5 -6.3863194539504624 10 
		-12.790183851195421 25 -12.790183851195421 30 -6.3863194539504624 36 0;
createNode animCurveTA -n "ankle_left_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0 1 0 5 2.6824433587792931 10 
		5.3722560652604887 25 5.3722560652604887 30 2.6824433587792931 36 0;
createNode animCurveTA -n "ankle_left_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 12.332318745691806 1 12.332318745691806 
		5 12.184038448257404 10 12.035350789033453 25 12.035350789033453 30 12.184038448257404 
		36 12.332318745691806;
createNode animCurveTA -n "knee_left_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0 1 -1.8791466464407292e-014 
		5 -17.047296293845896 10 3.2816635143814747 25 3.2816635143814747 30 -17.047296293845896 
		36 -1.8791466464407292e-014;
createNode animCurveTA -n "knee_left_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0 1 4.0000861710403006e-015 5 
		3.6288096135444623 10 -0.67815997134166106 25 -0.67815997134166106 30 3.6288096135444623 
		36 4.0000861710403006e-015;
createNode animCurveTA -n "knee_left_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0 1 6.5230759777298564e-014 5 
		59.17622722540235 10 -11.298060374823878 25 -11.298060374823878 30 59.17622722540235 
		36 6.5230759777298564e-014;
createNode animCurveTL -n "knee_left_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 -1.422630675941676 1 -1.422630675941676 
		5 -1.422630675941676 10 -1.422630675941676 25 -1.422630675941676 30 -1.422630675941676 
		36 -1.422630675941676;
createNode animCurveTL -n "knee_left_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 -0.045955384666098248 1 -0.045955384666098248 
		5 -0.045955384666098248 10 -0.045955384666098248 25 -0.045955384666098248 
		30 -0.045955384666098248 36 -0.045955384666098248;
createNode animCurveTL -n "knee_left_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0.073999999999999955 1 0.073999999999999955 
		5 0.073999999999999955 10 0.073999999999999955 25 0.073999999999999955 30 
		0.073999999999999955 36 0.073999999999999955;
createNode animCurveTA -n "hip_left_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0 1 5.3084091339474923e-008 5 
		13.409634459513548 10 11.568233142007506 25 11.568233142007506 30 13.409634459513548 
		36 5.3084091339474923e-008;
createNode animCurveTA -n "hip_left_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0 1 4.0780476731387268e-007 5 
		1.0420795167766479 10 -1.7029675427849957 25 -1.7029675427849957 30 1.0420795167766479 
		36 4.0780476731387268e-007;
createNode animCurveTA -n "hip_left_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0 1 -9.7151447751050411e-009 
		5 -44.421051212406852 10 5.4258280774849172 25 5.4258280774849172 30 -44.421051212406852 
		36 -9.7151447751050411e-009;
createNode animCurveTL -n "hip_left_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0.23857025923405772 1 0.23857025923405772 
		5 0.23857025923405772 10 0.23857025923405772 25 0.23857025923405772 30 0.23857025923405772 
		36 0.23857025923405772;
createNode animCurveTL -n "hip_left_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0.51696414622172004 1 0.51696414622172004 
		5 0.51696414622172004 10 0.51696414622172004 25 0.51696414622172004 30 0.51696414622172004 
		36 0.51696414622172004;
createNode animCurveTL -n "hip_left_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 -0.39827875495140175 1 -0.39827875495140175 
		5 -0.39827875495140175 10 -0.39827875495140175 25 -0.39827875495140175 30 
		-0.39827875495140175 36 -0.39827875495140175;
createNode animCurveTA -n "toe_right_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "toe_right_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "toe_right_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTL -n "toe_right_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.50298908175463664 1 0.50298908175463664 
		36 0.50298908175463664;
createNode animCurveTL -n "toe_right_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.069857591953772072 1 -0.069857591953772072 
		36 -0.069857591953772072;
createNode animCurveTL -n "toe_right_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "foot_right_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "foot_right_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "foot_right_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTL -n "foot_right_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.31980250193466442 1 0.31980250193466442 
		36 0.31980250193466442;
createNode animCurveTL -n "foot_right_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.31552827848608578 1 -0.31552827848608578 
		36 -0.31552827848608578;
createNode animCurveTL -n "foot_right_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1.1655884772967523e-016 1 1.1655884772967523e-016 
		36 1.1655884772967523e-016;
createNode animCurveTL -n "ankle_right_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 -0.31067255460704729 1 -0.31067255460704729 
		5 -0.31067255460704729 10 -0.31067255460704729 25 -0.31067255460704729 30 
		-0.31067255460704729 36 -0.31067255460704729;
createNode animCurveTL -n "ankle_right_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 -1.3479572821830512 1 -1.3479572821830512 
		5 -1.3479572821830512 10 -1.3479572821830512 25 -1.3479572821830512 30 -1.3479572821830512 
		36 -1.3479572821830512;
createNode animCurveTL -n "ankle_right_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0.0082292523803421599 1 0.0082292523803421599 
		5 0.0082292523803421599 10 0.0082292523803421599 25 0.0082292523803421599 
		30 0.0082292523803421599 36 0.0082292523803421599;
createNode animCurveTA -n "ankle_right_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0 1 0 5 6.0981672526602724 10 
		12.213087567596475 25 12.213087567596475 30 6.0981672526602724 36 0;
createNode animCurveTA -n "ankle_right_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0 1 0 5 -6.6471820727341697 10 
		4.8379187881430816 25 4.8379187881430816 30 -6.6471820727341697 36 0;
createNode animCurveTA -n "ankle_right_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 -10.725239901888113 1 -10.725239901888113 
		5 -10.606756767067539 10 -10.487948130659444 25 -10.487948130659444 30 -10.606756767067539 
		36 -10.725239901888113;
createNode animCurveTA -n "knee_right_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0 1 -1.2209505928047884e-013 
		5 3.2563031441311505 10 -3.2928444063953899 25 -3.2928444063953899 30 3.2563031441311505 
		36 -1.2209505928047884e-013;
createNode animCurveTA -n "knee_right_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0 1 2.4947223278023968e-014 5 
		-0.68342709430951676 10 0.672814486599559 25 0.672814486599559 30 -0.68342709430951676 
		36 2.4947223278023968e-014;
createNode animCurveTA -n "knee_right_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0 1 -4.0877603296278821e-013 
		5 10.986841035820698 10 -11.024490929791664 25 -11.024490929791664 30 10.986841035820698 
		36 -4.0877603296278821e-013;
createNode animCurveTL -n "knee_right_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 -0.048720761297601417 1 -0.048720761297601417 
		5 -0.048720761297601417 10 -0.048720761297601417 25 -0.048720761297601417 
		30 -0.048720761297601417 36 -0.048720761297601417;
createNode animCurveTL -n "knee_right_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 -1.422786667389194 1 -1.422786667389194 
		5 -1.422786667389194 10 -1.422786667389194 25 -1.422786667389194 30 -1.422786667389194 
		36 -1.422786667389194;
createNode animCurveTL -n "knee_right_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 -0.074063271423084859 1 -0.074063271423084859 
		5 -0.074063271423084859 10 -0.074063271423084859 25 -0.074063271423084859 
		30 -0.074063271423084859 36 -0.074063271423084859;
createNode animCurveTA -n "hip_right_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0 1 5.289956097839203e-008 5 
		-6.978542873617422 10 -10.482854522458529 25 -10.482854522458529 30 -6.978542873617422 
		36 5.289956097839203e-008;
createNode animCurveTA -n "hip_right_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0 1 4.0782933886737026e-007 5 
		7.9368851895066994 10 1.5072105710090671 25 1.5072105710090671 30 7.9368851895066994 
		36 4.0782933886737026e-007;
createNode animCurveTA -n "hip_right_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0 1 9.6901934901878081e-009 5 
		-5.2753475239962144 10 5.313628358972454 25 5.313628358972454 30 -5.2753475239962144 
		36 9.6901934901878081e-009;
createNode animCurveTL -n "hip_right_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0.23772558061548399 1 0.23772558061548399 
		5 0.23772558061548399 10 0.23772558061548399 25 0.23772558061548399 30 0.23772558061548399 
		36 0.23772558061548399;
createNode animCurveTL -n "hip_right_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 -0.3993348915190601 1 -0.3993348915190601 
		5 -0.3993348915190601 10 -0.3993348915190601 25 -0.3993348915190601 30 -0.3993348915190601 
		36 -0.3993348915190601;
createNode animCurveTL -n "hip_right_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 -0.51002476940581498 1 -0.51002476940581498 
		5 -0.51002476940581498 10 -0.51002476940581498 25 -0.51002476940581498 30 
		-0.51002476940581498 36 -0.51002476940581498;
createNode animCurveTA -n "god_joint_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0 1 0 5 0 10 0 25 0 30 0 36 0;
createNode animCurveTA -n "god_joint_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0 1 0 5 0 10 0 25 0 30 0 36 0;
createNode animCurveTA -n "god_joint_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0 1 0 5 0 10 0 25 0 30 0 36 0;
createNode animCurveTL -n "god_joint_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0 1 0 5 0.30275908637692073 10 
		0.6063499226462874 25 0.6063499226462874 30 0.30275908637692073 36 0;
createNode animCurveTL -n "god_joint_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 -0.22555293471241178 1 -0.22555293471241178 
		5 -0.22555293471241178 10 -0.22555293471241178 25 -0.22555293471241178 30 
		-0.22555293471241178 36 -0.22555293471241178;
createNode animCurveTL -n "god_joint_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 3.6331280509189527 1 3.6331280509189527 
		5 3.5663304144042782 10 3.5406455737925393 25 3.5406455737925393 30 3.5663304144042782 
		36 3.6331280509189527;
createNode clipLibrary -n "clipLibrary1";
	setAttr -s 210 ".cel[0].cev";
	setAttr ".cd[0].cm" -type "characterMapping" 210 "thumb_end_left.rotateZ" 
		2 1 "thumb_end_left.rotateY" 2 2 "thumb_end_left.rotateX" 
		2 3 "thumb_end_left.translateZ" 1 1 "thumb_end_left.translateY" 
		1 2 "thumb_end_left.translateX" 1 3 "thumb_left.rotateZ" 
		2 4 "thumb_left.rotateY" 2 5 "thumb_left.rotateX" 2 
		6 "thumb_left.translateZ" 1 4 "thumb_left.translateY" 1 
		5 "thumb_left.translateX" 1 6 "finger_end_left.rotateZ" 2 
		7 "finger_end_left.rotateY" 2 8 "finger_end_left.rotateX" 
		2 9 "finger_end_left.translateZ" 1 7 "finger_end_left.translateY" 
		1 8 "finger_end_left.translateX" 1 9 "finger_left.rotateZ" 
		2 10 "finger_left.rotateY" 2 11 "finger_left.rotateX" 2 
		12 "finger_left.translateZ" 1 10 "finger_left.translateY" 1 
		11 "finger_left.translateX" 1 12 "hand_left.rotateZ" 2 
		13 "hand_left.rotateY" 2 14 "hand_left.rotateX" 2 15 "hand_left.translateZ" 
		1 13 "hand_left.translateY" 1 14 "hand_left.translateX" 
		1 15 "wrist_left.rotateZ" 2 16 "wrist_left.rotateY" 2 
		17 "wrist_left.rotateX" 2 18 "wrist_left.translateZ" 1 
		16 "wrist_left.translateY" 1 17 "wrist_left.translateX" 1 
		18 "elbow_left.translateZ" 1 19 "elbow_left.translateX" 1 
		20 "elbow_left.translateY" 1 21 "elbow_left.rotateZ" 2 
		19 "elbow_left.rotateX" 2 20 "elbow_left.rotateY" 2 21 "shoulder_left.translateZ" 
		1 22 "shoulder_left.translateY" 1 23 "shoulder_left.translateX" 
		1 24 "shoulder_left.rotateZ" 2 22 "shoulder_left.rotateY" 
		2 23 "shoulder_left.rotateX" 2 24 "clavicle_left.rotateZ" 
		2 25 "clavicle_left.rotateY" 2 26 "clavicle_left.rotateX" 
		2 27 "clavicle_left.translateZ" 1 25 "clavicle_left.translateY" 
		1 26 "clavicle_left.translateX" 1 27 "thumb_end_right.rotateZ" 
		2 28 "thumb_end_right.rotateY" 2 29 "thumb_end_right.rotateX" 
		2 30 "thumb_end_right.translateZ" 1 28 "thumb_end_right.translateY" 
		1 29 "thumb_end_right.translateX" 1 30 "thumb_right.rotateZ" 
		2 31 "thumb_right.rotateY" 2 32 "thumb_right.rotateX" 2 
		33 "thumb_right.translateZ" 1 31 "thumb_right.translateY" 1 
		32 "thumb_right.translateX" 1 33 "finger_end_right.rotateZ" 
		2 34 "finger_end_right.rotateY" 2 35 "finger_end_right.rotateX" 
		2 36 "finger_end_right.translateZ" 1 34 "finger_end_right.translateY" 
		1 35 "finger_end_right.translateX" 1 36 "finger_right.rotateZ" 
		2 37 "finger_right.rotateY" 2 38 "finger_right.rotateX" 
		2 39 "finger_right.translateZ" 1 37 "finger_right.translateY" 
		1 38 "finger_right.translateX" 1 39 "hand_right.rotateZ" 
		2 40 "hand_right.rotateX" 2 41 "hand_right.rotateY" 2 
		42 "hand_right.translateZ" 1 40 "hand_right.translateY" 1 
		41 "hand_right.translateX" 1 42 "wrist_right.rotateZ" 2 
		43 "wrist_right.rotateY" 2 44 "wrist_right.rotateX" 2 45 "wrist_right.translateZ" 
		1 43 "wrist_right.translateY" 1 44 "wrist_right.translateX" 
		1 45 "elbow_right.translateZ" 1 46 "elbow_right.translateY" 
		1 47 "elbow_right.translateX" 1 48 "elbow_right.rotateZ" 
		2 46 "elbow_right.rotateX" 2 47 "elbow_right.rotateY" 2 
		48 "shoulder_right.translateZ" 1 49 "shoulder_right.translateY" 
		1 50 "shoulder_right.translateX" 1 51 "shoulder_right.rotateZ" 
		2 49 "shoulder_right.rotateY" 2 50 "shoulder_right.rotateX" 
		2 51 "clavicle_right.rotateZ" 2 52 "clavicle_right.rotateY" 
		2 53 "clavicle_right.rotateX" 2 54 "clavicle_right.translateZ" 
		1 52 "clavicle_right.translateY" 1 53 "clavicle_right.translateX" 
		1 54 "head_end.rotateZ" 2 55 "head_end.rotateY" 2 
		56 "head_end.rotateX" 2 57 "head_end.translateZ" 1 55 "head_end.translateY" 
		1 56 "head_end.translateX" 1 57 "head.rotateZ" 2 58 "head.rotateY" 
		2 59 "head.rotateX" 2 60 "head.translateZ" 1 58 "head.translateY" 
		1 59 "head.translateX" 1 60 "neck.rotateZ" 2 61 "neck.rotateY" 
		2 62 "neck.rotateX" 2 63 "neck.translateZ" 1 61 "neck.translateY" 
		1 62 "neck.translateX" 1 63 "chest.rotateZ" 2 64 "chest.rotateY" 
		2 65 "chest.rotateX" 2 66 "chest.translateZ" 1 64 "chest.translateY" 
		1 65 "chest.translateX" 1 66 "spine_2.rotateZ" 2 67 "spine_2.rotateY" 
		2 68 "spine_2.rotateX" 2 69 "spine_2.translateZ" 1 
		67 "spine_2.translateY" 1 68 "spine_2.translateX" 1 69 "spine_1.rotateZ" 
		2 70 "spine_1.rotateY" 2 71 "spine_1.rotateX" 2 72 "spine_1.translateZ" 
		1 70 "spine_1.translateY" 1 71 "spine_1.translateX" 1 
		72 "toe_left.rotateZ" 2 73 "toe_left.rotateY" 2 74 "toe_left.rotateX" 
		2 75 "toe_left.translateZ" 1 73 "toe_left.translateY" 1 
		74 "toe_left.translateX" 1 75 "foot_left.rotateZ" 2 76 "foot_left.rotateY" 
		2 77 "foot_left.rotateX" 2 78 "foot_left.translateZ" 1 
		76 "foot_left.translateY" 1 77 "foot_left.translateX" 1 
		78 "ankle_left.translateZ" 1 79 "ankle_left.translateY" 1 
		80 "ankle_left.translateX" 1 81 "ankle_left.rotateZ" 2 
		79 "ankle_left.rotateX" 2 80 "ankle_left.rotateY" 2 81 "knee_left.rotateZ" 
		2 82 "knee_left.rotateY" 2 83 "knee_left.rotateX" 2 
		84 "knee_left.translateY" 1 82 "knee_left.translateZ" 1 
		83 "knee_left.translateX" 1 84 "hip_left.rotateZ" 2 85 "hip_left.rotateY" 
		2 86 "hip_left.rotateX" 2 87 "hip_left.translateZ" 1 
		85 "hip_left.translateX" 1 86 "hip_left.translateY" 1 87 "toe_right.rotateZ" 
		2 88 "toe_right.rotateY" 2 89 "toe_right.rotateX" 2 
		90 "toe_right.translateZ" 1 88 "toe_right.translateY" 1 
		89 "toe_right.translateX" 1 90 "foot_right.rotateZ" 2 91 "foot_right.rotateY" 
		2 92 "foot_right.rotateX" 2 93 "foot_right.translateZ" 
		1 91 "foot_right.translateY" 1 92 "foot_right.translateX" 
		1 93 "ankle_right.translateZ" 1 94 "ankle_right.translateY" 
		1 95 "ankle_right.translateX" 1 96 "ankle_right.rotateZ" 
		2 94 "ankle_right.rotateX" 2 95 "ankle_right.rotateY" 2 
		96 "knee_right.rotateZ" 2 97 "knee_right.rotateY" 2 98 "knee_right.rotateX" 
		2 99 "knee_right.translateZ" 1 97 "knee_right.translateY" 
		1 98 "knee_right.translateX" 1 99 "hip_right.rotateZ" 2 
		100 "hip_right.rotateY" 2 101 "hip_right.rotateX" 2 102 "hip_right.translateZ" 
		1 100 "hip_right.translateY" 1 101 "hip_right.translateX" 
		1 102 "god_joint.rotateZ" 2 103 "god_joint.rotateY" 2 
		104 "god_joint.rotateX" 2 105 "god_joint.translateX" 1 103 "god_joint.translateZ" 
		1 104 "god_joint.translateY" 1 105  ;
	setAttr ".cd[0].cim" -type "Int32Array" 210 0 1 2 3
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
		 147 148 149 150 151 152 153 154 155 156 157
		 158 159 160 161 162 163 164 165 166 167 168
		 169 170 171 172 173 174 175 176 177 178 179
		 180 181 182 183 184 185 186 187 188 189 190
		 191 192 193 194 195 196 197 198 199 200 201
		 202 203 204 205 206 207 208 209 ;
createNode lightLinker -n "lightLinker1";
select -ne :time1;
	setAttr ".o" 0;
select -ne :renderPartition;
	setAttr -s 5 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 5 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :lightList1;
select -ne :defaultTextureList1;
	setAttr -s 3 ".tx";
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultRenderGlobals;
	setAttr ".top" 0;
	setAttr ".rght" 0;
	setAttr ".fs" 1;
	setAttr ".ef" 10;
select -ne :defaultRenderQuality;
	setAttr ".rfl" 10;
	setAttr ".rfr" 10;
	setAttr ".sl" 10;
	setAttr ".eaa" 0;
	setAttr ".ufil" yes;
	setAttr ".ss" 2;
select -ne :defaultResolution;
	setAttr ".w" 640;
	setAttr ".h" 480;
	setAttr ".dar" 1.3329999446868896;
	setAttr ".ldar" yes;
select -ne :characterPartition;
select -ne :hyperGraphLayout;
	setAttr ".cch" no;
	setAttr ".ihi" 2;
	setAttr ".nds" 0;
	setAttr ".img" -type "string" "";
	setAttr ".ims" 1;
select -ne :ikSystem;
connectAttr "idle1Source.st" "clipLibrary1.st[0]";
connectAttr "idle1Source.du" "clipLibrary1.du[0]";
connectAttr "thumb_end_rotateZ1.a" "clipLibrary1.cel[0].cev[0].cevr";
connectAttr "thumb_end_rotateY1.a" "clipLibrary1.cel[0].cev[1].cevr";
connectAttr "thumb_end_rotateX1.a" "clipLibrary1.cel[0].cev[2].cevr";
connectAttr "thumb_end_translateZ1.a" "clipLibrary1.cel[0].cev[3].cevr";
connectAttr "thumb_end_translateY1.a" "clipLibrary1.cel[0].cev[4].cevr";
connectAttr "thumb_end_translateX1.a" "clipLibrary1.cel[0].cev[5].cevr";
connectAttr "thumb_left_rotateZ.a" "clipLibrary1.cel[0].cev[6].cevr";
connectAttr "thumb_left_rotateY.a" "clipLibrary1.cel[0].cev[7].cevr";
connectAttr "thumb_left_rotateX.a" "clipLibrary1.cel[0].cev[8].cevr";
connectAttr "thumb_left_translateZ.a" "clipLibrary1.cel[0].cev[9].cevr";
connectAttr "thumb_left_translateY.a" "clipLibrary1.cel[0].cev[10].cevr"
		;
connectAttr "thumb_left_translateX.a" "clipLibrary1.cel[0].cev[11].cevr"
		;
connectAttr "finger_end_left_rotateZ.a" "clipLibrary1.cel[0].cev[12].cevr"
		;
connectAttr "finger_end_left_rotateY.a" "clipLibrary1.cel[0].cev[13].cevr"
		;
connectAttr "finger_end_left_rotateX.a" "clipLibrary1.cel[0].cev[14].cevr"
		;
connectAttr "finger_end_left_translateZ.a" "clipLibrary1.cel[0].cev[15].cevr"
		;
connectAttr "finger_end_left_translateY.a" "clipLibrary1.cel[0].cev[16].cevr"
		;
connectAttr "finger_end_left_translateX.a" "clipLibrary1.cel[0].cev[17].cevr"
		;
connectAttr "finger_left_rotateZ.a" "clipLibrary1.cel[0].cev[18].cevr";
connectAttr "finger_left_rotateY.a" "clipLibrary1.cel[0].cev[19].cevr";
connectAttr "finger_left_rotateX.a" "clipLibrary1.cel[0].cev[20].cevr";
connectAttr "finger_left_translateZ.a" "clipLibrary1.cel[0].cev[21].cevr"
		;
connectAttr "finger_left_translateY.a" "clipLibrary1.cel[0].cev[22].cevr"
		;
connectAttr "finger_left_translateX.a" "clipLibrary1.cel[0].cev[23].cevr"
		;
connectAttr "hand_left_rotateZ.a" "clipLibrary1.cel[0].cev[24].cevr";
connectAttr "hand_left_rotateY.a" "clipLibrary1.cel[0].cev[25].cevr";
connectAttr "hand_left_rotateX.a" "clipLibrary1.cel[0].cev[26].cevr";
connectAttr "hand_left_translateZ.a" "clipLibrary1.cel[0].cev[27].cevr";
connectAttr "hand_left_translateY.a" "clipLibrary1.cel[0].cev[28].cevr";
connectAttr "hand_left_translateX.a" "clipLibrary1.cel[0].cev[29].cevr";
connectAttr "wrist_left_rotateZ.a" "clipLibrary1.cel[0].cev[30].cevr";
connectAttr "wrist_left_rotateY.a" "clipLibrary1.cel[0].cev[31].cevr";
connectAttr "wrist_left_rotateX.a" "clipLibrary1.cel[0].cev[32].cevr";
connectAttr "wrist_left_translateZ.a" "clipLibrary1.cel[0].cev[33].cevr"
		;
connectAttr "wrist_left_translateY.a" "clipLibrary1.cel[0].cev[34].cevr"
		;
connectAttr "wrist_left_translateX.a" "clipLibrary1.cel[0].cev[35].cevr"
		;
connectAttr "elbow_left_translateZ.a" "clipLibrary1.cel[0].cev[36].cevr"
		;
connectAttr "elbow_left_translateX.a" "clipLibrary1.cel[0].cev[37].cevr"
		;
connectAttr "elbow_left_translateY.a" "clipLibrary1.cel[0].cev[38].cevr"
		;
connectAttr "elbow_left_rotateZ.a" "clipLibrary1.cel[0].cev[39].cevr";
connectAttr "elbow_left_rotateX.a" "clipLibrary1.cel[0].cev[40].cevr";
connectAttr "elbow_left_rotateY.a" "clipLibrary1.cel[0].cev[41].cevr";
connectAttr "shoulder_left_translateZ.a" "clipLibrary1.cel[0].cev[42].cevr"
		;
connectAttr "shoulder_left_translateY.a" "clipLibrary1.cel[0].cev[43].cevr"
		;
connectAttr "shoulder_left_translateX.a" "clipLibrary1.cel[0].cev[44].cevr"
		;
connectAttr "shoulder_left_rotateZ.a" "clipLibrary1.cel[0].cev[45].cevr"
		;
connectAttr "shoulder_left_rotateY.a" "clipLibrary1.cel[0].cev[46].cevr"
		;
connectAttr "shoulder_left_rotateX.a" "clipLibrary1.cel[0].cev[47].cevr"
		;
connectAttr "clavicle_left_rotateZ.a" "clipLibrary1.cel[0].cev[48].cevr"
		;
connectAttr "clavicle_left_rotateY.a" "clipLibrary1.cel[0].cev[49].cevr"
		;
connectAttr "clavicle_left_rotateX.a" "clipLibrary1.cel[0].cev[50].cevr"
		;
connectAttr "clavicle_left_translateZ.a" "clipLibrary1.cel[0].cev[51].cevr"
		;
connectAttr "clavicle_left_translateY.a" "clipLibrary1.cel[0].cev[52].cevr"
		;
connectAttr "clavicle_left_translateX.a" "clipLibrary1.cel[0].cev[53].cevr"
		;
connectAttr "thumb_end_rotateZ.a" "clipLibrary1.cel[0].cev[54].cevr";
connectAttr "thumb_end_rotateY.a" "clipLibrary1.cel[0].cev[55].cevr";
connectAttr "thumb_end_rotateX.a" "clipLibrary1.cel[0].cev[56].cevr";
connectAttr "thumb_end_translateZ.a" "clipLibrary1.cel[0].cev[57].cevr";
connectAttr "thumb_end_translateY.a" "clipLibrary1.cel[0].cev[58].cevr";
connectAttr "thumb_end_translateX.a" "clipLibrary1.cel[0].cev[59].cevr";
connectAttr "thumb_right_rotateZ.a" "clipLibrary1.cel[0].cev[60].cevr";
connectAttr "thumb_right_rotateY.a" "clipLibrary1.cel[0].cev[61].cevr";
connectAttr "thumb_right_rotateX.a" "clipLibrary1.cel[0].cev[62].cevr";
connectAttr "thumb_right_translateZ.a" "clipLibrary1.cel[0].cev[63].cevr"
		;
connectAttr "thumb_right_translateY.a" "clipLibrary1.cel[0].cev[64].cevr"
		;
connectAttr "thumb_right_translateX.a" "clipLibrary1.cel[0].cev[65].cevr"
		;
connectAttr "finger_end_right_rotateZ.a" "clipLibrary1.cel[0].cev[66].cevr"
		;
connectAttr "finger_end_right_rotateY.a" "clipLibrary1.cel[0].cev[67].cevr"
		;
connectAttr "finger_end_right_rotateX.a" "clipLibrary1.cel[0].cev[68].cevr"
		;
connectAttr "finger_end_right_translateZ.a" "clipLibrary1.cel[0].cev[69].cevr"
		;
connectAttr "finger_end_right_translateY.a" "clipLibrary1.cel[0].cev[70].cevr"
		;
connectAttr "finger_end_right_translateX.a" "clipLibrary1.cel[0].cev[71].cevr"
		;
connectAttr "finger_right_rotateZ.a" "clipLibrary1.cel[0].cev[72].cevr";
connectAttr "finger_right_rotateY.a" "clipLibrary1.cel[0].cev[73].cevr";
connectAttr "finger_right_rotateX.a" "clipLibrary1.cel[0].cev[74].cevr";
connectAttr "finger_right_translateZ.a" "clipLibrary1.cel[0].cev[75].cevr"
		;
connectAttr "finger_right_translateY.a" "clipLibrary1.cel[0].cev[76].cevr"
		;
connectAttr "finger_right_translateX.a" "clipLibrary1.cel[0].cev[77].cevr"
		;
connectAttr "hand_right_rotateZ.a" "clipLibrary1.cel[0].cev[78].cevr";
connectAttr "hand_right_rotateX.a" "clipLibrary1.cel[0].cev[79].cevr";
connectAttr "hand_right_rotateY.a" "clipLibrary1.cel[0].cev[80].cevr";
connectAttr "hand_right_translateZ.a" "clipLibrary1.cel[0].cev[81].cevr"
		;
connectAttr "hand_right_translateY.a" "clipLibrary1.cel[0].cev[82].cevr"
		;
connectAttr "hand_right_translateX.a" "clipLibrary1.cel[0].cev[83].cevr"
		;
connectAttr "wrist_right_rotateZ.a" "clipLibrary1.cel[0].cev[84].cevr";
connectAttr "wrist_right_rotateY.a" "clipLibrary1.cel[0].cev[85].cevr";
connectAttr "wrist_right_rotateX.a" "clipLibrary1.cel[0].cev[86].cevr";
connectAttr "wrist_right_translateZ.a" "clipLibrary1.cel[0].cev[87].cevr"
		;
connectAttr "wrist_right_translateY.a" "clipLibrary1.cel[0].cev[88].cevr"
		;
connectAttr "wrist_right_translateX.a" "clipLibrary1.cel[0].cev[89].cevr"
		;
connectAttr "elbow_right_translateZ.a" "clipLibrary1.cel[0].cev[90].cevr"
		;
connectAttr "elbow_right_translateY.a" "clipLibrary1.cel[0].cev[91].cevr"
		;
connectAttr "elbow_right_translateX.a" "clipLibrary1.cel[0].cev[92].cevr"
		;
connectAttr "elbow_right_rotateZ.a" "clipLibrary1.cel[0].cev[93].cevr";
connectAttr "elbow_right_rotateX.a" "clipLibrary1.cel[0].cev[94].cevr";
connectAttr "elbow_right_rotateY.a" "clipLibrary1.cel[0].cev[95].cevr";
connectAttr "shoulder_right_translateZ.a" "clipLibrary1.cel[0].cev[96].cevr"
		;
connectAttr "shoulder_right_translateY.a" "clipLibrary1.cel[0].cev[97].cevr"
		;
connectAttr "shoulder_right_translateX.a" "clipLibrary1.cel[0].cev[98].cevr"
		;
connectAttr "shoulder_right_rotateZ.a" "clipLibrary1.cel[0].cev[99].cevr"
		;
connectAttr "shoulder_right_rotateY.a" "clipLibrary1.cel[0].cev[100].cevr"
		;
connectAttr "shoulder_right_rotateX.a" "clipLibrary1.cel[0].cev[101].cevr"
		;
connectAttr "clavicle_right_rotateZ.a" "clipLibrary1.cel[0].cev[102].cevr"
		;
connectAttr "clavicle_right_rotateY.a" "clipLibrary1.cel[0].cev[103].cevr"
		;
connectAttr "clavicle_right_rotateX.a" "clipLibrary1.cel[0].cev[104].cevr"
		;
connectAttr "clavicle_right_translateZ.a" "clipLibrary1.cel[0].cev[105].cevr"
		;
connectAttr "clavicle_right_translateY.a" "clipLibrary1.cel[0].cev[106].cevr"
		;
connectAttr "clavicle_right_translateX.a" "clipLibrary1.cel[0].cev[107].cevr"
		;
connectAttr "head_end_rotateZ.a" "clipLibrary1.cel[0].cev[108].cevr";
connectAttr "head_end_rotateY.a" "clipLibrary1.cel[0].cev[109].cevr";
connectAttr "head_end_rotateX.a" "clipLibrary1.cel[0].cev[110].cevr";
connectAttr "head_end_translateZ.a" "clipLibrary1.cel[0].cev[111].cevr";
connectAttr "head_end_translateY.a" "clipLibrary1.cel[0].cev[112].cevr";
connectAttr "head_end_translateX.a" "clipLibrary1.cel[0].cev[113].cevr";
connectAttr "head_rotateZ.a" "clipLibrary1.cel[0].cev[114].cevr";
connectAttr "head_rotateY.a" "clipLibrary1.cel[0].cev[115].cevr";
connectAttr "head_rotateX.a" "clipLibrary1.cel[0].cev[116].cevr";
connectAttr "head_translateZ.a" "clipLibrary1.cel[0].cev[117].cevr";
connectAttr "head_translateY.a" "clipLibrary1.cel[0].cev[118].cevr";
connectAttr "head_translateX.a" "clipLibrary1.cel[0].cev[119].cevr";
connectAttr "neck_rotateZ.a" "clipLibrary1.cel[0].cev[120].cevr";
connectAttr "neck_rotateY.a" "clipLibrary1.cel[0].cev[121].cevr";
connectAttr "neck_rotateX.a" "clipLibrary1.cel[0].cev[122].cevr";
connectAttr "neck_translateZ.a" "clipLibrary1.cel[0].cev[123].cevr";
connectAttr "neck_translateY.a" "clipLibrary1.cel[0].cev[124].cevr";
connectAttr "neck_translateX.a" "clipLibrary1.cel[0].cev[125].cevr";
connectAttr "chest_rotateZ.a" "clipLibrary1.cel[0].cev[126].cevr";
connectAttr "chest_rotateY.a" "clipLibrary1.cel[0].cev[127].cevr";
connectAttr "chest_rotateX.a" "clipLibrary1.cel[0].cev[128].cevr";
connectAttr "chest_translateZ.a" "clipLibrary1.cel[0].cev[129].cevr";
connectAttr "chest_translateY.a" "clipLibrary1.cel[0].cev[130].cevr";
connectAttr "chest_translateX.a" "clipLibrary1.cel[0].cev[131].cevr";
connectAttr "spine_2_rotateZ.a" "clipLibrary1.cel[0].cev[132].cevr";
connectAttr "spine_2_rotateY.a" "clipLibrary1.cel[0].cev[133].cevr";
connectAttr "spine_2_rotateX.a" "clipLibrary1.cel[0].cev[134].cevr";
connectAttr "spine_2_translateZ.a" "clipLibrary1.cel[0].cev[135].cevr";
connectAttr "spine_2_translateY.a" "clipLibrary1.cel[0].cev[136].cevr";
connectAttr "spine_2_translateX.a" "clipLibrary1.cel[0].cev[137].cevr";
connectAttr "spine_1_rotateZ.a" "clipLibrary1.cel[0].cev[138].cevr";
connectAttr "spine_1_rotateY.a" "clipLibrary1.cel[0].cev[139].cevr";
connectAttr "spine_1_rotateX.a" "clipLibrary1.cel[0].cev[140].cevr";
connectAttr "spine_1_translateZ.a" "clipLibrary1.cel[0].cev[141].cevr";
connectAttr "spine_1_translateY.a" "clipLibrary1.cel[0].cev[142].cevr";
connectAttr "spine_1_translateX.a" "clipLibrary1.cel[0].cev[143].cevr";
connectAttr "toe_left_rotateZ.a" "clipLibrary1.cel[0].cev[144].cevr";
connectAttr "toe_left_rotateY.a" "clipLibrary1.cel[0].cev[145].cevr";
connectAttr "toe_left_rotateX.a" "clipLibrary1.cel[0].cev[146].cevr";
connectAttr "toe_left_translateZ.a" "clipLibrary1.cel[0].cev[147].cevr";
connectAttr "toe_left_translateY.a" "clipLibrary1.cel[0].cev[148].cevr";
connectAttr "toe_left_translateX.a" "clipLibrary1.cel[0].cev[149].cevr";
connectAttr "foot_left_rotateZ.a" "clipLibrary1.cel[0].cev[150].cevr";
connectAttr "foot_left_rotateY.a" "clipLibrary1.cel[0].cev[151].cevr";
connectAttr "foot_left_rotateX.a" "clipLibrary1.cel[0].cev[152].cevr";
connectAttr "foot_left_translateZ.a" "clipLibrary1.cel[0].cev[153].cevr"
		;
connectAttr "foot_left_translateY.a" "clipLibrary1.cel[0].cev[154].cevr"
		;
connectAttr "foot_left_translateX.a" "clipLibrary1.cel[0].cev[155].cevr"
		;
connectAttr "ankle_left_translateZ.a" "clipLibrary1.cel[0].cev[156].cevr"
		;
connectAttr "ankle_left_translateY.a" "clipLibrary1.cel[0].cev[157].cevr"
		;
connectAttr "ankle_left_translateX.a" "clipLibrary1.cel[0].cev[158].cevr"
		;
connectAttr "ankle_left_rotateZ.a" "clipLibrary1.cel[0].cev[159].cevr";
connectAttr "ankle_left_rotateX.a" "clipLibrary1.cel[0].cev[160].cevr";
connectAttr "ankle_left_rotateY.a" "clipLibrary1.cel[0].cev[161].cevr";
connectAttr "knee_left_rotateZ.a" "clipLibrary1.cel[0].cev[162].cevr";
connectAttr "knee_left_rotateY.a" "clipLibrary1.cel[0].cev[163].cevr";
connectAttr "knee_left_rotateX.a" "clipLibrary1.cel[0].cev[164].cevr";
connectAttr "knee_left_translateY.a" "clipLibrary1.cel[0].cev[165].cevr"
		;
connectAttr "knee_left_translateZ.a" "clipLibrary1.cel[0].cev[166].cevr"
		;
connectAttr "knee_left_translateX.a" "clipLibrary1.cel[0].cev[167].cevr"
		;
connectAttr "hip_left_rotateZ.a" "clipLibrary1.cel[0].cev[168].cevr";
connectAttr "hip_left_rotateY.a" "clipLibrary1.cel[0].cev[169].cevr";
connectAttr "hip_left_rotateX.a" "clipLibrary1.cel[0].cev[170].cevr";
connectAttr "hip_left_translateZ.a" "clipLibrary1.cel[0].cev[171].cevr";
connectAttr "hip_left_translateX.a" "clipLibrary1.cel[0].cev[172].cevr";
connectAttr "hip_left_translateY.a" "clipLibrary1.cel[0].cev[173].cevr";
connectAttr "toe_right_rotateZ.a" "clipLibrary1.cel[0].cev[174].cevr";
connectAttr "toe_right_rotateY.a" "clipLibrary1.cel[0].cev[175].cevr";
connectAttr "toe_right_rotateX.a" "clipLibrary1.cel[0].cev[176].cevr";
connectAttr "toe_right_translateZ.a" "clipLibrary1.cel[0].cev[177].cevr"
		;
connectAttr "toe_right_translateY.a" "clipLibrary1.cel[0].cev[178].cevr"
		;
connectAttr "toe_right_translateX.a" "clipLibrary1.cel[0].cev[179].cevr"
		;
connectAttr "foot_right_rotateZ.a" "clipLibrary1.cel[0].cev[180].cevr";
connectAttr "foot_right_rotateY.a" "clipLibrary1.cel[0].cev[181].cevr";
connectAttr "foot_right_rotateX.a" "clipLibrary1.cel[0].cev[182].cevr";
connectAttr "foot_right_translateZ.a" "clipLibrary1.cel[0].cev[183].cevr"
		;
connectAttr "foot_right_translateY.a" "clipLibrary1.cel[0].cev[184].cevr"
		;
connectAttr "foot_right_translateX.a" "clipLibrary1.cel[0].cev[185].cevr"
		;
connectAttr "ankle_right_translateZ.a" "clipLibrary1.cel[0].cev[186].cevr"
		;
connectAttr "ankle_right_translateY.a" "clipLibrary1.cel[0].cev[187].cevr"
		;
connectAttr "ankle_right_translateX.a" "clipLibrary1.cel[0].cev[188].cevr"
		;
connectAttr "ankle_right_rotateZ.a" "clipLibrary1.cel[0].cev[189].cevr";
connectAttr "ankle_right_rotateX.a" "clipLibrary1.cel[0].cev[190].cevr";
connectAttr "ankle_right_rotateY.a" "clipLibrary1.cel[0].cev[191].cevr";
connectAttr "knee_right_rotateZ.a" "clipLibrary1.cel[0].cev[192].cevr";
connectAttr "knee_right_rotateY.a" "clipLibrary1.cel[0].cev[193].cevr";
connectAttr "knee_right_rotateX.a" "clipLibrary1.cel[0].cev[194].cevr";
connectAttr "knee_right_translateZ.a" "clipLibrary1.cel[0].cev[195].cevr"
		;
connectAttr "knee_right_translateY.a" "clipLibrary1.cel[0].cev[196].cevr"
		;
connectAttr "knee_right_translateX.a" "clipLibrary1.cel[0].cev[197].cevr"
		;
connectAttr "hip_right_rotateZ.a" "clipLibrary1.cel[0].cev[198].cevr";
connectAttr "hip_right_rotateY.a" "clipLibrary1.cel[0].cev[199].cevr";
connectAttr "hip_right_rotateX.a" "clipLibrary1.cel[0].cev[200].cevr";
connectAttr "hip_right_translateZ.a" "clipLibrary1.cel[0].cev[201].cevr"
		;
connectAttr "hip_right_translateY.a" "clipLibrary1.cel[0].cev[202].cevr"
		;
connectAttr "hip_right_translateX.a" "clipLibrary1.cel[0].cev[203].cevr"
		;
connectAttr "god_joint_rotateZ.a" "clipLibrary1.cel[0].cev[204].cevr";
connectAttr "god_joint_rotateY.a" "clipLibrary1.cel[0].cev[205].cevr";
connectAttr "god_joint_rotateX.a" "clipLibrary1.cel[0].cev[206].cevr";
connectAttr "god_joint_translateX.a" "clipLibrary1.cel[0].cev[207].cevr"
		;
connectAttr "god_joint_translateZ.a" "clipLibrary1.cel[0].cev[208].cevr"
		;
connectAttr "god_joint_translateY.a" "clipLibrary1.cel[0].cev[209].cevr"
		;
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[0].llnk";
connectAttr ":initialShadingGroup.msg" "lightLinker1.lnk[0].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[1].llnk";
connectAttr ":initialParticleSE.msg" "lightLinker1.lnk[1].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[2].llnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[3].llnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[4].llnk";
connectAttr "lightLinker1.msg" ":lightList1.ln" -na;
// End of idle1.ma
