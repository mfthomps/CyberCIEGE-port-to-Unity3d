//Maya ASCII 4.0 scene
//Name: idle2.ma
//Last modified: Sat, Jul 26, 2003 02:41:16 PM
requires maya "4.0";
currentUnit -l foot -a degree -t ntsc;
createNode animClip -n "femguard_idle2Source";
	setAttr ".ihi" 0;
	setAttr ".du" 36;
	setAttr ".ci" no;
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
	setAttr -s 3 ".ktv[0:2]"  0 -0.26730799992280224 1 -0.26730799992280224 
		36 -0.26730799992280224;
createNode animCurveTL -n "toe_left_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.026002799999999913 1 0.026002799999999913 
		36 0.026002799999999913;
createNode animCurveTL -n "toe_left_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.0027340075477466875 1 0.0027340075477466875 
		36 0.0027340075477466875;
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
	setAttr -s 3 ".ktv[0:2]"  0 -0.33148020011396101 1 -0.33148020011396101 
		36 -0.33148020011396101;
createNode animCurveTL -n "foot_left_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.23017959999999957 1 0.23017959999999957 
		36 0.23017959999999957;
createNode animCurveTL -n "foot_left_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.0040359906402779909 1 -0.0040359906402779909 
		36 -0.0040359906402779909;
createNode animCurveTA -n "ankle_left_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 30 0 36 0;
createNode animCurveTA -n "ankle_left_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 30 0 36 0;
createNode animCurveTA -n "ankle_left_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 30 0 36 0;
createNode animCurveTL -n "ankle_left_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.082741199307677857 1 0.082741199307677857 
		10 0.082741199307677857 30 0.082741199307677857 36 0.082741199307677857;
createNode animCurveTL -n "ankle_left_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 1.3981700000000006 1 1.3981700000000006 
		10 1.3981700000000006 30 1.3981700000000006 36 1.3981700000000006;
createNode animCurveTL -n "ankle_left_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.024519002336292325 1 -0.024519002336292325 
		10 -0.024519002336292325 30 -0.024519002336292325 36 -0.024519002336292325;
createNode animCurveTL -n "knee_left_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.00055230067650989588 1 -0.00055230067650989588 
		10 -0.00055230067650989588 30 -0.00055230067650989588 36 -0.00055230067650989588;
createNode animCurveTL -n "knee_left_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 1.3619899999999996 1 1.3619899999999996 
		10 1.3619899999999996 30 1.3619899999999996 36 1.3619899999999996;
createNode animCurveTL -n "knee_left_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.023958999984405118 1 -0.023958999984405118 
		10 -0.023958999984405118 30 -0.023958999984405118 36 -0.023958999984405118;
createNode animCurveTA -n "knee_left_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 -1.7983671827668164e-017 
		10 -0.034053443241717427 30 -0.034053443241717427 36 0;
createNode animCurveTA -n "knee_left_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 3.4474296695316543e-016 10 
		0.65279689101416949 30 0.65279689101416949 36 0;
createNode animCurveTA -n "knee_left_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 1.9597913362840073e-014 10 
		37.110131721309585 30 37.110131721309585 36 0;
createNode animCurveTL -n "hip_left_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.094614583000000002 1 0.094614583000000002 
		10 0.094614583000000002 30 0.094614583000000002 36 0.094614583000000002;
createNode animCurveTL -n "hip_left_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.15893760000000029 1 -0.15893760000000029 
		10 -0.15893760000000029 30 -0.15893760000000029 36 -0.15893760000000029;
createNode animCurveTL -n "hip_left_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.28443400000000002 1 0.28443400000000002 
		10 0.28443400000000002 30 0.28443400000000002 36 0.28443400000000002;
createNode animCurveTA -n "hip_left_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -5.6248813004385599e-008 1 -8.846425801024219e-008 
		10 -15.963145208906308 30 -15.963145208906308 36 -8.846425801024219e-008;
createNode animCurveTA -n "hip_left_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -1.8890108612840429e-006 1 -2.9709061286736614e-006 
		10 -1.2096482339645689 30 -1.2096482339645689 36 -2.9709061286736614e-006;
createNode animCurveTA -n "hip_left_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 3.3177596761524202e-008 1 5.2179439066168074e-008 
		10 -18.701881985404473 30 -18.701881985404473 36 5.2179439066168074e-008;
createNode animCurveTA -n "thumb_end_left_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "thumb_end_left_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "thumb_end_left_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTL -n "thumb_end_left_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.030828701496288247;
createNode animCurveTL -n "thumb_end_left_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -0.013688081888510414;
createNode animCurveTL -n "thumb_end_left_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.14882926423741955;
createNode animCurveTA -n "thumb_left_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "thumb_left_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "thumb_left_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTL -n "thumb_left_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.18760766470505399;
createNode animCurveTL -n "thumb_left_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -0.063297873416744949;
createNode animCurveTL -n "thumb_left_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.12671291902827508;
createNode animCurveTA -n "finger_end_left_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "finger_end_left_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "finger_end_left_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTL -n "finger_end_left_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.0038460460787230481;
createNode animCurveTL -n "finger_end_left_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -0.081128637904893858;
createNode animCurveTL -n "finger_end_left_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.20209227194411183;
createNode animCurveTA -n "finger_left_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 -37.571000802840771 36 -37.571000802840771;
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
	setAttr -s 3 ".ktv[0:2]"  0 0.016630279977842277 1 0.016630279977842277 
		36 0.016630279977842277;
createNode animCurveTL -n "finger_left_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.034045011537951073 1 -0.034045011537951073 
		36 -0.034045011537951073;
createNode animCurveTL -n "finger_left_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.11203476525020467 1 0.11203476525020467 
		36 0.11203476525020467;
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
	setAttr -s 3 ".ktv[0:2]"  0 -0.0035235078871608903 1 -0.0035235078871608903 
		36 -0.0035235078871608903;
createNode animCurveTL -n "hand_left_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.0042292210198608647 1 -0.0042292210198608647 
		36 -0.0042292210198608647;
createNode animCurveTL -n "hand_left_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.24070156915346913 1 0.24070156915346913 
		36 0.24070156915346913;
createNode animCurveTA -n "wrist_left_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 -23.438503018052167 10 -25.071225886904212 
		25 -25.071225886904212 36 -23.438503018052167;
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
	setAttr -s 5 ".ktv[0:4]"  0 0.02726706289283733 1 0.02726706289283733 
		10 0.02726706289283733 25 0.02726706289283733 36 0.02726706289283733;
createNode animCurveTL -n "wrist_left_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.10269978901324116 1 -0.10269978901324116 
		10 -0.10269978901324116 25 -0.10269978901324116 36 -0.10269978901324116;
createNode animCurveTL -n "wrist_left_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.82465955778486177 1 0.82465955778486177 
		10 0.82465955778486177 25 0.82465955778486177 36 0.82465955778486177;
createNode animCurveTA -n "elbow_left_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -2.580738612835451e-012 1 0 10 
		66.066293504239155 25 66.066293504239155 36 0;
	setAttr -s 5 ".kit[2:4]"  1 1 9;
	setAttr -s 5 ".kot[2:4]"  1 1 9;
	setAttr -s 5 ".kix[2:4]"  0.99807536602020264 0.99898499250411987 
		0.30303803086280823;
	setAttr -s 5 ".kiy[2:4]"  0.062012840062379837 -0.045043628662824631 
		-0.95297849178314209;
	setAttr -s 5 ".kox[2:4]"  0.99807536602020264 0.99898499250411987 
		0.30303803086280823;
	setAttr -s 5 ".koy[2:4]"  0.06201283261179924 -0.045043788850307465 
		-0.95297849178314209;
createNode animCurveTA -n "elbow_left_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 3.7972370526170041e-013 1 -24.073947336701355 
		10 -142.81065822170538 25 -142.81065822170538 36 -24.073947336701355;
	setAttr -s 5 ".kit[2:4]"  1 1 9;
	setAttr -s 5 ".kot[2:4]"  1 1 9;
	setAttr -s 5 ".kix[2:4]"  0.96005058288574219 0.99370747804641724 
		0.17422696948051453;
	setAttr -s 5 ".kiy[2:4]"  -0.2798265814781189 0.11200635135173798 
		0.98470550775527954;
	setAttr -s 5 ".kox[2:4]"  0.96005046367645264 0.99370753765106201 
		0.17422696948051453;
	setAttr -s 5 ".koy[2:4]"  -0.27982687950134277 0.11200614273548126 
		0.98470550775527954;
createNode animCurveTA -n "elbow_left_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 1.3262039160557593e-013 1 0 10 
		-56.071712204508266 25 -56.071712204508266 36 0;
	setAttr -s 5 ".kit[2:4]"  1 1 9;
	setAttr -s 5 ".kot[2:4]"  1 1 9;
	setAttr -s 5 ".kix[2:4]"  0.99992185831069946 0.99952429533004761 
		0.35085341334342957;
	setAttr -s 5 ".kiy[2:4]"  -0.012500448152422905 0.03084191121160984 
		0.93643039464950562;
	setAttr -s 5 ".kox[2:4]"  0.99992185831069946 0.99952429533004761 
		0.35085341334342957;
	setAttr -s 5 ".koy[2:4]"  -0.012500342912971973 0.030842173844575882 
		0.93643039464950562;
createNode animCurveTL -n "elbow_left_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.021224737031623805 1 0.021224737031623805 
		10 0.021224737031623805 25 0.021224737031623805 36 0.021224737031623805;
createNode animCurveTL -n "elbow_left_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.17981803983816538 1 -0.17981803983816538 
		10 -0.17981803983816538 25 -0.17981803983816538 36 -0.17981803983816538;
createNode animCurveTL -n "elbow_left_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.92776861678856271 1 0.92776861678856271 
		10 0.92776861678856271 25 0.92776861678856271 36 0.92776861678856271;
createNode animCurveTL -n "shoulder_left_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.012709658266087689 1 -0.012709658266087689 
		10 -0.012709658266087689 25 -0.012709658266087689 36 -0.012709658266087689;
createNode animCurveTL -n "shoulder_left_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.065618345778951148 1 -0.065618345778951148 
		10 -0.065618345778951148 25 -0.065618345778951148 36 -0.065618345778951148;
createNode animCurveTL -n "shoulder_left_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.28728579794589171 1 0.28728579794589171 
		10 0.28728579794589171 25 0.28728579794589171 36 0.28728579794589171;
createNode animCurveTA -n "shoulder_left_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 6.5447648542832723e-008 1 13.957230130174425 
		10 9.94194001321973 25 9.94194001321973 36 13.957230130174425;
createNode animCurveTA -n "shoulder_left_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -4.0596483345451955e-007 1 8.1932848812221011e-016 
		10 0.82462855839580429 25 0.82462855839580429 36 0;
createNode animCurveTA -n "shoulder_left_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -1.1233536513441593e-008 1 -67.927621728828427 
		10 -29.411949629369438 25 -29.411949629369438 31 -67.927621728828427;
	setAttr -s 5 ".kit[2:4]"  1 1 9;
	setAttr -s 5 ".kot[2:4]"  1 1 9;
	setAttr -s 5 ".kix[2:4]"  0.9998505711555481 0.99999761581420898 
		0.28516572713851929;
	setAttr -s 5 ".kiy[2:4]"  -0.017286419868469238 0.0021851756609976292 
		-0.95847821235656738;
	setAttr -s 5 ".kox[2:4]"  0.9998505711555481 0.99999761581420898 
		0.28516572713851929;
	setAttr -s 5 ".koy[2:4]"  -0.017286311835050583 0.0021853020880371332 
		-0.95847821235656738;
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
	setAttr -s 3 ".ktv[0:2]"  0 -0.037497125798613883 1 -0.037497125798613883 
		36 -0.037497125798613883;
createNode animCurveTL -n "clavicle_left_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.17470489219059654 1 0.17470489219059654 
		36 0.17470489219059654;
createNode animCurveTL -n "clavicle_left_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.20945807840601455 1 0.20945807840601455 
		36 0.20945807840601455;
createNode animCurveTA -n "thumb_end_right_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "thumb_end_right_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "thumb_end_right_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTL -n "thumb_end_right_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.051459579685620378;
createNode animCurveTL -n "thumb_end_right_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -0.032073882002759228;
createNode animCurveTL -n "thumb_end_right_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -0.11584676002885215;
createNode animCurveTA -n "thumb_right_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "thumb_right_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "thumb_right_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTL -n "thumb_right_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.2038130328475489;
createNode animCurveTL -n "thumb_right_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -0.016660807372582829;
createNode animCurveTL -n "thumb_right_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -0.16098660402453643;
createNode animCurveTA -n "finger_end_right_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "finger_end_right_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "finger_end_right_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTL -n "finger_end_right_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.01527647710967135;
createNode animCurveTL -n "finger_end_right_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -0.059848374363183285;
createNode animCurveTL -n "finger_end_right_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -0.15083048315066452;
createNode animCurveTL -n "finger_right_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.0091075416781556864 1 0.0091075416781556864 
		36 0.0091075416781556864;
createNode animCurveTL -n "finger_right_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.025320795289294096 1 -0.025320795289294096 
		36 -0.025320795289294096;
createNode animCurveTL -n "finger_right_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.12190444152264517 1 -0.12190444152264517 
		36 -0.12190444152264517;
createNode animCurveTA -n "finger_right_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "finger_right_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 36 0;
createNode animCurveTA -n "finger_right_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 48.676444636818552 31 48.676444636818552;
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
	setAttr -s 3 ".ktv[0:2]"  0 0.016517298185127552 1 0.016517298185127552 
		36 0.016517298185127552;
createNode animCurveTL -n "hand_right_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.0097732241414564026 1 -0.0097732241414564026 
		36 -0.0097732241414564026;
createNode animCurveTL -n "hand_right_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.2572731993833246 1 -0.2572731993833246 
		36 -0.2572731993833246;
createNode animCurveTA -n "wrist_right_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 17.785995707073525 10 19.024965771952221 
		25 19.024965771952221 36 17.785995707073525;
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
	setAttr -s 5 ".ktv[0:4]"  0 0.028582144150580788 1 0.028582144150580788 
		10 0.028582144150580788 25 0.028582144150580788 36 0.028582144150580788;
createNode animCurveTL -n "wrist_right_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.12398776736683303 1 -0.12398776736683303 
		10 -0.12398776736683303 25 -0.12398776736683303 36 -0.12398776736683303;
createNode animCurveTL -n "wrist_right_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.81696879044915294 1 -0.81696879044915294 
		10 -0.81696879044915294 25 -0.81696879044915294 36 -0.81696879044915294;
createNode animCurveTA -n "elbow_right_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 7.2592429300023808e-013 1 0 10 
		-73.391450143293966 25 -73.391450143293966 36 0;
	setAttr -s 5 ".kit[2:4]"  1 1 9;
	setAttr -s 5 ".kot[2:4]"  1 1 9;
	setAttr -s 5 ".kix[2:4]"  0.99301040172576904 0.99522346258163452 
		0.27519902586936951;
	setAttr -s 5 ".kiy[2:4]"  -0.11802668869495392 0.097622983157634735 
		0.9613872766494751;
	setAttr -s 5 ".kox[2:4]"  0.99301040172576904 0.99522346258163452 
		0.27519902586936951;
	setAttr -s 5 ".koy[2:4]"  -0.11802683025598526 0.097623080015182495 
		0.9613872766494751;
createNode animCurveTA -n "elbow_right_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -4.4325159449387919e-013 1 23.734580987764215 
		10 142.9110990163507 25 142.9110990163507 36 23.734580987764215;
	setAttr -s 5 ".kit[2:4]"  1 1 9;
	setAttr -s 5 ".kot[2:4]"  1 1 9;
	setAttr -s 5 ".kix[2:4]"  0.99028968811035156 0.91152727603912354 
		0.17360341548919678;
	setAttr -s 5 ".kiy[2:4]"  0.13901910185813904 -0.41123956441879272 
		-0.98481565713882446;
	setAttr -s 5 ".kox[2:4]"  0.99028968811035156 0.91152745485305786 
		0.17360341548919678;
	setAttr -s 5 ".koy[2:4]"  0.13901931047439575 -0.41123923659324646 
		-0.98481565713882446;
createNode animCurveTA -n "elbow_right_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 9.2667425671105443e-014 1 0 10 
		-63.682604511497289 25 -63.682604511497289 36 0;
	setAttr -s 5 ".kit[2:4]"  1 1 9;
	setAttr -s 5 ".kot[2:4]"  1 1 9;
	setAttr -s 5 ".kix[2:4]"  0.98299998044967651 0.98110347986221313 
		0.31328585743904114;
	setAttr -s 5 ".kiy[2:4]"  -0.18360553681850433 0.19348365068435669 
		0.94965887069702148;
	setAttr -s 5 ".kox[2:4]"  0.98300004005432129 0.98110347986221313 
		0.31328585743904114;
	setAttr -s 5 ".koy[2:4]"  -0.18360531330108643 0.19348372519016266 
		0.94965887069702148;
createNode animCurveTL -n "elbow_right_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.011013512692828603 1 0.011013512692828603 
		10 0.011013512692828603 25 0.011013512692828603 36 0.011013512692828603;
createNode animCurveTL -n "elbow_right_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.17190264960971463 1 -0.17190264960971463 
		10 -0.17190264960971463 25 -0.17190264960971463 36 -0.17190264960971463;
createNode animCurveTL -n "elbow_right_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.90839189660147301 1 -0.90839189660147301 
		10 -0.90839189660147301 25 -0.90839189660147301 36 -0.90839189660147301;
createNode animCurveTL -n "shoulder_right_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.012467802940862074 1 -0.012467802940862074 
		10 -0.012467802940862074 25 -0.012467802940862074 36 -0.012467802940862074;
createNode animCurveTL -n "shoulder_right_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.060253259837126642 1 -0.060253259837126642 
		10 -0.060253259837126642 25 -0.060253259837126642 36 -0.060253259837126642;
createNode animCurveTL -n "shoulder_right_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.29624780759410063 1 -0.29624780759410063 
		10 -0.29624780759410063 25 -0.29624780759410063 36 -0.29624780759410063;
createNode animCurveTA -n "shoulder_right_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 6.9513263869754047e-008 1 -13.979517946949338 
		10 -8.9710399315969536 25 -8.9710399315969536 36 -13.979517946949338;
createNode animCurveTA -n "shoulder_right_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 4.053374011788815e-007 1 -8.194077697812287e-016 
		10 -3.545089300890389 25 -3.545089300890389 36 0;
createNode animCurveTA -n "shoulder_right_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -9.3021710412895469e-009 1 68.265188123040971 
		10 27.50674411329803 25 27.50674411329803 31 68.265188123040971;
	setAttr -s 5 ".kit[2:4]"  1 1 9;
	setAttr -s 5 ".kot[2:4]"  1 1 9;
	setAttr -s 5 ".kix[2:4]"  0.98971343040466309 0.99417489767074585 
		0.27065455913543701;
	setAttr -s 5 ".kiy[2:4]"  -0.14306388795375824 0.10777857899665833 
		0.9626765251159668;
	setAttr -s 5 ".kox[2:4]"  0.98971343040466309 0.99417489767074585 
		0.27065455913543701;
	setAttr -s 5 ".koy[2:4]"  -0.14306390285491943 0.1077786386013031 
		0.9626765251159668;
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
	setAttr -s 3 ".ktv[0:2]"  0 -0.037497125798613945 1 -0.037497125798613945 
		36 -0.037497125798613945;
createNode animCurveTL -n "clavicle_right_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.16592239127002378 1 0.16592239127002378 
		36 0.16592239127002378;
createNode animCurveTL -n "clavicle_right_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.21829510794591603 1 -0.21829510794591603 
		36 -0.21829510794591603;
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
	setAttr ".ktv[0]"  0 0.054468169916845631;
createNode animCurveTL -n "head_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.1323188580516835;
createNode animCurveTL -n "head_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 5.6093945469906199e-016;
createNode animCurveTA -n "neck_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 15 -0.042942054672773865 
		30 -0.042942054672773865 36 0;
createNode animCurveTA -n "neck_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 15 -31.269785680413499 
		30 -31.269785680413499 36 0;
createNode animCurveTA -n "neck_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 15 2.6003130931649268 30 
		2.6003130931649268 36 0;
createNode animCurveTL -n "neck_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.017219607724953713 1 -0.017219607724953713 
		15 -0.017219607724953713 30 -0.017219607724953713 36 -0.017219607724953713;
createNode animCurveTL -n "neck_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.3019234892985671 1 0.3019234892985671 
		15 0.3019234892985671 30 0.3019234892985671 36 0.3019234892985671;
createNode animCurveTL -n "neck_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.0082292523803426838 1 0.0082292523803426838 
		15 0.0082292523803426838 30 0.0082292523803426838 36 0.0082292523803426838;
createNode animCurveTA -n "chest_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 30 0 36 0;
createNode animCurveTA -n "chest_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 30 0 36 0;
createNode animCurveTA -n "chest_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 30 0 36 0;
createNode animCurveTL -n "chest_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.0015492958015011305 1 -0.0015492958015011305 
		10 -0.0015492958015011305 30 -0.0015492958015011305 36 -0.0015492958015011305;
createNode animCurveTL -n "chest_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.46373699154677961 1 0.46373699154677961 
		10 0.46373699154677961 30 0.46373699154677961 36 0.46373699154677961;
createNode animCurveTL -n "chest_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 1.0927391974657027e-017 1 1.0927391974657027e-017 
		10 1.0700306114612259e-017 30 1.0700306114612259e-017 36 0;
createNode animCurveTA -n "spine_2_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 8.7793401948527841 30 
		8.7793401948527841 36 0;
createNode animCurveTA -n "spine_2_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 30 0 36 0;
createNode animCurveTA -n "spine_2_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 30 0 36 0;
createNode animCurveTL -n "spine_2_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.11191009313517926 1 -0.11191009313517926 
		10 -0.11191009313517926 30 -0.11191009313517926 36 -0.11191009313517926;
createNode animCurveTL -n "spine_2_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.42997221413194348 1 0.42997221413194348 
		10 0.42997221413194348 30 0.42997221413194348 36 0.42997221413194348;
createNode animCurveTL -n "spine_2_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -1.1655884772967523e-016 1 -1.1655884772967523e-016 
		10 -1.1413659855586438e-016 30 -1.1413659855586438e-016 36 0;
createNode animCurveTA -n "spine_1_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 30 0 36 0;
createNode animCurveTA -n "spine_1_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 30 0 36 0;
createNode animCurveTA -n "spine_1_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 30 0 36 0;
createNode animCurveTL -n "spine_1_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.099936166928885559 1 0.099936166928885559 
		10 0.099936166928885559 30 0.099936166928885559 36 0.099936166928885559;
createNode animCurveTL -n "spine_1_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.33510738703344928 1 0.33510738703344928 
		10 0.33510738703344928 30 0.33510738703344928 36 0.33510738703344928;
createNode animCurveTL -n "spine_1_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 1.2869016594960968e-016 1 1.2869016594960968e-016 
		10 1.2601581171378221e-016 30 1.2601581171378221e-016 36 0;
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
	setAttr -s 3 ".ktv[0:2]"  0 0.26730790870451632 1 0.26730790870451632 
		36 0.26730790870451632;
createNode animCurveTL -n "toe_right_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.026002832602698769 1 -0.026002832602698769 
		36 -0.026002832602698769;
createNode animCurveTL -n "toe_right_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.0027340134067207981 1 -0.0027340134067207981 
		36 -0.0027340134067207981;
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
	setAttr -s 3 ".ktv[0:2]"  0 0.3314797801755629 1 0.3314797801755629 
		36 0.3314797801755629;
createNode animCurveTL -n "foot_right_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.23017955300932538 1 -0.23017955300932538 
		36 -0.23017955300932538;
createNode animCurveTL -n "foot_right_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.0040365194698261221 1 0.0040365194698261221 
		36 0.0040365194698261221;
createNode animCurveTA -n "ankle_right_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 30 0 36 0;
createNode animCurveTA -n "ankle_right_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 30 0 36 0;
createNode animCurveTA -n "ankle_right_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 30 0 36 0;
createNode animCurveTL -n "ankle_right_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.082741196952342819 1 -0.082741196952342819 
		10 -0.082741196952342819 30 -0.082741196952342819 36 -0.082741196952342819;
createNode animCurveTL -n "ankle_right_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -1.3981727993300175 1 -1.3981727993300175 
		10 -1.3981727993300175 30 -1.3981727993300175 36 -1.3981727993300175;
createNode animCurveTL -n "ankle_right_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.024519138031067863 1 0.024519138031067863 
		10 0.024519138031067863 30 0.024519138031067863 36 0.024519138031067863;
createNode animCurveTL -n "knee_right_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.00055232197394155537 1 0.00055232197394155537 
		10 0.00055232197394155537 30 0.00055232197394155537 36 0.00055232197394155537;
createNode animCurveTL -n "knee_right_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -1.3619898643348314 1 -1.3619898643348314 
		10 -1.3619898643348314 30 -1.3619898643348314 36 -1.3619898643348314;
createNode animCurveTL -n "knee_right_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.023958151493519372 1 0.023958151493519372 
		10 0.023958151493519372 30 0.023958151493519372 36 0.023958151493519372;
createNode animCurveTA -n "knee_right_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 1.4068705028942191e-015 1 0 10 
		0.0032357648919565094 30 0.0032357648919565094 36 0;
createNode animCurveTA -n "knee_right_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -2.6063561777633393e-014 1 0 
		10 -0.059945499925248787 30 -0.059945499925248787 36 0;
createNode animCurveTA -n "knee_right_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -1.4815478662884208e-012 1 0 
		10 -3.4075207471311497 30 -3.4075207471311497 36 0;
createNode animCurveTL -n "hip_right_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0.094614605088345211 1 0.094614605088345211 
		10 0.094614605088345211 30 0.094614605088345211 36 0.094614605088345211;
createNode animCurveTL -n "hip_right_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.15893499118290558 1 -0.15893499118290558 
		10 -0.15893499118290558 30 -0.15893499118290558 36 -0.15893499118290558;
createNode animCurveTL -n "hip_right_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.28443362633828351 1 -0.28443362633828351 
		10 -0.28443362633828351 30 -0.28443362633828351 36 -0.28443362633828351;
createNode animCurveTA -n "hip_right_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 4.81732943709954e-008 1 6.3056656983598352e-008 
		10 7.1671527441400098 30 7.1671527441400098 36 6.3056656983598352e-008;
createNode animCurveTA -n "hip_right_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 1.6178117738163672e-006 1 2.117642226471317e-006 
		10 0.48201526126634586 30 0.48201526126634586 36 2.117642226471317e-006;
createNode animCurveTA -n "hip_right_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -2.8413951434892953e-008 1 -3.7192573269749766e-008 
		10 1.7173380534757203 30 1.7173380534757203 36 -3.7192573269749766e-008;
createNode animCurveTA -n "god_joint_rotateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 -6.8065065718300266 
		30 -6.8065065718300266 36 0;
createNode animCurveTA -n "god_joint_rotateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 30 0 36 0;
createNode animCurveTA -n "god_joint_rotateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 30 0 36 0;
createNode animCurveTL -n "god_joint_translateZ";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 -0.075516883000000007 1 -0.075516883000000007 
		10 -0.075516883000000007 30 -0.075516883000000007 36 -0.075516883000000007;
createNode animCurveTL -n "god_joint_translateX";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 1 0 10 0 30 0 36 0;
createNode animCurveTL -n "god_joint_translateY";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 3.2189776000000001 1 3.2189776000000001 
		10 3.1876446107268821 30 3.1876446107268821 36 3.2189776000000001;
createNode clipLibrary -n "clipLibrary1";
	setAttr -s 204 ".cel[0].cev";
	setAttr ".cd[0].cm" -type "characterMapping" 204 "toe_left.rotateZ" 2 
		1 "toe_left.rotateY" 2 2 "toe_left.rotateX" 2 3 "toe_left.translateZ" 
		1 1 "toe_left.translateY" 1 2 "toe_left.translateX" 1 
		3 "foot_left.rotateZ" 2 4 "foot_left.rotateY" 2 5 "foot_left.rotateX" 
		2 6 "foot_left.translateZ" 1 4 "foot_left.translateY" 
		1 5 "foot_left.translateX" 1 6 "ankle_left.rotateZ" 2 
		7 "ankle_left.rotateY" 2 8 "ankle_left.rotateX" 2 9 "ankle_left.translateZ" 
		1 7 "ankle_left.translateY" 1 8 "ankle_left.translateX" 
		1 9 "knee_left.translateZ" 1 10 "knee_left.translateY" 
		1 11 "knee_left.translateX" 1 12 "knee_left.rotateZ" 2 
		10 "knee_left.rotateY" 2 11 "knee_left.rotateX" 2 12 "hip_left.translateZ" 
		1 13 "hip_left.translateY" 1 14 "hip_left.translateX" 1 
		15 "hip_left.rotateZ" 2 13 "hip_left.rotateY" 2 14 "hip_left.rotateX" 
		2 15 "thumb_end_left.rotateZ" 2 16 "thumb_end_left.rotateY" 
		2 17 "thumb_end_left.rotateX" 2 18 "thumb_end_left.translateZ" 
		1 16 "thumb_end_left.translateY" 1 17 "thumb_end_left.translateX" 
		1 18 "thumb_left.rotateZ" 2 19 "thumb_left.rotateY" 2 
		20 "thumb_left.rotateX" 2 21 "thumb_left.translateZ" 1 
		19 "thumb_left.translateY" 1 20 "thumb_left.translateX" 1 
		21 "finger_end_left.rotateZ" 2 22 "finger_end_left.rotateY" 
		2 23 "finger_end_left.rotateX" 2 24 "finger_end_left.translateZ" 
		1 22 "finger_end_left.translateY" 1 23 "finger_end_left.translateX" 
		1 24 "finger_left.rotateZ" 2 25 "finger_left.rotateY" 2 
		26 "finger_left.rotateX" 2 27 "finger_left.translateZ" 1 
		25 "finger_left.translateY" 1 26 "finger_left.translateX" 1 
		27 "hand_left.rotateZ" 2 28 "hand_left.rotateY" 2 29 "hand_left.rotateX" 
		2 30 "hand_left.translateZ" 1 28 "hand_left.translateY" 
		1 29 "hand_left.translateX" 1 30 "wrist_left.rotateZ" 2 
		31 "wrist_left.rotateY" 2 32 "wrist_left.rotateX" 2 33 "wrist_left.translateZ" 
		1 31 "wrist_left.translateY" 1 32 "wrist_left.translateX" 
		1 33 "elbow_left.rotateZ" 2 34 "elbow_left.rotateY" 2 
		35 "elbow_left.rotateX" 2 36 "elbow_left.translateZ" 1 
		34 "elbow_left.translateY" 1 35 "elbow_left.translateX" 1 
		36 "shoulder_left.translateZ" 1 37 "shoulder_left.translateY" 
		1 38 "shoulder_left.translateX" 1 39 "shoulder_left.rotateY" 
		2 37 "shoulder_left.rotateX" 2 38 "shoulder_left.rotateZ" 
		2 39 "clavicle_left.rotateZ" 2 40 "clavicle_left.rotateY" 
		2 41 "clavicle_left.rotateX" 2 42 "clavicle_left.translateZ" 
		1 40 "clavicle_left.translateY" 1 41 "clavicle_left.translateX" 
		1 42 "thumb_end_right.rotateZ" 2 43 "thumb_end_right.rotateY" 
		2 44 "thumb_end_right.rotateX" 2 45 "thumb_end_right.translateZ" 
		1 43 "thumb_end_right.translateY" 1 44 "thumb_end_right.translateX" 
		1 45 "thumb_right.rotateZ" 2 46 "thumb_right.rotateY" 2 
		47 "thumb_right.rotateX" 2 48 "thumb_right.translateZ" 1 
		46 "thumb_right.translateY" 1 47 "thumb_right.translateX" 1 
		48 "finger_end_right.rotateZ" 2 49 "finger_end_right.rotateY" 
		2 50 "finger_end_right.rotateX" 2 51 "finger_end_right.translateZ" 
		1 49 "finger_end_right.translateY" 1 50 "finger_end_right.translateX" 
		1 51 "finger_right.translateZ" 1 52 "finger_right.translateY" 
		1 53 "finger_right.translateX" 1 54 "finger_right.rotateY" 
		2 52 "finger_right.rotateX" 2 53 "finger_right.rotateZ" 
		2 54 "hand_right.rotateZ" 2 55 "hand_right.rotateY" 2 
		56 "hand_right.rotateX" 2 57 "hand_right.translateZ" 1 
		55 "hand_right.translateY" 1 56 "hand_right.translateX" 1 
		57 "wrist_right.rotateZ" 2 58 "wrist_right.rotateY" 2 59 "wrist_right.rotateX" 
		2 60 "wrist_right.translateZ" 1 58 "wrist_right.translateY" 
		1 59 "wrist_right.translateX" 1 60 "elbow_right.rotateZ" 
		2 61 "elbow_right.rotateY" 2 62 "elbow_right.rotateX" 2 
		63 "elbow_right.translateZ" 1 61 "elbow_right.translateY" 1 
		62 "elbow_right.translateX" 1 63 "shoulder_right.translateZ" 
		1 64 "shoulder_right.translateY" 1 65 "shoulder_right.translateX" 
		1 66 "shoulder_right.rotateY" 2 64 "shoulder_right.rotateX" 
		2 65 "shoulder_right.rotateZ" 2 66 "clavicle_right.rotateZ" 
		2 67 "clavicle_right.rotateY" 2 68 "clavicle_right.rotateX" 
		2 69 "clavicle_right.translateZ" 1 67 "clavicle_right.translateY" 
		1 68 "clavicle_right.translateX" 1 69 "head.rotateZ" 2 
		70 "head.rotateY" 2 71 "head.rotateX" 2 72 "head.translateZ" 
		1 70 "head.translateY" 1 71 "head.translateX" 1 72 "neck.rotateZ" 
		2 73 "neck.rotateY" 2 74 "neck.rotateX" 2 75 "neck.translateZ" 
		1 73 "neck.translateY" 1 74 "neck.translateX" 1 75 "chest.rotateZ" 
		2 76 "chest.rotateY" 2 77 "chest.rotateX" 2 78 "chest.translateZ" 
		1 76 "chest.translateY" 1 77 "chest.translateX" 1 
		78 "spine_2.rotateZ" 2 79 "spine_2.rotateY" 2 80 "spine_2.rotateX" 
		2 81 "spine_2.translateZ" 1 79 "spine_2.translateY" 1 
		80 "spine_2.translateX" 1 81 "spine_1.rotateZ" 2 82 "spine_1.rotateY" 
		2 83 "spine_1.rotateX" 2 84 "spine_1.translateZ" 1 
		82 "spine_1.translateY" 1 83 "spine_1.translateX" 1 84 "toe_right.rotateZ" 
		2 85 "toe_right.rotateY" 2 86 "toe_right.rotateX" 2 
		87 "toe_right.translateZ" 1 85 "toe_right.translateY" 1 
		86 "toe_right.translateX" 1 87 "foot_right.rotateZ" 2 88 "foot_right.rotateY" 
		2 89 "foot_right.rotateX" 2 90 "foot_right.translateZ" 
		1 88 "foot_right.translateY" 1 89 "foot_right.translateX" 
		1 90 "ankle_right.rotateZ" 2 91 "ankle_right.rotateY" 2 
		92 "ankle_right.rotateX" 2 93 "ankle_right.translateZ" 1 
		91 "ankle_right.translateY" 1 92 "ankle_right.translateX" 1 
		93 "knee_right.translateZ" 1 94 "knee_right.translateY" 1 
		95 "knee_right.translateX" 1 96 "knee_right.rotateZ" 2 
		94 "knee_right.rotateY" 2 95 "knee_right.rotateX" 2 96 "hip_right.translateZ" 
		1 97 "hip_right.translateY" 1 98 "hip_right.translateX" 
		1 99 "hip_right.rotateZ" 2 97 "hip_right.rotateY" 2 
		98 "hip_right.rotateX" 2 99 "god_joint.rotateZ" 2 100 "god_joint.rotateY" 
		2 101 "god_joint.rotateX" 2 102 "god_joint.translateZ" 1 
		100 "god_joint.translateX" 1 101 "god_joint.translateY" 1 
		102  ;
	setAttr ".cd[0].cim" -type "Int32Array" 204 0 1 2 3
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
		 202 203 ;
createNode lightLinker -n "lightLinker1";
select -ne :time1;
	setAttr ".o" 4;
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
select -ne :ikSystem;
connectAttr "femguard_idle2Source.st" "clipLibrary1.st[0]";
connectAttr "femguard_idle2Source.du" "clipLibrary1.du[0]";
connectAttr "toe_left_rotateZ.a" "clipLibrary1.cel[0].cev[0].cevr";
connectAttr "toe_left_rotateY.a" "clipLibrary1.cel[0].cev[1].cevr";
connectAttr "toe_left_rotateX.a" "clipLibrary1.cel[0].cev[2].cevr";
connectAttr "toe_left_translateZ.a" "clipLibrary1.cel[0].cev[3].cevr";
connectAttr "toe_left_translateY.a" "clipLibrary1.cel[0].cev[4].cevr";
connectAttr "toe_left_translateX.a" "clipLibrary1.cel[0].cev[5].cevr";
connectAttr "foot_left_rotateZ.a" "clipLibrary1.cel[0].cev[6].cevr";
connectAttr "foot_left_rotateY.a" "clipLibrary1.cel[0].cev[7].cevr";
connectAttr "foot_left_rotateX.a" "clipLibrary1.cel[0].cev[8].cevr";
connectAttr "foot_left_translateZ.a" "clipLibrary1.cel[0].cev[9].cevr";
connectAttr "foot_left_translateY.a" "clipLibrary1.cel[0].cev[10].cevr";
connectAttr "foot_left_translateX.a" "clipLibrary1.cel[0].cev[11].cevr";
connectAttr "ankle_left_rotateZ.a" "clipLibrary1.cel[0].cev[12].cevr";
connectAttr "ankle_left_rotateY.a" "clipLibrary1.cel[0].cev[13].cevr";
connectAttr "ankle_left_rotateX.a" "clipLibrary1.cel[0].cev[14].cevr";
connectAttr "ankle_left_translateZ.a" "clipLibrary1.cel[0].cev[15].cevr"
		;
connectAttr "ankle_left_translateY.a" "clipLibrary1.cel[0].cev[16].cevr"
		;
connectAttr "ankle_left_translateX.a" "clipLibrary1.cel[0].cev[17].cevr"
		;
connectAttr "knee_left_translateZ.a" "clipLibrary1.cel[0].cev[18].cevr";
connectAttr "knee_left_translateY.a" "clipLibrary1.cel[0].cev[19].cevr";
connectAttr "knee_left_translateX.a" "clipLibrary1.cel[0].cev[20].cevr";
connectAttr "knee_left_rotateZ.a" "clipLibrary1.cel[0].cev[21].cevr";
connectAttr "knee_left_rotateY.a" "clipLibrary1.cel[0].cev[22].cevr";
connectAttr "knee_left_rotateX.a" "clipLibrary1.cel[0].cev[23].cevr";
connectAttr "hip_left_translateZ.a" "clipLibrary1.cel[0].cev[24].cevr";
connectAttr "hip_left_translateY.a" "clipLibrary1.cel[0].cev[25].cevr";
connectAttr "hip_left_translateX.a" "clipLibrary1.cel[0].cev[26].cevr";
connectAttr "hip_left_rotateZ.a" "clipLibrary1.cel[0].cev[27].cevr";
connectAttr "hip_left_rotateY.a" "clipLibrary1.cel[0].cev[28].cevr";
connectAttr "hip_left_rotateX.a" "clipLibrary1.cel[0].cev[29].cevr";
connectAttr "thumb_end_left_rotateZ.a" "clipLibrary1.cel[0].cev[30].cevr"
		;
connectAttr "thumb_end_left_rotateY.a" "clipLibrary1.cel[0].cev[31].cevr"
		;
connectAttr "thumb_end_left_rotateX.a" "clipLibrary1.cel[0].cev[32].cevr"
		;
connectAttr "thumb_end_left_translateZ.a" "clipLibrary1.cel[0].cev[33].cevr"
		;
connectAttr "thumb_end_left_translateY.a" "clipLibrary1.cel[0].cev[34].cevr"
		;
connectAttr "thumb_end_left_translateX.a" "clipLibrary1.cel[0].cev[35].cevr"
		;
connectAttr "thumb_left_rotateZ.a" "clipLibrary1.cel[0].cev[36].cevr";
connectAttr "thumb_left_rotateY.a" "clipLibrary1.cel[0].cev[37].cevr";
connectAttr "thumb_left_rotateX.a" "clipLibrary1.cel[0].cev[38].cevr";
connectAttr "thumb_left_translateZ.a" "clipLibrary1.cel[0].cev[39].cevr"
		;
connectAttr "thumb_left_translateY.a" "clipLibrary1.cel[0].cev[40].cevr"
		;
connectAttr "thumb_left_translateX.a" "clipLibrary1.cel[0].cev[41].cevr"
		;
connectAttr "finger_end_left_rotateZ.a" "clipLibrary1.cel[0].cev[42].cevr"
		;
connectAttr "finger_end_left_rotateY.a" "clipLibrary1.cel[0].cev[43].cevr"
		;
connectAttr "finger_end_left_rotateX.a" "clipLibrary1.cel[0].cev[44].cevr"
		;
connectAttr "finger_end_left_translateZ.a" "clipLibrary1.cel[0].cev[45].cevr"
		;
connectAttr "finger_end_left_translateY.a" "clipLibrary1.cel[0].cev[46].cevr"
		;
connectAttr "finger_end_left_translateX.a" "clipLibrary1.cel[0].cev[47].cevr"
		;
connectAttr "finger_left_rotateZ.a" "clipLibrary1.cel[0].cev[48].cevr";
connectAttr "finger_left_rotateY.a" "clipLibrary1.cel[0].cev[49].cevr";
connectAttr "finger_left_rotateX.a" "clipLibrary1.cel[0].cev[50].cevr";
connectAttr "finger_left_translateZ.a" "clipLibrary1.cel[0].cev[51].cevr"
		;
connectAttr "finger_left_translateY.a" "clipLibrary1.cel[0].cev[52].cevr"
		;
connectAttr "finger_left_translateX.a" "clipLibrary1.cel[0].cev[53].cevr"
		;
connectAttr "hand_left_rotateZ.a" "clipLibrary1.cel[0].cev[54].cevr";
connectAttr "hand_left_rotateY.a" "clipLibrary1.cel[0].cev[55].cevr";
connectAttr "hand_left_rotateX.a" "clipLibrary1.cel[0].cev[56].cevr";
connectAttr "hand_left_translateZ.a" "clipLibrary1.cel[0].cev[57].cevr";
connectAttr "hand_left_translateY.a" "clipLibrary1.cel[0].cev[58].cevr";
connectAttr "hand_left_translateX.a" "clipLibrary1.cel[0].cev[59].cevr";
connectAttr "wrist_left_rotateZ.a" "clipLibrary1.cel[0].cev[60].cevr";
connectAttr "wrist_left_rotateY.a" "clipLibrary1.cel[0].cev[61].cevr";
connectAttr "wrist_left_rotateX.a" "clipLibrary1.cel[0].cev[62].cevr";
connectAttr "wrist_left_translateZ.a" "clipLibrary1.cel[0].cev[63].cevr"
		;
connectAttr "wrist_left_translateY.a" "clipLibrary1.cel[0].cev[64].cevr"
		;
connectAttr "wrist_left_translateX.a" "clipLibrary1.cel[0].cev[65].cevr"
		;
connectAttr "elbow_left_rotateZ.a" "clipLibrary1.cel[0].cev[66].cevr";
connectAttr "elbow_left_rotateY.a" "clipLibrary1.cel[0].cev[67].cevr";
connectAttr "elbow_left_rotateX.a" "clipLibrary1.cel[0].cev[68].cevr";
connectAttr "elbow_left_translateZ.a" "clipLibrary1.cel[0].cev[69].cevr"
		;
connectAttr "elbow_left_translateY.a" "clipLibrary1.cel[0].cev[70].cevr"
		;
connectAttr "elbow_left_translateX.a" "clipLibrary1.cel[0].cev[71].cevr"
		;
connectAttr "shoulder_left_translateZ.a" "clipLibrary1.cel[0].cev[72].cevr"
		;
connectAttr "shoulder_left_translateY.a" "clipLibrary1.cel[0].cev[73].cevr"
		;
connectAttr "shoulder_left_translateX.a" "clipLibrary1.cel[0].cev[74].cevr"
		;
connectAttr "shoulder_left_rotateY.a" "clipLibrary1.cel[0].cev[75].cevr"
		;
connectAttr "shoulder_left_rotateX.a" "clipLibrary1.cel[0].cev[76].cevr"
		;
connectAttr "shoulder_left_rotateZ.a" "clipLibrary1.cel[0].cev[77].cevr"
		;
connectAttr "clavicle_left_rotateZ.a" "clipLibrary1.cel[0].cev[78].cevr"
		;
connectAttr "clavicle_left_rotateY.a" "clipLibrary1.cel[0].cev[79].cevr"
		;
connectAttr "clavicle_left_rotateX.a" "clipLibrary1.cel[0].cev[80].cevr"
		;
connectAttr "clavicle_left_translateZ.a" "clipLibrary1.cel[0].cev[81].cevr"
		;
connectAttr "clavicle_left_translateY.a" "clipLibrary1.cel[0].cev[82].cevr"
		;
connectAttr "clavicle_left_translateX.a" "clipLibrary1.cel[0].cev[83].cevr"
		;
connectAttr "thumb_end_right_rotateZ.a" "clipLibrary1.cel[0].cev[84].cevr"
		;
connectAttr "thumb_end_right_rotateY.a" "clipLibrary1.cel[0].cev[85].cevr"
		;
connectAttr "thumb_end_right_rotateX.a" "clipLibrary1.cel[0].cev[86].cevr"
		;
connectAttr "thumb_end_right_translateZ.a" "clipLibrary1.cel[0].cev[87].cevr"
		;
connectAttr "thumb_end_right_translateY.a" "clipLibrary1.cel[0].cev[88].cevr"
		;
connectAttr "thumb_end_right_translateX.a" "clipLibrary1.cel[0].cev[89].cevr"
		;
connectAttr "thumb_right_rotateZ.a" "clipLibrary1.cel[0].cev[90].cevr";
connectAttr "thumb_right_rotateY.a" "clipLibrary1.cel[0].cev[91].cevr";
connectAttr "thumb_right_rotateX.a" "clipLibrary1.cel[0].cev[92].cevr";
connectAttr "thumb_right_translateZ.a" "clipLibrary1.cel[0].cev[93].cevr"
		;
connectAttr "thumb_right_translateY.a" "clipLibrary1.cel[0].cev[94].cevr"
		;
connectAttr "thumb_right_translateX.a" "clipLibrary1.cel[0].cev[95].cevr"
		;
connectAttr "finger_end_right_rotateZ.a" "clipLibrary1.cel[0].cev[96].cevr"
		;
connectAttr "finger_end_right_rotateY.a" "clipLibrary1.cel[0].cev[97].cevr"
		;
connectAttr "finger_end_right_rotateX.a" "clipLibrary1.cel[0].cev[98].cevr"
		;
connectAttr "finger_end_right_translateZ.a" "clipLibrary1.cel[0].cev[99].cevr"
		;
connectAttr "finger_end_right_translateY.a" "clipLibrary1.cel[0].cev[100].cevr"
		;
connectAttr "finger_end_right_translateX.a" "clipLibrary1.cel[0].cev[101].cevr"
		;
connectAttr "finger_right_translateZ.a" "clipLibrary1.cel[0].cev[102].cevr"
		;
connectAttr "finger_right_translateY.a" "clipLibrary1.cel[0].cev[103].cevr"
		;
connectAttr "finger_right_translateX.a" "clipLibrary1.cel[0].cev[104].cevr"
		;
connectAttr "finger_right_rotateY.a" "clipLibrary1.cel[0].cev[105].cevr"
		;
connectAttr "finger_right_rotateX.a" "clipLibrary1.cel[0].cev[106].cevr"
		;
connectAttr "finger_right_rotateZ.a" "clipLibrary1.cel[0].cev[107].cevr"
		;
connectAttr "hand_right_rotateZ.a" "clipLibrary1.cel[0].cev[108].cevr";
connectAttr "hand_right_rotateY.a" "clipLibrary1.cel[0].cev[109].cevr";
connectAttr "hand_right_rotateX.a" "clipLibrary1.cel[0].cev[110].cevr";
connectAttr "hand_right_translateZ.a" "clipLibrary1.cel[0].cev[111].cevr"
		;
connectAttr "hand_right_translateY.a" "clipLibrary1.cel[0].cev[112].cevr"
		;
connectAttr "hand_right_translateX.a" "clipLibrary1.cel[0].cev[113].cevr"
		;
connectAttr "wrist_right_rotateZ.a" "clipLibrary1.cel[0].cev[114].cevr";
connectAttr "wrist_right_rotateY.a" "clipLibrary1.cel[0].cev[115].cevr";
connectAttr "wrist_right_rotateX.a" "clipLibrary1.cel[0].cev[116].cevr";
connectAttr "wrist_right_translateZ.a" "clipLibrary1.cel[0].cev[117].cevr"
		;
connectAttr "wrist_right_translateY.a" "clipLibrary1.cel[0].cev[118].cevr"
		;
connectAttr "wrist_right_translateX.a" "clipLibrary1.cel[0].cev[119].cevr"
		;
connectAttr "elbow_right_rotateZ.a" "clipLibrary1.cel[0].cev[120].cevr";
connectAttr "elbow_right_rotateY.a" "clipLibrary1.cel[0].cev[121].cevr";
connectAttr "elbow_right_rotateX.a" "clipLibrary1.cel[0].cev[122].cevr";
connectAttr "elbow_right_translateZ.a" "clipLibrary1.cel[0].cev[123].cevr"
		;
connectAttr "elbow_right_translateY.a" "clipLibrary1.cel[0].cev[124].cevr"
		;
connectAttr "elbow_right_translateX.a" "clipLibrary1.cel[0].cev[125].cevr"
		;
connectAttr "shoulder_right_translateZ.a" "clipLibrary1.cel[0].cev[126].cevr"
		;
connectAttr "shoulder_right_translateY.a" "clipLibrary1.cel[0].cev[127].cevr"
		;
connectAttr "shoulder_right_translateX.a" "clipLibrary1.cel[0].cev[128].cevr"
		;
connectAttr "shoulder_right_rotateY.a" "clipLibrary1.cel[0].cev[129].cevr"
		;
connectAttr "shoulder_right_rotateX.a" "clipLibrary1.cel[0].cev[130].cevr"
		;
connectAttr "shoulder_right_rotateZ.a" "clipLibrary1.cel[0].cev[131].cevr"
		;
connectAttr "clavicle_right_rotateZ.a" "clipLibrary1.cel[0].cev[132].cevr"
		;
connectAttr "clavicle_right_rotateY.a" "clipLibrary1.cel[0].cev[133].cevr"
		;
connectAttr "clavicle_right_rotateX.a" "clipLibrary1.cel[0].cev[134].cevr"
		;
connectAttr "clavicle_right_translateZ.a" "clipLibrary1.cel[0].cev[135].cevr"
		;
connectAttr "clavicle_right_translateY.a" "clipLibrary1.cel[0].cev[136].cevr"
		;
connectAttr "clavicle_right_translateX.a" "clipLibrary1.cel[0].cev[137].cevr"
		;
connectAttr "head_rotateZ.a" "clipLibrary1.cel[0].cev[138].cevr";
connectAttr "head_rotateY.a" "clipLibrary1.cel[0].cev[139].cevr";
connectAttr "head_rotateX.a" "clipLibrary1.cel[0].cev[140].cevr";
connectAttr "head_translateZ.a" "clipLibrary1.cel[0].cev[141].cevr";
connectAttr "head_translateY.a" "clipLibrary1.cel[0].cev[142].cevr";
connectAttr "head_translateX.a" "clipLibrary1.cel[0].cev[143].cevr";
connectAttr "neck_rotateZ.a" "clipLibrary1.cel[0].cev[144].cevr";
connectAttr "neck_rotateY.a" "clipLibrary1.cel[0].cev[145].cevr";
connectAttr "neck_rotateX.a" "clipLibrary1.cel[0].cev[146].cevr";
connectAttr "neck_translateZ.a" "clipLibrary1.cel[0].cev[147].cevr";
connectAttr "neck_translateY.a" "clipLibrary1.cel[0].cev[148].cevr";
connectAttr "neck_translateX.a" "clipLibrary1.cel[0].cev[149].cevr";
connectAttr "chest_rotateZ.a" "clipLibrary1.cel[0].cev[150].cevr";
connectAttr "chest_rotateY.a" "clipLibrary1.cel[0].cev[151].cevr";
connectAttr "chest_rotateX.a" "clipLibrary1.cel[0].cev[152].cevr";
connectAttr "chest_translateZ.a" "clipLibrary1.cel[0].cev[153].cevr";
connectAttr "chest_translateY.a" "clipLibrary1.cel[0].cev[154].cevr";
connectAttr "chest_translateX.a" "clipLibrary1.cel[0].cev[155].cevr";
connectAttr "spine_2_rotateZ.a" "clipLibrary1.cel[0].cev[156].cevr";
connectAttr "spine_2_rotateY.a" "clipLibrary1.cel[0].cev[157].cevr";
connectAttr "spine_2_rotateX.a" "clipLibrary1.cel[0].cev[158].cevr";
connectAttr "spine_2_translateZ.a" "clipLibrary1.cel[0].cev[159].cevr";
connectAttr "spine_2_translateY.a" "clipLibrary1.cel[0].cev[160].cevr";
connectAttr "spine_2_translateX.a" "clipLibrary1.cel[0].cev[161].cevr";
connectAttr "spine_1_rotateZ.a" "clipLibrary1.cel[0].cev[162].cevr";
connectAttr "spine_1_rotateY.a" "clipLibrary1.cel[0].cev[163].cevr";
connectAttr "spine_1_rotateX.a" "clipLibrary1.cel[0].cev[164].cevr";
connectAttr "spine_1_translateZ.a" "clipLibrary1.cel[0].cev[165].cevr";
connectAttr "spine_1_translateY.a" "clipLibrary1.cel[0].cev[166].cevr";
connectAttr "spine_1_translateX.a" "clipLibrary1.cel[0].cev[167].cevr";
connectAttr "toe_right_rotateZ.a" "clipLibrary1.cel[0].cev[168].cevr";
connectAttr "toe_right_rotateY.a" "clipLibrary1.cel[0].cev[169].cevr";
connectAttr "toe_right_rotateX.a" "clipLibrary1.cel[0].cev[170].cevr";
connectAttr "toe_right_translateZ.a" "clipLibrary1.cel[0].cev[171].cevr"
		;
connectAttr "toe_right_translateY.a" "clipLibrary1.cel[0].cev[172].cevr"
		;
connectAttr "toe_right_translateX.a" "clipLibrary1.cel[0].cev[173].cevr"
		;
connectAttr "foot_right_rotateZ.a" "clipLibrary1.cel[0].cev[174].cevr";
connectAttr "foot_right_rotateY.a" "clipLibrary1.cel[0].cev[175].cevr";
connectAttr "foot_right_rotateX.a" "clipLibrary1.cel[0].cev[176].cevr";
connectAttr "foot_right_translateZ.a" "clipLibrary1.cel[0].cev[177].cevr"
		;
connectAttr "foot_right_translateY.a" "clipLibrary1.cel[0].cev[178].cevr"
		;
connectAttr "foot_right_translateX.a" "clipLibrary1.cel[0].cev[179].cevr"
		;
connectAttr "ankle_right_rotateZ.a" "clipLibrary1.cel[0].cev[180].cevr";
connectAttr "ankle_right_rotateY.a" "clipLibrary1.cel[0].cev[181].cevr";
connectAttr "ankle_right_rotateX.a" "clipLibrary1.cel[0].cev[182].cevr";
connectAttr "ankle_right_translateZ.a" "clipLibrary1.cel[0].cev[183].cevr"
		;
connectAttr "ankle_right_translateY.a" "clipLibrary1.cel[0].cev[184].cevr"
		;
connectAttr "ankle_right_translateX.a" "clipLibrary1.cel[0].cev[185].cevr"
		;
connectAttr "knee_right_translateZ.a" "clipLibrary1.cel[0].cev[186].cevr"
		;
connectAttr "knee_right_translateY.a" "clipLibrary1.cel[0].cev[187].cevr"
		;
connectAttr "knee_right_translateX.a" "clipLibrary1.cel[0].cev[188].cevr"
		;
connectAttr "knee_right_rotateZ.a" "clipLibrary1.cel[0].cev[189].cevr";
connectAttr "knee_right_rotateY.a" "clipLibrary1.cel[0].cev[190].cevr";
connectAttr "knee_right_rotateX.a" "clipLibrary1.cel[0].cev[191].cevr";
connectAttr "hip_right_translateZ.a" "clipLibrary1.cel[0].cev[192].cevr"
		;
connectAttr "hip_right_translateY.a" "clipLibrary1.cel[0].cev[193].cevr"
		;
connectAttr "hip_right_translateX.a" "clipLibrary1.cel[0].cev[194].cevr"
		;
connectAttr "hip_right_rotateZ.a" "clipLibrary1.cel[0].cev[195].cevr";
connectAttr "hip_right_rotateY.a" "clipLibrary1.cel[0].cev[196].cevr";
connectAttr "hip_right_rotateX.a" "clipLibrary1.cel[0].cev[197].cevr";
connectAttr "god_joint_rotateZ.a" "clipLibrary1.cel[0].cev[198].cevr";
connectAttr "god_joint_rotateY.a" "clipLibrary1.cel[0].cev[199].cevr";
connectAttr "god_joint_rotateX.a" "clipLibrary1.cel[0].cev[200].cevr";
connectAttr "god_joint_translateZ.a" "clipLibrary1.cel[0].cev[201].cevr"
		;
connectAttr "god_joint_translateX.a" "clipLibrary1.cel[0].cev[202].cevr"
		;
connectAttr "god_joint_translateY.a" "clipLibrary1.cel[0].cev[203].cevr"
		;
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[0].llnk";
connectAttr ":initialShadingGroup.msg" "lightLinker1.lnk[0].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[1].llnk";
connectAttr ":initialParticleSE.msg" "lightLinker1.lnk[1].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[2].llnk";
connectAttr "lightLinker1.msg" ":lightList1.ln" -na;
// End of idle2.ma
