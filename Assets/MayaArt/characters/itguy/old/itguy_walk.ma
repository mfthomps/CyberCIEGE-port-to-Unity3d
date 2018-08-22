//Maya ASCII 4.5 scene
//Name: itguy_walk.ma
//Last modified: Mon, Nov 17, 2003 03:17:28 PM
requires maya "4.5";
currentUnit -l foot -a degree -t ntsc;
fileInfo "application" "maya";
fileInfo "product" "Maya Complete 4.5";
fileInfo "version" "4.5";
fileInfo "cutIdentifier" "200208160001";
fileInfo "osv" "Microsoft Windows 2000 Professional Service Pack 4 (Build 2195)\n";
createNode transform -s -n "persp";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 23.995596766075874 1.2378252161232719 0.96343534065107239 ;
	setAttr ".r" -type "double3" 3.8526902682806314 -7467.800000005469 0 ;
	setAttr ".rp" -type "double3" 3.7298831273496072e-015 -9.3247078183740181e-016 
		-7.4597662546992144e-015 ;
	setAttr ".rpt" -type "double3" -1.0181554296189579e-014 -2.6294516172537049e-015 
		9.3990862888378329e-015 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999979;
	setAttr ".coi" 24.699835619827514;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 66.343236756828176 131.66446201534833 -0.60960000000000525 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
	setAttr ".col" -type "float3" 1 1 1 ;
createNode transform -s -n "top";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.042799962206748469 100 -0.09559028157937946 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100;
	setAttr ".ow" 3.337602966704293;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -1.6486000614283083 3.2197236342466686 100 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100;
	setAttr ".ow" 11.588543821559293;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 100.21016046280489 2.2626987313300826 0.56993263041394204 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100;
	setAttr ".ow" 9.8036361083020314;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode joint -n "god_joint";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 82.905600000000007 -1.5235399408006025 1;
createNode joint -n "spine_1" -p "god_joint";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 96.316800000000001 2.2204460492503131e-016 1;
createNode joint -n "spine_2" -p "spine_1";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 112.16640000000001 -0.12451816054295495 1;
createNode joint -n "chest" -p "spine_2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 126.90278208834873 0.19509691995282158 1;
createNode joint -n "neck" -p "|god_joint|spine_1|spine_2|chest";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 145.07595133010403 -1.2191999999999996 1;
createNode joint -n "head" -p "neck";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 148.12395133010398 1.2192000000000005 1;
createNode joint -n "head_end" -p "|god_joint|spine_1|spine_2|chest|neck|head";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 166.41195133010399 0.60960000000000081 1;
createNode joint -n "clavicle_right" -p "|god_joint|spine_1|spine_2|chest";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.722223920000001 130.56032297236209 -6.5925809435429965 1;
createNode joint -n "shoulder_right" -p "clavicle_right";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -21.336000000000002 138.37920000000003 -3.0480000000000032 1;
createNode joint -n "elbow_right" -p "shoulder_right";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -45.719999999999985 134.61561791165141 -3.1717480164570038 1;
createNode joint -n "wrist_right" -p "elbow_right";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -71.932799999999972 132.28319999999999 -3.6576000000000017 1;
createNode joint -n "hand_right" -p "wrist_right";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -76.199999999999974 132.89280000000005 -3.6576000000000013 1;
createNode joint -n "index1_right" -p "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.840525395620432 133.50240000000008 -2.2204460492503131e-015 1;
createNode joint -n "index2_right" -p "index1_right";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -83.498125395620448 132.89280000000008 0.3004912146664338 1;
createNode joint -n "index_end_right" -p "index2_right";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -87.155725395620451 131.67360000000002 0.69545463276183173 1;
createNode joint -n "thumb1_right" -p "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -74.096561497334889 131.67360000000008 0.82854536723815997 1;
createNode joint -n "thumb2_right" -p "thumb1_right";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -76.534961497334891 130.45440000000005 2.3525453672381595 1;
createNode joint -n "thumb_end_right" -p "thumb2_right";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -80.529365497334879 129.23520000000005 3.8273506472381591 1;
createNode joint -n "fingers1_right" -p "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -80.012234661144092 133.50240000000005 -4.8768000000000029 1;
createNode joint -n "fingers2_right" -p "fingers1_right";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -83.66983466114408 132.89280000000005 -4.8768000000000038 1;
createNode joint -n "fingers_end_right" -p "fingers2_right";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -87.327434661144068 131.67360000000005 -4.8768000000000038 1;
createNode joint -n "clavicle_left" -p "|god_joint|spine_1|spine_2|chest";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 10.722226103569733 130.56038208834872 -6.5925950459904277 1;
createNode joint -n "shoulder_left" -p "clavicle_left";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 21.336000000000002 138.37919999999997 -3.0480000000000098 1;
createNode joint -n "elbow_left" -p "shoulder_left";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 45.719999999999985 134.61561791165127 -3.1717496975867028 1;
createNode joint -n "wrist_left" -p "elbow_left";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 71.932800000000015 132.28319999999997 -3.6576000000000128 1;
createNode joint -n "hand_left" -p "wrist_left";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.200000000000017 132.89280000000002 -3.6576000000000133 1;
createNode joint -n "index1_left" -p "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 79.651273513656392 133.50240000000002 -5.773159728050814e-015 1;
createNode joint -n "index2_left" -p "index1_left";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.30887351365638 132.89280000000005 0.27933108636088111 1;
createNode joint -n "index_end_left" -p "index2_left";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 86.966473513656368 132.28320000000005 0.6095999999999947 1;
createNode joint -n "thumb1_left" -p "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 74.045160190930289 131.67359999999999 0.60959999999999459 1;
createNode joint -n "thumb2_left" -p "thumb1_left";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 75.873960190930291 131.06400000000002 2.4383999999999943 1;
createNode joint -n "thumb_end_left" -p "thumb2_left";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.750760190930293 128.7133061190454 3.6575999999999942 1;
createNode joint -n "fingers1_left" -p "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 79.611369072747692 134.11199999999999 -4.8768000000000065 1;
createNode joint -n "fingers2_left" -p "fingers1_left";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 82.659369072747737 132.89279999999999 -4.8768000000000065 1;
createNode joint -n "fingers_end_left" -p "fingers2_left";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 86.926569072747682 131.67359999999999 -4.8768000000000074 1;
createNode joint -n "hip_left" -p "god_joint";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".mnrl" -type "double3" -85 -10 -25 ;
	setAttr ".mxrl" -type "double3" 35 10 10 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 9.1440000000000019 79.857600000000005 -4.4408920985006262e-016 1;
createNode joint -n "knee_left" -p "hip_left";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".mnrl" -type "double3" 0 -14.999999999999998 0 ;
	setAttr ".mxrl" -type "double3" 80 14.999999999999998 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 10.875341649084138 46.329670381891738 -4.4408920985006262e-016 1;
createNode joint -n "ankle_left" -p "knee_left";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".mnrl" -type "double3" -29.999999999999996 0 0 ;
	setAttr ".mxrl" -type "double3" 45 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 10.875341649084136 10.363210150620098 -5.48640001637769 1;
createNode joint -n "foot_left" -p "ankle_left";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".mnrl" -type "double3" -20 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 10.875341649084136 2.2223399195636429 0.60960012712479283 1;
createNode joint -n "toe_left" -p "|god_joint|hip_left|knee_left|ankle_left|foot_left";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 10.875341649084136 2.2223399195636411 12.801613567960064 1;
createNode joint -n "hip_right" -p "god_joint";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".mnrl" -type "double3" -85 -10 -25 ;
	setAttr ".mxrl" -type "double3" 35.00000000000005 10.000000000000002 10 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 0.99999999999999911 -4.19555995185357e-008 0
		 0 4.19555995185357e-008 0.99999999999999911 0 -9.1440000000000019 79.857568333125414 -4.4408920985006262e-016 1;
createNode joint -n "knee_right" -p "hip_right";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".mnrl" -type "double3" 0 -14.999999999999998 0 ;
	setAttr ".mxrl" -type "double3" 80 14.999999999999998 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 0.99999999999999911 -4.19555995185357e-008 0
		 0 4.19555995185357e-008 0.99999999999999911 0 -10.875324960000004 46.329600000000021 1.406686011610668e-006 1;
createNode joint -n "ankle_right" -p "knee_right";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".mnrl" -type "double3" -29.999999999999996 0 0 ;
	setAttr ".mxrl" -type "double3" 45 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 0.99999999999999911 -4.19555995185357e-008 0
		 0 4.19555995185357e-008 0.99999999999999911 0 -10.875324960000009 10.363199769814855 -5.4863970843221095 1;
createNode joint -n "foot_right" -p "ankle_right";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".mnrl" -type "double3" -20 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 0.99999999999999911 -4.19555995185357e-008 0
		 0 4.19555995185357e-008 0.99999999999999911 0 -10.875324960000007 2.2223394295094661 0.60960325723257203 1;
createNode joint -n "toe_right" -p "|god_joint|hip_right|knee_right|ankle_right|foot_right";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 
		-max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 0.99999999999999911 -4.19555995185357e-008 0
		 0 4.19555995185357e-008 0.99999999999999911 0 -10.875324960000009 2.2223399410321365 12.801603257232561 1;
createNode transform -n "itguy";
createNode transform -n "foot_left" -p "itguy";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode mesh -n "foot_leftShape" -p "|itguy|foot_left";
	setAttr -k off ".v";
	setAttr -s 6 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
createNode mesh -n "foot_leftShapeOrig" -p "|itguy|foot_left";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 59 ".uvst[0].uvsp[0:58]" -type "float2" 0.56060851 
		0.024526626 0.59982872 0.024397878 0.54740512 0.07796526 0.59814882 0.076692522 
		0.60459638 0.0074473917 0.56051087 0.006727919 0.98793983 0.03199625 0.96394253 
		0.032337666 0.98767042 0.0091662407 0.96372461 0.0095071793 0.85549974 0.0040259361 
		0.94490099 0.0040564537 0.85614204 0.016713494 0.94553614 0.028077602 0.90512943 
		0.074683666 0.95299071 0.073819637 0.65593386 0.018900501 0.63732243 0.079663754 
		0.67106533 0.061151028 0.6499157 0.0064341873 0.61225665 0.12380338 0.66694987 
		0.19083443 0.63840079 0.13040201 0.86241102 0.077750206 0.73347819 0.05190428 
		0.77195168 0.052038748 0.72137529 0.074823655 0.77605408 0.074944295 0.6996932 
		0.026549142 0.7022562 0.050236702 0.69959474 0.010801852 0.67467505 0.11361227 
		0.70143116 0.18218343 0.71044499 0.12987377 0.71549094 0.15987349 0.80630684 
		0.008398056 0.80692482 0.023832627 0.82837248 0.059961319 0.79714203 0.049797535 
		0.77542067 0.020597935 0.78037643 0.033446416 0.71700227 0.040615082 0.72449493 
		0.021396428 0.72735804 0.030318215 0.77189451 0.030483678 0.77342129 0.021255493 
		0.72588778 0.021091938 0.95871162 0.034870148 0.9592948 0.0068717003 0.59316719 
		0.17573681 0.58210546 0.11931868 0.54227591 0.031653434 0.5403018 0.0099351257 
		0.96219063 0.07738971 0.98667812 0.077078335 0.72106224 0.10771203 0.77614015 
		0.10782123 0.57407409 0.16336828 0.57140219 0.13508046;
	setAttr ".cuvs" -type "string" "map1";
	setAttr -s 32 ".vt[0:31]"  0.32191795 0.36482728 -0.39539057 
		0.15464324 0.36482728 -0.36589548 0.051705755 0.12984475 -0.37141415 0.084230736 
		0.0058917217 -0.36503613 0.40293476 0.0058917059 -0.42713884 0.41675994 0.12984473 
		-0.43578297 0.39906815 0.36482725 -0.22128187 0.14169449 0.36482731 -0.17589995 
		0.087495998 0.12984475 -0.1663433 0.16 0.0058917217 -0.12 0.53480935 -0.0060574724 
		0.019033669 0.56757182 0.11789554 0.025161553 0.4310275 0.37501058 -0.00060343056 
		0.18475693 0.37501064 0.028891616 0.13922244 0.12984475 0.12701197 0.17023185 
		0.0058917254 0.087409228 0.45141625 0.22226104 0.33226591 0.28301707 0.22226109 
		0.36891326 0.16843118 0.12984475 0.3558189 0.14545728 0.0099967299 0.35569769 
		0.57734925 0.0099967141 0.27954349 0.55437541 0.12984473 0.27942231 0.25850895 
		0.17226306 0.46284896 0.25850895 0.068835028 0.48570019 0.51573068 0.17226306 
		0.41749379 0.51532245 0.068835028 0.44041705 0.30996692 0.022311706 -0.50952917 
		0.12683569 0.022311706 -0.47723821 0.12682772 0.16675939 -0.47643161 0.3102504 
		0.16675939 -0.50877398 0.44068295 0.27879497 0.17256896 0.23680201 0.27879503 
		0.20564017;
	setAttr -s 87 ".ed[0:86]"  0 1 0 1 2 
		1 2 3 1 3 27 0 4 5 1 5 
		0 1 7 8 1 8 9 1 9 10 1 
		10 11 1 11 6 1 12 13 0 14 15 
		1 15 10 1 11 12 1 16 17 1 17 
		18 1 18 19 1 19 23 0 20 21 1 
		21 16 1 0 6 0 1 7 0 2 8 
		1 3 9 0 4 10 0 5 11 1 6 
		12 0 7 13 0 8 14 1 9 15 0 
		12 30 1 13 31 1 14 18 1 15 19 
		0 10 20 0 11 21 1 21 24 1 22 
		18 1 17 22 1 23 25 0 22 23 1 
		24 22 1 16 24 1 25 20 0 24 25 
		1 26 4 0 0 29 1 26 27 0 27 
		28 1 28 1 1 2 28 1 29 26 1 
		28 29 1 29 5 1 30 16 1 11 30 
		1 31 17 1 30 31 1 31 14 1 19 
		20 0 3 4 0 13 8 1 8 1 1 
		8 3 1 29 27 1 4 11 1 5 6 
		1 14 13 1 8 15 1 16 31 1 18 
		31 1 19 14 1 20 23 1 11 20 1 
		30 21 1 21 25 1 23 18 1 24 17 
		1 22 25 1 5 26 1 9 4 1 27 
		2 1 28 0 1 30 13 1 15 20 1 
		3 26 1;
	setAttr -s 56 ".fc[0:55]" -type "polyFaces" 
		f 3 23 63 1 
		mu 0 3 0 1 2 
		f 3 -64 -7 -23 
		mu 0 3 2 1 3 
		f 3 -8 64 24 
		mu 0 3 4 1 5 
		f 3 -65 -24 2 
		mu 0 3 5 1 0 
		f 3 53 65 49 
		mu 0 3 6 7 8 
		f 3 -66 52 48 
		mu 0 3 8 7 9 
		f 3 -26 66 -10 
		mu 0 3 10 11 12 
		f 3 4 26 -67 
		mu 0 3 11 13 12 
		f 3 -27 67 -11 
		mu 0 3 12 13 14 
		f 3 -68 5 21 
		mu 0 3 14 13 15 
		f 3 29 68 62 
		mu 0 3 1 16 17 
		f 3 -69 -60 -33 
		mu 0 3 17 16 18 
		f 3 6 -63 -29 
		mu 0 3 3 1 17 
		f 3 -30 69 -13 
		mu 0 3 16 1 19 
		f 3 7 30 -70 
		mu 0 3 1 4 19 
		f 3 8 -14 -31 
		mu 0 3 20 21 22 
		f 3 -15 10 27 
		mu 0 3 23 12 14 
		f 3 -16 70 57 
		mu 0 3 24 25 26 
		f 3 -71 -56 58 
		mu 0 3 26 25 27 
		f 3 33 71 59 
		mu 0 3 16 28 18 
		f 3 -72 -17 -58 
		mu 0 3 18 28 29 
		f 3 34 72 12 
		mu 0 3 19 30 16 
		f 3 -73 -18 -34 
		mu 0 3 16 30 28 
		f 3 60 73 -19 
		mu 0 3 31 32 33 
		f 3 -74 -45 -41 
		mu 0 3 33 32 34 
		f 3 9 74 -36 
		mu 0 3 10 12 35 
		f 3 -75 36 -20 
		mu 0 3 35 12 36 
		f 3 56 75 -37 
		mu 0 3 12 37 36 
		f 3 -76 55 -21 
		mu 0 3 36 37 38 
		f 3 19 76 44 
		mu 0 3 35 36 39 
		f 3 -77 37 45 
		mu 0 3 39 36 40 
		f 3 43 -38 20 
		mu 0 3 38 40 36 
		f 3 -40 16 -39 
		mu 0 3 41 29 28 
		f 3 18 77 17 
		mu 0 3 30 42 28 
		f 3 -78 -42 38 
		mu 0 3 28 42 41 
		f 3 -43 78 39 
		mu 0 3 43 44 24 
		f 3 -79 -44 15 
		mu 0 3 24 44 25 
		f 3 42 79 -46 
		mu 0 3 44 43 45 
		f 3 -80 41 40 
		mu 0 3 45 43 46 
		f 3 54 80 -53 
		mu 0 3 47 13 48 
		f 3 -81 -5 -47 
		mu 0 3 48 13 11 
		f 3 -9 81 25 
		mu 0 3 21 20 49 
		f 3 -82 -25 61 
		mu 0 3 49 20 50 
		f 3 -50 82 51 
		mu 0 3 51 52 0 
		f 3 -83 -4 -3 
		mu 0 3 0 52 5 
		f 3 -51 -52 -2 
		mu 0 3 2 51 0 
		f 3 -54 83 47 
		mu 0 3 7 6 53 
		f 3 50 -1 -84 
		mu 0 3 6 54 53 
		f 3 -6 -55 -48 
		mu 0 3 15 13 47 
		f 3 14 31 -57 
		mu 0 3 12 23 37 
		f 3 -59 84 32 
		mu 0 3 26 27 55 
		f 3 -85 -32 11 
		mu 0 3 55 27 56 
		f 3 -35 85 -61 
		mu 0 3 31 22 32 
		f 3 -86 13 35 
		mu 0 3 32 22 21 
		f 3 -62 86 46 
		mu 0 3 49 50 57 
		f 3 3 -49 -87 
		mu 0 3 50 58 57 ;
createNode transform -n "foot_right" -p "itguy";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode mesh -n "foot_rightShape" -p "|itguy|foot_right";
	setAttr -k off ".v";
	setAttr -s 6 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".op" yes;
createNode mesh -n "foot_rightShapeOrig" -p "|itguy|foot_right";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 59 ".uvst[0].uvsp[0:58]" -type "float2" 0.56060851 
		0.024526626 0.59982872 0.024397878 0.54740512 0.07796526 0.59814882 0.076692522 
		0.60459638 0.0074473917 0.56051087 0.006727919 0.98793983 0.03199625 0.96394253 
		0.032337666 0.98767042 0.0091662407 0.96372461 0.0095071793 0.85549974 0.0040259361 
		0.94490099 0.0040564537 0.85614204 0.016713494 0.94553614 0.028077602 0.90512943 
		0.074683666 0.95299071 0.073819637 0.65593386 0.018900501 0.63732243 0.079663754 
		0.67106533 0.061151028 0.6499157 0.0064341873 0.61225665 0.12380338 0.66694987 
		0.19083443 0.63840079 0.13040201 0.86241102 0.077750206 0.73347819 0.05190428 
		0.77195168 0.052038748 0.72137529 0.074823655 0.77605408 0.074944295 0.6996932 
		0.026549142 0.7022562 0.050236702 0.69959474 0.010801852 0.67467505 0.11361227 
		0.70143116 0.18218343 0.71044499 0.12987377 0.71549094 0.15987349 0.80630684 
		0.008398056 0.80692482 0.023832627 0.82837248 0.059961319 0.79714203 0.049797535 
		0.77542067 0.020597935 0.78037643 0.033446416 0.71700227 0.040615082 0.72449493 
		0.021396428 0.72735804 0.030318215 0.77189451 0.030483678 0.77342129 0.021255493 
		0.72588778 0.021091938 0.95871162 0.034870148 0.9592948 0.0068717003 0.59316719 
		0.17573681 0.58210546 0.11931868 0.54227591 0.031653434 0.5403018 0.0099351257 
		0.96219063 0.07738971 0.98667812 0.077078335 0.72106224 0.10771203 0.77614015 
		0.10782123 0.57407409 0.16336828 0.57140219 0.13508046;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".op" yes;
	setAttr -s 32 ".vt[0:31]"  -0.32191795 0.36482728 -0.39539057 
		-0.15464324 0.36482728 -0.36589548 -0.051705755 0.12984475 -0.37141415 -0.084230736 
		0.0058917217 -0.36503613 -0.40293476 0.0058917059 -0.42713884 -0.41675994 
		0.12984473 -0.43578297 -0.39906815 0.36482725 -0.22128187 -0.14169449 0.36482731 
		-0.17589995 -0.087495998 0.12984475 -0.1663433 -0.16 0.0058917217 -0.12 -0.53480935 
		-0.0060574724 0.019033669 -0.56757182 0.11789554 0.025161553 -0.4310275 0.37501058 
		-0.00060343056 -0.18475693 0.37501064 0.028891616 -0.13922244 0.12984475 
		0.12701197 -0.17023185 0.0058917254 0.087409228 -0.45141625 0.22226104 0.33226591 
		-0.28301707 0.22226109 0.36891326 -0.16843118 0.12984475 0.3558189 -0.14545728 
		0.0099967299 0.35569769 -0.57734925 0.0099967141 0.27954349 -0.55437541 0.12984473 
		0.27942231 -0.25850895 0.17226306 0.46284896 -0.25850895 0.068835028 0.48570019 
		-0.51573068 0.17226306 0.41749379 -0.51532245 0.068835028 0.44041705 -0.30996692 
		0.022311706 -0.50952917 -0.12683569 0.022311706 -0.47723821 -0.12682772 0.16675939 
		-0.47643161 -0.3102504 0.16675939 -0.50877398 -0.44068295 0.27879497 0.17256896 
		-0.23680201 0.27879503 0.20564017;
	setAttr -s 87 ".ed[0:86]"  0 1 0 1 2 
		1 2 3 1 3 27 0 4 5 1 5 
		0 1 7 8 1 8 9 1 9 10 1 
		10 11 1 11 6 1 12 13 0 14 15 
		1 15 10 1 11 12 1 16 17 1 17 
		18 1 18 19 1 19 23 0 20 21 1 
		21 16 1 0 6 0 1 7 0 2 8 
		1 3 9 0 4 10 0 5 11 1 6 
		12 0 7 13 0 8 14 1 9 15 0 
		12 30 1 13 31 1 14 18 1 15 19 
		0 10 20 0 11 21 1 21 24 1 22 
		18 1 17 22 1 23 25 0 22 23 1 
		24 22 1 16 24 1 25 20 0 24 25 
		1 26 4 0 0 29 1 26 27 0 27 
		28 1 28 1 1 2 28 1 29 26 1 
		28 29 1 29 5 1 30 16 1 11 30 
		1 31 17 1 30 31 1 31 14 1 19 
		20 0 3 4 0 13 8 1 8 1 1 
		8 3 1 29 27 1 4 11 1 5 6 
		1 14 13 1 8 15 1 16 31 1 18 
		31 1 19 14 1 20 23 1 11 20 1 
		30 21 1 21 25 1 23 18 1 24 17 
		1 22 25 1 5 26 1 9 4 1 27 
		2 1 28 0 1 30 13 1 15 20 1 
		3 26 1;
	setAttr -s 56 ".fc[0:55]" -type "polyFaces" 
		f 3 -2 -64 -24 
		mu 0 3 0 2 1 
		f 3 22 6 63 
		mu 0 3 2 3 1 
		f 3 -25 -65 7 
		mu 0 3 4 5 1 
		f 3 -3 23 64 
		mu 0 3 5 0 1 
		f 3 -50 -66 -54 
		mu 0 3 6 8 7 
		f 3 -49 -53 65 
		mu 0 3 8 9 7 
		f 3 9 -67 25 
		mu 0 3 10 12 11 
		f 3 66 -27 -5 
		mu 0 3 11 12 13 
		f 3 10 -68 26 
		mu 0 3 12 14 13 
		f 3 -22 -6 67 
		mu 0 3 14 15 13 
		f 3 -63 -69 -30 
		mu 0 3 1 17 16 
		f 3 32 59 68 
		mu 0 3 17 18 16 
		f 3 28 62 -7 
		mu 0 3 3 17 1 
		f 3 12 -70 29 
		mu 0 3 16 19 1 
		f 3 69 -31 -8 
		mu 0 3 1 19 4 
		f 3 30 13 -9 
		mu 0 3 20 22 21 
		f 3 -28 -11 14 
		mu 0 3 23 14 12 
		f 3 -58 -71 15 
		mu 0 3 24 26 25 
		f 3 -59 55 70 
		mu 0 3 26 27 25 
		f 3 -60 -72 -34 
		mu 0 3 16 18 28 
		f 3 57 16 71 
		mu 0 3 18 29 28 
		f 3 -13 -73 -35 
		mu 0 3 19 16 30 
		f 3 33 17 72 
		mu 0 3 16 28 30 
		f 3 18 -74 -61 
		mu 0 3 31 33 32 
		f 3 40 44 73 
		mu 0 3 33 34 32 
		f 3 35 -75 -10 
		mu 0 3 10 35 12 
		f 3 19 -37 74 
		mu 0 3 35 36 12 
		f 3 36 -76 -57 
		mu 0 3 12 36 37 
		f 3 20 -56 75 
		mu 0 3 36 38 37 
		f 3 -45 -77 -20 
		mu 0 3 35 39 36 
		f 3 -46 -38 76 
		mu 0 3 39 40 36 
		f 3 -21 37 -44 
		mu 0 3 38 36 40 
		f 3 38 -17 39 
		mu 0 3 41 28 29 
		f 3 -18 -78 -19 
		mu 0 3 30 28 42 
		f 3 -39 41 77 
		mu 0 3 28 41 42 
		f 3 -40 -79 42 
		mu 0 3 43 24 44 
		f 3 -16 43 78 
		mu 0 3 24 25 44 
		f 3 45 -80 -43 
		mu 0 3 44 45 43 
		f 3 -41 -42 79 
		mu 0 3 45 46 43 
		f 3 52 -81 -55 
		mu 0 3 47 48 13 
		f 3 46 4 80 
		mu 0 3 48 11 13 
		f 3 -26 -82 8 
		mu 0 3 21 49 20 
		f 3 -62 24 81 
		mu 0 3 49 50 20 
		f 3 -52 -83 49 
		mu 0 3 51 0 52 
		f 3 2 3 82 
		mu 0 3 0 5 52 
		f 3 1 51 50 
		mu 0 3 2 0 51 
		f 3 -48 -84 53 
		mu 0 3 7 53 6 
		f 3 83 0 -51 
		mu 0 3 6 53 54 
		f 3 47 54 5 
		mu 0 3 15 47 13 
		f 3 56 -32 -15 
		mu 0 3 12 37 23 
		f 3 -33 -85 58 
		mu 0 3 26 55 27 
		f 3 -12 31 84 
		mu 0 3 55 56 27 
		f 3 60 -86 34 
		mu 0 3 31 32 22 
		f 3 -36 -14 85 
		mu 0 3 32 21 22 
		f 3 -47 -87 61 
		mu 0 3 49 57 50 
		f 3 86 48 -4 
		mu 0 3 50 57 58 ;
createNode transform -n "midsection" -p "itguy";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode mesh -n "midsectionShape" -p "midsection";
	setAttr -k off ".v";
	setAttr -s 6 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
createNode mesh -n "midsectionShapeOrig" -p "midsection";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 33 ".uvst[0].uvsp[0:32]" -type "float2" 0.4520213 
		0.6146872 0.45955908 0.44946584 0.5137099 0.58990526 0.51580697 0.45260307 
		0.5764994 0.4559893 0.5764994 0.59138912 0.35614321 0.45016107 0.35658982 
		0.58019364 0.29431546 0.4543775 0.29431492 0.57902431 0.41081932 0.611332 
		0.41457272 0.45322296 0.29431465 0.65620154 0.35647893 0.65715653 0.4102287 
		0.67093951 0.44949082 0.67356366 0.51126289 0.65693069 0.57684404 0.66485906 
		0.13660733 0.61468589 0.074918568 0.58990395 0.12906982 0.44946417 0.072821639 
		0.45260116 0.0090188142 0.46529007 0.0090189502 0.60260165 0.23248696 0.45016119 
		0.23203984 0.58019274 0.17780976 0.61132997 0.17405692 0.45322117 0.2321506 
		0.65715575 0.1784005 0.67093843 0.1391381 0.67356253 0.077366047 0.65692997 
		0.0086750761 0.67123348;
	setAttr ".cuvs" -type "string" "map1";
	setAttr -s 30 ".vt[0:29]"  0.66450387 2.6313486 -0.16026559 
		0.37359446 2.6313488 -0.43242797 2.3463816e-008 2.6670737 -0.59874308 3.3675004e-008 
		2.6742194 0.53504199 0.34496748 2.6563561 0.43359789 0.63706201 2.6563561 
		0.16801396 0.64559126 3.25037 -0.12314864 0.37359446 3.1563563 -0.43242791 
		1.1236515e-008 3.1563563 -0.56126243 1.7546997e-008 3.156357 0.51166707 0.34496757 
		3.1563559 0.41022295 0.61814946 3.2503698 0.16801402 -0.66450399 2.6313486 
		-0.16026561 -0.37359449 2.6313493 -0.43242794 -0.34496754 2.656357 0.43359801 
		-0.63706207 2.6563563 0.16801395 -0.64559126 3.2503698 -0.12314869 -0.37359443 
		3.1563566 -0.43242779 -0.34496754 3.1563563 0.4102228 -0.6181494 3.2503695 
		0.16801393 0.3449676 3.4063561 0.40243128 1.5873507e-008 3.406357 0.50387532 
		0.62578124 3.4533629 0.16801396 0.64293253 3.4533632 -0.11077639 0.37359446 
		3.3741426 -0.4163211 3.4457592e-008 3.4027131 -0.51118654 -0.34496754 3.4063556 
		0.40243122 -0.62578136 3.4533634 0.16801398 -0.64293253 3.4533634 -0.11077637 
		-0.3735944 3.3741431 -0.41632089;
	setAttr -s 70 ".ed[0:69]"  0 1 0 1 2 
		0 3 4 0 4 5 0 5 0 0 6 
		7 1 7 8 1 9 10 1 10 11 1 
		11 6 1 3 9 1 6 23 1 7 24 
		1 8 25 1 9 21 1 10 20 1 11 
		22 1 2 8 1 1 7 1 0 6 1 
		5 11 1 4 10 1 0 7 1 2 7 
		1 10 3 1 10 5 1 6 5 1 10 
		21 1 11 20 1 23 11 1 24 6 1 
		25 7 1 12 13 0 13 2 0 3 14 
		0 14 15 0 15 12 0 16 17 1 17 
		8 1 9 18 1 18 19 1 19 16 1 
		16 28 1 17 29 1 18 26 1 19 27 
		1 13 17 1 12 16 1 15 19 1 14 
		18 1 12 17 1 2 17 1 18 3 1 
		18 15 1 16 15 1 18 21 1 19 26 
		1 28 19 1 29 16 1 25 17 1 21 
		20 0 20 22 0 22 23 0 23 24 0 
		24 25 0 21 26 0 26 27 0 27 28 
		0 28 29 0 29 25 0;
	setAttr -s 40 ".fc[0:39]" -type "polyFaces" 
		f 3 -20 22 -6 
		mu 0 3 0 1 2 
		f 3 -23 0 18 
		mu 0 3 2 1 3 
		f 3 1 23 -19 
		mu 0 3 3 4 2 
		f 3 -24 17 -7 
		mu 0 3 2 4 5 
		f 3 21 24 2 
		mu 0 3 6 7 8 
		f 3 -25 -8 -11 
		mu 0 3 8 7 9 
		f 3 -9 25 20 
		mu 0 3 10 7 11 
		f 3 -26 -22 3 
		mu 0 3 11 7 6 
		f 3 19 26 4 
		mu 0 3 1 0 11 
		f 3 -27 -10 -21 
		mu 0 3 11 0 10 
		f 3 7 27 -15 
		mu 0 3 9 7 12 
		f 3 -28 15 -61 
		mu 0 3 12 7 13 
		f 3 8 28 -16 
		mu 0 3 7 10 13 
		f 3 -29 16 -62 
		mu 0 3 13 10 14 
		f 3 11 29 9 
		mu 0 3 0 15 10 
		f 3 -30 -63 -17 
		mu 0 3 10 15 14 
		f 3 12 30 5 
		mu 0 3 2 16 0 
		f 3 -31 -64 -12 
		mu 0 3 0 16 15 
		f 3 13 31 6 
		mu 0 3 5 17 2 
		f 3 -32 -65 -13 
		mu 0 3 2 17 16 
		f 3 37 -51 47 
		mu 0 3 18 19 20 
		f 3 -47 -33 50 
		mu 0 3 19 21 20 
		f 3 46 -52 -34 
		mu 0 3 21 19 22 
		f 3 38 -18 51 
		mu 0 3 19 23 22 
		f 3 -35 -53 -50 
		mu 0 3 24 8 25 
		f 3 10 39 52 
		mu 0 3 8 9 25 
		f 3 -49 -54 40 
		mu 0 3 26 27 25 
		f 3 -36 49 53 
		mu 0 3 27 24 25 
		f 3 -37 -55 -48 
		mu 0 3 20 27 18 
		f 3 48 41 54 
		mu 0 3 27 26 18 
		f 3 14 -56 -40 
		mu 0 3 9 12 25 
		f 3 65 -45 55 
		mu 0 3 12 28 25 
		f 3 44 -57 -41 
		mu 0 3 25 28 26 
		f 3 66 -46 56 
		mu 0 3 28 29 26 
		f 3 -42 -58 -43 
		mu 0 3 18 26 30 
		f 3 45 67 57 
		mu 0 3 26 29 30 
		f 3 -38 -59 -44 
		mu 0 3 19 18 31 
		f 3 42 68 58 
		mu 0 3 18 30 31 
		f 3 -39 -60 -14 
		mu 0 3 23 19 32 
		f 3 43 69 59 
		mu 0 3 19 31 32 ;
createNode transform -n "chest" -p "itguy";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode mesh -n "chestShape" -p "|itguy|chest";
	setAttr -k off ".v";
	setAttr -s 6 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
createNode mesh -n "chestShapeOrig" -p "|itguy|chest";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 75 ".uvst[0].uvsp[0:74]" -type "float2" 0.32788196 
		0.9176259 0.32467026 0.93224984 0.29380733 0.90897858 0.51345885 0.78140545 
		0.57718915 0.82985008 0.51406544 0.83982813 0.3527928 0.8232466 0.29431409 
		0.82250571 0.35647893 0.65715653 0.29431465 0.65620154 0.40874153 0.78119224 
		0.4102287 0.67093951 0.51448458 0.89497483 0.57461691 0.92496783 0.51285893 
		0.93608022 0.35630938 0.85957193 0.40723059 0.81455946 0.39937299 0.87682146 
		0.35545126 0.89727294 0.29431367 0.88207299 0.57455516 0.94612205 0.53359836 
		0.95628506 0.40063977 0.92273325 0.52112412 0.98207057 0.48311287 0.97004688 
		0.44519615 0.78318334 0.44949082 0.67356366 0.51126289 0.65693069 0.34417164 
		0.95004332 0.40127361 0.9506672 0.29416928 0.92341518 0.33055323 0.94960439 
		0.53293914 0.96819055 0.53868514 0.98566324 0.55441451 0.95520866 0.5743714 
		0.95132142 0.4865303 0.92748034 0.47560415 0.86461675 0.47330004 0.81545413 
		0.57684404 0.66485906 0.075170599 0.78140491 0.074564233 0.83982754 0.0083310679 
		0.82985008 0.23583579 0.82324618 0.2321506 0.65715575 0.17988741 0.78119129 
		0.1784005 0.67093843 0.074145637 0.89497423 0.078155689 0.93641871 0.0085199196 
		0.92462885 0.23231891 0.85845751 0.18139796 0.81455857 0.18925585 0.8768205 
		0.2331765 0.89615834 0.26123857 0.9170894 0.0095382258 0.94816113 0.055713542 
		0.95965165 0.18798782 0.92273277 0.11489124 0.97693545 0.067601845 0.99028486 
		0.14343293 0.78318232 0.1391381 0.67356253 0.077366047 0.65692997 0.25747827 
		0.95150149 0.18735209 0.95162749 0.27033076 0.92961931 0.26525229 0.94937712 
		0.056459032 0.97311318 0.048995174 0.99484938 0.032176461 0.958435 0.009745691 
		0.95404005 0.10669056 0.9279446 0.11566281 0.86461604 0.11804004 0.81545329 
		0.0086750761 0.67123348;
	setAttr ".cuvs" -type "string" "map1";
	setAttr -s 64 ".vt[0:63]"  0.3449676 3.4063561 0.40243134 -2.6390576e-009 
		3.4063563 0.5038752 0.6257813 3.4533632 0.16801398 0.64293253 3.4533632 -0.11077638 
		0.37359446 3.3741422 -0.41632113 9.7575832e-009 3.4027131 -0.51118648 -0.34496757 
		3.4063559 0.40243128 -0.62578136 3.4533634 0.16801398 -0.64293253 3.4533634 
		-0.11077639 -0.37359446 3.3741426 -0.4163211 -9.0678998e-007 4.6971493 0.2053697 
		0.17250711 4.6971493 0.14263101 0.15150368 4.6240931 0.1276301 5.4386322e-009 
		4.6193485 0.15230054 -4.4293098e-009 4.8119774 -0.2540583 0.20605254 4.6442666 
		0.011413081 0.22546488 4.7565951 -0.13415813 0.10199229 4.7900305 -0.22288014 
		0.37359446 4.2115607 -0.47114342 4.678101e-009 4.1563568 -0.54876894 5.9712129e-009 
		4.1563563 0.45712501 0.34496757 4.1563559 0.35568109 0.37359449 4.7216401 
		-0.35994768 -1.5669006e-008 4.6563568 -0.44570056 4.5719228e-010 4.5888281 
		0.29473189 0.34496763 4.5888281 0.2206253 -1.7252346e-009 4.8316731 -0.29240012 
		0.20910645 4.8187757 -0.21152744 0.64386326 3.9290118 0.16801393 0.37359446 
		3.9063566 -0.45390365 0.37359449 4.502574 -0.41095248 0.3449676 4.4063563 
		0.29334754 0.25790626 4.7578411 -0.012089786 -0.15150368 4.6240931 0.12763013 
		-0.20605254 4.6442666 0.011413077 -0.22546488 4.7565951 -0.13415813 -0.10199228 
		4.7900295 -0.2228801 -0.37359446 4.2115607 -0.47114339 -0.34496757 4.1563563 
		0.35568103 -0.37359446 4.7216406 -0.35994753 -0.3449676 4.5888276 0.2206253 
		-0.17250709 4.6971493 0.14263101 -0.20910646 4.8187757 -0.21152742 -0.6438632 
		3.9290118 0.16801392 -0.37359446 3.9063566 -0.45390365 -0.37359446 4.5025744 
		-0.41095215 -0.3449676 4.4063563 0.29334754 -0.25790626 4.7578411 -0.01208982 
		0.62872201 4.1037011 0.16801396 0.62086862 4.4314489 0.21471007 0.54834747 
		4.6925397 0.16801398 0.54834747 4.7293048 -0.091217354 0.54700226 4.6221967 
		-0.34144282 0.61913133 4.3434072 -0.4169966 0.62677056 4.0875735 -0.37645829 
		0.73322946 3.9290116 -0.10467959 -0.62086862 4.4314489 0.21471004 -0.62872195 
		4.1037011 0.16801396 -0.54834747 4.6925397 0.168014 -0.54834747 4.7293043 
		-0.091217369 -0.61913133 4.3434072 -0.41699651 -0.54700226 4.6221967 -0.34144273 
		-0.62677056 4.0875735 -0.37645826 -0.73322946 3.9290116 -0.10467959;
	setAttr -s 162 ".ed[0:161]"  1 0 0 0 2 
		0 2 3 0 3 4 0 4 5 0 1 
		6 0 6 7 0 7 8 0 8 9 0 
		9 5 0 11 10 0 11 12 0 12 10 
		0 12 13 0 15 12 0 16 15 0 14 
		17 0 17 16 0 18 19 1 20 21 1 
		21 48 1 51 22 1 22 23 1 24 25 
		1 25 50 1 18 30 1 20 24 1 21 
		31 1 24 10 1 50 11 1 26 23 1 
		51 27 1 25 11 1 27 26 1 11 32 
		1 27 22 1 1 20 1 0 21 1 2 
		28 1 3 55 1 4 29 1 28 48 1 
		28 55 1 29 18 1 55 29 1 5 19 
		1 19 23 1 30 22 1 31 25 1 49 
		31 1 32 27 1 32 50 1 32 51 1 
		10 13 1 26 14 1 32 15 1 27 16 
		1 17 26 1 17 27 1 52 30 1 53 
		18 1 54 29 1 31 20 1 31 24 1 
		30 23 1 30 19 1 29 19 1 29 5 
		1 28 0 1 21 28 1 52 22 1 20 
		0 1 49 21 1 11 24 1 26 22 1 
		28 3 1 29 3 1 25 49 1 15 11 
		1 16 32 1 53 30 1 18 54 1 33 
		13 0 34 33 0 35 34 0 14 36 0 
		36 35 0 37 19 1 20 38 1 38 57 
		1 59 39 1 39 23 1 24 40 1 40 
		58 1 37 45 1 38 46 1 58 41 1 
		59 42 1 41 10 0 40 41 1 42 26 
		1 41 47 1 42 39 1 6 38 1 7 
		43 1 8 63 1 9 44 1 43 57 1 
		43 63 1 44 37 1 63 44 1 45 39 
		1 46 40 1 56 46 1 47 42 1 47 
		58 1 47 59 1 41 33 1 47 34 1 
		42 35 1 36 26 1 36 42 1 61 45 
		1 60 37 1 62 44 1 46 20 1 46 
		24 1 45 23 1 45 19 1 44 19 1 
		44 5 1 43 6 1 38 43 1 61 39 
		1 20 6 1 56 38 1 41 24 1 26 
		39 1 43 8 1 44 8 1 40 56 1 
		33 10 1 34 41 1 35 47 1 60 45 
		1 37 62 1 48 49 0 49 50 0 50 
		51 0 52 53 0 53 54 0 54 55 0 
		51 52 0 55 48 0 57 56 0 56 58 
		0 58 59 0 61 60 0 60 62 0 62 
		63 0 59 61 0 63 57 0;
	setAttr -s 96 ".fc[0:95]" -type "polyFaces" 
		f 3 11 12 -11 
		mu 0 3 0 1 2 
		f 3 66 -19 -44 
		mu 0 3 3 4 5 
		f 3 -20 71 37 
		mu 0 3 6 7 8 
		f 3 -72 -37 0 
		mu 0 3 8 7 9 
		f 3 68 1 38 
		mu 0 3 10 8 11 
		f 3 64 -23 -48 
		mu 0 3 12 13 14 
		f 3 62 19 27 
		mu 0 3 15 7 6 
		f 3 146 72 20 
		mu 0 3 16 17 6 
		f 3 -73 49 -28 
		mu 0 3 6 17 15 
		f 3 32 73 23 
		mu 0 3 18 0 19 
		f 3 -74 10 -29 
		mu 0 3 19 0 2 
		f 3 -31 74 22 
		mu 0 3 13 20 14 
		f 3 -75 -34 35 
		mu 0 3 14 20 21 
		f 3 -33 24 29 
		mu 0 3 0 18 22 
		f 3 -51 52 31 
		mu 0 3 21 23 24 
		f 3 -36 -32 21 
		mu 0 3 14 21 24 
		f 3 -43 75 39 
		mu 0 3 25 10 26 
		f 3 -76 -39 2 
		mu 0 3 26 10 11 
		f 3 40 76 3 
		mu 0 3 27 3 26 
		f 3 -77 -45 -40 
		mu 0 3 26 3 25 
		f 3 -25 77 147 
		mu 0 3 22 18 17 
		f 3 -78 -49 -50 
		mu 0 3 17 18 15 
		f 3 -35 -30 -52 
		mu 0 3 28 0 22 
		f 3 -53 51 148 
		mu 0 3 29 28 22 
		f 3 -13 13 -54 
		mu 0 3 2 1 30 
		f 3 55 78 34 
		mu 0 3 28 31 0 
		f 3 -79 14 -12 
		mu 0 3 0 31 1 
		f 3 56 79 50 
		mu 0 3 21 32 23 
		f 3 -80 15 -56 
		mu 0 3 23 32 33 
		f 3 57 54 16 
		mu 0 3 34 20 35 
		f 3 33 -58 58 
		mu 0 3 21 20 34 
		f 3 -59 17 -57 
		mu 0 3 21 34 32 
		f 3 149 80 -60 
		mu 0 3 36 37 12 
		f 3 -81 60 25 
		mu 0 3 12 37 5 
		f 3 43 81 61 
		mu 0 3 3 5 38 
		f 3 -82 -61 150 
		mu 0 3 38 5 37 
		f 3 151 44 -62 
		mu 0 3 38 25 3 
		f 3 152 70 -22 
		mu 0 3 24 36 14 
		f 3 59 47 -71 
		mu 0 3 36 12 14 
		f 3 153 -42 42 
		mu 0 3 25 16 10 
		f 3 -27 -63 63 
		mu 0 3 19 7 15 
		f 3 -64 48 -24 
		mu 0 3 19 15 18 
		f 3 65 46 -65 
		mu 0 3 12 4 13 
		f 3 -26 18 -66 
		mu 0 3 12 5 4 
		f 3 45 -67 67 
		mu 0 3 39 4 3 
		f 3 -68 -41 4 
		mu 0 3 39 3 27 
		f 3 41 -21 69 
		mu 0 3 10 16 6 
		f 3 -70 -38 -69 
		mu 0 3 10 6 8 
		f 3 109 87 -130 
		mu 0 3 40 41 42 
		f 3 -104 -135 88 
		mu 0 3 43 44 7 
		f 3 -6 36 134 
		mu 0 3 44 9 7 
		f 3 -105 -7 -132 
		mu 0 3 45 46 44 
		f 3 111 91 -128 
		mu 0 3 47 48 49 
		f 3 -96 -89 -126 
		mu 0 3 50 43 7 
		f 3 -90 -136 -155 
		mu 0 3 51 43 52 
		f 3 95 -114 135 
		mu 0 3 43 50 52 
		f 3 -93 -137 -100 
		mu 0 3 53 19 54 
		f 3 28 -99 136 
		mu 0 3 19 2 54 
		f 3 -92 -138 30 
		mu 0 3 49 48 55 
		f 3 -103 100 137 
		mu 0 3 48 56 55 
		f 3 -97 -94 99 
		mu 0 3 54 57 53 
		f 3 -98 -117 114 
		mu 0 3 56 58 59 
		f 3 -91 97 102 
		mu 0 3 48 58 56 
		f 3 -106 -139 108 
		mu 0 3 60 61 45 
		f 3 -8 104 138 
		mu 0 3 61 46 45 
		f 3 -9 -140 -107 
		mu 0 3 62 61 40 
		f 3 105 110 139 
		mu 0 3 61 60 40 
		f 3 -156 -141 93 
		mu 0 3 57 52 53 
		f 3 113 112 140 
		mu 0 3 52 50 53 
		f 3 115 96 101 
		mu 0 3 63 57 54 
		f 3 -157 -116 116 
		mu 0 3 64 57 63 
		f 3 98 -142 -118 
		mu 0 3 54 2 65 
		f 3 53 -83 141 
		mu 0 3 2 30 65 
		f 3 -102 -143 -119 
		mu 0 3 63 54 66 
		f 3 117 -84 142 
		mu 0 3 54 65 66 
		f 3 -115 -144 -120 
		mu 0 3 56 59 67 
		f 3 118 -85 143 
		mu 0 3 59 68 67 
		f 3 -86 -55 -121 
		mu 0 3 69 70 55 
		f 3 -122 120 -101 
		mu 0 3 56 69 55 
		f 3 119 -87 121 
		mu 0 3 56 67 69 
		f 3 122 -145 -158 
		mu 0 3 71 47 72 
		f 3 -95 -124 144 
		mu 0 3 47 41 72 
		f 3 -125 -146 -110 
		mu 0 3 40 73 41 
		f 3 -159 123 145 
		mu 0 3 73 72 41 
		f 3 124 -111 -160 
		mu 0 3 73 40 60 
		f 3 90 -134 -161 
		mu 0 3 58 48 71 
		f 3 133 -112 -123 
		mu 0 3 71 48 47 
		f 3 -109 107 -162 
		mu 0 3 60 45 51 
		f 3 -127 125 26 
		mu 0 3 19 50 7 
		f 3 92 -113 126 
		mu 0 3 19 53 50 
		f 3 127 -47 -129 
		mu 0 3 47 49 42 
		f 3 128 -88 94 
		mu 0 3 47 42 41 
		f 3 -131 129 -46 
		mu 0 3 74 40 42 
		f 3 -10 106 130 
		mu 0 3 74 62 40 
		f 3 -133 89 -108 
		mu 0 3 45 43 51 
		f 3 131 103 132 
		mu 0 3 45 44 43 ;
createNode transform -n "leg_left" -p "itguy";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode mesh -n "leg_leftShape" -p "leg_left";
	setAttr -k off ".v";
	setAttr -s 6 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
createNode mesh -n "leg_leftShapeOrig" -p "leg_left";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 49 ".uvst[0].uvsp[0:48]" -type "float2" 0.48281479 
		0.31297424 0.54376632 0.31907016 0.49654028 0.36161262 0.53896606 0.36201689 
		0.49618265 0.44066915 0.53686059 0.44308338 0.33312178 0.31822744 0.37371445 
		0.31800795 0.33343297 0.44297868 0.37418094 0.44275945 0.42112383 0.44248292 
		0.41794416 0.31799075 0.46902648 0.10559116 0.47801805 0.056961589 0.49713227 
		0.094104908 0.49705753 0.061972272 0.53662682 0.09309715 0.53014392 0.05812376 
		0.28616843 0.05812376 0.34200808 0.071656145 0.29265118 0.09309715 0.3457559 
		0.10479957 0.37218437 0.11067827 0.37206596 0.075670443 0.42616183 0.105175 
		0.42215294 0.059003673 0.49950233 0.17865042 0.47345427 0.17831047 0.53884792 
		0.17860916 0.3535856 0.16864458 0.29487234 0.17860916 0.37327018 0.16848178 
		0.41209182 0.16839598 0.50593632 0.23464939 0.46714589 0.22743794 0.5472753 
		0.23458812 0.35566443 0.23403832 0.30329981 0.23458812 0.37376416 0.23383605 
		0.40810612 0.2269924 0.55923539 0.29719776 0.31525987 0.29719776 0.34749568 
		0.039963212 0.37816378 0.044391904 0.42233327 0.018126369 0.48589063 0.0083265584 
		0.50418347 0.012665125 0.53337562 0.01109363 0.28940001 0.01109363;
	setAttr ".cuvs" -type "string" "map1";
	setAttr -s 2 ".pt[8:9]" -type "float3"  3.744427e-009 -0.048641134 
		-0.096982665 -0.034729369 0 -0.059931483;
	setAttr -s 43 ".vt[0:42]"  0.41063502 2.0541155 -0.31585437 
		0.30584398 2.0890465 0.37576428 0.58668399 2.0890465 0.092832521 0.38252637 
		2.3571751 -0.39542896 0.30584395 2.8692839 -0.44553152 0.30584401 2.8692839 
		0.37576434 0.58668399 2.8692837 0.063360453 0.42984068 0.14825286 -0.41970024 
		0.22533925 0.1736405 -0.49425387 0.067961484 0.16452265 -0.20630884 0.18915248 
		0.34787893 0.13382645 0.34175494 0.37674281 0.16597252 0.55257434 0.21313268 
		0.051752027 0.59018123 0.7580002 -0.35244927 0.30970582 0.68384266 -0.44163555 
		0.082948469 0.67772007 -0.16846818 0.15697274 0.753281 0.15030874 0.30970585 
		0.79103559 0.15261264 0.62918341 0.7580002 0.042885236 0.49815425 1.2124926 
		-0.30731541 0.28212133 1.2124926 -0.43317303 0.067840569 1.2124926 -0.16000558 
		0.12125734 1.1532546 0.30062243 0.30970582 1.1532546 0.26985472 0.53715658 
		1.1532546 0.1162277 0.51996946 1.5201927 -0.25653988 0.22508839 1.5626667 
		-0.38239744 0.030085921 1.5626668 -0.10923008 0.083502695 1.5626667 0.4112294 
		0.30970582 1.562667 0.38116133 0.55897176 1.5201929 0.16982415 0.1600679 
		0.54581934 0.11815094 0.30970582 0.57218224 0.16918516 0.5345459 0.46864125 
		0.045706179 0.49554366 0.45312649 -0.37360573 0.30970582 0.48233801 -0.53190327 
		0.10665112 0.45890182 -0.20796032 -7.5640063e-009 2.0890462 -0.41279519 1.5513573e-008 
		2.3571754 -0.49236983 -2.1613872e-008 2.8692839 -0.5424723 -2.1460908e-010 
		2.8692837 0.47270522 -2.601133e-008 2.089046 0.47270522 2.6576574e-009 1.9545817 
		-0.020947207;
	setAttr -s 114 ".ed[0:113]"  0 37 1 41 1 
		1 1 2 1 2 0 1 3 38 1 4 
		39 0 40 5 0 5 6 0 6 4 0 
		0 3 1 3 4 1 1 5 1 2 6 
		1 7 8 0 8 9 0 9 10 0 10 
		11 0 11 12 0 12 7 0 13 14 1 
		14 15 1 15 16 1 16 17 1 17 18 
		1 18 13 1 19 20 1 20 21 1 21 
		22 1 22 23 1 23 24 1 24 19 1 
		25 26 1 26 27 1 27 28 1 28 29 
		1 29 30 1 30 25 1 7 34 1 8 
		35 0 9 36 1 10 31 1 11 32 1 
		12 33 1 13 19 1 14 20 1 15 21 
		1 16 22 0 17 23 1 18 24 1 19 
		25 1 20 26 1 21 27 1 22 28 1 
		23 29 1 24 30 1 25 0 1 26 37 
		0 27 42 1 28 41 0 29 1 1 30 
		2 1 31 16 1 32 17 1 31 32 1 
		33 18 1 32 33 1 34 13 1 33 34 
		1 35 14 0 34 35 1 36 15 1 35 
		36 1 36 31 1 3 2 1 3 6 1 
		26 42 1 37 3 1 38 4 1 1 40 
		1 5 2 1 34 14 1 14 36 1 31 
		15 1 16 32 1 17 33 1 13 33 1 
		20 13 1 15 20 1 21 16 1 16 23 
		1 24 17 1 19 18 1 25 20 1 21 
		26 1 27 22 1 22 29 1 23 30 1 
		24 25 1 0 26 1 42 28 1 28 1 
		1 1 30 1 25 2 1 11 31 1 33 
		11 1 34 12 1 34 8 1 8 36 1 
		10 36 1 37 38 0 38 39 0 41 40 
		0 37 42 0 42 41 0;
	setAttr -s 71 ".fc[0:70]" -type "polyFaces" 
		f 3 0 76 -10 
		mu 0 3 0 1 2 
		f 3 -77 109 -5 
		mu 0 3 2 1 3 
		f 3 4 77 -11 
		mu 0 3 2 3 4 
		f 3 -78 110 -6 
		mu 0 3 4 3 5 
		f 3 1 78 -112 
		mu 0 3 6 7 8 
		f 3 11 -7 -79 
		mu 0 3 7 9 8 
		f 3 -8 79 12 
		mu 0 3 10 9 11 
		f 3 -12 2 -80 
		mu 0 3 9 7 11 
		f 3 73 3 9 
		mu 0 3 2 11 0 
		f 3 -67 80 -20 
		mu 0 3 12 13 14 
		f 3 -81 69 68 
		mu 0 3 14 13 15 
		f 3 -21 81 70 
		mu 0 3 16 14 17 
		f 3 -82 -69 71 
		mu 0 3 17 14 15 
		f 3 72 82 -71 
		mu 0 3 18 19 20 
		f 3 -22 -83 61 
		mu 0 3 21 20 19 
		f 3 -23 83 62 
		mu 0 3 22 21 23 
		f 3 -84 -62 63 
		mu 0 3 23 21 19 
		f 3 -24 84 64 
		mu 0 3 24 22 25 
		f 3 -63 65 -85 
		mu 0 3 22 23 25 
		f 3 66 85 67 
		mu 0 3 13 12 25 
		f 3 -86 -25 -65 
		mu 0 3 25 12 24 
		f 3 44 86 19 
		mu 0 3 14 26 12 
		f 3 -87 -26 -44 
		mu 0 3 12 26 27 
		f 3 20 87 -45 
		mu 0 3 14 16 26 
		f 3 -88 45 -27 
		mu 0 3 26 16 28 
		f 3 -28 88 46 
		mu 0 3 29 30 21 
		f 3 -46 21 -89 
		mu 0 3 30 20 21 
		f 3 -47 89 -29 
		mu 0 3 29 21 31 
		f 3 22 47 -90 
		mu 0 3 21 22 31 
		f 3 48 90 23 
		mu 0 3 24 32 22 
		f 3 -48 -91 -30 
		mu 0 3 31 22 32 
		f 3 43 91 24 
		mu 0 3 12 27 24 
		f 3 -31 -49 -92 
		mu 0 3 27 32 24 
		f 3 -32 92 50 
		mu 0 3 33 34 26 
		f 3 -93 -50 25 
		mu 0 3 26 34 27 
		f 3 26 93 -51 
		mu 0 3 26 28 33 
		f 3 -94 51 -33 
		mu 0 3 33 28 35 
		f 3 -34 94 52 
		mu 0 3 36 37 29 
		f 3 -52 27 -95 
		mu 0 3 37 30 29 
		f 3 -53 95 -35 
		mu 0 3 36 29 38 
		f 3 -96 28 53 
		mu 0 3 38 29 31 
		f 3 -54 96 -36 
		mu 0 3 38 31 39 
		f 3 29 54 -97 
		mu 0 3 31 32 39 
		f 3 -55 97 -37 
		mu 0 3 39 32 34 
		f 3 30 49 -98 
		mu 0 3 32 27 34 
		f 3 -1 98 56 
		mu 0 3 1 0 33 
		f 3 -99 -56 31 
		mu 0 3 33 0 34 
		f 3 -57 75 -113 
		mu 0 3 1 33 40 
		f 3 32 57 -76 
		mu 0 3 33 35 40 
		f 3 -114 99 58 
		mu 0 3 6 41 36 
		f 3 -58 33 -100 
		mu 0 3 41 37 36 
		f 3 -59 100 -2 
		mu 0 3 6 36 7 
		f 3 -101 34 59 
		mu 0 3 7 36 38 
		f 3 -3 101 60 
		mu 0 3 11 7 39 
		f 3 -60 35 -102 
		mu 0 3 7 38 39 
		f 3 36 102 -61 
		mu 0 3 39 34 11 
		f 3 -4 -103 55 
		mu 0 3 0 11 34 
		f 3 16 103 -41 
		mu 0 3 42 43 19 
		f 3 -104 41 -64 
		mu 0 3 19 43 23 
		f 3 42 104 17 
		mu 0 3 44 25 43 
		f 3 -42 -105 -66 
		mu 0 3 23 43 25 
		f 3 37 105 18 
		mu 0 3 45 13 44 
		f 3 -106 -68 -43 
		mu 0 3 44 13 25 
		f 3 -70 106 38 
		mu 0 3 15 13 46 
		f 3 -107 -38 13 
		mu 0 3 46 13 45 
		f 3 -39 107 -72 
		mu 0 3 15 46 17 
		f 3 -108 14 39 
		mu 0 3 17 46 47 
		f 3 15 108 -40 
		mu 0 3 48 42 18 
		f 3 -73 -109 40 
		mu 0 3 19 18 42 
		f 3 74 -13 -74 
		mu 0 3 2 10 11 
		f 3 10 -9 -75 
		mu 0 3 2 4 10 ;
createNode transform -n "leg_right" -p "itguy";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode mesh -n "leg_rightShape" -p "leg_right";
	setAttr -k off ".v";
	setAttr -s 6 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
createNode mesh -n "leg_rightShapeOrig" -p "leg_right";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 49 ".uvst[0].uvsp[0:48]" -type "float2" 0.079411425 
		0.31387621 0.065679893 0.36233407 0.018981064 0.31946149 0.022851769 0.36233407 
		0.065794751 0.4442178 0.0248565 0.44421753 0.23011832 0.31946149 0.23011832 
		0.44421753 0.18943635 0.31946149 0.18943635 0.44421753 0.14107011 0.44421753 
		0.1446563 0.31946149 0.094375357 0.10663334 0.066155404 0.09477599 0.085673586 
		0.057885565 0.058120333 0.062556505 0.028034927 0.093797095 0.032581761 0.058809265 
		0.27655682 0.058809265 0.27200994 0.093797095 0.21929425 0.072706699 0.21035036 
		0.10587899 0.18962094 0.11191586 0.18953879 0.076922238 0.1370258 0.10663334 
		0.1379547 0.060366344 0.063463226 0.17930481 0.091781139 0.17930481 0.026270088 
		0.17930481 0.20582686 0.16983306 0.27024513 0.17930481 0.18923183 0.16983306 
		0.14905985 0.16983306 0.056833796 0.23529619 0.09454377 0.22850466 0.015553006 
		0.23529619 0.20716794 0.23529619 0.25952807 0.23529619 0.18906528 0.23529619 
		0.15560175 0.22850466 0.0039090258 0.29796124 0.24788409 0.29796124 0.21343456 
		0.041056801 0.18333212 0.045672294 0.1411093 0.019511543 0.077935122 0.0091376137 
		0.059196614 0.013197232 0.029269053 0.011739409 0.27324402 0.011739409;
	setAttr ".cuvs" -type "string" "map1";
	setAttr -s 43 ".vt[0:42]"  -4.2747588e-009 2.0890462 -0.41279519 
		-1.8223403e-008 2.0890465 0.47270525 3.2473546e-009 2.3571751 -0.49236977 
		-8.9464818e-009 2.8692837 -0.54247224 -9.8376001e-009 2.8692837 0.47270522 
		1.7260304e-009 1.9545817 -0.020947196 -0.41063499 2.0541158 -0.31585437 -0.30584398 
		2.089046 0.37576425 -0.58668399 2.0890462 0.092832506 -0.38252637 2.3571751 
		-0.39542896 -0.30584395 2.8692839 -0.44553152 -0.30584404 2.8692837 0.37576434 
		-0.58668399 2.8692837 0.063360468 -0.43009734 0.14825283 -0.42004305 -0.22559597 
		0.17364049 -0.49459672 -0.068218149 0.16452265 -0.20665164 -0.18940914 0.34787893 
		0.13348365 -0.34201163 0.37674284 0.16562971 -0.55283105 0.21313271 0.051409174 
		-0.59018123 0.7580002 -0.35244927 -0.30970582 0.68384272 -0.44163552 -0.10938124 
		0.67772013 -0.16846821 -0.19850996 0.753281 0.15030874 -0.30970582 0.79103559 
		0.15261264 -0.62918353 0.7580002 0.042885229 -0.52081096 1.2124928 -0.30731541 
		-0.2821213 1.2124926 -0.43317297 -0.10182557 1.2124926 -0.16000558 -0.15524235 
		1.1532546 0.30062243 -0.30970582 1.1532546 0.26985472 -0.5598132 1.1532546 
		0.11622769 -0.50864106 1.5201929 -0.25653973 -0.2250884 1.562667 -0.38239744 
		-0.030085918 1.5626668 -0.10923007 -0.083502695 1.5626668 0.41122946 -0.30970582 
		1.5626667 0.3811613 -0.54764348 1.5201927 0.16982415 -0.1600679 0.54581934 
		0.11815095 -0.30970582 0.5721823 0.16918518 -0.61006814 0.46864125 0.045706183 
		-0.49554366 0.45312652 -0.37360573 -0.22 0.48233807 -0.45999998 -0.10665111 
		0.45890182 -0.20796032;
	setAttr -s 114 ".ed[0:113]"  0 2 0 1 4 
		0 2 3 0 0 5 0 5 1 0 6 
		0 1 1 7 1 7 8 1 8 6 1 
		9 2 1 10 3 0 4 11 0 11 12 
		0 12 10 0 6 9 1 9 10 1 7 
		11 1 8 12 1 13 14 0 14 15 0 
		15 16 0 16 17 0 17 18 0 18 13 
		0 19 20 1 20 21 1 21 22 1 22 
		23 1 23 24 1 24 19 1 25 26 1 
		26 27 1 27 28 1 28 29 1 29 30 
		1 30 25 1 31 32 1 32 33 1 33 
		34 1 34 35 1 35 36 1 36 31 1 
		13 40 1 14 41 0 15 42 1 16 37 
		1 17 38 1 18 39 1 19 25 1 20 
		26 1 21 27 1 22 28 0 23 29 1 
		24 30 1 25 31 1 26 32 1 27 33 
		1 28 34 1 29 35 1 30 36 1 31 
		6 1 32 0 0 33 5 1 34 1 0 
		35 7 1 36 8 1 37 22 1 38 23 
		1 37 38 1 39 24 1 38 39 1 40 
		19 1 39 40 1 41 20 0 40 41 1 
		42 21 1 41 42 1 42 37 1 9 8 
		1 9 12 1 32 5 1 0 9 1 2 
		10 1 7 4 1 11 8 1 40 20 1 
		20 42 1 37 21 1 22 38 1 23 39 
		1 19 39 1 26 19 1 21 26 1 27 
		22 1 22 29 1 30 23 1 25 24 1 
		31 26 1 27 32 1 33 28 1 28 35 
		1 29 36 1 30 31 1 6 32 1 5 
		34 1 34 7 1 7 36 1 31 8 1 
		17 37 1 39 17 1 40 18 1 40 14 
		1 14 42 1 16 42 1;
	setAttr -s 71 ".fc[0:70]" -type "polyFaces" 
		f 3 14 -82 -6 
		mu 0 3 0 1 2 
		f 3 9 -1 81 
		mu 0 3 1 3 2 
		f 3 15 -83 -10 
		mu 0 3 1 4 3 
		f 3 10 -3 82 
		mu 0 3 4 5 3 
		f 3 1 -84 -7 
		mu 0 3 6 7 8 
		f 3 83 11 -17 
		mu 0 3 8 7 9 
		f 3 -18 -85 12 
		mu 0 3 10 11 9 
		f 3 84 -8 16 
		mu 0 3 9 11 8 
		f 3 -15 -9 -79 
		mu 0 3 1 0 11 
		f 3 24 -86 71 
		mu 0 3 12 13 14 
		f 3 -74 -75 85 
		mu 0 3 13 15 14 
		f 3 -76 -87 25 
		mu 0 3 16 17 13 
		f 3 -77 73 86 
		mu 0 3 17 15 13 
		f 3 75 -88 -78 
		mu 0 3 18 19 20 
		f 3 -67 87 26 
		mu 0 3 21 20 19 
		f 3 -68 -89 27 
		mu 0 3 22 23 21 
		f 3 -69 66 88 
		mu 0 3 23 20 21 
		f 3 -70 -90 28 
		mu 0 3 24 25 22 
		f 3 89 -71 67 
		mu 0 3 22 25 23 
		f 3 -73 -91 -72 
		mu 0 3 14 25 12 
		f 3 69 29 90 
		mu 0 3 25 24 12 
		f 3 -25 -92 -50 
		mu 0 3 13 12 26 
		f 3 48 30 91 
		mu 0 3 12 27 26 
		f 3 49 -93 -26 
		mu 0 3 13 26 16 
		f 3 31 -51 92 
		mu 0 3 26 28 16 
		f 3 -52 -94 32 
		mu 0 3 29 21 30 
		f 3 93 -27 50 
		mu 0 3 30 21 19 
		f 3 33 -95 51 
		mu 0 3 29 31 21 
		f 3 94 -53 -28 
		mu 0 3 21 31 22 
		f 3 -29 -96 -54 
		mu 0 3 24 22 32 
		f 3 34 95 52 
		mu 0 3 31 32 22 
		f 3 -30 -97 -49 
		mu 0 3 12 24 27 
		f 3 96 53 35 
		mu 0 3 27 24 32 
		f 3 -56 -98 36 
		mu 0 3 33 26 34 
		f 3 -31 54 97 
		mu 0 3 26 27 34 
		f 3 55 -99 -32 
		mu 0 3 26 33 28 
		f 3 37 -57 98 
		mu 0 3 33 35 28 
		f 3 -58 -100 38 
		mu 0 3 36 29 37 
		f 3 99 -33 56 
		mu 0 3 37 29 30 
		f 3 39 -101 57 
		mu 0 3 36 38 29 
		f 3 -59 -34 100 
		mu 0 3 38 31 29 
		f 3 40 -102 58 
		mu 0 3 38 39 31 
		f 3 101 -60 -35 
		mu 0 3 31 39 32 
		f 3 41 -103 59 
		mu 0 3 39 34 32 
		f 3 102 -55 -36 
		mu 0 3 32 34 27 
		f 3 -62 -104 5 
		mu 0 3 2 33 0 
		f 3 -37 60 103 
		mu 0 3 33 34 0 
		f 3 3 -81 61 
		mu 0 3 2 40 33 
		f 3 80 -63 -38 
		mu 0 3 33 40 35 
		f 3 -64 -105 4 
		mu 0 3 6 36 41 
		f 3 104 -39 62 
		mu 0 3 41 36 37 
		f 3 6 -106 63 
		mu 0 3 6 8 36 
		f 3 -65 -40 105 
		mu 0 3 8 38 36 
		f 3 -66 -107 7 
		mu 0 3 11 39 8 
		f 3 106 -41 64 
		mu 0 3 8 39 38 
		f 3 65 -108 -42 
		mu 0 3 39 11 34 
		f 3 -61 107 8 
		mu 0 3 0 34 11 
		f 3 45 -109 -22 
		mu 0 3 42 20 43 
		f 3 68 -47 108 
		mu 0 3 20 23 43 
		f 3 -23 -110 -48 
		mu 0 3 44 43 25 
		f 3 70 109 46 
		mu 0 3 23 25 43 
		f 3 -24 -111 -43 
		mu 0 3 45 44 14 
		f 3 47 72 110 
		mu 0 3 44 25 14 
		f 3 -44 -112 74 
		mu 0 3 15 46 14 
		f 3 -19 42 111 
		mu 0 3 46 45 14 
		f 3 76 -113 43 
		mu 0 3 15 17 46 
		f 3 -45 -20 112 
		mu 0 3 17 47 46 
		f 3 44 -114 -21 
		mu 0 3 48 18 42 
		f 3 -46 113 77 
		mu 0 3 20 42 18 
		f 3 78 17 -80 
		mu 0 3 1 11 10 
		f 3 79 13 -16 
		mu 0 3 1 10 4 ;
createNode transform -n "upperarm_left" -p "itguy";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode mesh -n "upperarm_leftShape" -p "upperarm_left";
	setAttr -k off ".v";
	setAttr -s 6 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
createNode mesh -n "upperarm_leftShapeOrig" -p "upperarm_left";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 63 ".uvst[0].uvsp[0:62]" -type "float2" 0.4775272 
		0.92512566 0.4731265 0.94659936 0.4458425 0.92572474 0.44817406 0.94657212 
		0.46719044 0.96436834 0.42923197 0.9475956 0.44890735 0.96732426 0.4493176 
		0.98950011 0.46760666 0.98901737 0.44817784 0.82491606 0.46646678 0.82443303 
		0.4480707 0.84649724 0.46638554 0.84818065 0.47255722 0.86434168 0.44761679 
		0.86606514 0.42963785 0.84703714 0.47724399 0.88426918 0.44556692 0.88594878 
		0.44544646 0.9056322 0.47713852 0.9044584 0.40269041 0.92655951 0.42756787 
		0.92592406 0.41028926 0.94858325 0.4119119 0.96821445 0.4304094 0.96773803 
		0.42226774 0.98933142 0.43579191 0.98930556 0.41120535 0.84759933 0.42112809 
		0.82474691 0.43465239 0.8247211 0.40965894 0.87387848 0.42863834 0.8701086 
		0.40234861 0.89074922 0.42727017 0.88858283 0.40234944 0.90727264 0.42720839 
		0.90634614 0.46948031 0.92307884 0.46916419 0.90460283 0.46922722 0.8865298 
		0.46566591 0.86492461 0.46090874 0.84885812 0.46093154 0.82496953 0.46170935 
		0.96442461 0.4620716 0.98955375 0.4662303 0.94646943 0.97160172 0.38025552 
		0.9715035 0.42283195 0.93097681 0.37725016 0.93075806 0.42217767 0.97044992 
		0.46539271 0.92990428 0.45654163 0.97848266 0.51095116 0.92818153 0.50672138 
		0.98986101 0.54038519 0.9270826 0.54081368 0.98888999 0.57687002 0.92621905 
		0.57586366 0.99304968 0.26941919 0.99303353 0.30591881 0.93037891 0.26841262 
		0.9301511 0.3140074 0.98086357 0.3349748 0.93044263 0.3396135;
	setAttr ".cuvs" -type "string" "map1";
	setAttr -s 48 ".vt[0:47]"  1.3631362 4.5155659 -0.28995982 
		1.3066158 4.3174653 -0.37201583 1.2352744 4.1701508 -0.28995985 1.2351916 
		4.0880952 -0.091859102 1.2352744 4.1701508 0.1062417 1.3066158 4.3174653 
		0.18829772 1.3631362 4.5155659 0.10624173 1.363219 4.5976219 -0.091859058 
		1.0170718 4.5451398 -0.29889524 1.0339733 4.3364697 -0.38465244 1.0337644 
		4.139235 -0.2988953 1.0336777 4.0534778 -0.091859087 1.0337644 4.139235 0.11517706 
		1.0339733 4.3364697 0.20093426 1.0170718 4.5451398 0.11517712 1.0171584 4.6308966 
		-0.09185911 1.2746749 4.5622702 -0.091859162 1.2746112 4.499361 -0.24373639 
		1.2746112 4.499361 0.060018081 1.2312789 4.322886 0.12292774 1.1765841 4.2099447 
		0.06001813 1.1765205 4.1470356 -0.09185911 1.176584 4.2099447 -0.24373639 
		1.2312789 4.322886 -0.30664596 1.4496787 4.5310063 -0.091859117 1.4496782 
		4.481267 -0.24354702 1.4496781 4.481267 0.0063044638 1.4494686 4.3417373 
		0.056043938 1.449204 4.2524405 0.0063045314 1.4492036 4.202702 -0.09185905 
		1.4492041 4.2524405 -0.24354707 1.4494686 4.3417373 -0.29328647 0.83124316 
		4.1214681 0.14159551 0.82742095 4.3839593 0.20782219 0.81897026 4.6188402 
		0.14159565 0.81901371 4.6801019 -0.091538064 0.81820863 4.5836682 -0.32016903 
		0.82655227 4.3399386 -0.40082455 0.83026743 4.1134043 -0.33767676 0.88345361 
		3.9912446 -0.098269358 0.61913133 4.3434072 -0.41699663 0.54700226 4.6221972 
		-0.34144282 0.62677056 4.087574 -0.37645832 0.73322946 3.9290116 -0.10467961 
		0.62872201 4.1037011 0.16801395 0.62086862 4.4314489 0.21471012 0.54834741 
		4.6925397 0.16801398 0.54834759 4.7293057 -0.09121722;
	setAttr -s 128 ".ed[0:127]"  0 1 0 1 2 
		0 2 3 0 3 4 0 4 5 0 5 
		6 0 6 7 0 7 0 0 8 9 1 
		10 11 1 11 12 1 13 14 1 14 15 
		1 15 8 1 0 8 1 1 9 1 2 
		10 1 3 11 1 4 12 1 5 13 1 
		6 14 1 7 15 1 8 36 1 9 37 
		1 10 38 1 11 39 1 12 32 1 13 
		33 1 14 34 1 15 35 1 7 16 1 
		0 17 1 16 17 0 6 18 1 18 16 
		0 5 19 1 19 18 0 4 20 1 20 
		19 0 3 21 1 21 20 0 2 22 1 
		22 21 0 1 23 1 23 22 0 17 23 
		0 16 24 1 17 25 1 24 25 0 18 
		26 1 26 24 0 19 27 1 27 26 0 
		20 28 1 28 27 0 21 29 1 29 28 
		0 22 30 1 30 29 0 23 31 1 31 
		30 0 25 31 0 32 44 1 33 45 1 
		32 33 1 34 46 1 33 34 1 35 47 
		1 34 35 1 36 41 1 35 36 1 37 
		40 1 36 37 1 38 42 1 37 38 1 
		39 43 1 38 39 1 39 32 1 2 9 
		1 13 4 1 32 13 1 37 10 1 1 
		8 1 9 10 1 10 3 1 3 12 1 
		12 13 1 14 5 1 14 7 1 7 8 
		1 36 40 1 40 38 1 38 43 1 43 
		32 1 44 33 1 45 34 1 34 47 1 
		35 41 1 7 17 1 18 7 1 5 18 
		1 4 19 1 3 20 1 22 3 1 23 
		2 1 17 1 1 16 25 1 26 16 1 
		27 18 1 28 19 1 29 20 1 22 29 
		1 23 30 1 17 31 1 33 14 1 34 
		15 1 15 36 1 8 37 1 10 39 1 
		39 12 1 41 40 0 40 42 0 42 43 
		0 43 44 0 44 45 0 45 46 0 46 
		47 0 47 41 0;
	setAttr -s 80 ".fc[0:79]" -type "polyFaces" 
		f 3 0 82 -15 
		mu 0 3 0 1 2 
		f 3 -83 15 -9 
		mu 0 3 2 1 3 
		f 3 1 78 -16 
		mu 0 3 1 4 3 
		f 3 -24 83 -82 
		mu 0 3 5 3 6 
		f 3 -79 16 -84 
		mu 0 3 3 4 6 
		f 3 -10 84 17 
		mu 0 3 7 6 8 
		f 3 -85 -17 2 
		mu 0 3 8 6 4 
		f 3 -18 85 -11 
		mu 0 3 9 10 11 
		f 3 -86 3 18 
		mu 0 3 11 10 12 
		f 3 19 79 4 
		mu 0 3 13 14 12 
		f 3 -27 86 -81 
		mu 0 3 15 11 14 
		f 3 -19 -80 -87 
		mu 0 3 11 12 14 
		f 3 20 87 5 
		mu 0 3 16 17 13 
		f 3 -88 -12 -20 
		mu 0 3 13 17 14 
		f 3 -13 88 21 
		mu 0 3 18 17 19 
		f 3 -89 -21 6 
		mu 0 3 19 17 16 
		f 3 -22 89 -14 
		mu 0 3 18 19 2 
		f 3 -90 7 14 
		mu 0 3 2 19 0 
		f 3 -70 90 -121 
		mu 0 3 20 21 22 
		f 3 -91 72 71 
		mu 0 3 22 21 5 
		f 3 -122 91 73 
		mu 0 3 23 22 24 
		f 3 -92 -72 74 
		mu 0 3 24 22 5 
		f 3 -74 92 -123 
		mu 0 3 23 24 25 
		f 3 -93 76 75 
		mu 0 3 25 24 26 
		f 3 -124 93 62 
		mu 0 3 27 28 15 
		f 3 -94 -76 77 
		mu 0 3 15 28 29 
		f 3 -125 94 63 
		mu 0 3 30 27 31 
		f 3 -95 -63 64 
		mu 0 3 31 27 15 
		f 3 -126 95 65 
		mu 0 3 32 30 33 
		f 3 -96 -64 66 
		mu 0 3 33 30 31 
		f 3 -66 96 -127 
		mu 0 3 32 33 34 
		f 3 -97 68 67 
		mu 0 3 34 33 35 
		f 3 -68 97 -128 
		mu 0 3 34 35 20 
		f 3 -98 70 69 
		mu 0 3 20 35 21 
		f 3 -8 98 -32 
		mu 0 3 0 19 36 
		f 3 -99 30 32 
		mu 0 3 36 19 37 
		f 3 33 99 -7 
		mu 0 3 16 38 19 
		f 3 -100 34 -31 
		mu 0 3 19 38 37 
		f 3 -6 100 -34 
		mu 0 3 16 13 38 
		f 3 -101 35 36 
		mu 0 3 38 13 39 
		f 3 -5 101 -36 
		mu 0 3 13 12 39 
		f 3 -102 37 38 
		mu 0 3 39 12 40 
		f 3 -4 102 -38 
		mu 0 3 12 10 40 
		f 3 -103 39 40 
		mu 0 3 40 10 41 
		f 3 41 103 -3 
		mu 0 3 4 42 8 
		f 3 -104 42 -40 
		mu 0 3 8 42 43 
		f 3 43 104 -2 
		mu 0 3 1 44 4 
		f 3 -105 44 -42 
		mu 0 3 4 44 42 
		f 3 31 105 -1 
		mu 0 3 0 36 1 
		f 3 -106 45 -44 
		mu 0 3 1 36 44 
		f 3 -33 106 -48 
		mu 0 3 45 46 47 
		f 3 -107 46 48 
		mu 0 3 47 46 48 
		f 3 49 107 -35 
		mu 0 3 49 50 46 
		f 3 -108 50 -47 
		mu 0 3 46 50 48 
		f 3 51 108 -37 
		mu 0 3 51 52 49 
		f 3 -109 52 -50 
		mu 0 3 49 52 50 
		f 3 53 109 -39 
		mu 0 3 53 54 51 
		f 3 -110 54 -52 
		mu 0 3 51 54 52 
		f 3 55 110 -41 
		mu 0 3 55 56 53 
		f 3 -111 56 -54 
		mu 0 3 53 56 54 
		f 3 -43 111 -56 
		mu 0 3 57 58 59 
		f 3 -112 57 58 
		mu 0 3 59 58 60 
		f 3 -45 112 -58 
		mu 0 3 58 61 60 
		f 3 -113 59 60 
		mu 0 3 60 61 62 
		f 3 -46 113 -60 
		mu 0 3 61 45 62 
		f 3 -114 47 61 
		mu 0 3 62 45 47 
		f 3 -65 80 27 
		mu 0 3 31 15 14 
		f 3 -67 114 28 
		mu 0 3 33 31 17 
		f 3 -115 -28 11 
		mu 0 3 17 31 14 
		f 3 -69 115 29 
		mu 0 3 35 33 18 
		f 3 -116 -29 12 
		mu 0 3 18 33 17 
		f 3 -30 116 -71 
		mu 0 3 35 18 21 
		f 3 -117 13 22 
		mu 0 3 21 18 2 
		f 3 -23 117 -73 
		mu 0 3 21 2 5 
		f 3 -118 8 23 
		mu 0 3 5 2 3 
		f 3 -75 81 24 
		mu 0 3 24 5 6 
		f 3 -25 118 -77 
		mu 0 3 24 6 26 
		f 3 -119 9 25 
		mu 0 3 26 6 7 
		f 3 -78 119 26 
		mu 0 3 15 29 11 
		f 3 -120 -26 10 
		mu 0 3 11 29 9 ;
createNode transform -n "lowerarm_left" -p "itguy";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode mesh -n "lowerarm_leftShape" -p "lowerarm_left";
	setAttr -k off ".v";
	setAttr -s 6 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
createNode mesh -n "lowerarm_leftShapeOrig" -p "lowerarm_left";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 27 ".uvst[0].uvsp[0:26]" -type "float2" 0.93075806 
		0.42217767 0.90763968 0.42180631 0.93097681 0.37725016 0.90784967 0.37752363 
		0.90672815 0.46041629 0.92990428 0.45654163 0.92818153 0.50672138 0.9050886 
		0.50446182 0.9270826 0.54081368 0.90404034 0.53482127 0.90310079 0.57549262 
		0.92621905 0.57586366 0.9301511 0.3140074 0.90702385 0.3143076 0.93037891 
		0.26841262 0.90726054 0.26804167 0.93044263 0.3396135 0.9073137 0.34001079 
		0.73782051 0.38724092 0.73763508 0.41647935 0.73703265 0.4454883 0.73590618 
		0.48686743 0.73517299 0.51936436 0.73443526 0.55610484 0.73806578 0.28777814 
		0.73777092 0.32734182 0.7376985 0.35438484;
	setAttr ".cuvs" -type "string" "map1";
	setAttr -s 24 ".vt[0:23]"  1.5495677 4.5308318 -0.091859028 
		1.5495672 4.4810915 -0.24354704 1.5495671 4.481092 0.028222559 1.5493575 
		4.3415618 0.077961907 1.549093 4.2522655 0.028222483 1.5490927 4.202527 -0.091859087 
		1.5490929 4.252265 -0.24354701 1.5493574 4.3415618 -0.29328644 1.4496782 
		4.4812665 -0.24354699 1.4496787 4.5310063 -0.091859028 1.4496781 4.481267 
		0.0063045495 1.4494686 4.3417373 0.056044016 1.449204 4.2524405 0.0063045076 
		1.4492036 4.202702 -0.09185905 1.4492041 4.2524405 -0.24354705 1.4494686 
		4.3417368 -0.29328647 2.2803197 4.4127316 -0.097350873 2.2803197 4.3858786 
		-0.19616671 2.2803197 4.385879 -0.019124903 2.2801902 4.3096504 0.013277281 
		2.2800267 4.2672868 -0.019124959 2.2800262 4.2365685 -0.09735094 2.2800267 
		4.2672868 -0.19616674 2.2801902 4.3096499 -0.22174993;
	setAttr -s 56 ".ed[0:55]"  9 0 1 8 1 
		1 0 1 1 10 2 1 2 0 1 11 
		3 1 3 2 1 12 4 1 4 3 1 
		13 5 1 5 4 1 14 6 1 6 5 
		1 15 7 1 7 6 1 1 7 1 0 
		16 1 1 17 1 2 18 1 3 19 1 
		4 20 1 5 21 1 6 22 1 7 23 
		1 0 8 1 0 10 1 11 2 1 4 
		11 1 12 5 1 6 13 1 15 6 1 
		1 15 1 0 17 1 18 0 1 19 2 
		1 20 3 1 21 4 1 6 21 1 7 
		22 1 1 23 1 9 8 0 10 9 0 
		11 10 0 12 11 0 13 12 0 14 13 
		0 15 14 0 8 15 0 16 17 0 18 
		16 0 19 18 0 20 19 0 21 20 0 
		22 21 0 23 22 0 17 23 0;
	setAttr -s 32 ".fc[0:31]" -type "polyFaces" 
		f 3 0 24 -41 
		mu 0 3 0 1 2 
		f 3 -25 2 -2 
		mu 0 3 2 1 3 
		f 3 4 25 3 
		mu 0 3 4 1 5 
		f 3 -26 -1 -42 
		mu 0 3 5 1 0 
		f 3 -43 26 -4 
		mu 0 3 5 6 4 
		f 3 -27 5 6 
		mu 0 3 4 6 7 
		f 3 7 27 -44 
		mu 0 3 8 9 6 
		f 3 -28 8 -6 
		mu 0 3 6 9 7 
		f 3 -8 28 10 
		mu 0 3 9 8 10 
		f 3 -29 -45 9 
		mu 0 3 10 8 11 
		f 3 11 29 -46 
		mu 0 3 12 13 14 
		f 3 -30 12 -10 
		mu 0 3 14 13 15 
		f 3 -47 30 -12 
		mu 0 3 12 16 13 
		f 3 -31 13 14 
		mu 0 3 13 16 17 
		f 3 1 31 -48 
		mu 0 3 2 3 16 
		f 3 -32 15 -14 
		mu 0 3 16 3 17 
		f 3 -3 32 -18 
		mu 0 3 3 1 18 
		f 3 -33 16 48 
		mu 0 3 18 1 19 
		f 3 18 33 -5 
		mu 0 3 4 20 1 
		f 3 -34 49 -17 
		mu 0 3 1 20 19 
		f 3 19 34 -7 
		mu 0 3 7 21 4 
		f 3 -35 50 -19 
		mu 0 3 4 21 20 
		f 3 20 35 -9 
		mu 0 3 9 22 7 
		f 3 -36 51 -20 
		mu 0 3 7 22 21 
		f 3 21 36 -11 
		mu 0 3 10 23 9 
		f 3 -37 52 -21 
		mu 0 3 9 23 22 
		f 3 -13 37 -22 
		mu 0 3 15 13 24 
		f 3 -38 22 53 
		mu 0 3 24 13 25 
		f 3 -15 38 -23 
		mu 0 3 13 17 25 
		f 3 -39 23 54 
		mu 0 3 25 17 26 
		f 3 -16 39 -24 
		mu 0 3 17 3 26 
		f 3 -40 17 55 
		mu 0 3 26 3 18 ;
createNode transform -n "upperarm_right" -p "itguy";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode mesh -n "upperarm_rightShape" -p "upperarm_right";
	setAttr -k off ".v";
	setAttr -s 6 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".op" yes;
createNode mesh -n "upperarm_rightShapeOrig" -p "upperarm_right";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 63 ".uvst[0].uvsp[0:62]" -type "float2" 0.4775272 
		0.92512566 0.4731265 0.94659936 0.4458425 0.92572474 0.44817406 0.94657212 
		0.46719044 0.96436834 0.42923197 0.9475956 0.44890735 0.96732426 0.4493176 
		0.98950011 0.46760666 0.98901737 0.44817784 0.82491606 0.46646678 0.82443303 
		0.4480707 0.84649724 0.46638554 0.84818065 0.47255722 0.86434168 0.44761679 
		0.86606514 0.42963785 0.84703714 0.47724399 0.88426918 0.44556692 0.88594878 
		0.44544646 0.9056322 0.47713852 0.9044584 0.40269041 0.92655951 0.42756787 
		0.92592406 0.41028926 0.94858325 0.4119119 0.96821445 0.4304094 0.96773803 
		0.42226774 0.98933142 0.43579191 0.98930556 0.41120535 0.84759933 0.42112809 
		0.82474691 0.43465239 0.8247211 0.40965894 0.87387848 0.42863834 0.8701086 
		0.40234861 0.89074922 0.42727017 0.88858283 0.40234944 0.90727264 0.42720839 
		0.90634614 0.46948031 0.92307884 0.46916419 0.90460283 0.46922722 0.8865298 
		0.46566591 0.86492461 0.46090874 0.84885812 0.46093154 0.82496953 0.46170935 
		0.96442461 0.4620716 0.98955375 0.4662303 0.94646943 0.97160172 0.38025552 
		0.9715035 0.42283195 0.93097681 0.37725016 0.93075806 0.42217767 0.97044992 
		0.46539271 0.92990428 0.45654163 0.97848266 0.51095116 0.92818153 0.50672138 
		0.98986101 0.54038519 0.9270826 0.54081368 0.98888999 0.57687002 0.92621905 
		0.57586366 0.99304968 0.26941919 0.99303353 0.30591881 0.93037891 0.26841262 
		0.9301511 0.3140074 0.98086357 0.3349748 0.93044263 0.3396135;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".op" yes;
	setAttr -s 48 ".vt[0:47]"  -1.3631362 4.5155659 -0.28995982 
		-1.3066158 4.3174653 -0.37201583 -1.0170718 4.5451398 -0.29889524 -1.0339733 
		4.3364697 -0.38465244 -1.2352744 4.1701508 -0.28995985 -0.82655227 4.3399386 
		-0.40082455 -1.0337644 4.139235 -0.2988953 -1.0336777 4.0534778 -0.091859087 
		-1.2351916 4.0880952 -0.091859102 -1.0337644 4.139235 0.11517706 -1.2352744 
		4.1701508 0.1062417 -1.3066158 4.3174653 0.18829772 -1.0339733 4.3364697 
		0.20093426 -0.83124316 4.1214681 0.14159551 -1.3631362 4.5155659 0.10624173 
		-1.0170718 4.5451398 0.11517712 -1.0171584 4.6308966 -0.09185911 -1.363219 
		4.5976219 -0.091859058 -0.54700226 4.6221972 -0.34144282 -0.81820863 4.5836682 
		-0.32016903 -0.61913133 4.3434072 -0.41699663 -0.62677056 4.087574 -0.37645832 
		-0.83026743 4.1134043 -0.33767676 -0.73322946 3.9290116 -0.10467961 -0.88345361 
		3.9912446 -0.098269358 -0.62872201 4.1037011 0.16801395 -0.62086862 4.4314489 
		0.21471012 -0.82742095 4.3839593 0.20782219 -0.54834741 4.6925397 0.16801398 
		-0.81897026 4.6188402 0.14159565 -0.54834759 4.7293057 -0.09121722 -0.81901371 
		4.6801019 -0.091538064 -1.2746112 4.499361 -0.24373639 -1.2746749 4.5622702 
		-0.091859162 -1.2746112 4.499361 0.060018081 -1.2312789 4.322886 0.12292774 
		-1.1765841 4.2099447 0.06001813 -1.1765205 4.1470356 -0.09185911 -1.176584 
		4.2099447 -0.24373639 -1.2312789 4.322886 -0.30664596 -1.4496782 4.481267 
		-0.24354702 -1.4496787 4.5310063 -0.091859117 -1.4496781 4.481267 0.0063044638 
		-1.4494686 4.3417373 0.056043938 -1.449204 4.2524405 0.0063045314 -1.4492036 
		4.202702 -0.09185905 -1.4492041 4.2524405 -0.24354707 -1.4494686 4.3417373 
		-0.29328647;
	setAttr -s 128 ".ed[0:127]"  0 1 0 1 2 
		1 0 2 1 1 3 1 2 3 1 1 
		4 0 4 3 1 3 5 1 3 6 1 
		5 6 1 4 6 1 6 7 1 6 8 
		1 8 7 1 4 8 0 8 9 1 7 
		9 1 8 10 0 10 9 1 11 12 1 
		12 10 1 10 11 0 9 13 1 9 12 
		1 13 12 1 14 15 1 15 11 1 11 
		14 0 12 15 1 15 16 1 15 17 1 
		17 16 1 14 17 0 17 2 1 16 2 
		1 17 0 0 19 18 1 19 20 1 18 
		20 0 19 5 1 5 20 1 20 21 0 
		20 22 1 22 21 1 5 22 1 22 23 
		1 21 23 0 22 24 1 24 23 1 23 
		25 0 23 13 1 13 25 1 24 13 1 
		25 26 0 25 27 1 27 26 1 13 27 
		1 26 28 0 26 29 1 29 28 1 27 
		29 1 29 30 1 28 30 0 29 31 1 
		31 30 1 31 18 1 30 18 0 31 19 
		1 17 32 1 0 32 1 17 33 1 33 
		32 0 14 34 1 34 17 1 34 33 0 
		11 34 1 11 35 1 35 34 0 10 35 
		1 10 36 1 36 35 0 8 36 1 8 
		37 1 37 36 0 4 38 1 38 8 1 
		38 37 0 1 39 1 39 4 1 39 38 
		0 32 1 1 32 39 0 33 40 1 32 
		40 1 33 41 1 41 40 0 34 42 1 
		42 33 1 42 41 0 35 43 1 43 34 
		1 43 42 0 36 44 1 44 35 1 44 
		43 0 37 45 1 45 36 1 45 44 0 
		38 45 1 38 46 1 46 45 0 39 46 
		1 39 47 1 47 46 0 32 47 1 40 
		47 0 12 27 1 27 15 1 15 29 1 
		29 16 1 16 31 1 16 19 1 2 19 
		1 2 5 1 6 22 1 6 24 1 7 
		24 1 24 9 1;
	setAttr -s 80 ".fc[0:79]" -type "polyFaces" 
		f 3 2 -2 -1 
		mu 0 3 0 2 1 
		f 3 4 -4 1 
		mu 0 3 2 3 1 
		f 3 3 -7 -6 
		mu 0 3 1 3 4 
		f 3 9 -9 7 
		mu 0 3 5 6 3 
		f 3 8 -11 6 
		mu 0 3 3 6 4 
		f 3 -14 -13 11 
		mu 0 3 7 8 6 
		f 3 -15 10 12 
		mu 0 3 8 4 6 
		f 3 16 -16 13 
		mu 0 3 9 11 10 
		f 3 -19 -18 15 
		mu 0 3 11 12 10 
		f 3 -22 -21 -20 
		mu 0 3 13 12 14 
		f 3 24 -24 22 
		mu 0 3 15 14 11 
		f 3 23 20 18 
		mu 0 3 11 14 12 
		f 3 -28 -27 -26 
		mu 0 3 16 13 17 
		f 3 19 28 26 
		mu 0 3 13 14 17 
		f 3 -32 -31 29 
		mu 0 3 18 19 17 
		f 3 -33 25 30 
		mu 0 3 19 16 17 
		f 3 34 -34 31 
		mu 0 3 18 2 19 
		f 3 -3 -36 33 
		mu 0 3 2 0 19 
		f 3 38 -38 36 
		mu 0 3 20 22 21 
		f 3 -41 -40 37 
		mu 0 3 22 5 21 
		f 3 -44 -43 41 
		mu 0 3 23 24 22 
		f 3 -45 40 42 
		mu 0 3 24 5 22 
		f 3 46 -46 43 
		mu 0 3 23 25 24 
		f 3 -49 -48 45 
		mu 0 3 25 26 24 
		f 3 -52 -51 49 
		mu 0 3 27 15 28 
		f 3 -53 48 50 
		mu 0 3 15 29 28 
		f 3 -56 -55 53 
		mu 0 3 30 31 27 
		f 3 -57 51 54 
		mu 0 3 31 15 27 
		f 3 -60 -59 57 
		mu 0 3 32 33 30 
		f 3 -61 55 58 
		mu 0 3 33 31 30 
		f 3 62 -62 59 
		mu 0 3 32 34 33 
		f 3 -65 -64 61 
		mu 0 3 34 35 33 
		f 3 66 -66 64 
		mu 0 3 34 20 35 
		f 3 -37 -68 65 
		mu 0 3 20 21 35 
		f 3 69 -69 35 
		mu 0 3 0 36 19 
		f 3 -72 -71 68 
		mu 0 3 36 37 19 
		f 3 32 -74 -73 
		mu 0 3 16 19 38 
		f 3 70 -75 73 
		mu 0 3 19 37 38 
		f 3 72 -76 27 
		mu 0 3 16 38 13 
		f 3 -78 -77 75 
		mu 0 3 38 39 13 
		f 3 76 -79 21 
		mu 0 3 13 39 12 
		f 3 -81 -80 78 
		mu 0 3 39 40 12 
		f 3 79 -82 17 
		mu 0 3 12 40 10 
		f 3 -84 -83 81 
		mu 0 3 40 41 10 
		f 3 14 -86 -85 
		mu 0 3 4 8 42 
		f 3 82 -87 85 
		mu 0 3 8 43 42 
		f 3 5 -89 -88 
		mu 0 3 1 4 44 
		f 3 84 -90 88 
		mu 0 3 4 42 44 
		f 3 0 -91 -70 
		mu 0 3 0 1 36 
		f 3 87 -92 90 
		mu 0 3 1 44 36 
		f 3 93 -93 71 
		mu 0 3 45 47 46 
		f 3 -96 -95 92 
		mu 0 3 47 48 46 
		f 3 74 -98 -97 
		mu 0 3 49 46 50 
		f 3 94 -99 97 
		mu 0 3 46 48 50 
		f 3 77 -101 -100 
		mu 0 3 51 49 52 
		f 3 96 -102 100 
		mu 0 3 49 50 52 
		f 3 80 -104 -103 
		mu 0 3 53 51 54 
		f 3 99 -105 103 
		mu 0 3 51 52 54 
		f 3 83 -107 -106 
		mu 0 3 55 53 56 
		f 3 102 -108 106 
		mu 0 3 53 54 56 
		f 3 105 -109 86 
		mu 0 3 57 59 58 
		f 3 -111 -110 108 
		mu 0 3 59 60 58 
		f 3 109 -112 89 
		mu 0 3 58 60 61 
		f 3 -114 -113 111 
		mu 0 3 60 62 61 
		f 3 112 -115 91 
		mu 0 3 61 62 45 
		f 3 -116 -94 114 
		mu 0 3 62 47 45 
		f 3 -117 -25 56 
		mu 0 3 31 14 15 
		f 3 -119 -118 60 
		mu 0 3 33 17 31 
		f 3 -29 116 117 
		mu 0 3 17 14 31 
		f 3 -121 -120 63 
		mu 0 3 35 18 33 
		f 3 -30 118 119 
		mu 0 3 18 17 33 
		f 3 67 -122 120 
		mu 0 3 35 21 18 
		f 3 -123 -35 121 
		mu 0 3 21 2 18 
		f 3 39 -124 122 
		mu 0 3 21 5 2 
		f 3 -8 -5 123 
		mu 0 3 5 3 2 
		f 3 -125 -10 44 
		mu 0 3 24 6 5 
		f 3 47 -126 124 
		mu 0 3 24 26 6 
		f 3 -127 -12 125 
		mu 0 3 26 7 6 
		f 3 -23 -128 52 
		mu 0 3 15 11 29 
		f 3 -17 126 127 
		mu 0 3 11 9 29 ;
createNode transform -n "lowerarm_right" -p "itguy";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode mesh -n "lowerarm_rightShape" -p "lowerarm_right";
	setAttr -k off ".v";
	setAttr -s 6 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".op" yes;
createNode mesh -n "lowerarm_rightShapeOrig" -p "lowerarm_right";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 27 ".uvst[0].uvsp[0:26]" -type "float2" 0.93075806 
		0.42217767 0.90763968 0.42180631 0.93097681 0.37725016 0.90784967 0.37752363 
		0.90672815 0.46041629 0.92990428 0.45654163 0.92818153 0.50672138 0.9050886 
		0.50446182 0.9270826 0.54081368 0.90404034 0.53482127 0.90310079 0.57549262 
		0.92621905 0.57586366 0.9301511 0.3140074 0.90702385 0.3143076 0.93037891 
		0.26841262 0.90726054 0.26804167 0.93044263 0.3396135 0.9073137 0.34001079 
		0.73782051 0.38724092 0.73763508 0.41647935 0.73703265 0.4454883 0.73590618 
		0.48686743 0.73517299 0.51936436 0.73443526 0.55610484 0.73806578 0.28777814 
		0.73777092 0.32734182 0.7376985 0.35438484;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".op" yes;
	setAttr -s 24 ".vt[0:23]"  -1.5495677 4.5308318 -0.091859028 
		-1.5495672 4.4810915 -0.24354704 -1.5495671 4.481092 0.028222559 -1.5493575 
		4.3415618 0.077961907 -1.549093 4.2522655 0.028222483 -1.5490927 4.202527 
		-0.091859087 -1.5490929 4.252265 -0.24354701 -1.5493574 4.3415618 -0.29328644 
		-1.4496782 4.4812665 -0.24354699 -1.4496787 4.5310063 -0.091859028 -1.4496781 
		4.481267 0.0063045495 -1.4494686 4.3417373 0.056044016 -1.449204 4.2524405 
		0.0063045076 -1.4492036 4.202702 -0.09185905 -1.4492041 4.2524405 -0.24354705 
		-1.4494686 4.3417368 -0.29328647 -2.2803197 4.4127316 -0.097350873 -2.2803197 
		4.3858786 -0.19616671 -2.2803197 4.385879 -0.019124903 -2.2801902 4.3096504 
		0.013277281 -2.2800267 4.2672868 -0.019124959 -2.2800262 4.2365685 -0.09735094 
		-2.2800267 4.2672868 -0.19616674 -2.2801902 4.3096499 -0.22174993;
	setAttr -s 56 ".ed[0:55]"  9 0 1 0 8 
		1 0 1 1 8 1 1 2 0 1 0 
		10 1 10 2 1 11 2 1 11 3 1 
		3 2 1 12 4 1 4 11 1 4 3 
		1 12 5 1 5 4 1 13 5 1 14 
		6 1 6 13 1 6 5 1 15 6 1 
		15 7 1 7 6 1 1 15 1 1 7 
		1 0 17 1 1 17 1 0 16 1 2 
		18 1 18 0 1 3 19 1 19 2 1 
		4 20 1 20 3 1 5 21 1 21 4 
		1 6 21 1 6 22 1 7 22 1 7 
		23 1 1 23 1 9 8 0 10 9 0 
		11 10 0 12 11 0 13 12 0 14 13 
		0 15 14 0 8 15 0 16 17 0 18 
		16 0 19 18 0 20 19 0 21 20 0 
		22 21 0 23 22 0 17 23 0;
	setAttr -s 32 ".fc[0:31]" -type "polyFaces" 
		f 3 40 -2 -1 
		mu 0 3 0 2 1 
		f 3 3 -3 1 
		mu 0 3 2 3 1 
		f 3 -7 -6 -5 
		mu 0 3 4 5 1 
		f 3 41 0 5 
		mu 0 3 5 0 1 
		f 3 6 -8 42 
		mu 0 3 5 4 6 
		f 3 -10 -9 7 
		mu 0 3 4 7 6 
		f 3 43 -12 -11 
		mu 0 3 8 6 9 
		f 3 8 -13 11 
		mu 0 3 6 7 9 
		f 3 -15 -14 10 
		mu 0 3 9 10 8 
		f 3 -16 44 13 
		mu 0 3 10 11 8 
		f 3 45 -18 -17 
		mu 0 3 12 14 13 
		f 3 15 -19 17 
		mu 0 3 14 15 13 
		f 3 16 -20 46 
		mu 0 3 12 13 16 
		f 3 -22 -21 19 
		mu 0 3 13 17 16 
		f 3 47 -23 -4 
		mu 0 3 2 16 3 
		f 3 20 -24 22 
		mu 0 3 16 17 3 
		f 3 25 -25 2 
		mu 0 3 3 18 1 
		f 3 -49 -27 24 
		mu 0 3 18 19 1 
		f 3 4 -29 -28 
		mu 0 3 4 1 20 
		f 3 26 -50 28 
		mu 0 3 1 19 20 
		f 3 9 -31 -30 
		mu 0 3 7 4 21 
		f 3 27 -51 30 
		mu 0 3 4 20 21 
		f 3 12 -33 -32 
		mu 0 3 9 7 22 
		f 3 29 -52 32 
		mu 0 3 7 21 22 
		f 3 14 -35 -34 
		mu 0 3 10 9 23 
		f 3 31 -53 34 
		mu 0 3 9 22 23 
		f 3 33 -36 18 
		mu 0 3 15 24 13 
		f 3 -54 -37 35 
		mu 0 3 24 25 13 
		f 3 36 -38 21 
		mu 0 3 13 25 17 
		f 3 -55 -39 37 
		mu 0 3 25 26 17 
		f 3 38 -40 23 
		mu 0 3 17 26 3 
		f 3 -56 -26 39 
		mu 0 3 26 18 3 ;
createNode transform -n "head" -p "itguy";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode mesh -n "headShape" -p "|itguy|head";
	setAttr -k off ".v";
	setAttr -s 6 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
createNode mesh -n "headShapeOrig" -p "|itguy|head";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 247 ".uvst[0].uvsp[0:246]" -type "float2" 0.84251046 
		0.20869482 0.83540976 0.21814129 0.82060933 0.20781952 0.80036312 0.21814129 
		0.76042783 0.20869482 0.78142434 0.20804706 0.76430094 0.21814129 0.75849128 
		0.19276018 0.77753103 0.19276045 0.76107335 0.17682606 0.78112608 0.17773788 
		0.7662375 0.1678822 0.80078888 0.16813309 0.84251046 0.17682606 0.82060933 
		0.17770174 0.83540976 0.1679184 0.84638357 0.19276018 0.82406682 0.19276001 
		0.80079889 0.19276045 0.84251046 0.20869482 0.83540976 0.21814129 0.82060933 
		0.20781952 0.80036312 0.21814129 0.76042783 0.20869482 0.78142434 0.20804706 
		0.76430094 0.21814129 0.75849128 0.19276018 0.77753103 0.19276045 0.76107335 
		0.17682606 0.78112608 0.17773788 0.7662375 0.1678822 0.80078888 0.16813309 
		0.84251046 0.17682606 0.82060933 0.17770174 0.83540976 0.1679184 0.84638357 
		0.19276018 0.82406682 0.19276001 0.80079889 0.19276045 0.91991353 0.99152863 
		0.85023654 0.9896993 0.96353501 0.99556798 0.79723132 0.99556798 0.7972331 
		0.96286952 0.83070743 0.96138775 0.81969571 0.92477763 0.79723328 0.92503154 
		0.81534231 0.88279271 0.7972334 0.88307357 0.80910218 0.84810585 0.79471141 
		0.85314488 0.79824924 0.82936931 0.79471147 0.82930076 0.79471147 0.81302351 
		0.79925418 0.81315416 0.80466509 0.77296013 0.79471147 0.77285361 0.80065131 
		0.78664517 0.79471147 0.78657019 0.79471147 0.75850773 0.80042845 0.75860226 
		0.79439622 0.7373116 0.79961848 0.73931307 0.79997879 0.72504765 0.79439622 
		0.72504765 0.79439622 0.70327449 0.79971391 0.70327449 0.80364937 0.68630224 
		0.79775244 0.68640685 0.79687673 0.66170043 0.98844612 0.75827199 0.98565614 
		0.8290745 0.99800801 0.77089912 0.99800801 0.83196211 0.99800825 0.92231727 
		0.98483038 0.91528469 0.98544943 0.96816558 0.99800825 0.9697839 0.81689405 
		0.83677572 0.82923967 0.85480595 0.83131593 0.83732355 0.84217137 0.84805679 
		0.8410185 0.82755154 0.84916317 0.81922656 0.83994395 0.80388743 0.83436871 
		0.81765574 0.822945 0.81413746 0.82521296 0.80412185 0.81086886 0.80435598 
		0.81024653 0.82265657 0.81835926 0.751504 0.80761921 0.73118806 0.80717456 
		0.72202003 0.82934338 0.73291939 0.81755567 0.71930844 0.82884789 0.69657987 
		0.81199485 0.68698603 0.80697179 0.70398551 0.81785822 0.76272666 0.81189185 
		0.78690392 0.83427328 0.88307989 0.85407621 0.86120808 0.8619436 0.81244737 
		0.84783614 0.7675063 0.82718641 0.7778309 0.84100747 0.6761899 0.81698078 
		0.66616046 0.84142953 0.91800308 0.86494756 0.88667011 0.86742079 0.80860406 
		0.85737818 0.75427532 0.86203593 0.70241553 0.86171687 0.94912052 0.8875742 
		0.90216964 0.81967014 0.63783449 0.84311748 0.64313769 0.79687673 0.63449079 
		0.89302957 0.62358582 0.82843906 0.62534279 0.79687691 0.62286919 0.79687721 
		0.61139756 0.88031048 0.80611801 0.87632203 0.74125952 0.88668317 0.70270002 
		0.89986444 0.9681161 0.92599791 0.9085899 0.91734439 0.85025269 0.90822035 
		0.74884039 0.91461623 0.67906582 0.96207678 0.97008163 0.96115184 0.91045201 
		0.91335386 0.80700368 0.9396798 0.84333318 0.92208147 0.74267524 0.93511224 
		0.76087362 0.96070141 0.73365986 0.96159613 0.80896187 0.88640195 0.59346551 
		0.79723495 0.59126151 0.92400372 0.60294968 0.96336812 0.65073729 0.99800789 
		0.68118316 0.99089265 0.67950302 0.94445664 0.82856899 0.9473595 0.80809158 
		0.94264996 0.84496468 0.94977266 0.8074258 0.9410246 0.76723397 0.81730497 
		0.83498859 0.83097064 0.83465099 0.83350533 0.82115233 0.82403845 0.81757629 
		0.82921803 0.82603216 0.65792513 0.99152845 0.61430234 0.99556798 0.74423003 
		0.98969913 0.76375884 0.96138746 0.7747708 0.92477745 0.77912438 0.88279253 
		0.77370036 0.84810585 0.79117364 0.82936919 0.79016864 0.81315416 0.78475791 
		0.77296001 0.78877163 0.78664505 0.78899443 0.75860214 0.78917384 0.73931307 
		0.78881383 0.72504765 0.78907865 0.70327449 0.79185551 0.68630195 0.60111523 
		0.75827199 0.58782846 0.77089912 0.6039052 0.82907462 0.58782846 0.83196211 
		0.58782864 0.92231727 0.60473108 0.91528434 0.60411233 0.9681654 0.58782876 
		0.9697839 0.76861137 0.83714068 0.75860679 0.85480559 0.75581181 0.83730692 
		0.74567527 0.84805638 0.74610806 0.82411373 0.73868334 0.81922621 0.74790269 
		0.80388701 0.75347775 0.81577039 0.7649014 0.81454378 0.77837145 0.80435598 
		0.76263368 0.80412155 0.77621531 0.8226772 0.77043307 0.75150383 0.78117335 
		0.73118794 0.781618 0.72201991 0.75944895 0.7329191 0.7712369 0.71930826 
		0.76665664 0.69687057 0.78350997 0.68698591 0.78182077 0.70398527 0.77156472 
		0.76272655 0.77753109 0.78690392 0.76019323 0.88307947 0.73134392 0.8543933 
		0.72127956 0.81615192 0.73927093 0.76750594 0.7672804 0.77783048 0.75274581 
		0.67618948 0.77677262 0.66616023 0.75303698 0.91800272 0.72169936 0.88666958 
		0.71220827 0.81230891 0.72652406 0.75427485 0.72447479 0.70241511 0.73274976 
		0.94912034 0.70071667 0.90216905 0.77408338 0.63783425 0.75063592 0.6431374 
		0.69613308 0.62358552 0.76531446 0.62534285 0.70042115 0.80982244 0.70208204 
		0.74125892 0.69346142 0.70216912 0.6946016 0.96811545 0.65476525 0.9085893 
		0.66603094 0.84727961 0.67749834 0.74878508 0.66322196 0.67906541 0.6297999 
		0.97008115 0.63072467 0.91045171 0.66666341 0.8070032 0.64022768 0.84107983 
		0.66167617 0.74160933 0.64980292 0.7425378 0.61701739 0.73365939 0.61960399 
		0.82358336 0.70806432 0.59346515 0.67046118 0.60294926 0.61783135 0.65073681 
		0.58782834 0.67477983 0.59866816 0.67449802 0.63697642 0.83576316 0.63268095 
		0.80948371 0.64810801 0.84255278 0.63388276 0.80742514 0.63951337 0.77230048 
		0.76820028 0.83535403 0.75615704 0.83463424 0.75434101 0.81926686 0.76380825 
		0.81798267 0.75940859 0.82603186;
	setAttr ".cuvs" -type "string" "map1";
	setAttr -s 237 ".vt";
	setAttr ".vt[0:165]"  -0.14447919 5.227119 0.30586389 -0.1117982 
		5.2381949 0.31562319 -0.079117164 5.2255926 0.32331085 -0.065580256 5.1966925 
		0.32442352 -0.079117179 5.1684251 0.31830943 -0.1117982 5.1573491 0.30855009 
		-0.14447916 5.1699514 0.30086234 -0.15801609 5.1988511 0.29974964 -0.14008561 
		5.2116518 0.34351248 -0.12121722 5.2180471 0.34914708 -0.10234882 5.2107716 
		0.35358557 -0.094533294 5.1940851 0.35422793 -0.10234884 5.1777654 0.35069799 
		-0.12121724 5.17137 0.34506336 -0.14008562 5.1786466 0.3406249 -0.14790113 
		5.1953306 0.33998239 -0.12274182 5.1942124 0.35277343 0.14447917 5.227119 
		0.30586389 0.1117982 5.2381949 0.31562316 0.14008561 5.2116518 0.34351248 
		0.12121722 5.2180471 0.34914708 0.079117164 5.2255921 0.32331076 0.10234882 
		5.2107706 0.35358548 0.065580249 5.1966925 0.32442352 0.094533294 5.1940851 
		0.35422793 0.079117171 5.1684251 0.31830943 0.10234884 5.1777654 0.35069799 
		0.1117982 5.1573491 0.30855012 0.12121724 5.17137 0.34506336 0.14447916 5.1699514 
		0.30086234 0.14008561 5.1786466 0.3406249 0.15801607 5.1988511 0.29974964 
		0.14790113 5.1953306 0.33998239 0.12274182 5.1942124 0.35277343 5.9867364e-009 
		5.5915937 0.11135893 3.0551869e-010 5.5230532 0.26532707 1.1188238e-009 5.4331598 
		0.34133798 1.401497e-009 5.3323989 0.38119742 -1.3395542e-010 5.2602878 0.39973658 
		9.5902164e-010 5.2020049 0.38027045 -1.4805013e-008 5.0999002 0.44188765 
		-1.0581591e-008 5.0599732 0.4504365 -5.7048188e-009 5.0311084 0.41080865 
		-4.219888e-009 4.9809752 0.43346813 -1.8520664e-010 4.9570203 0.40993318 
		-2.5806066e-010 4.9265075 0.42661855 3.1397926e-009 4.8810792 0.39880967 
		2.8842151e-009 4.8335404 0.40437147 5.9798073e-009 4.7782216 0.36636588 1.3375294e-009 
		4.7485862 0.25327656 1.048955e-009 4.7189507 0.17819257 -4.952343e-009 5.0459256 
		-0.21657456 1.358184e-009 5.1925592 -0.27480024 -4.52127e-009 5.4120455 -0.25750214 
		-3.4157233e-009 5.5287285 -0.1915819 1.7036857e-009 5.597878 -0.07079082 
		6.6734089e-009 5.1629448 0.39689076 0.09202946 5.4323287 0.33247331 0.083112851 
		5.3314357 0.36954513 0.068896718 5.2477612 0.3869876 0.015860634 5.2020044 
		0.37340501 0.019512808 5.1629448 0.38385907 0.024598157 5.0999002 0.43440568 
		0.030251525 5.0599732 0.43980423 0.021817844 5.0311084 0.40135774 0.027728068 
		4.9857755 0.43130529 0.027728077 4.9570203 0.40993318 0.027728081 4.9265075 
		0.42661852 0.027728077 4.8807263 0.39471823 0.10532828 5.5252032 -0.17516154 
		0.10636596 5.5840783 -0.08319284 0.099830501 5.2178731 0.36530808 0.1550632 
		5.2635751 0.36925337 0.14231682 5.218771 0.34757388 0.21634004 5.2465434 
		0.34171793 0.17294244 5.1963019 0.32003832 0.23023985 5.1757827 0.30622685 
		0.19658399 5.1393638 0.33799052 0.16060635 5.1754503 0.33250636 0.038455475 
		5.1410232 0.35952058 0.1109512 5.1673155 0.34877992 0.069840617 5.187644 
		0.35484517 0.10978583 5.0131574 0.37081707 0.051351707 4.9654751 0.4065218 
		0.049089663 4.9495311 0.4038052 0.15681051 4.9676104 0.35062218 0.088991277 
		4.942729 0.39440745 0.066949785 4.8822813 0.39047652 0.050864771 4.9280939 
		0.42096874 0.13768692 4.9039702 0.35480225 0.048005644 5.0991344 0.37697744 
		0.068170406 5.0468059 0.38418064 0.16716333 5.3314052 0.33961132 0.26225376 
		5.2773805 0.29853565 0.27314606 5.1582079 0.25932401 0.21865076 5.0504065 
		0.30701011 0.12171864 5.1401935 0.34875554 0.13184284 5.0764985 0.35070744 
		0.17487915 4.8663073 0.30702826 0.094695106 4.8439326 0.38703826 0.18001617 
		5.4151039 0.29952073 0.26823723 5.3376079 0.23653425 0.27889377 5.147294 
		0.19356316 0.26611441 5.0167747 0.24300778 0.23539752 4.8910055 0.24146786 
		0.10165399 5.5192108 0.25504917 0.22478721 5.4763865 0.20743306 0.15419497 
		4.7968802 0.27136427 0.094695106 4.785964 0.35137427 0.084005833 4.7545886 
		0.25349212 0.27834675 5.3725462 0.12771638 0.28704539 5.1393991 0.11661407 
		0.26559702 4.982759 0.14169019 0.24117972 4.889153 0.13671109 0.16280743 
		4.7675714 0.16913266 0.10322323 5.5841556 0.10273371 0.22743209 5.5191598 
		0.072208367 0.27834675 5.3855071 0.020383056 0.28704539 5.1393991 0.02811373 
		0.27181822 5.017694 0.041003834 0.20605254 4.8295202 0.040626083 0.23741867 
		5.5192485 -0.12046997 0.25859866 5.3855066 -0.16566792 0.26311845 5.1393991 
		-0.16750662 0.22546488 4.9579678 -0.12067498 0.10199229 5.0159307 -0.19104636 
		0.13999519 5.1860819 -0.25323173 0.13649043 5.3954649 -0.23813809 0.2750819 
		5.1393991 -0.080565304 0.26470006 5.02666 -0.0088167908 0.28328371 5.2105074 
		0.024248421 0.28214425 5.1893253 -0.069053985 0.31005034 5.2358923 -0.072602428 
		0.31326398 5.1372652 -0.10195803 0.29797935 5.007514 0.01376962 0.29068533 
		5.2350059 -0.070828214 0.2969811 5.0587745 -0.059086606 0.10261633 5.213594 
		0.36750856 0.14201979 5.2123642 0.35057265 0.15941267 5.1840558 0.33779728 
		0.11893916 5.1757946 0.3546389 0.12317604 5.1925988 0.31922299 -0.09202946 
		5.4323287 0.33247328 -0.083112866 5.3314357 0.36954519 -0.068896718 5.2477612 
		0.3869876 -0.01586063 5.2020044 0.37340507 -0.019512804 5.1629448 0.38385907 
		-0.024598163 5.0999002 0.43440571 -0.030251531 5.0599732 0.43980426 -0.02181785 
		5.0311084 0.40135771 -0.027728081 4.9857755 0.43130526 -0.027728081 4.9570203 
		0.40993315 -0.027728075 4.9265075 0.42661852 -0.027728075 4.8807259 0.3947182 
		-0.10532829 5.5252032 -0.17516163 -0.10636597 5.5840783 -0.083192818 -0.099830471 
		5.2178726 0.36530805 -0.1550632 5.2635751 0.3692534 -0.14231683 5.218771 
		0.34757388 -0.21634004 5.2465434 0.34171787 -0.17304081 5.1963019 0.32003829 
		-0.23023987 5.1757832 0.30622697 -0.19658394 5.1393642 0.33799043 -0.16060634 
		5.1754503 0.33250627 -0.038455456 5.1410232 0.35952061 -0.11095119 5.1673155 
		0.34877989;
	setAttr ".vt[166:236]" -0.069742225 5.1876445 0.35484514 -0.10978584 
		5.0131574 0.3708171 -0.051351707 4.9654751 0.40652186 -0.049089666 4.9495311 
		0.4038052 -0.15681051 4.9676104 0.35062224 -0.088991269 4.942729 0.39440745 
		-0.066949785 4.8822813 0.39047652 -0.050864764 4.9280939 0.42096874 -0.13768694 
		4.9039698 0.35480219 -0.048005652 5.0991344 0.37697744 -0.068170421 5.0468059 
		0.38418064 -0.16716333 5.3314052 0.33961132 -0.26225376 5.27738 0.29853565 
		-0.27314606 5.1582079 0.25932404 -0.21865079 5.0504065 0.30701014 -0.12171862 
		5.1401939 0.34875551 -0.13184287 5.076499 0.35070741 -0.17487915 4.8663073 
		0.30702826 -0.094695106 4.8439326 0.38703829 -0.1800162 5.4151039 0.29952073 
		-0.26823726 5.3376079 0.23653425 -0.27889374 5.1472945 0.19356315 -0.26611441 
		5.0167747 0.24300775 -0.23539752 4.8910055 0.24146786 -0.10165398 5.5192108 
		0.2550492 -0.22478715 5.476387 0.20743304 -0.15419497 4.7968802 0.27136427 
		-0.094695106 4.785964 0.3513743 -0.084005833 4.7545891 0.25349215 -0.27834675 
		5.3725462 0.12771639 -0.28704539 5.1393991 0.11661405 -0.26559702 4.982759 
		0.14169019 -0.24117967 4.889153 0.13671109 -0.16280743 4.7675714 0.16913274 
		-0.10322322 5.5841556 0.10273371 -0.22743201 5.5191588 0.072208352 -0.27834675 
		5.3855071 0.020383053 -0.28704539 5.1393991 0.028113734 -0.27181822 5.017694 
		0.041003816 -0.20605253 4.8295202 0.040626075 -0.2374187 5.5192485 -0.12046999 
		-0.25859863 5.3855071 -0.16566794 -0.26311845 5.1393991 -0.16750664 -0.22546488 
		4.9579678 -0.12067497 -0.10199229 5.0159311 -0.19104636 -0.13999519 5.1860824 
		-0.25323173 -0.13649043 5.3954649 -0.23813808 -0.2750819 5.1393991 -0.080565311 
		-0.26470006 5.0266595 -0.0088164881 -0.28328368 5.2105074 0.024248412 -0.28214425 
		5.1893253 -0.069053993 -0.31005037 5.2358928 -0.072602473 -0.31326398 5.1372652 
		-0.10195804 -0.29797935 5.0075135 0.01376998 -0.29068533 5.2350054 -0.070828237 
		-0.2969811 5.058773 -0.059086319 -0.10261634 5.213594 0.36750859 -0.14201981 
		5.2123637 0.35057268 -0.15941267 5.1840558 0.33779728 -0.11893915 5.1757946 
		0.35463881 -0.12317605 5.1925983 0.31922299 0.15150368 4.6240931 0.12763011 
		5.5875651e-009 4.6193485 0.15230052 0.20605253 4.6442666 0.011413074 0.22546488 
		4.7565956 -0.13415813 -5.2631641e-009 4.8119774 -0.2540583 0.10199229 4.7900305 
		-0.22288015 -0.15150368 4.6240931 0.12763011 -0.20605254 4.6442666 0.011413077 
		-0.22546488 4.7565951 -0.13415813 -0.10199228 4.7900295 -0.2228801;
	setAttr -s 676 ".ed";
	setAttr ".ed[0:165]"  0 1 0 1 2 0 
		2 3 0 3 4 0 4 5 0 5 6 
		0 6 7 0 7 0 0 8 9 1 9 
		10 1 10 11 1 11 12 1 12 13 1 
		13 14 1 14 15 1 15 8 1 0 8 
		1 1 9 1 2 10 1 3 11 1 4 
		12 1 5 13 1 6 14 1 7 15 1 
		8 16 1 9 16 1 10 16 1 11 16 
		1 12 16 1 13 16 1 14 16 1 15 
		16 1 1 8 1 10 1 1 11 2 1 
		4 11 1 5 12 1 14 5 1 15 6 
		1 0 15 1 17 18 0 18 19 1 17 
		19 1 18 20 1 19 20 1 21 22 1 
		22 18 1 18 21 0 20 22 1 23 24 
		1 24 21 1 21 23 0 22 24 1 23 
		25 0 25 24 1 25 26 1 24 26 1 
		25 27 0 27 26 1 27 28 1 26 28 
		1 29 30 1 30 27 1 27 29 0 28 
		30 1 31 32 1 32 29 1 29 31 0 
		30 32 1 31 17 0 17 32 1 32 19 
		1 20 33 1 19 33 1 22 33 1 24 
		33 1 26 33 1 28 33 1 30 33 1 
		32 33 1 34 35 1 35 36 1 36 37 
		1 37 38 1 38 39 1 39 56 1 40 
		41 1 41 42 1 42 43 1 43 44 1 
		44 45 1 45 46 1 46 47 1 47 48 
		1 48 49 1 49 50 1 50 228 1 231 
		51 1 51 52 1 52 53 1 53 54 1 
		54 55 1 55 34 1 56 40 1 34 115 
		1 70 115 1 35 105 1 36 57 1 37 
		58 1 57 58 1 38 59 1 58 59 1 
		39 60 1 59 60 1 56 61 1 60 61 
		1 40 62 1 41 63 1 62 63 1 42 
		64 1 63 64 1 43 65 1 64 65 1 
		44 66 1 65 66 1 45 67 1 66 67 
		1 46 68 1 67 68 1 68 47 1 51 
		125 1 54 69 1 55 70 1 69 70 1 
		61 62 1 60 71 1 59 71 1 59 72 
		1 71 73 1 72 73 1 72 74 1 73 
		75 1 74 75 1 74 76 1 76 75 1 
		76 77 1 75 78 1 77 78 1 77 96 
		1 78 80 1 79 80 1 79 61 1 80 
		81 1 81 60 1 81 71 1 64 82 1 
		65 83 1 82 83 1 66 84 1 83 84 
		1 82 85 1 83 86 1 85 86 1 84 
		86 1 85 89 1 86 88 1;
	setAttr ".ed[166:331]" 87 88 1 88 84 1 89 
		87 1 86 89 1 87 68 1 88 67 1 
		62 90 1 63 91 1 90 91 1 91 82 
		1 79 90 1 64 91 1 72 92 1 58 
		92 1 74 93 1 92 93 1 76 94 1 
		93 94 1 77 95 1 94 95 1 95 97 
		1 96 79 1 80 96 1 97 90 1 96 
		97 1 82 97 1 85 95 1 89 98 1 
		95 98 1 87 99 1 98 99 1 99 47 
		1 92 100 1 57 100 1 93 101 1 100 
		101 1 101 102 1 94 102 1 95 103 1 
		102 103 1 98 104 1 103 104 1 57 105 
		1 100 106 1 105 106 1 106 110 1 98 
		107 1 99 108 1 107 108 1 108 48 1 
		104 107 1 108 109 1 114 109 1 109 49 
		1 114 50 1 101 110 1 102 111 1 110 
		111 1 103 112 1 111 112 1 104 113 1 
		112 113 1 107 114 1 113 114 1 105 115 
		1 106 116 1 115 116 1 110 117 1 116 
		117 1 111 118 1 117 130 1 112 119 1 
		118 119 1 113 120 1 119 120 1 120 114 
		1 116 121 1 117 122 1 121 122 1 122 
		123 1 119 129 0 123 124 1 124 120 1 
		70 121 1 52 126 1 125 126 1 126 127 
		1 53 127 1 127 69 1 69 121 1 127 
		122 1 126 123 1 125 124 1 114 227 1 
		120 229 1 124 230 1 125 232 1 128 123 
		1 122 131 1 129 124 1 128 129 0 130 
		118 1 131 128 0 130 131 0 131 135 1 
		130 132 1 128 133 1 132 133 0 118 133 
		1 129 134 1 133 136 0 119 134 0 132 
		118 1 118 134 1 135 132 0 135 130 1 
		136 134 0 118 136 1 136 129 1 130 111 
		1 111 119 1 71 137 1 73 138 1 137 
		138 1 138 75 1 78 139 1 75 139 1 
		80 140 1 139 140 0 140 81 0 81 137 
		1 137 141 1 138 141 1 75 141 0 139 
		141 1 140 141 1 81 141 0 109 50 1 
		115 55 1 34 105 1 57 35 1 58 36 
		1 59 37 1 60 38 1 39 61 1 41 
		62 1 63 42 1 66 43 1 44 67 1 
		46 67 1 126 51 1 52 127 1 69 53 
		1 54 70 1 62 56 1 72 71 1 74 
		73 1 77 75 1 79 81 1 65 82 1 
		83 66 1 86 82 1 87 86 1 68 88 
		1 66 88 1 63 90 1;
	setAttr ".ed[332:497]" 61 90 1 58 72 1 74 
		92 1 76 93 1 95 76 1 90 96 1 
		96 78 1 97 77 1 85 97 1 98 85 
		1 99 89 1 47 87 1 97 91 1 57 
		92 1 101 92 1 102 93 1 103 94 1 
		95 104 1 100 105 1 101 106 1 98 108 
		1 99 48 1 109 107 1 108 49 1 111 
		101 1 103 111 1 112 104 1 114 104 1 
		115 106 1 116 110 1 110 130 1 113 119 
		1 121 117 1 116 70 1 121 127 1 122 
		126 1 125 123 1 227 50 1 229 114 1 
		230 120 1 231 125 1 232 124 1 131 117 
		1 132 128 1 132 131 1 136 128 1 73 
		137 1 140 78 1 131 123 1 128 124 1 
		124 119 1 64 43 1 60 79 1 34 200 
		1 155 200 1 35 190 1 36 142 1 37 
		143 1 142 143 1 38 144 1 143 144 1 
		39 145 1 144 145 1 56 146 1 145 146 
		1 40 147 1 41 148 1 147 148 1 42 
		149 1 148 149 1 43 150 1 149 150 1 
		44 151 1 150 151 1 45 152 1 151 152 
		1 46 153 1 152 153 1 153 47 1 51 
		210 1 54 154 1 55 155 1 154 155 1 
		146 147 1 145 156 1 144 156 1 144 157 
		1 156 158 1 157 158 1 157 159 1 158 
		160 1 159 160 1 159 161 1 161 160 1 
		161 162 1 160 163 1 162 163 1 162 181 
		1 163 165 1 164 165 1 164 146 1 165 
		166 1 166 145 1 166 156 1 149 167 1 
		150 168 1 167 168 1 151 169 1 168 169 
		1 167 170 1 168 171 1 170 171 1 169 
		171 1 170 174 1 171 173 1 172 173 1 
		173 169 1 174 172 1 171 174 1 172 153 
		1 173 152 1 147 175 1 148 176 1 175 
		176 1 176 167 1 164 175 1 149 176 1 
		157 177 1 143 177 1 159 178 1 177 178 
		1 161 179 1 178 179 1 162 180 1 179 
		180 1 180 182 1 181 164 1 165 181 1 
		182 175 1 181 182 1 167 182 1 170 180 
		1 174 183 1 180 183 1 172 184 1 183 
		184 1 184 47 1 177 185 1 142 185 1 
		178 186 1 185 186 1 186 187 1 179 187 
		1 180 188 1 187 188 1 183 189 1 188 
		189 1 142 190 1 185 191 1 190 191 1 
		191 195 1 183 192 1 184 193 1 192 193 
		1 193 48 1 189 192 1;
	setAttr ".ed[498:663]" 193 194 1 199 194 1 194 
		49 1 199 50 1 186 195 1 187 196 1 
		195 196 1 188 197 1 196 197 1 189 198 
		1 197 198 1 192 199 1 198 199 1 190 
		200 1 191 201 1 200 201 1 195 202 1 
		201 202 1 196 203 1 202 215 1 197 204 
		1 203 204 1 198 205 1 204 205 1 205 
		199 1 201 206 1 202 207 1 206 207 1 
		207 208 1 204 214 0 208 209 1 209 205 
		1 155 206 1 52 211 1 210 211 1 211 
		212 1 53 212 1 212 154 1 154 206 1 
		212 207 1 211 208 1 210 209 1 199 233 
		1 205 234 1 209 235 1 210 236 1 213 
		208 1 207 216 1 214 209 1 213 214 0 
		215 203 1 216 213 0 215 216 0 216 220 
		1 215 217 1 213 218 1 217 218 0 203 
		218 1 214 219 1 218 221 0 204 219 0 
		217 203 1 203 219 1 220 217 0 220 215 
		1 221 219 0 203 221 1 221 214 1 215 
		196 1 196 204 1 156 222 1 158 223 1 
		222 223 1 223 160 1 163 224 1 160 224 
		1 165 225 1 224 225 0 225 166 0 166 
		222 1 222 226 1 223 226 1 160 226 0 
		224 226 1 225 226 1 166 226 0 194 50 
		1 200 55 1 34 190 1 142 35 1 143 
		36 1 144 37 1 145 38 1 39 146 1 
		41 147 1 148 42 1 151 43 1 44 152 
		1 46 152 1 211 51 1 52 212 1 154 
		53 1 54 155 1 147 56 1 157 156 1 
		159 158 1 162 160 1 164 166 1 150 167 
		1 168 151 1 171 167 1 172 171 1 153 
		173 1 151 173 1 148 175 1 146 175 1 
		143 157 1 159 177 1 161 178 1 180 161 
		1 175 181 1 181 163 1 182 162 1 170 
		182 1 183 170 1 184 174 1 47 172 1 
		182 176 1 142 177 1 186 177 1 187 178 
		1 188 179 1 180 189 1 185 190 1 186 
		191 1 183 193 1 184 48 1 194 192 1 
		193 49 1 196 186 1 188 196 1 197 189 
		1 199 189 1 200 191 1 201 195 1 195 
		215 1 198 204 1 206 202 1 201 155 1 
		206 212 1 207 211 1 210 208 1 233 50 
		1 234 199 1 235 205 1 231 210 1 236 
		209 1 216 202 1 217 213 1 217 216 1 
		221 213 1 158 222 1 225 163 1 216 208 
		1 213 209 1 209 204 1;
	setAttr ".ed[664:675]" 149 43 1 145 164 1 227 
		228 0 229 227 0 230 229 0 231 232 0 
		232 230 0 233 228 0 234 233 0 235 234 
		0 231 236 0 236 235 0;
	setAttr -s 442 ".fc[0:441]" -type "polyFaces" 
		f 3 16 -33 -1 
		mu 0 3 0 2 1 
		f 3 32 8 -18 
		mu 0 3 1 2 3 
		f 3 -2 -34 -19 
		mu 0 3 4 6 5 
		f 3 17 9 33 
		mu 0 3 6 3 5 
		f 3 -3 -35 -20 
		mu 0 3 7 4 8 
		f 3 18 10 34 
		mu 0 3 4 5 8 
		f 3 19 -36 -4 
		mu 0 3 7 8 9 
		f 3 35 11 -21 
		mu 0 3 9 8 10 
		f 3 20 -37 -5 
		mu 0 3 9 10 11 
		f 3 36 12 -22 
		mu 0 3 11 10 12 
		f 3 -6 -38 -23 
		mu 0 3 13 15 14 
		f 3 21 13 37 
		mu 0 3 15 12 14 
		f 3 -7 -39 -24 
		mu 0 3 16 13 17 
		f 3 22 14 38 
		mu 0 3 13 14 17 
		f 3 23 -40 -8 
		mu 0 3 16 17 0 
		f 3 39 15 -17 
		mu 0 3 0 17 2 
		f 3 24 -26 -9 
		mu 0 3 2 18 3 
		f 3 25 -27 -10 
		mu 0 3 3 18 5 
		f 3 26 -28 -11 
		mu 0 3 5 18 8 
		f 3 27 -29 -12 
		mu 0 3 8 18 10 
		f 3 28 -30 -13 
		mu 0 3 10 18 12 
		f 3 29 -31 -14 
		mu 0 3 12 18 14 
		f 3 30 -32 -15 
		mu 0 3 14 18 17 
		f 3 31 -25 -16 
		mu 0 3 17 18 2 
		f 3 40 41 -43 
		mu 0 3 19 20 21 
		f 3 43 -45 -42 
		mu 0 3 20 22 21 
		f 3 45 46 47 
		mu 0 3 23 24 25 
		f 3 -47 -49 -44 
		mu 0 3 25 24 22 
		f 3 49 50 51 
		mu 0 3 26 27 23 
		f 3 -51 -53 -46 
		mu 0 3 23 27 24 
		f 3 53 54 -50 
		mu 0 3 26 28 27 
		f 3 55 -57 -55 
		mu 0 3 28 29 27 
		f 3 57 58 -56 
		mu 0 3 28 30 29 
		f 3 59 -61 -59 
		mu 0 3 30 31 29 
		f 3 61 62 63 
		mu 0 3 32 33 34 
		f 3 -63 -65 -60 
		mu 0 3 34 33 31 
		f 3 65 66 67 
		mu 0 3 35 36 32 
		f 3 -67 -69 -62 
		mu 0 3 32 36 33 
		f 3 69 70 -66 
		mu 0 3 35 19 36 
		f 3 42 -72 -71 
		mu 0 3 19 21 36 
		f 3 44 72 -74 
		mu 0 3 21 22 37 
		f 3 48 74 -73 
		mu 0 3 22 24 37 
		f 3 52 75 -75 
		mu 0 3 24 27 37 
		f 3 56 76 -76 
		mu 0 3 27 29 37 
		f 3 60 77 -77 
		mu 0 3 29 31 37 
		f 3 64 78 -78 
		mu 0 3 31 33 37 
		f 3 68 79 -79 
		mu 0 3 33 36 37 
		f 3 71 73 -80 
		mu 0 3 36 21 37 
		f 3 105 304 132 
		mu 0 3 38 39 40 
		f 3 -105 -103 -305 
		mu 0 3 39 41 40 
		f 3 -81 305 -107 
		mu 0 3 42 41 43 
		f 3 104 -231 -306 
		mu 0 3 41 39 43 
		f 3 -209 306 106 
		mu 0 3 43 44 42 
		f 3 -82 -307 -108 
		mu 0 3 45 42 44 
		f 3 109 307 107 
		mu 0 3 44 46 45 
		f 3 -83 -308 -109 
		mu 0 3 47 45 46 
		f 3 111 308 108 
		mu 0 3 46 48 47 
		f 3 -84 -309 -111 
		mu 0 3 49 47 48 
		f 3 113 309 110 
		mu 0 3 48 50 49 
		f 3 -85 -310 -113 
		mu 0 3 51 49 50 
		f 3 -86 310 -115 
		mu 0 3 52 51 53 
		f 3 112 115 -311 
		mu 0 3 51 50 53 
		f 3 -118 311 118 
		mu 0 3 54 55 56 
		f 3 -87 116 -312 
		mu 0 3 55 57 56 
		f 3 117 312 -88 
		mu 0 3 55 54 58 
		f 3 -313 120 -120 
		mu 0 3 58 54 59 
		f 3 383 -89 119 
		mu 0 3 59 60 58 
		f 3 124 313 121 
		mu 0 3 61 62 60 
		f 3 -90 -314 -124 
		mu 0 3 63 60 62 
		f 3 -91 314 -126 
		mu 0 3 64 63 65 
		f 3 123 126 -315 
		mu 0 3 63 62 65 
		f 3 -128 315 128 
		mu 0 3 66 67 65 
		f 3 -92 125 -316 
		mu 0 3 67 64 65 
		f 3 -93 127 129 
		mu 0 3 68 67 66 
		f 3 251 316 130 
		mu 0 3 69 70 71 
		f 3 -99 -317 -251 
		mu 0 3 72 71 70 
		f 3 -100 317 -254 
		mu 0 3 73 72 74 
		f 3 250 252 -318 
		mu 0 3 72 70 74 
		f 3 254 318 253 
		mu 0 3 74 75 73 
		f 3 -132 -101 -319 
		mu 0 3 75 76 73 
		f 3 -102 319 -133 
		mu 0 3 40 76 38 
		f 3 131 133 -320 
		mu 0 3 76 75 38 
		f 3 134 320 114 
		mu 0 3 53 56 52 
		f 3 -104 -321 -117 
		mu 0 3 57 52 56 
		f 3 -114 136 -136 
		mu 0 3 50 48 77 
		f 3 137 321 -137 
		mu 0 3 48 78 77 
		f 3 -322 139 -139 
		mu 0 3 77 78 79 
		f 3 140 322 -140 
		mu 0 3 78 80 79 
		f 3 -323 142 -142 
		mu 0 3 79 80 81 
		f 3 -143 143 144 
		mu 0 3 81 80 82 
		f 3 145 323 -145 
		mu 0 3 82 83 81 
		f 3 -324 147 -147 
		mu 0 3 81 83 84 
		f 3 188 187 150 
		mu 0 3 85 86 87 
		f 3 -151 324 -153 
		mu 0 3 85 87 88 
		f 3 384 151 -116 
		mu 0 3 50 87 53 
		f 3 135 -155 153 
		mu 0 3 50 77 88 
		f 3 155 -326 -123 
		mu 0 3 59 89 61 
		f 3 -157 325 157 
		mu 0 3 90 61 89 
		f 3 156 326 -125 
		mu 0 3 61 90 62 
		f 3 -327 159 -159 
		mu 0 3 62 90 91 
		f 3 162 327 160 
		mu 0 3 92 93 89 
		f 3 -158 -328 -162 
		mu 0 3 90 89 93 
		f 3 -160 161 -164 
		mu 0 3 91 90 93 
		f 3 168 328 169 
		mu 0 3 94 95 93 
		f 3 -329 166 -166 
		mu 0 3 93 95 96 
		f 3 165 167 163 
		mu 0 3 93 96 91 
		f 3 -163 164 -170 
		mu 0 3 93 92 94 
		f 3 170 329 -167 
		mu 0 3 95 66 96 
		f 3 -330 -129 -172 
		mu 0 3 96 66 65 
		f 3 -127 330 171 
		mu 0 3 65 62 96 
		f 3 -168 -331 158 
		mu 0 3 91 96 62 
		f 3 -174 331 174 
		mu 0 3 97 54 98 
		f 3 -119 172 -332 
		mu 0 3 54 56 98 
		f 3 177 175 -156 
		mu 0 3 59 97 89 
		f 3 -135 332 -173 
		mu 0 3 56 53 98 
		f 3 -152 176 -333 
		mu 0 3 53 87 98 
		f 3 -121 173 -178 
		mu 0 3 59 54 97 
		f 3 -112 333 -138 
		mu 0 3 48 46 78 
		f 3 -334 179 -179 
		mu 0 3 78 46 99 
		f 3 -181 334 181 
		mu 0 3 100 80 99 
		f 3 -141 178 -335 
		mu 0 3 80 78 99 
		f 3 -183 335 183 
		mu 0 3 101 82 100 
		f 3 -144 180 -336 
		mu 0 3 82 80 100 
		f 3 185 336 182 
		mu 0 3 101 102 82 
		f 3 -146 -337 -185 
		mu 0 3 83 82 102 
		f 3 189 337 190 
		mu 0 3 103 98 86 
		f 3 -177 -188 -338 
		mu 0 3 98 87 86 
		f 3 148 338 -148 
		mu 0 3 83 86 84 
		f 3 -339 -189 -150 
		mu 0 3 84 86 85 
		f 3 186 339 184 
		mu 0 3 102 103 83 
		f 3 -191 -149 -340 
		mu 0 3 103 86 83 
		f 3 -193 340 -187 
		mu 0 3 102 92 103 
		f 3 -161 191 -341 
		mu 0 3 92 89 103 
		f 3 194 341 192 
		mu 0 3 102 104 92 
		f 3 -165 -342 -194 
		mu 0 3 94 92 104 
		f 3 196 342 193 
		mu 0 3 104 105 94 
		f 3 -169 -343 -196 
		mu 0 3 95 94 105 
		f 3 197 343 195 
		mu 0 3 105 68 95 
		f 3 -171 -344 -130 
		mu 0 3 66 95 68 
		f 3 -190 344 -175 
		mu 0 3 98 103 97 
		f 3 -192 -176 -345 
		mu 0 3 103 89 97 
		f 3 -110 345 -180 
		mu 0 3 46 44 99 
		f 3 -346 199 -199 
		mu 0 3 99 44 106 
		f 3 201 346 198 
		mu 0 3 106 107 99 
		f 3 -182 -347 -201 
		mu 0 3 100 99 107 
		f 3 202 347 200 
		mu 0 3 107 108 100 
		f 3 -184 -348 -204 
		mu 0 3 101 100 108 
		f 3 205 348 203 
		mu 0 3 108 109 101 
		f 3 -186 -349 -205 
		mu 0 3 102 101 109 
		f 3 -195 349 -207 
		mu 0 3 104 102 110 
		f 3 204 207 -350 
		mu 0 3 102 109 110 
		f 3 -210 350 210 
		mu 0 3 111 106 43 
		f 3 -200 208 -351 
		mu 0 3 106 44 43 
		f 3 -222 351 211 
		mu 0 3 112 107 111 
		f 3 -202 209 -352 
		mu 0 3 107 106 111 
		f 3 -197 352 -214 
		mu 0 3 105 104 113 
		f 3 212 214 -353 
		mu 0 3 104 114 113 
		f 3 -198 353 -94 
		mu 0 3 68 105 115 
		f 3 213 215 -354 
		mu 0 3 105 113 115 
		f 3 206 216 -213 
		mu 0 3 104 110 114 
		f 3 218 354 228 
		mu 0 3 116 117 114 
		f 3 -215 -355 -218 
		mu 0 3 113 114 117 
		f 3 -216 355 -95 
		mu 0 3 115 113 118 
		f 3 217 219 -356 
		mu 0 3 113 117 118 
		f 3 303 -96 -220 
		mu 0 3 117 119 118 
		f 3 223 356 221 
		mu 0 3 112 120 107 
		f 3 -203 -357 -223 
		mu 0 3 108 107 120 
		f 3 -225 357 225 
		mu 0 3 121 109 120 
		f 3 -206 222 -358 
		mu 0 3 109 108 120 
		f 3 224 358 -208 
		mu 0 3 109 121 110 
		f 3 -359 227 -227 
		mu 0 3 110 121 122 
		f 3 229 359 226 
		mu 0 3 122 116 110 
		f 3 -217 -360 -229 
		mu 0 3 114 110 116 
		f 3 230 360 -211 
		mu 0 3 43 39 111 
		f 3 -361 232 -232 
		mu 0 3 111 39 123 
		f 3 231 361 -212 
		mu 0 3 111 123 112 
		f 3 -362 234 -234 
		mu 0 3 112 123 124 
		f 3 -224 362 285 
		mu 0 3 120 112 125 
		f 3 233 236 -363 
		mu 0 3 112 124 125 
		f 3 -226 286 -238 
		mu 0 3 121 120 126 
		f 3 -240 363 240 
		mu 0 3 127 122 126 
		f 3 -228 237 -364 
		mu 0 3 122 121 126 
		f 3 -230 239 241 
		mu 0 3 116 122 127 
		f 3 242 364 -235 
		mu 0 3 123 128 124 
		f 3 -365 244 -244 
		mu 0 3 124 128 129 
		f 3 -268 271 278 
		mu 0 3 130 125 131 
		f 3 -239 279 -278 
		mu 0 3 126 130 132 
		f 3 265 382 246 
		mu 0 3 133 134 126 
		f 3 -243 365 249 
		mu 0 3 128 123 38 
		f 3 -106 -366 -233 
		mu 0 3 39 38 123 
		f 3 255 -250 -134 
		mu 0 3 75 128 38 
		f 3 -245 366 256 
		mu 0 3 129 128 74 
		f 3 -255 -367 -256 
		mu 0 3 75 74 128 
		f 3 -246 367 257 
		mu 0 3 135 129 70 
		f 3 -257 -253 -368 
		mu 0 3 129 74 70 
		f 3 -252 368 -258 
		mu 0 3 70 69 135 
		f 3 258 -248 -369 
		mu 0 3 69 134 135 
		f 3 259 369 -221 
		mu 0 3 116 136 119 
		f 3 -370 666 -97 
		mu 0 3 119 136 137 
		f 3 260 370 -242 
		mu 0 3 127 138 116 
		f 3 -371 667 -260 
		mu 0 3 116 138 136 
		f 3 261 371 -249 
		mu 0 3 134 139 127 
		f 3 -372 668 -261 
		mu 0 3 127 139 138 
		f 3 -98 372 -131 
		mu 0 3 71 140 69 
		f 3 669 -263 -373 
		mu 0 3 140 141 69 
		f 3 262 373 -259 
		mu 0 3 69 141 134 
		f 3 -374 670 -262 
		mu 0 3 134 141 139 
		f 3 380 -264 -269 
		mu 0 3 142 135 143 
		f 3 381 -266 -267 
		mu 0 3 143 134 133 
		f 3 264 374 243 
		mu 0 3 129 142 124 
		f 3 -237 -375 -270 
		mu 0 3 125 124 142 
		f 3 269 270 281 
		mu 0 3 125 142 144 
		f 3 -274 375 272 
		mu 0 3 145 131 143 
		f 3 -376 376 268 
		mu 0 3 143 131 142 
		f 3 -377 -281 -271 
		mu 0 3 142 131 144 
		f 3 284 275 -283 
		mu 0 3 146 133 132 
		f 3 -247 277 -276 
		mu 0 3 133 126 132 
		f 3 -279 273 -275 
		mu 0 3 130 131 145 
		f 3 -280 283 282 
		mu 0 3 132 130 146 
		f 3 -282 280 -272 
		mu 0 3 125 144 131 
		f 3 -284 274 276 
		mu 0 3 146 130 145 
		f 3 -285 377 266 
		mu 0 3 133 146 143 
		f 3 -378 -277 -273 
		mu 0 3 143 146 145 
		f 3 -286 267 -236 
		mu 0 3 120 125 130 
		f 3 -287 235 238 
		mu 0 3 126 120 130 
		f 3 138 378 -288 
		mu 0 3 77 79 147 
		f 3 288 -290 -379 
		mu 0 3 79 148 147 
		f 3 141 -291 -289 
		mu 0 3 79 81 148 
		f 3 146 291 -293 
		mu 0 3 81 84 149 
		f 3 293 379 149 
		mu 0 3 85 150 84 
		f 3 -380 -295 -292 
		mu 0 3 84 150 149 
		f 3 152 -296 -294 
		mu 0 3 85 88 150 
		f 3 154 287 -297 
		mu 0 3 88 77 147 
		f 3 289 298 -298 
		mu 0 3 147 148 151 
		f 3 290 299 -299 
		mu 0 3 148 81 151 
		f 3 292 300 -300 
		mu 0 3 81 149 151 
		f 3 294 301 -301 
		mu 0 3 149 150 151 
		f 3 295 302 -302 
		mu 0 3 150 88 151 
		f 3 296 297 -303 
		mu 0 3 88 147 151 
		f 3 -219 220 -304 
		mu 0 3 117 116 119 
		f 3 245 -381 -265 
		mu 0 3 129 135 142 
		f 3 247 -382 263 
		mu 0 3 135 134 143 
		f 3 -383 248 -241 
		mu 0 3 126 134 127 
		f 3 -122 -384 122 
		mu 0 3 61 60 59 
		f 3 -325 -385 -154 
		mu 0 3 88 87 50 
		f 3 -414 -586 -387 
		mu 0 3 152 153 154 
		f 3 585 102 385 
		mu 0 3 154 153 41 
		f 3 387 -587 80 
		mu 0 3 42 155 41 
		f 3 586 511 -386 
		mu 0 3 41 155 154 
		f 3 -388 -588 489 
		mu 0 3 155 42 156 
		f 3 388 587 81 
		mu 0 3 45 156 42 
		f 3 -389 -589 -391 
		mu 0 3 156 45 157 
		f 3 389 588 82 
		mu 0 3 47 157 45 
		f 3 -390 -590 -393 
		mu 0 3 157 47 158 
		f 3 391 589 83 
		mu 0 3 49 158 47 
		f 3 -392 -591 -395 
		mu 0 3 158 49 159 
		f 3 393 590 84 
		mu 0 3 51 159 49 
		f 3 395 -592 85 
		mu 0 3 52 160 51 
		f 3 591 -397 -394 
		mu 0 3 51 160 159 
		f 3 -400 -593 398 
		mu 0 3 161 162 55 
		f 3 592 -398 86 
		mu 0 3 55 162 57 
		f 3 87 -594 -399 
		mu 0 3 55 58 161 
		f 3 400 -402 593 
		mu 0 3 58 163 161 
		f 3 -401 88 -665 
		mu 0 3 163 58 60 
		f 3 -403 -595 -406 
		mu 0 3 164 60 165 
		f 3 404 594 89 
		mu 0 3 63 165 60 
		f 3 406 -596 90 
		mu 0 3 64 166 63 
		f 3 595 -408 -405 
		mu 0 3 63 166 165 
		f 3 -410 -597 408 
		mu 0 3 167 166 67 
		f 3 596 -407 91 
		mu 0 3 67 166 64 
		f 3 -411 -409 92 
		mu 0 3 68 167 67 
		f 3 -412 -598 -533 
		mu 0 3 168 169 170 
		f 3 531 597 98 
		mu 0 3 171 170 169 
		f 3 534 -599 99 
		mu 0 3 172 173 171 
		f 3 598 -534 -532 
		mu 0 3 171 173 170 
		f 3 -535 -600 -536 
		mu 0 3 173 172 174 
		f 3 599 100 412 
		mu 0 3 174 172 175 
		f 3 413 -601 101 
		mu 0 3 153 152 175 
		f 3 600 -415 -413 
		mu 0 3 175 152 174 
		f 3 -396 -602 -416 
		mu 0 3 160 52 162 
		f 3 397 601 103 
		mu 0 3 57 162 52 
		f 3 416 -418 394 
		mu 0 3 159 176 158 
		f 3 417 -603 -419 
		mu 0 3 158 176 177 
		f 3 419 -421 602 
		mu 0 3 176 178 177 
		f 3 420 -604 -422 
		mu 0 3 177 178 179 
		f 3 422 -424 603 
		mu 0 3 178 180 179 
		f 3 -426 -425 423 
		mu 0 3 180 181 179 
		f 3 425 -605 -427 
		mu 0 3 181 180 182 
		f 3 427 -429 604 
		mu 0 3 180 183 182 
		f 3 -432 -469 -470 
		mu 0 3 184 185 186 
		f 3 433 -606 431 
		mu 0 3 184 187 185 
		f 3 396 -433 -666 
		mu 0 3 159 160 185 
		f 3 -435 435 -417 
		mu 0 3 159 187 176 
		f 3 403 606 -437 
		mu 0 3 163 164 188 
		f 3 -439 -607 437 
		mu 0 3 189 188 164 
		f 3 405 -608 -438 
		mu 0 3 164 165 189 
		f 3 439 -441 607 
		mu 0 3 165 190 189 
		f 3 -442 -609 -444 
		mu 0 3 191 188 192 
		f 3 442 608 438 
		mu 0 3 189 192 188 
		f 3 444 -443 440 
		mu 0 3 190 192 189 
		f 3 -451 -610 -450 
		mu 0 3 193 192 194 
		f 3 446 -448 609 
		mu 0 3 192 195 194 
		f 3 -445 -449 -447 
		mu 0 3 192 190 195 
		f 3 450 -446 443 
		mu 0 3 192 193 191 
		f 3 447 -611 -452 
		mu 0 3 194 195 167 
		f 3 452 409 610 
		mu 0 3 195 166 167 
		f 3 -453 -612 407 
		mu 0 3 166 195 165 
		f 3 -440 611 448 
		mu 0 3 190 165 195 
		f 3 -456 -613 454 
		mu 0 3 196 197 161 
		f 3 612 -454 399 
		mu 0 3 161 197 162 
		f 3 436 -457 -459 
		mu 0 3 163 188 196 
		f 3 453 -614 415 
		mu 0 3 162 197 160 
		f 3 613 -458 432 
		mu 0 3 160 197 185 
		f 3 458 -455 401 
		mu 0 3 163 196 161 
		f 3 418 -615 392 
		mu 0 3 158 177 157 
		f 3 459 -461 614 
		mu 0 3 177 198 157 
		f 3 -463 -616 461 
		mu 0 3 199 198 179 
		f 3 615 -460 421 
		mu 0 3 179 198 177 
		f 3 -465 -617 463 
		mu 0 3 200 199 181 
		f 3 616 -462 424 
		mu 0 3 181 199 179 
		f 3 -464 -618 -467 
		mu 0 3 200 181 201 
		f 3 465 617 426 
		mu 0 3 182 201 181 
		f 3 -472 -619 -471 
		mu 0 3 202 186 197 
		f 3 618 468 457 
		mu 0 3 197 186 185 
		f 3 428 -620 -430 
		mu 0 3 182 183 186 
		f 3 430 469 619 
		mu 0 3 183 184 186 
		f 3 -466 -621 -468 
		mu 0 3 201 182 202 
		f 3 620 429 471 
		mu 0 3 202 182 186 
		f 3 467 -622 473 
		mu 0 3 201 202 191 
		f 3 621 -473 441 
		mu 0 3 191 202 188 
		f 3 -474 -623 -476 
		mu 0 3 201 191 203 
		f 3 474 622 445 
		mu 0 3 193 203 191 
		f 3 -475 -624 -478 
		mu 0 3 203 193 204 
		f 3 476 623 449 
		mu 0 3 194 204 193 
		f 3 -477 -625 -479 
		mu 0 3 204 194 68 
		f 3 410 624 451 
		mu 0 3 167 68 194 
		f 3 455 -626 470 
		mu 0 3 197 196 202 
		f 3 625 456 472 
		mu 0 3 202 196 188 
		f 3 460 -627 390 
		mu 0 3 157 198 156 
		f 3 479 -481 626 
		mu 0 3 198 205 156 
		f 3 -480 -628 -483 
		mu 0 3 205 198 206 
		f 3 481 627 462 
		mu 0 3 199 206 198 
		f 3 -482 -629 -484 
		mu 0 3 206 199 207 
		f 3 484 628 464 
		mu 0 3 200 207 199 
		f 3 -485 -630 -487 
		mu 0 3 207 200 208 
		f 3 485 629 466 
		mu 0 3 201 208 200 
		f 3 487 -631 475 
		mu 0 3 203 209 201 
		f 3 630 -489 -486 
		mu 0 3 201 209 208 
		f 3 -492 -632 490 
		mu 0 3 210 155 205 
		f 3 631 -490 480 
		mu 0 3 205 155 156 
		f 3 -493 -633 502 
		mu 0 3 211 210 206 
		f 3 632 -491 482 
		mu 0 3 206 210 205 
		f 3 494 -634 477 
		mu 0 3 204 212 203 
		f 3 633 -496 -494 
		mu 0 3 203 212 213 
		f 3 93 -635 478 
		mu 0 3 68 115 204 
		f 3 634 -497 -495 
		mu 0 3 204 115 212 
		f 3 493 -498 -488 
		mu 0 3 203 213 209 
		f 3 -510 -636 -500 
		mu 0 3 214 213 215 
		f 3 498 635 495 
		mu 0 3 212 215 213 
		f 3 94 -637 496 
		mu 0 3 115 118 212 
		f 3 636 -501 -499 
		mu 0 3 212 118 215 
		f 3 500 95 -585 
		mu 0 3 215 118 119 
		f 3 -503 -638 -505 
		mu 0 3 211 206 216 
		f 3 503 637 483 
		mu 0 3 207 216 206 
		f 3 -507 -639 505 
		mu 0 3 217 216 208 
		f 3 638 -504 486 
		mu 0 3 208 216 207 
		f 3 488 -640 -506 
		mu 0 3 208 209 217 
		f 3 507 -509 639 
		mu 0 3 209 218 217 
		f 3 -508 -641 -511 
		mu 0 3 218 209 214 
		f 3 509 640 497 
		mu 0 3 213 214 209 
		f 3 491 -642 -512 
		mu 0 3 155 210 154 
		f 3 512 -514 641 
		mu 0 3 210 219 154 
		f 3 492 -643 -513 
		mu 0 3 210 211 219 
		f 3 514 -516 642 
		mu 0 3 211 220 219 
		f 3 -567 -644 504 
		mu 0 3 216 221 211 
		f 3 643 -518 -515 
		mu 0 3 211 221 220 
		f 3 518 -568 506 
		mu 0 3 217 222 216 
		f 3 -522 -645 520 
		mu 0 3 223 222 218 
		f 3 644 -519 508 
		mu 0 3 218 222 217 
		f 3 -523 -521 510 
		mu 0 3 214 223 218 
		f 3 515 -646 -524 
		mu 0 3 219 220 224 
		f 3 524 -526 645 
		mu 0 3 220 225 224 
		f 3 -560 -553 548 
		mu 0 3 226 227 221 
		f 3 558 -561 519 
		mu 0 3 222 228 226 
		f 3 -528 -664 -547 
		mu 0 3 229 222 230 
		f 3 -531 -647 523 
		mu 0 3 224 152 219 
		f 3 513 646 386 
		mu 0 3 154 219 152 
		f 3 414 530 -537 
		mu 0 3 174 152 224 
		f 3 -538 -648 525 
		mu 0 3 225 173 224 
		f 3 536 647 535 
		mu 0 3 174 224 173 
		f 3 -539 -649 526 
		mu 0 3 231 170 225 
		f 3 648 533 537 
		mu 0 3 225 170 173 
		f 3 538 -650 532 
		mu 0 3 170 231 168 
		f 3 649 528 -540 
		mu 0 3 168 231 230 
		f 3 501 -651 -541 
		mu 0 3 214 119 232 
		f 3 96 -672 650 
		mu 0 3 119 137 232 
		f 3 522 -652 -542 
		mu 0 3 223 214 233 
		f 3 540 -673 651 
		mu 0 3 214 232 233 
		f 3 529 -653 -543 
		mu 0 3 230 223 234 
		f 3 541 -674 652 
		mu 0 3 223 233 234 
		f 3 411 -654 97 
		mu 0 3 169 168 235 
		f 3 653 543 -675 
		mu 0 3 235 168 236 
		f 3 539 -655 -544 
		mu 0 3 168 230 236 
		f 3 542 -676 654 
		mu 0 3 230 234 236 
		f 3 549 544 -662 
		mu 0 3 237 238 231 
		f 3 547 546 -663 
		mu 0 3 238 229 230 
		f 3 -525 -656 -546 
		mu 0 3 225 220 237 
		f 3 550 655 517 
		mu 0 3 221 237 220 
		f 3 -563 -552 -551 
		mu 0 3 221 239 237 
		f 3 -554 -657 554 
		mu 0 3 240 238 227 
		f 3 -550 -658 656 
		mu 0 3 238 237 227 
		f 3 551 561 657 
		mu 0 3 237 239 227 
		f 3 563 -557 -566 
		mu 0 3 241 228 229 
		f 3 556 -559 527 
		mu 0 3 229 228 222 
		f 3 555 -555 559 
		mu 0 3 226 240 227 
		f 3 -564 -565 560 
		mu 0 3 228 241 226 
		f 3 552 -562 562 
		mu 0 3 221 227 239 
		f 3 -558 -556 564 
		mu 0 3 241 240 226 
		f 3 -548 -659 565 
		mu 0 3 229 238 241 
		f 3 553 557 658 
		mu 0 3 238 240 241 
		f 3 516 -549 566 
		mu 0 3 216 226 221 
		f 3 -520 -517 567 
		mu 0 3 222 226 216 
		f 3 568 -660 -420 
		mu 0 3 176 242 178 
		f 3 659 570 -570 
		mu 0 3 178 242 243 
		f 3 569 571 -423 
		mu 0 3 178 243 180 
		f 3 573 -573 -428 
		mu 0 3 180 244 183 
		f 3 -431 -661 -575 
		mu 0 3 184 183 245 
		f 3 572 575 660 
		mu 0 3 183 244 245 
		f 3 574 576 -434 
		mu 0 3 184 245 187 
		f 3 577 -569 -436 
		mu 0 3 187 242 176 
		f 3 578 -580 -571 
		mu 0 3 242 246 243 
		f 3 579 -581 -572 
		mu 0 3 243 246 180 
		f 3 580 -582 -574 
		mu 0 3 180 246 244 
		f 3 581 -583 -576 
		mu 0 3 244 246 245 
		f 3 582 -584 -577 
		mu 0 3 245 246 187 
		f 3 583 -579 -578 
		mu 0 3 187 246 242 
		f 3 584 -502 499 
		mu 0 3 215 119 214 
		f 3 545 661 -527 
		mu 0 3 225 237 231 
		f 3 -545 662 -529 
		mu 0 3 231 238 230 
		f 3 521 -530 663 
		mu 0 3 222 223 230 
		f 3 -404 664 402 
		mu 0 3 164 163 60 
		f 3 434 665 605 
		mu 0 3 187 159 185 ;
createNode transform -n "thumb_left" -p "itguy";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode mesh -n "thumb_leftShape" -p "thumb_left";
	setAttr -k off ".v";
	setAttr -s 6 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
createNode mesh -n "thumb_leftShapeOrig" -p "thumb_left";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 35 ".uvst[0].uvsp[0:34]" -type "float2" 0.60042 
		0.35057855 0.59048653 0.35066199 0.59705782 0.33831906 0.58902359 0.33831906 
		0.59364653 0.3255426 0.70766342 0.52057415 0.67423487 0.51529914 0.69987559 
		0.5025816 0.68221736 0.49185118 0.63891119 0.46872026 0.64727992 0.47061509 
		0.63892198 0.48033395 0.64726698 0.48298413 0.71545619 0.44370398 0.70619673 
		0.46539328 0.68046534 0.45931149 0.68690181 0.47368187 0.66514939 0.46958789 
		0.6102578 0.3548283 0.61447692 0.33651927 0.62171817 0.35320893 0.62539041 
		0.33651927 0.66678184 0.48263735 0.58553362 0.3255426 0.66162324 0.50236994 
		0.66374528 0.48592958 0.61974072 0.31473765 0.62605321 0.31473765 0.58931208 
		0.31298092 0.58517456 0.31298092 0.64552808 0.48446596 0.64502466 0.49626639 
		0.71623236 0.4545916 0.59028578 0.35991251 0.60068607 0.35673976;
	setAttr ".cuvs" -type "string" "map1";
	setAttr -s 17 ".vt[0:16]"  2.3896031 4.2483697 0.074688561 
		2.4817381 4.2384262 0.11507059 2.4817383 4.298811 0.10994403 2.3896034 4.3240805 
		0.078071378 2.5876541 4.299006 0.097725399 2.5876541 4.2052274 0.073607929 
		2.577765 4.2731719 0.14429918 2.5777652 4.2121973 0.13692334 2.6739938 4.2537723 
		0.1034191 2.6739941 4.1995344 0.096252531 2.6721745 4.2405972 0.14774019 
		2.6721747 4.2094998 0.14164856 2.3480847 4.2529721 0.0058960537 2.5214996 
		4.2367821 0.024522031 2.5150805 4.3352585 0.059178557 2.3480854 4.3958035 
		-0.00068699085 2.3426704 4.3271332 0.038237274;
	setAttr -s 43 ".ed[0:42]"  12 0 1 13 1 
		1 0 1 0 15 3 1 3 2 1 0 
		3 1 14 4 0 13 5 0 4 5 1 
		2 6 1 4 6 1 1 7 1 6 7 
		1 5 7 1 4 8 0 5 9 0 8 
		9 1 6 10 1 8 10 1 7 11 1 
		10 11 0 9 11 0 16 3 1 0 2 
		1 3 14 1 4 2 1 1 6 1 1 
		2 1 13 0 1 8 11 1 2 14 1 
		4 13 1 5 1 1 8 5 1 6 8 
		1 7 10 1 5 11 1 0 16 1 12 
		13 0 15 14 0 13 14 0 15 16 0 
		16 12 0;
	setAttr -s 27 ".fc[0:26]" -type "polyFaces" 
		f 3 -6 23 -5 
		mu 0 3 0 1 2 
		f 3 2 27 -24 
		mu 0 3 1 3 2 
		f 3 -28 26 -10 
		mu 0 3 2 3 4 
		f 3 38 28 -1 
		mu 0 3 5 6 7 
		f 3 -29 1 -3 
		mu 0 3 7 6 8 
		f 3 -17 29 -22 
		mu 0 3 9 10 11 
		f 3 -30 18 20 
		mu 0 3 11 10 12 
		f 3 3 24 -40 
		mu 0 3 13 14 15 
		f 3 4 30 -25 
		mu 0 3 14 16 15 
		f 3 -31 -26 -7 
		mu 0 3 15 16 17 
		f 3 6 31 40 
		mu 0 3 18 19 20 
		f 3 -32 8 -8 
		mu 0 3 20 19 21 
		f 3 -11 25 9 
		mu 0 3 22 17 16 
		f 3 11 -13 -27 
		mu 0 3 3 23 4 
		f 3 7 32 -2 
		mu 0 3 6 24 8 
		f 3 -33 13 -12 
		mu 0 3 8 24 25 
		f 3 14 33 -9 
		mu 0 3 19 26 21 
		f 3 -34 16 -16 
		mu 0 3 21 26 27 
		f 3 10 34 -15 
		mu 0 3 17 22 10 
		f 3 -35 17 -19 
		mu 0 3 10 22 12 
		f 3 12 35 -18 
		mu 0 3 4 23 28 
		f 3 -36 19 -21 
		mu 0 3 28 23 29 
		f 3 -14 36 -20 
		mu 0 3 25 24 30 
		f 3 -37 15 21 
		mu 0 3 30 24 31 
		f 3 41 22 -4 
		mu 0 3 13 32 14 
		f 3 0 37 42 
		mu 0 3 33 1 34 
		f 3 -38 5 -23 
		mu 0 3 34 1 0 ;
createNode transform -n "index_left" -p "itguy";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode mesh -n "index_leftShape" -p "index_left";
	setAttr -k off ".v";
	setAttr -s 6 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
createNode mesh -n "index_leftShapeOrig" -p "index_left";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 30 ".uvst[0].uvsp[0:29]" -type "float2" 0.5989089 
		0.44504735 0.59916866 0.43677875 0.60514766 0.44477463 0.6054005 0.43672973 
		0.66593087 0.35001561 0.65009493 0.35228327 0.65356535 0.34793195 0.66282135 
		0.43154988 0.66219926 0.45133176 0.65655333 0.43388712 0.65608633 0.44872907 
		0.64740151 0.34331095 0.63621503 0.34159875 0.64698511 0.3400254 0.65492523 
		0.53222775 0.63005984 0.52797937 0.65519106 0.51160938 0.63028049 0.5108313 
		0.66411781 0.33129287 0.65686613 0.33002886 0.63089496 0.43780035 0.63061184 
		0.44680437 0.6386385 0.32746238 0.64498329 0.32650799 0.60560501 0.52245426 
		0.60578465 0.50849748 0.66396219 0.31219274 0.66782981 0.31286681 0.6399793 
		0.31304109 0.63659483 0.31355008;
	setAttr ".cuvs" -type "string" "map1";
	setAttr -s 14 ".vt[0:13]"  2.6346967 4.4036198 -0.029226327 
		2.634697 4.3922338 0.024006685 2.7493529 4.3309016 -0.026420914 2.7493532 
		4.3160543 0.039522104 2.7580643 4.3808722 -0.0067676776 2.7580636 4.3739634 
		0.025526913 2.8763273 4.3053241 -0.0063890256 2.8763273 4.2974052 0.047281932 
		2.8809726 4.3319736 0.007797963 2.8809721 4.32829 0.036652122 2.6203377 4.318409 
		-0.0415232 2.6047111 4.4275331 -0.038306966 2.6047113 4.3960352 0.032643501 
		2.620338 4.2939363 0.037764866;
	setAttr -s 35 ".ed[0:34]"  11 0 0 0 10 
		1 12 1 1 1 0 1 13 1 1 10 
		2 1 13 3 0 2 3 1 0 4 1 
		4 2 1 1 5 1 5 4 1 3 5 
		1 2 6 0 3 7 0 6 7 1 4 
		8 1 8 6 1 5 9 1 9 8 1 
		7 9 0 6 9 1 12 0 1 2 13 
		1 0 2 1 1 4 1 3 1 1 6 
		3 1 8 2 1 5 8 1 3 9 1 
		11 10 0 12 11 0 13 12 0 10 13 
		0;
	setAttr -s 22 ".fc[0:21]" -type "polyFaces" 
		f 3 -16 21 -21 
		mu 0 3 0 1 2 
		f 3 -22 -18 -20 
		mu 0 3 2 1 3 
		f 3 -32 0 1 
		mu 0 3 4 5 6 
		f 3 -33 22 -1 
		mu 0 3 7 8 9 
		f 3 -23 2 3 
		mu 0 3 9 8 10 
		f 3 -34 4 -3 
		mu 0 3 11 12 13 
		f 3 5 23 -35 
		mu 0 3 14 15 16 
		f 3 -24 7 -7 
		mu 0 3 16 15 17 
		f 3 -2 24 -6 
		mu 0 3 4 6 18 
		f 3 -25 8 9 
		mu 0 3 18 6 19 
		f 3 -4 25 -9 
		mu 0 3 9 10 20 
		f 3 -26 10 11 
		mu 0 3 20 10 21 
		f 3 6 26 -5 
		mu 0 3 12 22 13 
		f 3 -27 12 -11 
		mu 0 3 13 22 23 
		f 3 13 27 -8 
		mu 0 3 15 24 17 
		f 3 -28 15 -15 
		mu 0 3 17 24 25 
		f 3 16 28 -10 
		mu 0 3 19 26 18 
		f 3 -29 17 -14 
		mu 0 3 18 26 27 
		f 3 -12 29 -17 
		mu 0 3 20 21 3 
		f 3 -30 18 19 
		mu 0 3 3 21 2 
		f 3 -13 30 -19 
		mu 0 3 23 22 28 
		f 3 -31 14 20 
		mu 0 3 28 22 29 ;
createNode transform -n "hand_left" -p "itguy";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode mesh -n "hand_leftShape" -p "|itguy|hand_left";
	setAttr -k off ".v";
	setAttr -s 6 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
createNode mesh -n "hand_leftShapeOrig" -p "|itguy|hand_left";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 51 ".uvst[0].uvsp[0:50]" -type "float2" 0.71545619 
		0.44370398 0.68046534 0.45931149 0.67652738 0.45055771 0.64773422 0.35089707 
		0.64074236 0.35313168 0.64740151 0.34331095 0.67902458 0.37949067 0.71712929 
		0.39049345 0.67681295 0.41799092 0.71634519 0.41542321 0.66706336 0.58328396 
		0.70695376 0.57564187 0.67117846 0.59636563 0.70678556 0.58869898 0.70730138 
		0.54866338 0.68417037 0.54836529 0.65438306 0.57429409 0.65418208 0.58990574 
		0.65707493 0.59964776 0.66371083 0.40326008 0.66282135 0.43154988 0.63621503 
		0.34159875 0.66219926 0.45133176 0.67423487 0.51529914 0.65519106 0.51160938 
		0.65492523 0.53222775 0.70766342 0.52057415 0.62995225 0.35242838 0.7175765 
		0.37626269 0.67991 0.36635962 0.66486955 0.36640894 0.66455781 0.37632635 
		0.65463817 0.55452704 0.72199178 0.32970521 0.72239906 0.29048678 0.73777092 
		0.32734182 0.73806578 0.28777814 0.7187683 0.55881339 0.71934956 0.51620442 
		0.73443526 0.55610484 0.73517299 0.51936436 0.72142732 0.44526726 0.72199899 
		0.41476753 0.73703265 0.4454883 0.73763508 0.41647935 0.73782051 0.38724092 
		0.7222029 0.39116949 0.72207677 0.36165723 0.7376985 0.35438484 0.73590618 
		0.48686743 0.72168034 0.47947106;
	setAttr ".cuvs" -type "string" "map1";
	setAttr -s 34 ".vt[0:33]"  2.2803197 4.4127316 -0.097350962 
		2.2803197 4.385879 -0.19616672 2.2803197 4.385879 -0.019124905 2.2801902 
		4.3096504 0.013277275 2.2800267 4.2672868 -0.019124944 2.2800262 4.2365685 
		-0.097351 2.2800267 4.2672868 -0.19616675 2.2801902 4.3096499 -0.22174995 
		2.5354753 4.3990693 0.028256126 2.3480854 4.4014225 -0.19153486 2.5342042 
		4.4099078 -0.2266665 2.3480854 4.2682219 -0.2058654 2.5540924 4.2863317 -0.23722428 
		2.3480854 4.4161711 -0.10212018 2.5390487 4.440465 -0.088466413 2.4678576 
		4.2873702 -0.10212046 2.3480854 4.2523909 -0.10212031 2.3480854 4.3342805 
		-0.24257536 2.5319147 4.3526902 -0.27381626 2.3480854 4.3958035 -0.00068705768 
		2.5150805 4.3352585 0.059178494 2.620338 4.2939348 -0.26332322 2.6203384 
		4.3048401 -0.2032876 2.6047115 4.3833222 -0.27194542 2.6047113 4.4275341 
		-0.038306709 2.6047113 4.426219 -0.13977233 2.620338 4.2939358 0.037764847 
		2.6047113 4.3960352 0.032643717 2.620338 4.318409 -0.041523259 2.5214996 
		4.2367821 0.024522005 2.3480854 4.2529731 0.0058959196 2.6047108 4.4170089 
		-0.23637491 2.620338 4.3147197 -0.12727344 2.3426707 4.3271337 0.038237225;
	setAttr -s 82 ".ed[0:81]"  0 1 0 2 0 
		0 3 2 0 4 3 0 5 4 0 6 
		5 0 7 6 0 1 7 0 19 8 1 
		9 10 1 11 12 1 19 13 1 8 14 
		1 9 17 1 10 18 1 11 16 1 12 
		15 1 12 21 1 29 26 0 10 31 1 
		8 27 1 13 9 1 14 10 1 13 14 
		1 14 24 1 15 29 1 28 15 1 16 
		30 1 15 16 1 20 26 1 17 11 1 
		18 12 1 17 18 1 18 23 1 32 15 
		1 22 12 1 25 14 1 25 10 1 11 
		6 1 16 5 1 30 4 1 19 2 1 
		13 0 1 9 1 1 17 7 1 3 33 
		1 27 20 1 20 8 1 9 14 1 11 
		18 1 12 16 1 21 18 1 14 19 1 
		8 24 1 15 26 1 16 29 1 10 17 
		1 10 23 1 22 15 1 16 6 1 30 
		5 1 13 2 1 0 9 1 17 1 1 
		11 7 1 33 2 1 3 30 1 19 20 
		0 21 22 0 23 21 0 24 25 0 26 
		27 0 27 24 0 28 26 0 30 29 0 
		29 20 0 31 23 0 32 28 0 22 32 
		0 25 31 0 19 33 0 33 30 0;
	setAttr -s 47 ".fc[0:46]" -type "polyFaces" 
		f 3 67 47 -9 
		mu 0 3 0 1 2 
		f 3 -48 -47 -21 
		mu 0 3 3 4 5 
		f 3 -10 48 22 
		mu 0 3 6 7 8 
		f 3 -49 -22 23 
		mu 0 3 8 7 9 
		f 3 -11 49 31 
		mu 0 3 10 11 12 
		f 3 -50 -31 32 
		mu 0 3 12 11 13 
		f 3 10 50 -16 
		mu 0 3 11 10 14 
		f 3 -51 16 28 
		mu 0 3 14 10 15 
		f 3 35 17 68 
		mu 0 3 16 10 17 
		f 3 69 51 33 
		mu 0 3 18 17 12 
		f 3 -52 -18 -32 
		mu 0 3 12 17 10 
		f 3 36 24 70 
		mu 0 3 19 8 20 
		f 3 71 46 29 
		mu 0 3 21 5 4 
		f 3 12 52 8 
		mu 0 3 2 8 0 
		f 3 -53 -24 -12 
		mu 0 3 0 8 9 
		f 3 -13 53 -25 
		mu 0 3 8 2 20 
		f 3 -54 20 72 
		mu 0 3 20 2 22 
		f 3 -26 54 -19 
		mu 0 3 23 15 24 
		f 3 -55 -27 73 
		mu 0 3 24 15 25 
		f 3 -28 55 -75 
		mu 0 3 26 14 23 
		f 3 -56 -29 25 
		mu 0 3 23 14 15 
		f 3 -30 -76 18 
		mu 0 3 21 4 27 
		f 3 9 56 -14 
		mu 0 3 7 6 28 
		f 3 -57 14 -33 
		mu 0 3 28 6 29 
		f 3 -15 57 -34 
		mu 0 3 29 6 30 
		f 3 -58 19 76 
		mu 0 3 30 6 31 
		f 3 -35 77 26 
		mu 0 3 15 32 25 
		f 3 -36 58 -17 
		mu 0 3 10 16 15 
		f 3 -59 78 34 
		mu 0 3 15 16 32 
		f 3 -23 -37 37 
		mu 0 3 6 8 19 
		f 3 -38 79 -20 
		mu 0 3 6 19 31 
		f 3 15 59 -39 
		mu 0 3 33 34 35 
		f 3 -60 39 -6 
		mu 0 3 35 34 36 
		f 3 27 60 -40 
		mu 0 3 37 38 39 
		f 3 -61 40 -5 
		mu 0 3 39 38 40 
		f 3 11 61 -42 
		mu 0 3 41 42 43 
		f 3 -62 42 -2 
		mu 0 3 43 42 44 
		f 3 -1 62 43 
		mu 0 3 45 44 46 
		f 3 -63 -43 21 
		mu 0 3 46 44 42 
		f 3 13 63 -44 
		mu 0 3 46 47 45 
		f 3 -64 44 -8 
		mu 0 3 45 47 48 
		f 3 30 64 -45 
		mu 0 3 47 33 48 
		f 3 -65 38 -7 
		mu 0 3 48 33 35 
		f 3 45 65 -3 
		mu 0 3 49 50 43 
		f 3 -66 -81 41 
		mu 0 3 43 50 41 
		f 3 -46 66 -82 
		mu 0 3 50 49 38 
		f 3 -67 -4 -41 
		mu 0 3 38 49 40 ;
createNode transform -n "fingers_left" -p "itguy";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode mesh -n "fingers_leftShape" -p "fingers_left";
	setAttr -k off ".v";
	setAttr -s 6 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
createNode mesh -n "fingers_leftShapeOrig" -p "fingers_left";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 41 ".uvst[0].uvsp[0:40]" -type "float2" 0.59341967 
		0.42276058 0.59617865 0.39962769 0.59955311 0.42368928 0.60243821 0.39654666 
		0.66282135 0.43154988 0.65249801 0.42321512 0.66371083 0.40326008 0.65308237 
		0.40462625 0.68606484 0.35313153 0.67183435 0.35109383 0.68412882 0.34645012 
		0.62485802 0.53346515 0.65492523 0.53222775 0.63190532 0.56142378 0.65463817 
		0.55452704 0.62590563 0.42349258 0.63480127 0.39254287 0.67453343 0.3308064 
		0.68153524 0.32967055 0.60099065 0.56050324 0.59944761 0.53284431 0.67394304 
		0.31364673 0.67760223 0.313041 0.66455781 0.37632635 0.65377021 0.38274139 
		0.65438306 0.57429409 0.61149818 0.37318811 0.61762822 0.36958072 0.70823634 
		0.35021663 0.691517 0.35313943 0.69348526 0.34355626 0.65421063 0.36874571 
		0.66486955 0.36640894 0.63536108 0.59105504 0.65418208 0.58990574 0.70247459 
		0.33200616 0.69532448 0.33037686 0.63965154 0.36882362 0.61671925 0.5881623 
		0.70485705 0.31304964 0.71032411 0.31391853;
	setAttr ".cuvs" -type "string" "map1";
	setAttr -s 24 ".vt[0:23]"  2.9075108 4.3345776 -0.046641957 
		2.9023225 4.3461194 -0.15692468 2.9121556 4.3626356 -0.05934475 2.6559505 
		4.4053016 -0.13368072 2.6559501 4.4126892 -0.067007788 2.7759166 4.3391056 
		-0.047770079 2.746278 4.3771243 -0.17491683 2.7846272 4.392797 -0.063018158 
		2.8976774 4.3172245 -0.15290926 2.6559505 4.3951669 -0.21217373 2.7375677 
		4.3223476 -0.15491696 2.8144035 4.2827773 -0.25847587 2.8190489 4.3119998 
		-0.25558028 2.6559505 4.3728008 -0.26237145 2.7176998 4.3247404 -0.26867396 
		2.7264106 4.3629689 -0.26045176 2.6047115 4.4262195 -0.13977236 2.6047113 
		4.4275341 -0.038306706 2.620338 4.318409 -0.041523252 2.6203377 4.3147197 
		-0.12727344 2.6047113 4.4170098 -0.23637511 2.6203384 4.3048401 -0.2032876 
		2.620338 4.2939348 -0.26332322 2.6047115 4.3833227 -0.27194545;
	setAttr -s 61 ".ed[0:60]"  17 18 0 8 0 
		1 2 1 1 0 2 0 16 3 1 17 
		4 1 4 3 1 18 4 1 10 5 1 
		18 5 0 3 6 1 4 7 1 7 6 
		1 5 7 1 5 0 0 6 1 1 7 
		2 1 8 1 1 20 9 1 3 9 1 
		21 10 1 19 10 1 9 6 1 10 8 
		1 11 8 0 12 11 1 1 12 1 23 
		13 1 13 22 1 9 13 1 22 14 0 
		14 10 1 13 15 1 15 14 1 6 15 
		1 14 11 0 15 12 1 8 2 1 4 
		16 1 18 10 1 6 4 1 5 4 1 
		8 5 1 7 1 1 0 7 1 16 9 
		1 12 8 1 13 20 1 21 14 1 13 
		14 1 15 9 1 10 11 1 12 14 1 
		12 6 1 17 16 0 19 18 0 16 20 
		0 21 19 0 23 22 0 20 23 0 22 
		21 0;
	setAttr -s 38 ".fc[0:37]" -type "polyFaces" 
		f 3 -2 37 -4 
		mu 0 3 0 1 2 
		f 3 -38 17 -3 
		mu 0 3 2 1 3 
		f 3 5 38 -55 
		mu 0 3 4 5 6 
		f 3 -39 6 -5 
		mu 0 3 6 5 7 
		f 3 0 7 -6 
		mu 0 3 8 9 10 
		f 3 -10 39 8 
		mu 0 3 11 12 13 
		f 3 -40 -56 21 
		mu 0 3 13 12 14 
		f 3 12 40 11 
		mu 0 3 15 16 5 
		f 3 -41 -11 -7 
		mu 0 3 5 16 7 
		f 3 9 41 -8 
		mu 0 3 9 17 10 
		f 3 -42 13 -12 
		mu 0 3 10 17 18 
		f 3 23 42 -9 
		mu 0 3 13 19 11 
		f 3 -43 1 -15 
		mu 0 3 11 19 20 
		f 3 -13 43 -16 
		mu 0 3 16 15 3 
		f 3 -44 16 2 
		mu 0 3 3 15 2 
		f 3 14 44 -14 
		mu 0 3 17 21 18 
		f 3 -45 3 -17 
		mu 0 3 18 21 22 
		f 3 -57 45 -19 
		mu 0 3 23 6 24 
		f 3 -46 4 19 
		mu 0 3 24 6 7 
		f 3 -58 20 -22 
		mu 0 3 14 25 13 
		f 3 -20 10 -23 
		mu 0 3 24 7 16 
		f 3 -26 46 -25 
		mu 0 3 26 27 1 
		f 3 -47 -27 -18 
		mu 0 3 1 27 3 
		f 3 -59 27 28 
		mu 0 3 28 29 30 
		f 3 29 47 18 
		mu 0 3 24 31 23 
		f 3 -48 -28 -60 
		mu 0 3 23 31 32 
		f 3 -21 48 31 
		mu 0 3 13 25 33 
		f 3 -49 -61 30 
		mu 0 3 33 25 34 
		f 3 -29 49 -31 
		mu 0 3 28 30 35 
		f 3 -50 32 33 
		mu 0 3 35 30 36 
		f 3 34 50 22 
		mu 0 3 16 37 24 
		f 3 -51 -33 -30 
		mu 0 3 24 37 31 
		f 3 -24 51 24 
		mu 0 3 19 13 38 
		f 3 -52 -32 35 
		mu 0 3 38 13 33 
		f 3 36 52 -34 
		mu 0 3 36 39 35 
		f 3 -53 25 -36 
		mu 0 3 35 39 40 
		f 3 26 53 15 
		mu 0 3 3 27 16 
		f 3 -54 -37 -35 
		mu 0 3 16 27 37 ;
createNode transform -n "thumb_right" -p "itguy";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode mesh -n "thumb_rightShape" -p "thumb_right";
	setAttr -k off ".v";
	setAttr -s 6 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
createNode mesh -n "thumb_rightShape43Orig" -p "thumb_right";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 35 ".uvst[0].uvsp[0:34]" -type "float2" 0.60042 
		0.35057855 0.59705782 0.33831906 0.59048653 0.35066199 0.58902359 0.33831906 
		0.59364653 0.3255426 0.70766342 0.52057415 0.69987559 0.5025816 0.67423487 
		0.51529914 0.68221736 0.49185118 0.63891119 0.46872026 0.63892198 0.48033395 
		0.64727992 0.47061509 0.64726698 0.48298413 0.71545619 0.44370398 0.68046534 
		0.45931149 0.70619673 0.46539328 0.68690181 0.47368187 0.66514939 0.46958789 
		0.6102578 0.3548283 0.62171817 0.35320893 0.61447692 0.33651927 0.62539041 
		0.33651927 0.66678184 0.48263735 0.58553362 0.3255426 0.66162324 0.50236994 
		0.66374528 0.48592958 0.61974072 0.31473765 0.62605321 0.31473765 0.58931208 
		0.31298092 0.58517456 0.31298092 0.64552808 0.48446596 0.64502466 0.49626639 
		0.71623236 0.4545916 0.59028578 0.35991251 0.60068607 0.35673976;
	setAttr ".cuvs" -type "string" "map1";
	setAttr -s 17 ".vt[0:16]"  -2.3896034 4.3240805 0.078071356 
		-2.3896034 4.2483702 0.074688524 -2.4817383 4.298811 0.10994408 -2.4817381 
		4.2384262 0.11507063 -2.5777652 4.2731719 0.14429928 -2.6739941 4.1995344 
		0.096252553 -2.6739941 4.2537723 0.10341921 -2.6721747 4.2094998 0.14164856 
		-2.6721747 4.2405972 0.14774023 -2.5876541 4.299006 0.097725518 -2.5876541 
		4.2052274 0.073607989 -2.577765 4.2121968 0.13692334 -2.5214996 4.2367821 
		0.02452204 -2.3480854 4.2529731 0.0058959369 -2.3480854 4.3958035 -0.00068703201 
		-2.5150805 4.3352585 0.059178557 -2.3426707 4.3271337 0.038237225;
	setAttr -s 43 ".ed[0:42]"  1 0 1 1 2 
		1 0 2 1 1 3 0 3 2 1 3 
		4 1 2 4 1 12 1 1 13 1 1 
		12 3 1 6 5 1 6 7 1 5 7 
		0 6 8 1 8 7 0 14 0 1 0 
		15 1 2 15 1 9 2 1 15 9 0 
		9 12 1 9 10 1 12 10 0 9 4 
		1 3 11 1 4 11 1 10 3 1 10 
		11 1 9 6 0 6 10 1 10 5 0 
		4 6 1 4 8 1 11 8 1 11 7 
		1 10 7 1 16 0 1 1 16 1 13 
		12 0 14 15 0 12 15 0 14 16 0 
		16 13 0;
	setAttr -s 27 ".fc[0:26]" -type "polyFaces" 
		f 3 2 -2 0 
		mu 0 3 0 1 2 
		f 3 1 -5 -4 
		mu 0 3 2 1 3 
		f 3 6 -6 4 
		mu 0 3 1 4 3 
		f 3 8 -8 -39 
		mu 0 3 5 6 7 
		f 3 3 -10 7 
		mu 0 3 6 8 7 
		f 3 12 -12 10 
		mu 0 3 9 10 11 
		f 3 -15 -14 11 
		mu 0 3 10 12 11 
		f 3 39 -17 -16 
		mu 0 3 13 14 15 
		f 3 16 -18 -3 
		mu 0 3 15 14 16 
		f 3 19 18 17 
		mu 0 3 14 17 16 
		f 3 -41 -21 -20 
		mu 0 3 18 19 20 
		f 3 22 -22 20 
		mu 0 3 19 21 20 
		f 3 -7 -19 23 
		mu 0 3 22 16 17 
		f 3 5 25 -25 
		mu 0 3 3 4 23 
		f 3 9 -27 -23 
		mu 0 3 7 8 24 
		f 3 24 -28 26 
		mu 0 3 8 25 24 
		f 3 21 -30 -29 
		mu 0 3 20 21 26 
		f 3 30 -11 29 
		mu 0 3 21 27 26 
		f 3 28 -32 -24 
		mu 0 3 17 11 22 
		f 3 13 -33 31 
		mu 0 3 11 12 22 
		f 3 32 -34 -26 
		mu 0 3 4 28 23 
		f 3 14 -35 33 
		mu 0 3 28 29 23 
		f 3 34 -36 27 
		mu 0 3 25 30 24 
		f 3 -13 -31 35 
		mu 0 3 30 31 24 
		f 3 15 -37 -42 
		mu 0 3 13 15 32 
		f 3 -43 -38 -9 
		mu 0 3 33 34 2 
		f 3 36 -1 37 
		mu 0 3 34 0 2 ;
createNode transform -n "index_right" -p "itguy";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode mesh -n "index_rightShape" -p "index_right";
	setAttr -k off ".v";
	setAttr -s 6 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
createNode mesh -n "index_rightShapeOrig" -p "index_right";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 30 ".uvst[0].uvsp[0:29]" -type "float2" 0.5989089 
		0.44504735 0.60514766 0.44477463 0.59916866 0.43677875 0.6054005 0.43672973 
		0.66593087 0.35001561 0.65356535 0.34793195 0.65009493 0.35228327 0.66282135 
		0.43154988 0.65655333 0.43388712 0.66219926 0.45133176 0.65608633 0.44872907 
		0.64740151 0.34331095 0.64698511 0.3400254 0.63621503 0.34159875 0.65492523 
		0.53222775 0.65519106 0.51160938 0.63005984 0.52797937 0.63028049 0.5108313 
		0.66411781 0.33129287 0.65686613 0.33002886 0.63089496 0.43780035 0.63061184 
		0.44680437 0.6386385 0.32746238 0.64498329 0.32650799 0.60560501 0.52245426 
		0.60578465 0.50849748 0.66396219 0.31219274 0.66782981 0.31286681 0.6399793 
		0.31304109 0.63659483 0.31355008;
	setAttr ".cuvs" -type "string" "map1";
	setAttr -s 14 ".vt[0:13]"  -2.876327 4.2974057 0.047281917 
		-2.8763273 4.3053241 -0.006389041 -2.8809726 4.32829 0.036652125 -2.8809726 
		4.331974 0.0077979676 -2.634696 4.4036193 -0.029226279 -2.634697 4.3922343 
		0.024006676 -2.7493529 4.3309016 -0.026420925 -2.7493532 4.3160543 0.039522078 
		-2.7580643 4.3808722 -0.0067677293 -2.7580636 4.3739638 0.025526911 -2.6047096 
		4.4275312 -0.038306817 -2.620338 4.318409 -0.041523259 -2.6047103 4.3960338 
		0.032643635 -2.620338 4.2939358 0.037764851;
	setAttr -s 35 ".ed[0:34]"  1 0 1 1 2 
		1 0 2 0 3 1 1 2 3 1 10 
		4 0 4 11 1 12 4 1 12 5 1 
		5 4 1 13 5 1 11 6 1 6 13 
		1 6 7 1 13 7 0 4 6 1 4 
		8 1 8 6 1 5 8 1 5 9 1 
		9 8 1 7 5 1 7 9 1 6 1 
		0 1 7 1 7 0 0 8 3 1 3 
		6 1 9 3 1 9 2 1 7 2 1 
		10 11 0 12 10 0 13 12 0 11 13 
		0;
	setAttr -s 22 ".fc[0:21]" -type "polyFaces" 
		f 3 2 -2 0 
		mu 0 3 0 1 2 
		f 3 4 3 1 
		mu 0 3 1 3 2 
		f 3 -7 -6 31 
		mu 0 3 4 5 6 
		f 3 5 -8 32 
		mu 0 3 7 8 9 
		f 3 -10 -9 7 
		mu 0 3 8 10 9 
		f 3 8 -11 33 
		mu 0 3 11 12 13 
		f 3 34 -13 -12 
		mu 0 3 14 15 16 
		f 3 14 -14 12 
		mu 0 3 15 17 16 
		f 3 11 -16 6 
		mu 0 3 4 18 5 
		f 3 -18 -17 15 
		mu 0 3 18 19 5 
		f 3 16 -19 9 
		mu 0 3 8 20 10 
		f 3 -21 -20 18 
		mu 0 3 20 21 10 
		f 3 10 -22 -15 
		mu 0 3 13 12 22 
		f 3 19 -23 21 
		mu 0 3 12 23 22 
		f 3 13 -25 -24 
		mu 0 3 16 17 24 
		f 3 25 -1 24 
		mu 0 3 17 25 24 
		f 3 17 -28 -27 
		mu 0 3 19 18 26 
		f 3 23 -4 27 
		mu 0 3 18 27 26 
		f 3 26 -29 20 
		mu 0 3 20 3 21 
		f 3 -5 -30 28 
		mu 0 3 3 1 21 
		f 3 29 -31 22 
		mu 0 3 23 28 22 
		f 3 -3 -26 30 
		mu 0 3 28 29 22 ;
createNode transform -n "hand_right" -p "itguy";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode mesh -n "hand_rightShape" -p "|itguy|hand_right";
	setAttr -k off ".v";
	setAttr -s 6 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
createNode mesh -n "hand_rightShapeOrig" -p "|itguy|hand_right";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 51 ".uvst[0].uvsp[0:50]" -type "float2" 0.71545619 
		0.44370398 0.67652738 0.45055771 0.68046534 0.45931149 0.64773422 0.35089707 
		0.64740151 0.34331095 0.64074236 0.35313168 0.67902458 0.37949067 0.67681295 
		0.41799092 0.71712929 0.39049345 0.71634519 0.41542321 0.66706336 0.58328396 
		0.67117846 0.59636563 0.70695376 0.57564187 0.70678556 0.58869898 0.70730138 
		0.54866338 0.68417037 0.54836529 0.65438306 0.57429409 0.65418208 0.58990574 
		0.65707493 0.59964776 0.66371083 0.40326008 0.66282135 0.43154988 0.63621503 
		0.34159875 0.66219926 0.45133176 0.67423487 0.51529914 0.65519106 0.51160938 
		0.65492523 0.53222775 0.70766342 0.52057415 0.62995225 0.35242838 0.7175765 
		0.37626269 0.67991 0.36635962 0.66486955 0.36640894 0.66455781 0.37632635 
		0.65463817 0.55452704 0.72199178 0.32970521 0.73777092 0.32734182 0.72239906 
		0.29048678 0.73806578 0.28777814 0.7187683 0.55881339 0.73443526 0.55610484 
		0.71934956 0.51620442 0.73517299 0.51936436 0.72142732 0.44526726 0.73703265 
		0.4454883 0.72199899 0.41476753 0.73763508 0.41647935 0.73782051 0.38724092 
		0.7222029 0.39116949 0.72207677 0.36165723 0.7376985 0.35438484 0.73590618 
		0.48686743 0.72168034 0.47947106;
	setAttr ".cuvs" -type "string" "map1";
	setAttr -s 34 ".vt[0:33]"  -2.2803197 4.385879 -0.19616672 
		-2.2803197 4.4127316 -0.097350962 -2.2803197 4.385879 -0.019124905 -2.2801902 
		4.3096504 0.013277275 -2.2800267 4.2672868 -0.019124944 -2.2800262 4.2365685 
		-0.097351 -2.2800267 4.2672868 -0.19616675 -2.2801902 4.3096499 -0.22174995 
		-2.3480854 4.3958035 -0.00068705768 -2.5150805 4.3352585 0.059178494 -2.5354753 
		4.3990693 0.028256126 -2.6047113 4.3960352 0.032643717 -2.5342042 4.4099078 
		-0.2266665 -2.3480854 4.4014225 -0.19153486 -2.5390487 4.440465 -0.088466413 
		-2.3480854 4.4161711 -0.10212018 -2.5540924 4.2863317 -0.23722428 -2.3480854 
		4.2682219 -0.2058654 -2.5319147 4.3526902 -0.27381626 -2.3480854 4.3342805 
		-0.24257536 -2.3480854 4.2523909 -0.10212031 -2.4678576 4.2873702 -0.10212046 
		-2.6203384 4.3048401 -0.2032876 -2.620338 4.2939348 -0.26332322 -2.6047115 
		4.3833222 -0.27194542 -2.6047113 4.426219 -0.13977233 -2.6047113 4.4275341 
		-0.038306709 -2.620338 4.2939358 0.037764847 -2.5214996 4.2367821 0.024522005 
		-2.620338 4.318409 -0.041523259 -2.3480854 4.2529731 0.0058959196 -2.6047108 
		4.4170089 -0.23637491 -2.620338 4.3147197 -0.12727344 -2.3426707 4.3271337 
		0.038237225;
	setAttr -s 82 ".ed[0:81]"  1 0 0 2 1 
		0 3 2 0 4 3 0 5 4 0 6 
		5 0 7 6 0 0 7 0 8 9 0 
		9 10 1 8 10 1 11 9 1 10 11 
		1 13 12 1 13 14 1 14 12 1 15 
		13 1 15 14 1 17 16 1 17 18 1 
		18 16 1 19 17 1 19 18 1 16 20 
		1 17 20 1 16 21 1 21 20 1 22 
		16 1 16 23 1 23 22 0 24 23 0 
		23 18 1 18 24 1 25 14 1 14 26 
		1 26 25 0 27 11 0 9 27 1 10 
		14 1 14 8 1 8 15 1 10 26 1 
		11 26 0 21 28 1 21 27 1 28 27 
		0 29 21 1 29 27 0 20 30 1 20 
		28 1 30 28 0 28 9 0 12 19 1 
		13 19 1 12 18 1 12 24 1 12 31 
		1 31 24 0 32 21 1 32 29 0 22 
		21 1 22 32 0 25 12 1 25 31 0 
		20 6 1 17 6 1 20 5 1 30 5 
		1 30 4 1 15 2 1 8 2 1 15 
		1 1 1 13 1 13 0 1 19 0 1 
		19 7 1 17 7 1 3 33 1 33 2 
		1 8 33 0 3 30 1 33 30 0;
	setAttr -s 47 ".fc[0:46]" -type "polyFaces" 
		f 3 10 -10 -9 
		mu 0 3 0 1 2 
		f 3 12 11 9 
		mu 0 3 3 4 5 
		f 3 -16 -15 13 
		mu 0 3 6 7 8 
		f 3 -18 16 14 
		mu 0 3 7 9 8 
		f 3 -21 -20 18 
		mu 0 3 10 11 12 
		f 3 -23 21 19 
		mu 0 3 11 13 12 
		f 3 24 -24 -19 
		mu 0 3 12 14 10 
		f 3 -27 -26 23 
		mu 0 3 14 15 10 
		f 3 -30 -29 -28 
		mu 0 3 16 17 10 
		f 3 -33 -32 -31 
		mu 0 3 18 11 17 
		f 3 20 28 31 
		mu 0 3 11 10 17 
		f 3 -36 -35 -34 
		mu 0 3 19 20 7 
		f 3 -38 -12 -37 
		mu 0 3 21 5 4 
		f 3 -11 -40 -39 
		mu 0 3 1 0 7 
		f 3 40 17 39 
		mu 0 3 0 9 7 
		f 3 34 -42 38 
		mu 0 3 7 20 1 
		f 3 -43 -13 41 
		mu 0 3 20 22 1 
		f 3 45 -45 43 
		mu 0 3 23 24 15 
		f 3 -48 46 44 
		mu 0 3 24 25 15 
		f 3 50 -50 48 
		mu 0 3 26 23 14 
		f 3 -44 26 49 
		mu 0 3 23 15 14 
		f 3 -46 51 37 
		mu 0 3 21 27 5 
		f 3 53 -53 -14 
		mu 0 3 8 28 6 
		f 3 22 -55 52 
		mu 0 3 28 29 6 
		f 3 32 -56 54 
		mu 0 3 29 30 6 
		f 3 -58 -57 55 
		mu 0 3 30 31 6 
		f 3 -47 -60 58 
		mu 0 3 15 25 32 
		f 3 25 -61 27 
		mu 0 3 10 15 16 
		f 3 -59 -62 60 
		mu 0 3 15 32 16 
		f 3 -63 33 15 
		mu 0 3 6 19 7 
		f 3 56 -64 62 
		mu 0 3 6 31 19 
		f 3 65 -65 -25 
		mu 0 3 33 34 35 
		f 3 5 -67 64 
		mu 0 3 34 36 35 
		f 3 66 -68 -49 
		mu 0 3 37 38 39 
		f 3 4 -69 67 
		mu 0 3 38 40 39 
		f 3 70 -70 -41 
		mu 0 3 41 42 43 
		f 3 1 -72 69 
		mu 0 3 42 44 43 
		f 3 -74 -73 0 
		mu 0 3 45 46 44 
		f 3 -17 71 72 
		mu 0 3 46 43 44 
		f 3 73 -75 -54 
		mu 0 3 46 45 47 
		f 3 7 -76 74 
		mu 0 3 45 48 47 
		f 3 75 -77 -22 
		mu 0 3 47 48 33 
		f 3 6 -66 76 
		mu 0 3 48 34 33 
		f 3 2 -79 -78 
		mu 0 3 49 42 50 
		f 3 -71 79 78 
		mu 0 3 42 41 50 
		f 3 81 -81 77 
		mu 0 3 50 39 49 
		f 3 68 3 80 
		mu 0 3 39 40 49 ;
createNode transform -n "fingers_right" -p "itguy";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode mesh -n "fingers_rightShape" -p "fingers_right";
	setAttr -k off ".v";
	setAttr -s 6 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
createNode mesh -n "fingers_rightShapeOrig" -p "fingers_right";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 41 ".uvst[0].uvsp[0:40]" -type "float2" 0.59341967 
		0.42276058 0.59955311 0.42368928 0.59617865 0.39962769 0.60243821 0.39654666 
		0.66282135 0.43154988 0.66371083 0.40326008 0.65249801 0.42321512 0.65308237 
		0.40462625 0.68606484 0.35313153 0.68412882 0.34645012 0.67183435 0.35109383 
		0.62485802 0.53346515 0.63190532 0.56142378 0.65492523 0.53222775 0.65463817 
		0.55452704 0.62590563 0.42349258 0.63480127 0.39254287 0.67453343 0.3308064 
		0.68153524 0.32967055 0.60099065 0.56050324 0.59944761 0.53284431 0.67394304 
		0.31364673 0.67760223 0.313041 0.66455781 0.37632635 0.65377021 0.38274139 
		0.65438306 0.57429409 0.61149818 0.37318811 0.61762822 0.36958072 0.70823634 
		0.35021663 0.69348526 0.34355626 0.691517 0.35313943 0.65421063 0.36874571 
		0.66486955 0.36640894 0.63536108 0.59105504 0.65418208 0.58990574 0.70247459 
		0.33200616 0.69532448 0.33037686 0.63965154 0.36882362 0.61671925 0.5881623 
		0.70485705 0.31304964 0.71032411 0.31391853;
	setAttr ".cuvs" -type "string" "map1";
	setAttr -s 24 ".vt[0:23]"  -2.9075108 4.3345776 -0.046641931 
		-2.8976774 4.3172245 -0.15290925 -2.9121559 4.3626356 -0.05934478 -2.9023225 
		4.3461194 -0.15692465 -2.6559505 4.4126892 -0.067007795 -2.6559505 4.4053011 
		-0.13368069 -2.7759166 4.3391056 -0.047770079 -2.7375679 4.3223476 -0.15491697 
		-2.7846277 4.392797 -0.06301818 -2.7462785 4.3771248 -0.17491692 -2.6559501 
		4.3951664 -0.2121736 -2.814404 4.2827778 -0.25847584 -2.8190491 4.3120003 
		-0.25558037 -2.6559505 4.3728008 -0.2623713 -2.7177 4.3247404 -0.26867399 
		-2.7264109 4.3629694 -0.260452 -2.6047113 4.4275341 -0.038306713 -2.6047111 
		4.426218 -0.13977227 -2.620338 4.3147197 -0.12727343 -2.620338 4.318409 -0.041523252 
		-2.6047108 4.4170089 -0.23637471 -2.6203384 4.3048401 -0.20328757 -2.6047115 
		4.3833222 -0.27194539 -2.620338 4.2939348 -0.26332319;
	setAttr -s 61 ".ed[0:60]"  16 19 0 1 0 
		1 1 2 1 0 2 0 1 3 1 2 
		3 1 16 4 1 4 17 1 4 5 1 
		17 5 1 19 4 1 19 6 0 19 7 
		1 7 6 1 18 7 1 8 9 1 9 
		4 1 4 8 1 5 9 1 6 4 1 
		6 8 1 7 1 1 1 6 1 6 0 
		0 8 3 1 9 3 1 8 2 1 0 
		8 1 17 10 1 20 10 1 5 10 1 
		21 7 1 10 9 1 12 11 1 12 1 
		1 11 1 0 3 12 1 22 13 1 13 
		23 1 10 13 1 13 20 1 21 14 1 
		14 7 1 23 14 0 13 14 1 13 15 
		1 15 14 1 9 15 1 15 10 1 7 
		11 1 14 11 0 15 12 1 12 14 1 
		12 9 1 16 17 0 18 19 0 17 20 
		0 21 18 0 22 23 0 20 22 0 23 
		21 0;
	setAttr -s 38 ".fc[0:37]" -type "polyFaces" 
		f 3 3 -3 1 
		mu 0 3 0 1 2 
		f 3 5 -5 2 
		mu 0 3 1 3 2 
		f 3 54 -8 -7 
		mu 0 3 4 5 6 
		f 3 9 -9 7 
		mu 0 3 5 7 6 
		f 3 6 -11 -1 
		mu 0 3 8 9 10 
		f 3 -14 -13 11 
		mu 0 3 11 12 13 
		f 3 -15 55 12 
		mu 0 3 12 14 13 
		f 3 -18 -17 -16 
		mu 0 3 15 6 16 
		f 3 8 18 16 
		mu 0 3 6 7 16 
		f 3 10 -20 -12 
		mu 0 3 10 9 17 
		f 3 17 -21 19 
		mu 0 3 9 18 17 
		f 3 13 -23 -22 
		mu 0 3 12 11 19 
		f 3 23 -2 22 
		mu 0 3 11 20 19 
		f 3 25 -25 15 
		mu 0 3 16 3 15 
		f 3 -6 -27 24 
		mu 0 3 3 1 15 
		f 3 20 -28 -24 
		mu 0 3 17 18 21 
		f 3 26 -4 27 
		mu 0 3 18 22 21 
		f 3 29 -29 56 
		mu 0 3 23 24 5 
		f 3 -31 -10 28 
		mu 0 3 24 7 5 
		f 3 14 -32 57 
		mu 0 3 14 12 25 
		f 3 32 -19 30 
		mu 0 3 24 16 7 
		f 3 35 -35 33 
		mu 0 3 26 2 27 
		f 3 4 36 34 
		mu 0 3 2 3 27 
		f 3 -39 -38 58 
		mu 0 3 28 29 30 
		f 3 -30 -41 -40 
		mu 0 3 24 23 31 
		f 3 59 37 40 
		mu 0 3 23 32 31 
		f 3 -43 -42 31 
		mu 0 3 12 33 25 
		f 3 -44 60 41 
		mu 0 3 33 34 25 
		f 3 43 -45 38 
		mu 0 3 28 35 29 
		f 3 -47 -46 44 
		mu 0 3 35 36 29 
		f 3 -33 -49 -48 
		mu 0 3 16 24 37 
		f 3 39 45 48 
		mu 0 3 24 31 37 
		f 3 -36 -50 21 
		mu 0 3 19 38 12 
		f 3 -51 42 49 
		mu 0 3 38 33 12 
		f 3 46 -53 -52 
		mu 0 3 36 35 39 
		f 3 50 -34 52 
		mu 0 3 35 40 39 
		f 3 -26 -54 -37 
		mu 0 3 3 16 27 
		f 3 47 51 53 
		mu 0 3 16 37 27 ;
createNode lightLinker -n "lightLinker1";
createNode displayLayerManager -n "layerManager";
	setAttr ".cdl" 2;
	setAttr -s 3 ".dli[1:2]"  1 2;
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
createNode renderLayer -s -n "globalRender";
createNode script -n "uiConfigurationScriptNode";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n"
		+ "//\n"
		+ "//  This script is machine generated.  Edit at your own risk.\n"
		+ "//\n"
		+ "//\n"
		+ "global string $gMainPane;\n"
		+ "if (`paneLayout -exists $gMainPane`) {\n"
		+ "\tglobal int $gUseScenePanelConfig;\n"
		+ "\tint    $useSceneConfig = $gUseScenePanelConfig;\n"
		+ "\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n"
		+ "\tint    $nPanes = 0;\n"
		+ "\tstring $editorName;\n"
		+ "\tstring $panelName;\n"
		+ "\tstring $itemFilterName;\n"
		+ "\tstring $panelConfig;\n"
		+ "\t//\n"
		+ "\t//  get current state of the UI\n"
		+ "\t//\n"
		+ "\tsceneUIReplacement -update $gMainPane;\n"
		+ "\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" \"Top View\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `modelPanel -unParent -l \"Top View\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = $panelName;\n"
		+ "            modelEditor -e \n"
		+ "                -camera \"top\" \n"
		+ "                -useInteractiveMode 0\n"
		+ "                -displayLights \"default\" \n"
		+ "                -displayAppearance \"wireframe\" \n"
		+ "                -activeOnly 0\n"
		+ "                -wireframeOnShaded 0\n"
		+ "                -bufferMode \"double\" \n"
		+ "                -twoSidedLighting 1\n"
		+ "                -backfaceCulling 0\n"
		+ "                -xray 0\n"
		+ "                -displayTextures 1\n"
		+ "                -smoothWireframe 0\n"
		+ "                -textureAnisotropic 0\n"
		+ "                -textureHilight 1\n"
		+ "                -textureSampling 2\n"
		+ "                -textureDisplay \"modulate\" \n"
		+ "                -textureMaxSize 4096\n"
		+ "                -fogging 0\n"
		+ "                -fogSource \"fragment\" \n"
		+ "                -fogMode \"linear\" \n"
		+ "                -fogStart 0\n"
		+ "                -fogEnd 100\n"
		+ "                -fogDensity 0.1\n"
		+ "                -fogColor 0.5 0.5 0.5 1 \n"
		+ "                -sortTransparent 1\n"
		+ "                -nurbsCurves 1\n"
		+ "                -nurbsSurfaces 1\n"
		+ "                -polymeshes 1\n"
		+ "                -subdivSurfaces 1\n"
		+ "                -planes 1\n"
		+ "                -lights 1\n"
		+ "                -cameras 1\n"
		+ "                -controlVertices 1\n"
		+ "                -hulls 1\n"
		+ "                -grid 1\n"
		+ "                -joints 1\n"
		+ "                -ikHandles 1\n"
		+ "                -deformers 1\n"
		+ "                -dynamics 1\n"
		+ "                -fluids 1\n"
		+ "                -locators 1\n"
		+ "                -dimensions 1\n"
		+ "                -handles 1\n"
		+ "                -pivots 1\n"
		+ "                -textures 1\n"
		+ "                -strokes 1\n"
		+ "                -shadows 0\n"
		+ "                $editorName;\n"
		+ "modelEditor -e -viewSelected 0 $editorName;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tmodelPanel -edit -l \"Top View\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n"
		+ "        modelEditor -e \n"
		+ "            -camera \"top\" \n"
		+ "            -useInteractiveMode 0\n"
		+ "            -displayLights \"default\" \n"
		+ "            -displayAppearance \"wireframe\" \n"
		+ "            -activeOnly 0\n"
		+ "            -wireframeOnShaded 0\n"
		+ "            -bufferMode \"double\" \n"
		+ "            -twoSidedLighting 1\n"
		+ "            -backfaceCulling 0\n"
		+ "            -xray 0\n"
		+ "            -displayTextures 1\n"
		+ "            -smoothWireframe 0\n"
		+ "            -textureAnisotropic 0\n"
		+ "            -textureHilight 1\n"
		+ "            -textureSampling 2\n"
		+ "            -textureDisplay \"modulate\" \n"
		+ "            -textureMaxSize 4096\n"
		+ "            -fogging 0\n"
		+ "            -fogSource \"fragment\" \n"
		+ "            -fogMode \"linear\" \n"
		+ "            -fogStart 0\n"
		+ "            -fogEnd 100\n"
		+ "            -fogDensity 0.1\n"
		+ "            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -sortTransparent 1\n"
		+ "            -nurbsCurves 1\n"
		+ "            -nurbsSurfaces 1\n"
		+ "            -polymeshes 1\n"
		+ "            -subdivSurfaces 1\n"
		+ "            -planes 1\n"
		+ "            -lights 1\n"
		+ "            -cameras 1\n"
		+ "            -controlVertices 1\n"
		+ "            -hulls 1\n"
		+ "            -grid 1\n"
		+ "            -joints 1\n"
		+ "            -ikHandles 1\n"
		+ "            -deformers 1\n"
		+ "            -dynamics 1\n"
		+ "            -fluids 1\n"
		+ "            -locators 1\n"
		+ "            -dimensions 1\n"
		+ "            -handles 1\n"
		+ "            -pivots 1\n"
		+ "            -textures 1\n"
		+ "            -strokes 1\n"
		+ "            -shadows 0\n"
		+ "            $editorName;\n"
		+ "modelEditor -e -viewSelected 0 $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" \"Side View\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `modelPanel -unParent -l \"Side View\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = $panelName;\n"
		+ "            modelEditor -e \n"
		+ "                -camera \"side\" \n"
		+ "                -useInteractiveMode 0\n"
		+ "                -displayLights \"default\" \n"
		+ "                -displayAppearance \"smoothShaded\" \n"
		+ "                -activeOnly 0\n"
		+ "                -wireframeOnShaded 0\n"
		+ "                -bufferMode \"double\" \n"
		+ "                -twoSidedLighting 1\n"
		+ "                -backfaceCulling 0\n"
		+ "                -xray 0\n"
		+ "                -displayTextures 1\n"
		+ "                -smoothWireframe 0\n"
		+ "                -textureAnisotropic 0\n"
		+ "                -textureHilight 1\n"
		+ "                -textureSampling 2\n"
		+ "                -textureDisplay \"modulate\" \n"
		+ "                -textureMaxSize 4096\n"
		+ "                -fogging 0\n"
		+ "                -fogSource \"fragment\" \n"
		+ "                -fogMode \"linear\" \n"
		+ "                -fogStart 0\n"
		+ "                -fogEnd 100\n"
		+ "                -fogDensity 0.1\n"
		+ "                -fogColor 0.5 0.5 0.5 1 \n"
		+ "                -sortTransparent 1\n"
		+ "                -nurbsCurves 1\n"
		+ "                -nurbsSurfaces 1\n"
		+ "                -polymeshes 1\n"
		+ "                -subdivSurfaces 1\n"
		+ "                -planes 1\n"
		+ "                -lights 1\n"
		+ "                -cameras 1\n"
		+ "                -controlVertices 1\n"
		+ "                -hulls 1\n"
		+ "                -grid 1\n"
		+ "                -joints 1\n"
		+ "                -ikHandles 1\n"
		+ "                -deformers 1\n"
		+ "                -dynamics 1\n"
		+ "                -fluids 1\n"
		+ "                -locators 1\n"
		+ "                -dimensions 1\n"
		+ "                -handles 1\n"
		+ "                -pivots 1\n"
		+ "                -textures 1\n"
		+ "                -strokes 1\n"
		+ "                -shadows 0\n"
		+ "                $editorName;\n"
		+ "modelEditor -e -viewSelected 0 $editorName;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tmodelPanel -edit -l \"Side View\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n"
		+ "        modelEditor -e \n"
		+ "            -camera \"side\" \n"
		+ "            -useInteractiveMode 0\n"
		+ "            -displayLights \"default\" \n"
		+ "            -displayAppearance \"smoothShaded\" \n"
		+ "            -activeOnly 0\n"
		+ "            -wireframeOnShaded 0\n"
		+ "            -bufferMode \"double\" \n"
		+ "            -twoSidedLighting 1\n"
		+ "            -backfaceCulling 0\n"
		+ "            -xray 0\n"
		+ "            -displayTextures 1\n"
		+ "            -smoothWireframe 0\n"
		+ "            -textureAnisotropic 0\n"
		+ "            -textureHilight 1\n"
		+ "            -textureSampling 2\n"
		+ "            -textureDisplay \"modulate\" \n"
		+ "            -textureMaxSize 4096\n"
		+ "            -fogging 0\n"
		+ "            -fogSource \"fragment\" \n"
		+ "            -fogMode \"linear\" \n"
		+ "            -fogStart 0\n"
		+ "            -fogEnd 100\n"
		+ "            -fogDensity 0.1\n"
		+ "            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -sortTransparent 1\n"
		+ "            -nurbsCurves 1\n"
		+ "            -nurbsSurfaces 1\n"
		+ "            -polymeshes 1\n"
		+ "            -subdivSurfaces 1\n"
		+ "            -planes 1\n"
		+ "            -lights 1\n"
		+ "            -cameras 1\n"
		+ "            -controlVertices 1\n"
		+ "            -hulls 1\n"
		+ "            -grid 1\n"
		+ "            -joints 1\n"
		+ "            -ikHandles 1\n"
		+ "            -deformers 1\n"
		+ "            -dynamics 1\n"
		+ "            -fluids 1\n"
		+ "            -locators 1\n"
		+ "            -dimensions 1\n"
		+ "            -handles 1\n"
		+ "            -pivots 1\n"
		+ "            -textures 1\n"
		+ "            -strokes 1\n"
		+ "            -shadows 0\n"
		+ "            $editorName;\n"
		+ "modelEditor -e -viewSelected 0 $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" \"Front View\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `modelPanel -unParent -l \"Front View\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = $panelName;\n"
		+ "            modelEditor -e \n"
		+ "                -camera \"front\" \n"
		+ "                -useInteractiveMode 0\n"
		+ "                -displayLights \"default\" \n"
		+ "                -displayAppearance \"smoothShaded\" \n"
		+ "                -activeOnly 0\n"
		+ "                -wireframeOnShaded 0\n"
		+ "                -bufferMode \"double\" \n"
		+ "                -twoSidedLighting 1\n"
		+ "                -backfaceCulling 0\n"
		+ "                -xray 0\n"
		+ "                -displayTextures 1\n"
		+ "                -smoothWireframe 0\n"
		+ "                -textureAnisotropic 0\n"
		+ "                -textureHilight 1\n"
		+ "                -textureSampling 2\n"
		+ "                -textureDisplay \"modulate\" \n"
		+ "                -textureMaxSize 4096\n"
		+ "                -fogging 0\n"
		+ "                -fogSource \"fragment\" \n"
		+ "                -fogMode \"linear\" \n"
		+ "                -fogStart 0\n"
		+ "                -fogEnd 100\n"
		+ "                -fogDensity 0.1\n"
		+ "                -fogColor 0.5 0.5 0.5 1 \n"
		+ "                -sortTransparent 1\n"
		+ "                -nurbsCurves 1\n"
		+ "                -nurbsSurfaces 1\n"
		+ "                -polymeshes 1\n"
		+ "                -subdivSurfaces 1\n"
		+ "                -planes 1\n"
		+ "                -lights 1\n"
		+ "                -cameras 1\n"
		+ "                -controlVertices 1\n"
		+ "                -hulls 1\n"
		+ "                -grid 1\n"
		+ "                -joints 1\n"
		+ "                -ikHandles 1\n"
		+ "                -deformers 1\n"
		+ "                -dynamics 1\n"
		+ "                -fluids 1\n"
		+ "                -locators 1\n"
		+ "                -dimensions 1\n"
		+ "                -handles 1\n"
		+ "                -pivots 1\n"
		+ "                -textures 1\n"
		+ "                -strokes 1\n"
		+ "                -shadows 0\n"
		+ "                $editorName;\n"
		+ "modelEditor -e -viewSelected 0 $editorName;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tmodelPanel -edit -l \"Front View\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n"
		+ "        modelEditor -e \n"
		+ "            -camera \"front\" \n"
		+ "            -useInteractiveMode 0\n"
		+ "            -displayLights \"default\" \n"
		+ "            -displayAppearance \"smoothShaded\" \n"
		+ "            -activeOnly 0\n"
		+ "            -wireframeOnShaded 0\n"
		+ "            -bufferMode \"double\" \n"
		+ "            -twoSidedLighting 1\n"
		+ "            -backfaceCulling 0\n"
		+ "            -xray 0\n"
		+ "            -displayTextures 1\n"
		+ "            -smoothWireframe 0\n"
		+ "            -textureAnisotropic 0\n"
		+ "            -textureHilight 1\n"
		+ "            -textureSampling 2\n"
		+ "            -textureDisplay \"modulate\" \n"
		+ "            -textureMaxSize 4096\n"
		+ "            -fogging 0\n"
		+ "            -fogSource \"fragment\" \n"
		+ "            -fogMode \"linear\" \n"
		+ "            -fogStart 0\n"
		+ "            -fogEnd 100\n"
		+ "            -fogDensity 0.1\n"
		+ "            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -sortTransparent 1\n"
		+ "            -nurbsCurves 1\n"
		+ "            -nurbsSurfaces 1\n"
		+ "            -polymeshes 1\n"
		+ "            -subdivSurfaces 1\n"
		+ "            -planes 1\n"
		+ "            -lights 1\n"
		+ "            -cameras 1\n"
		+ "            -controlVertices 1\n"
		+ "            -hulls 1\n"
		+ "            -grid 1\n"
		+ "            -joints 1\n"
		+ "            -ikHandles 1\n"
		+ "            -deformers 1\n"
		+ "            -dynamics 1\n"
		+ "            -fluids 1\n"
		+ "            -locators 1\n"
		+ "            -dimensions 1\n"
		+ "            -handles 1\n"
		+ "            -pivots 1\n"
		+ "            -textures 1\n"
		+ "            -strokes 1\n"
		+ "            -shadows 0\n"
		+ "            $editorName;\n"
		+ "modelEditor -e -viewSelected 0 $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" \"Persp View\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `modelPanel -unParent -l \"Persp View\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = $panelName;\n"
		+ "            modelEditor -e \n"
		+ "                -camera \"persp\" \n"
		+ "                -useInteractiveMode 0\n"
		+ "                -displayLights \"default\" \n"
		+ "                -displayAppearance \"smoothShaded\" \n"
		+ "                -activeOnly 0\n"
		+ "                -wireframeOnShaded 0\n"
		+ "                -bufferMode \"double\" \n"
		+ "                -twoSidedLighting 1\n"
		+ "                -backfaceCulling 0\n"
		+ "                -xray 0\n"
		+ "                -displayTextures 1\n"
		+ "                -smoothWireframe 0\n"
		+ "                -textureAnisotropic 0\n"
		+ "                -textureHilight 1\n"
		+ "                -textureSampling 2\n"
		+ "                -textureDisplay \"modulate\" \n"
		+ "                -textureMaxSize 4096\n"
		+ "                -fogging 0\n"
		+ "                -fogSource \"fragment\" \n"
		+ "                -fogMode \"linear\" \n"
		+ "                -fogStart 0\n"
		+ "                -fogEnd 100\n"
		+ "                -fogDensity 0.1\n"
		+ "                -fogColor 0.5 0.5 0.5 1 \n"
		+ "                -sortTransparent 1\n"
		+ "                -nurbsCurves 1\n"
		+ "                -nurbsSurfaces 1\n"
		+ "                -polymeshes 1\n"
		+ "                -subdivSurfaces 1\n"
		+ "                -planes 1\n"
		+ "                -lights 1\n"
		+ "                -cameras 1\n"
		+ "                -controlVertices 1\n"
		+ "                -hulls 1\n"
		+ "                -grid 1\n"
		+ "                -joints 1\n"
		+ "                -ikHandles 1\n"
		+ "                -deformers 1\n"
		+ "                -dynamics 1\n"
		+ "                -fluids 1\n"
		+ "                -locators 1\n"
		+ "                -dimensions 1\n"
		+ "                -handles 1\n"
		+ "                -pivots 1\n"
		+ "                -textures 1\n"
		+ "                -strokes 1\n"
		+ "                -shadows 0\n"
		+ "                $editorName;\n"
		+ "modelEditor -e -viewSelected 0 $editorName;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tmodelPanel -edit -l \"Persp View\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n"
		+ "        modelEditor -e \n"
		+ "            -camera \"persp\" \n"
		+ "            -useInteractiveMode 0\n"
		+ "            -displayLights \"default\" \n"
		+ "            -displayAppearance \"smoothShaded\" \n"
		+ "            -activeOnly 0\n"
		+ "            -wireframeOnShaded 0\n"
		+ "            -bufferMode \"double\" \n"
		+ "            -twoSidedLighting 1\n"
		+ "            -backfaceCulling 0\n"
		+ "            -xray 0\n"
		+ "            -displayTextures 1\n"
		+ "            -smoothWireframe 0\n"
		+ "            -textureAnisotropic 0\n"
		+ "            -textureHilight 1\n"
		+ "            -textureSampling 2\n"
		+ "            -textureDisplay \"modulate\" \n"
		+ "            -textureMaxSize 4096\n"
		+ "            -fogging 0\n"
		+ "            -fogSource \"fragment\" \n"
		+ "            -fogMode \"linear\" \n"
		+ "            -fogStart 0\n"
		+ "            -fogEnd 100\n"
		+ "            -fogDensity 0.1\n"
		+ "            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -sortTransparent 1\n"
		+ "            -nurbsCurves 1\n"
		+ "            -nurbsSurfaces 1\n"
		+ "            -polymeshes 1\n"
		+ "            -subdivSurfaces 1\n"
		+ "            -planes 1\n"
		+ "            -lights 1\n"
		+ "            -cameras 1\n"
		+ "            -controlVertices 1\n"
		+ "            -hulls 1\n"
		+ "            -grid 1\n"
		+ "            -joints 1\n"
		+ "            -ikHandles 1\n"
		+ "            -deformers 1\n"
		+ "            -dynamics 1\n"
		+ "            -fluids 1\n"
		+ "            -locators 1\n"
		+ "            -dimensions 1\n"
		+ "            -handles 1\n"
		+ "            -pivots 1\n"
		+ "            -textures 1\n"
		+ "            -strokes 1\n"
		+ "            -shadows 0\n"
		+ "            $editorName;\n"
		+ "modelEditor -e -viewSelected 0 $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" \"Outliner\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `outlinerPanel -unParent -l \"Outliner\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = $panelName;\n"
		+ "            outlinerEditor -e \n"
		+ "                -mainListConnection \"worldList\" \n"
		+ "                -selectionConnection \"modelList\" \n"
		+ "                -showShapes 0\n"
		+ "                -showAttributes 0\n"
		+ "                -showConnected 0\n"
		+ "                -showAnimCurvesOnly 0\n"
		+ "                -autoExpand 0\n"
		+ "                -showDagOnly 1\n"
		+ "                -ignoreDagHierarchy 0\n"
		+ "                -expandConnections 0\n"
		+ "                -showUnitlessCurves 1\n"
		+ "                -showCompounds 1\n"
		+ "                -showLeafs 1\n"
		+ "                -showNumericAttrsOnly 0\n"
		+ "                -highlightActive 1\n"
		+ "                -autoSelectNewObjects 0\n"
		+ "                -doNotSelectNewObjects 0\n"
		+ "                -dropIsParent 1\n"
		+ "                -transmitFilters 0\n"
		+ "                -setFilter \"defaultSetFilter\" \n"
		+ "                -showSetMembers 1\n"
		+ "                -allowMultiSelection 1\n"
		+ "                -alwaysToggleSelect 0\n"
		+ "                -directSelect 0\n"
		+ "                -displayMode \"DAG\" \n"
		+ "                -expandObjects 0\n"
		+ "                -setsIgnoreFilters 1\n"
		+ "                -editAttrName 0\n"
		+ "                -showAttrValues 0\n"
		+ "                -highlightSecondary 0\n"
		+ "                -showUVAttrsOnly 0\n"
		+ "                -showTextureNodesOnly 0\n"
		+ "                -sortOrder \"none\" \n"
		+ "                -longNames 0\n"
		+ "                -niceNames 1\n"
		+ "                $editorName;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\toutlinerPanel -edit -l \"Outliner\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n"
		+ "        outlinerEditor -e \n"
		+ "            -mainListConnection \"worldList\" \n"
		+ "            -selectionConnection \"modelList\" \n"
		+ "            -showShapes 0\n"
		+ "            -showAttributes 0\n"
		+ "            -showConnected 0\n"
		+ "            -showAnimCurvesOnly 0\n"
		+ "            -autoExpand 0\n"
		+ "            -showDagOnly 1\n"
		+ "            -ignoreDagHierarchy 0\n"
		+ "            -expandConnections 0\n"
		+ "            -showUnitlessCurves 1\n"
		+ "            -showCompounds 1\n"
		+ "            -showLeafs 1\n"
		+ "            -showNumericAttrsOnly 0\n"
		+ "            -highlightActive 1\n"
		+ "            -autoSelectNewObjects 0\n"
		+ "            -doNotSelectNewObjects 0\n"
		+ "            -dropIsParent 1\n"
		+ "            -transmitFilters 0\n"
		+ "            -setFilter \"defaultSetFilter\" \n"
		+ "            -showSetMembers 1\n"
		+ "            -allowMultiSelection 1\n"
		+ "            -alwaysToggleSelect 0\n"
		+ "            -directSelect 0\n"
		+ "            -displayMode \"DAG\" \n"
		+ "            -expandObjects 0\n"
		+ "            -setsIgnoreFilters 1\n"
		+ "            -editAttrName 0\n"
		+ "            -showAttrValues 0\n"
		+ "            -highlightSecondary 0\n"
		+ "            -showUVAttrsOnly 0\n"
		+ "            -showTextureNodesOnly 0\n"
		+ "            -sortOrder \"none\" \n"
		+ "            -longNames 0\n"
		+ "            -niceNames 1\n"
		+ "            $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\tif ($useSceneConfig) {\n"
		+ "\t\toutlinerPanel -e -to $panelName;\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" \"Graph Editor\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"graphEditor\" -l \"Graph Editor\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = ($panelName+\"OutlineEd\");\n"
		+ "            outlinerEditor -e \n"
		+ "                -mainListConnection \"graphEditorList\" \n"
		+ "                -selectionConnection \"graphEditor1FromOutliner\" \n"
		+ "                -highlightConnection \"keyframeList\" \n"
		+ "                -showShapes 1\n"
		+ "                -showAttributes 1\n"
		+ "                -showConnected 1\n"
		+ "                -showAnimCurvesOnly 1\n"
		+ "                -autoExpand 1\n"
		+ "                -showDagOnly 0\n"
		+ "                -ignoreDagHierarchy 0\n"
		+ "                -expandConnections 1\n"
		+ "                -showUnitlessCurves 1\n"
		+ "                -showCompounds 0\n"
		+ "                -showLeafs 1\n"
		+ "                -showNumericAttrsOnly 1\n"
		+ "                -highlightActive 0\n"
		+ "                -autoSelectNewObjects 1\n"
		+ "                -doNotSelectNewObjects 0\n"
		+ "                -dropIsParent 1\n"
		+ "                -transmitFilters 1\n"
		+ "                -setFilter \"0\" \n"
		+ "                -showSetMembers 0\n"
		+ "                -allowMultiSelection 1\n"
		+ "                -alwaysToggleSelect 0\n"
		+ "                -directSelect 0\n"
		+ "                -displayMode \"DAG\" \n"
		+ "                -expandObjects 0\n"
		+ "                -setsIgnoreFilters 1\n"
		+ "                -editAttrName 0\n"
		+ "                -showAttrValues 0\n"
		+ "                -highlightSecondary 0\n"
		+ "                -showUVAttrsOnly 0\n"
		+ "                -showTextureNodesOnly 0\n"
		+ "                -sortOrder \"none\" \n"
		+ "                -longNames 0\n"
		+ "                -niceNames 1\n"
		+ "                $editorName;\n"
		+ "\t\t\t$editorName = ($panelName+\"GraphEd\");\n"
		+ "            animCurveEditor -e \n"
		+ "                -mainListConnection \"graphEditor1FromOutliner\" \n"
		+ "                -displayKeys 1\n"
		+ "                -displayTangents 0\n"
		+ "                -displayActiveKeys 0\n"
		+ "                -displayActiveKeyTangents 1\n"
		+ "                -displayInfinities 0\n"
		+ "                -autoFit 0\n"
		+ "                -snapTime \"integer\" \n"
		+ "                -snapValue \"none\" \n"
		+ "                -showResults \"off\" \n"
		+ "                -showBufferCurves \"off\" \n"
		+ "                -smoothness \"fine\" \n"
		+ "                -resultSamples 1\n"
		+ "                -resultScreenSamples 0\n"
		+ "                -resultUpdate \"delayed\" \n"
		+ "                $editorName;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Graph Editor\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t\t$editorName = ($panelName+\"OutlineEd\");\n"
		+ "            outlinerEditor -e \n"
		+ "                -mainListConnection \"graphEditorList\" \n"
		+ "                -selectionConnection \"graphEditor1FromOutliner\" \n"
		+ "                -highlightConnection \"keyframeList\" \n"
		+ "                -showShapes 1\n"
		+ "                -showAttributes 1\n"
		+ "                -showConnected 1\n"
		+ "                -showAnimCurvesOnly 1\n"
		+ "                -autoExpand 1\n"
		+ "                -showDagOnly 0\n"
		+ "                -ignoreDagHierarchy 0\n"
		+ "                -expandConnections 1\n"
		+ "                -showUnitlessCurves 1\n"
		+ "                -showCompounds 0\n"
		+ "                -showLeafs 1\n"
		+ "                -showNumericAttrsOnly 1\n"
		+ "                -highlightActive 0\n"
		+ "                -autoSelectNewObjects 1\n"
		+ "                -doNotSelectNewObjects 0\n"
		+ "                -dropIsParent 1\n"
		+ "                -transmitFilters 1\n"
		+ "                -setFilter \"0\" \n"
		+ "                -showSetMembers 0\n"
		+ "                -allowMultiSelection 1\n"
		+ "                -alwaysToggleSelect 0\n"
		+ "                -directSelect 0\n"
		+ "                -displayMode \"DAG\" \n"
		+ "                -expandObjects 0\n"
		+ "                -setsIgnoreFilters 1\n"
		+ "                -editAttrName 0\n"
		+ "                -showAttrValues 0\n"
		+ "                -highlightSecondary 0\n"
		+ "                -showUVAttrsOnly 0\n"
		+ "                -showTextureNodesOnly 0\n"
		+ "                -sortOrder \"none\" \n"
		+ "                -longNames 0\n"
		+ "                -niceNames 1\n"
		+ "                $editorName;\n"
		+ "\t\t\t$editorName = ($panelName+\"GraphEd\");\n"
		+ "            animCurveEditor -e \n"
		+ "                -mainListConnection \"graphEditor1FromOutliner\" \n"
		+ "                -displayKeys 1\n"
		+ "                -displayTangents 0\n"
		+ "                -displayActiveKeys 0\n"
		+ "                -displayActiveKeyTangents 1\n"
		+ "                -displayInfinities 0\n"
		+ "                -autoFit 0\n"
		+ "                -snapTime \"integer\" \n"
		+ "                -snapValue \"none\" \n"
		+ "                -showResults \"off\" \n"
		+ "                -showBufferCurves \"off\" \n"
		+ "                -smoothness \"fine\" \n"
		+ "                -resultSamples 1\n"
		+ "                -resultScreenSamples 0\n"
		+ "                -resultUpdate \"delayed\" \n"
		+ "                $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" \"Dope Sheet\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"dopeSheetPanel\" -l \"Dope Sheet\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = ($panelName+\"OutlineEd\");\n"
		+ "            outlinerEditor -e \n"
		+ "                -mainListConnection \"animationList\" \n"
		+ "                -selectionConnection \"dopeSheetPanel1OutlinerSelection\" \n"
		+ "                -highlightConnection \"keyframeList\" \n"
		+ "                -showShapes 1\n"
		+ "                -showAttributes 1\n"
		+ "                -showConnected 1\n"
		+ "                -showAnimCurvesOnly 1\n"
		+ "                -autoExpand 0\n"
		+ "                -showDagOnly 0\n"
		+ "                -ignoreDagHierarchy 0\n"
		+ "                -expandConnections 1\n"
		+ "                -showUnitlessCurves 0\n"
		+ "                -showCompounds 1\n"
		+ "                -showLeafs 1\n"
		+ "                -showNumericAttrsOnly 1\n"
		+ "                -highlightActive 0\n"
		+ "                -autoSelectNewObjects 0\n"
		+ "                -doNotSelectNewObjects 1\n"
		+ "                -dropIsParent 1\n"
		+ "                -transmitFilters 0\n"
		+ "                -setFilter \"0\" \n"
		+ "                -showSetMembers 0\n"
		+ "                -allowMultiSelection 1\n"
		+ "                -alwaysToggleSelect 0\n"
		+ "                -directSelect 0\n"
		+ "                -displayMode \"DAG\" \n"
		+ "                -expandObjects 0\n"
		+ "                -setsIgnoreFilters 1\n"
		+ "                -editAttrName 0\n"
		+ "                -showAttrValues 0\n"
		+ "                -highlightSecondary 0\n"
		+ "                -showUVAttrsOnly 0\n"
		+ "                -showTextureNodesOnly 0\n"
		+ "                -sortOrder \"none\" \n"
		+ "                -longNames 0\n"
		+ "                -niceNames 1\n"
		+ "                $editorName;\n"
		+ "\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n"
		+ "            dopeSheetEditor -e \n"
		+ "                -mainListConnection \"dopeSheetPanel1FromOutliner\" \n"
		+ "                -highlightConnection \"dopeSheetPanel1OutlinerSelection\" \n"
		+ "                -displayKeys 1\n"
		+ "                -displayTangents 0\n"
		+ "                -displayActiveKeys 0\n"
		+ "                -displayActiveKeyTangents 0\n"
		+ "                -displayInfinities 0\n"
		+ "                -autoFit 0\n"
		+ "                -snapTime \"integer\" \n"
		+ "                -snapValue \"none\" \n"
		+ "                -outliner \"dopeSheetPanel1OutlineEd\" \n"
		+ "                -showSummary 1\n"
		+ "                -showScene 0\n"
		+ "                -hierarchyBelow 0\n"
		+ "                $editorName;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Dope Sheet\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t\t$editorName = ($panelName+\"OutlineEd\");\n"
		+ "            outlinerEditor -e \n"
		+ "                -mainListConnection \"animationList\" \n"
		+ "                -selectionConnection \"dopeSheetPanel1OutlinerSelection\" \n"
		+ "                -highlightConnection \"keyframeList\" \n"
		+ "                -showShapes 1\n"
		+ "                -showAttributes 1\n"
		+ "                -showConnected 1\n"
		+ "                -showAnimCurvesOnly 1\n"
		+ "                -autoExpand 0\n"
		+ "                -showDagOnly 0\n"
		+ "                -ignoreDagHierarchy 0\n"
		+ "                -expandConnections 1\n"
		+ "                -showUnitlessCurves 0\n"
		+ "                -showCompounds 1\n"
		+ "                -showLeafs 1\n"
		+ "                -showNumericAttrsOnly 1\n"
		+ "                -highlightActive 0\n"
		+ "                -autoSelectNewObjects 0\n"
		+ "                -doNotSelectNewObjects 1\n"
		+ "                -dropIsParent 1\n"
		+ "                -transmitFilters 0\n"
		+ "                -setFilter \"0\" \n"
		+ "                -showSetMembers 0\n"
		+ "                -allowMultiSelection 1\n"
		+ "                -alwaysToggleSelect 0\n"
		+ "                -directSelect 0\n"
		+ "                -displayMode \"DAG\" \n"
		+ "                -expandObjects 0\n"
		+ "                -setsIgnoreFilters 1\n"
		+ "                -editAttrName 0\n"
		+ "                -showAttrValues 0\n"
		+ "                -highlightSecondary 0\n"
		+ "                -showUVAttrsOnly 0\n"
		+ "                -showTextureNodesOnly 0\n"
		+ "                -sortOrder \"none\" \n"
		+ "                -longNames 0\n"
		+ "                -niceNames 1\n"
		+ "                $editorName;\n"
		+ "\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n"
		+ "            dopeSheetEditor -e \n"
		+ "                -mainListConnection \"dopeSheetPanel1FromOutliner\" \n"
		+ "                -highlightConnection \"dopeSheetPanel1OutlinerSelection\" \n"
		+ "                -displayKeys 1\n"
		+ "                -displayTangents 0\n"
		+ "                -displayActiveKeys 0\n"
		+ "                -displayActiveKeyTangents 0\n"
		+ "                -displayInfinities 0\n"
		+ "                -autoFit 0\n"
		+ "                -snapTime \"integer\" \n"
		+ "                -snapValue \"none\" \n"
		+ "                -outliner \"dopeSheetPanel1OutlineEd\" \n"
		+ "                -showSummary 1\n"
		+ "                -showScene 0\n"
		+ "                -hierarchyBelow 0\n"
		+ "                $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" \"Trax Editor\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"clipEditorPanel\" -l \"Trax Editor\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = ($panelName+\"ClipEditor\");\n"
		+ "            clipEditor -e \n"
		+ "                -characterOutline \"clipEditorPanel1OutlineEditor\" \n"
		+ "                -menuContext \"track\" \n"
		+ "                $editorName;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Trax Editor\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t\t$editorName = ($panelName+\"ClipEditor\");\n"
		+ "            clipEditor -e \n"
		+ "                -characterOutline \"clipEditorPanel1OutlineEditor\" \n"
		+ "                -menuContext \"track\" \n"
		+ "                $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" \"Hypergraph\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l \"Hypergraph\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n"
		+ "            hyperGraph -e \n"
		+ "                -orientation \"horiz\" \n"
		+ "                -zoom 1\n"
		+ "                -animateTransition 0\n"
		+ "                -showShapes 0\n"
		+ "                -showDeformers 0\n"
		+ "                -showExpressions 0\n"
		+ "                -showConstraints 0\n"
		+ "                -showUnderworld 0\n"
		+ "                -showInvisible 0\n"
		+ "                -transitionFrames 1\n"
		+ "                -freeform 0\n"
		+ "                -imageEnabled 0\n"
		+ "                -graphType \"DAG\" \n"
		+ "                -updateSelection 1\n"
		+ "                -updateNodeAdded 1\n"
		+ "                $editorName;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Hypergraph\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n"
		+ "            hyperGraph -e \n"
		+ "                -orientation \"horiz\" \n"
		+ "                -zoom 1\n"
		+ "                -animateTransition 0\n"
		+ "                -showShapes 0\n"
		+ "                -showDeformers 0\n"
		+ "                -showExpressions 0\n"
		+ "                -showConstraints 0\n"
		+ "                -showUnderworld 0\n"
		+ "                -showInvisible 0\n"
		+ "                -transitionFrames 1\n"
		+ "                -freeform 0\n"
		+ "                -imageEnabled 0\n"
		+ "                -graphType \"DAG\" \n"
		+ "                -updateSelection 1\n"
		+ "                -updateNodeAdded 1\n"
		+ "                $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" \"Hypershade\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperShadePanel\" -l \"Hypershade\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Hypershade\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" \"Visor\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"visorPanel\" -l \"Visor\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Visor\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" \"UV Texture Editor\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"polyTexturePlacementPanel\" -l \"UV Texture Editor\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"UV Texture Editor\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"multiListerPanel\" \"Multilister\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"multiListerPanel\" -l \"Multilister\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Multilister\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" \"Render View\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"renderWindowPanel\" -l \"Render View\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Render View\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextPanel \"blendShapePanel\" \"Blend Shape\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\tblendShapePanel -unParent -l \"Blend Shape\" -mbv $menusOkayInPanels ;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tblendShapePanel -edit -l \"Blend Shape\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" \"Dynamic Relationships\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynRelEdPanel\" -l \"Dynamic Relationships\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Dynamic Relationships\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextPanel \"devicePanel\" \"Devices\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\tdevicePanel -unParent -l \"Devices\" -mbv $menusOkayInPanels ;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tdevicePanel -edit -l \"Devices\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" \"Relationship Editor\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"relationshipPanel\" -l \"Relationship Editor\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Relationship Editor\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" \"Reference Editor\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"referenceEditorPanel\" -l \"Reference Editor\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Reference Editor\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" \"Component Editor\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"componentEditorPanel\" -l \"Component Editor\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Component Editor\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" \"Paint Effects\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynPaintScriptedPanelType\" -l \"Paint Effects\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Paint Effects\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\tif ($useSceneConfig) {\n"
		+ "        string $configName = `getPanel -cwl \"Current Layout\"`;\n"
		+ "        if (\"\" != $configName) {\n"
		+ "\t\t\tpanelConfiguration -edit -label \"Current Layout\"\n"
		+ "\t\t\t\t-defaultImage \"\"\n"
		+ "\t\t\t\t-image \"\"\n"
		+ "\t\t\t\t-sc false\n"
		+ "\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n"
		+ "\t\t\t\t-removeAllPanels\n"
		+ "\t\t\t\t-ap false\n"
		+ "\t\t\t\t\t\"Persp View\"\n"
		+ "\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l \\\"Persp View\\\" -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -wireframeOnShaded 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 4096\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -locators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l \\\"Persp View\\\" -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -wireframeOnShaded 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 4096\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -locators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t$configName;\n"
		+ "            setNamedPanelLayout \"Current Layout\";\n"
		+ "        }\n"
		+ "        panelHistory -e -clear mainPanelHistory;\n"
		+ "        setFocus `paneLayout -q -p1 $gMainPane`;\n"
		+ "        sceneUIReplacement -deleteRemaining;\n"
		+ "        sceneUIReplacement -clear;\n"
		+ "\t}\n"
		+ "grid -spacing 1 -size 12 -divisions 1 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\n"
		+ "}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 32 -ast 1 -aet 33 ";
	setAttr ".st" 6;
createNode brush -n "brush1";
createNode brush -n "brush2";
createNode lambert -n "itguy_mat";
createNode shadingEngine -n "lambert2SG";
	setAttr ".ihi" 0;
	setAttr -s 19 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 19 ".gn";
createNode materialInfo -n "materialInfo1";
createNode file -n "file1";
	setAttr ".ftn" -type "string" "C:/art/NPS/3d/characters/itguy//textures/itguy.tga";
createNode place2dTexture -n "place2dTexture1";
createNode skinCluster -n "skinCluster1";
	setAttr -s 32 ".wl";
	setAttr ".wl[0].w[37]"  1;
	setAttr ".wl[1].w[37]"  1;
	setAttr ".wl[2].w[37]"  1;
	setAttr ".wl[3].w[37]"  1;
	setAttr ".wl[4].w[37]"  1;
	setAttr ".wl[5].w[37]"  1;
	setAttr ".wl[6].w[37]"  1;
	setAttr ".wl[7].w[37]"  0.99999994;
	setAttr ".wl[8].w[37]"  1;
	setAttr -s 2 ".wl[9].w[37:38]"  0.51285189 0.48714808;
	setAttr -s 2 ".wl[10].w[37:38]"  0.49999997 0.49999997;
	setAttr -s 2 ".wl[11].w[37:38]"  0.52012557 0.47987437;
	setAttr ".wl[12].w[37]"  1;
	setAttr ".wl[13].w[37]"  1;
	setAttr -s 2 ".wl[14].w[37:38]"  0.32865539 0.67134458;
	setAttr -s 2 ".wl[15].w[37:38]"  0.40541688 0.59458309;
	setAttr ".wl[16].w[38]"  0.99999994;
	setAttr ".wl[17].w[38]"  0.99999994;
	setAttr ".wl[18].w[38]"  1;
	setAttr ".wl[19].w[38]"  1;
	setAttr ".wl[20].w[38]"  1;
	setAttr ".wl[21].w[38]"  1;
	setAttr ".wl[22].w[38]"  1;
	setAttr ".wl[23].w[38]"  1;
	setAttr ".wl[24].w[38]"  1;
	setAttr ".wl[25].w[38]"  1;
	setAttr ".wl[26].w[37]"  1;
	setAttr ".wl[27].w[37]"  1;
	setAttr ".wl[28].w[37]"  1;
	setAttr ".wl[29].w[37]"  1;
	setAttr ".wl[30].w[38]"  0.99999994;
	setAttr ".wl[31].w[38]"  1;
	setAttr -s 45 ".pm";
	setAttr ".pm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -82.905600000000007 1.5235399408006025 1;
	setAttr ".pm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -96.316800000000001 -2.2204460492503131e-016 1;
	setAttr ".pm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -112.16640000000001 0.12451816054295495 1;
	setAttr ".pm[3]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -126.90278208834873 -0.19509691995282158 1;
	setAttr ".pm[4]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -145.07595133010403 1.2191999999999996 1;
	setAttr ".pm[5]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -148.12395133010398 -1.2192000000000005 1;
	setAttr ".pm[6]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -166.41195133010399 -0.60960000000000081 1;
	setAttr ".pm[7]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 10.722223920000001 -130.56032297236209 6.5925809435429965 1;
	setAttr ".pm[8]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 21.336000000000002 -138.37920000000003 3.0480000000000032 1;
	setAttr ".pm[9]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 45.719999999999985 -134.61561791165141 3.1717480164570038 1;
	setAttr ".pm[10]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 71.932799999999972 -132.28319999999999 3.6576000000000017 1;
	setAttr ".pm[11]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.199999999999974 -132.89280000000005 3.6576000000000013 1;
	setAttr ".pm[12]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 79.840525395620432 -133.50240000000008 2.2204460492503131e-015 1;
	setAttr ".pm[13]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.498125395620448 -132.89280000000008 -0.3004912146664338 1;
	setAttr ".pm[14]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.155725395620451 -131.67360000000002 -0.69545463276183173 1;
	setAttr ".pm[15]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 74.096561497334889 -131.67360000000008 -0.82854536723815997 1;
	setAttr ".pm[16]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.534961497334891 -130.45440000000005 -2.3525453672381595 1;
	setAttr ".pm[17]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.529365497334879 -129.23520000000005 -3.8273506472381591 1;
	setAttr ".pm[18]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.012234661144092 -133.50240000000005 4.8768000000000029 1;
	setAttr ".pm[19]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.66983466114408 -132.89280000000005 4.8768000000000038 1;
	setAttr ".pm[20]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.327434661144068 -131.67360000000005 4.8768000000000038 1;
	setAttr ".pm[21]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.722226103569733 -130.56038208834872 6.5925950459904277 1;
	setAttr ".pm[22]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -21.336000000000002 -138.37919999999997 3.0480000000000098 1;
	setAttr ".pm[23]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -45.719999999999985 -134.61561791165127 3.1717496975867028 1;
	setAttr ".pm[24]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -71.932800000000015 -132.28319999999997 3.6576000000000128 1;
	setAttr ".pm[25]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -76.200000000000017 -132.89280000000002 3.6576000000000133 1;
	setAttr ".pm[26]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.651273513656392 -133.50240000000002 5.773159728050814e-015 1;
	setAttr ".pm[27]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -83.30887351365638 -132.89280000000005 -0.27933108636088111 1;
	setAttr ".pm[28]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.966473513656368 -132.28320000000005 -0.6095999999999947 1;
	setAttr ".pm[29]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -74.045160190930289 -131.67359999999999 -0.60959999999999459 1;
	setAttr ".pm[30]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -75.873960190930291 -131.06400000000002 -2.4383999999999943 1;
	setAttr ".pm[31]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -80.750760190930293 -128.7133061190454 -3.6575999999999942 1;
	setAttr ".pm[32]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.611369072747692 -134.11199999999999 4.8768000000000065 1;
	setAttr ".pm[33]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -82.659369072747737 -132.89279999999999 4.8768000000000065 1;
	setAttr ".pm[34]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.926569072747682 -131.67359999999999 4.8768000000000074 1;
	setAttr ".pm[35]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -9.1440000000000019 -79.857600000000005 4.4408920985006262e-016 1;
	setAttr ".pm[36]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084138 -46.329670381891738 4.4408920985006262e-016 1;
	setAttr ".pm[37]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -10.363210150620098 5.48640001637769 1;
	setAttr ".pm[38]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636429 -0.60960012712479283 1;
	setAttr ".pm[39]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636411 -12.801613567960064 1;
	setAttr ".pm[40]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 9.1440000000000001 -79.857568333125343 -3.3504721550646191e-006 1;
	setAttr ".pm[41]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000006 -46.329599999999921 -3.3504721550646187e-006 1;
	setAttr ".pm[42]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -10.363199999999924 5.4863966495278458 1;
	setAttr ".pm[43]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000009 -2.2223394039331943 -0.60960335047215453 1;
	setAttr ".pm[44]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -2.2223394039331952 -12.801603350472154 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 45 ".ma";
	setAttr -s 45 ".dpf[0:44]"  7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 
		7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7;
	setAttr -s 45 ".lw";
	setAttr -s 45 ".lw";
	setAttr ".mi" 4;
	setAttr ".ucm" yes;
createNode groupId -n "groupId162";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts1";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:55]";
createNode tweak -n "tweak1";
createNode objectSet -n "skinCluster1Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skinCluster1GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "skinCluster1GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode objectSet -n "tweakSet1";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId164";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts3";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode dagPose -n "bindPose1";
	setAttr -s 45 ".wm";
	setAttr -s 45 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 82.905600000000007
		 -1.5235399408006025 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 13.411199999999994
		 1.5235399408006027 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 15.849600000000009
		 -0.12451816054295517 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 14.736382088348719
		 0.31961508049577653 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[4]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 18.173169241755318
		 -1.4142969199528213 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[5]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 3.047999999999945
		 2.4384000000000001 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[6]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 18.288000000000011
		 -0.6095999999999997 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[7]" -type "matrix" "xform" 1 1 1 0 0 0 0 -10.722223920000001
		 3.6575408840133719 -6.7876778634958184 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[8]" -type "matrix" "xform" 1 1 1 0 0 0 0 -10.613776080000001
		 7.8188770276379387 3.5445809435429934 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[9]" -type "matrix" "xform" 1 1 1 0 0 0 0 -24.383999999999979
		 -3.7635820883486133 -0.12374801645700062 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[10]" -type "matrix" "xform" 1 1 1 0 0 0 0 -26.212799999999987
		 -2.3324179116514188 -0.48585198354299797 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[11]" -type "matrix" "xform" 1 1 1 0 0 0 0 -4.2672000000000025
		 0.6096000000000571 4.4408920985006262e-016 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
		0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[12]" -type "matrix" "xform" 1 1 1 0 0 0 0 -3.6405253956204575
		 0.60960000000002879 3.6575999999999991 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[13]" -type "matrix" "xform" 1 1 1 0 0 0 0 -3.6576000000000164
		 -0.60960000000000036 0.30049121466643602 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[14]" -type "matrix" "xform" 1 1 1 0 0 0 0 -3.6576000000000022
		 -1.2192000000000576 0.39496341809539792 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[15]" -type "matrix" "xform" 1 1 1 0 0 0 0 2.1034385026650853
		 -1.2191999999999723 4.4861453672381613 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[16]" -type "matrix" "xform" 1 1 1 0 0 0 0 -2.4384000000000015
		 -1.2192000000000291 1.5239999999999996 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[17]" -type "matrix" "xform" 1 1 1 0 0 0 0 -3.9944039999999887
		 -1.2192000000000007 1.4748052799999996 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[18]" -type "matrix" "xform" 1 1 1 0 0 0 0 -3.8122346611441174
		 0.60960000000000036 -1.2192000000000016 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[19]" -type "matrix" "xform" 1 1 1 0 0 0 0 -3.657599999999988
		 -0.60960000000000036 -8.8817841970012523e-016 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[20]" -type "matrix" "xform" 1 1 1 0 0 0 0 -3.657599999999988
		 -1.2192000000000007 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[21]" -type "matrix" "xform" 1 1 1 0 0 0 0 10.722226103569733
		 3.6576000000000022 -6.7876919659432495 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[22]" -type "matrix" "xform" 1 1 1 0 0 0 0 10.613773896430269
		 7.8188179116512515 3.5445950459904179 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[23]" -type "matrix" "xform" 1 1 1 0 0 0 0 24.383999999999986
		 -3.7635820883486986 -0.12374969758669296 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[24]" -type "matrix" "xform" 1 1 1 0 0 0 0 26.212800000000023
		 -2.3324179116513051 -0.48585030241331006 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[25]" -type "matrix" "xform" 1 1 1 0 0 0 0 4.2672000000000025
		 0.6096000000000571 -4.4408920985006262e-016 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
		0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[26]" -type "matrix" "xform" 1 1 1 0 0 0 0 3.4512735136563748
		 0.60960000000000036 3.6576000000000075 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[27]" -type "matrix" "xform" 1 1 1 0 0 0 0 3.657599999999988
		 -0.60959999999997194 0.27933108636088688 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[28]" -type "matrix" "xform" 1 1 1 0 0 0 0 3.657599999999988
		 -0.60960000000000036 0.33026891363911359 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[29]" -type "matrix" "xform" 1 1 1 0 0 0 0 -2.1548398090697281
		 -1.2192000000000291 4.2672000000000079 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[30]" -type "matrix" "xform" 1 1 1 0 0 0 0 1.8288000000000011
		 -0.60959999999997194 1.8287999999999998 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[31]" -type "matrix" "xform" 1 1 1 0 0 0 0 4.8768000000000029
		 -2.3506938809546227 1.2191999999999998 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[32]" -type "matrix" "xform" 1 1 1 0 0 0 0 3.4113690727476751
		 1.2191999999999723 -1.2191999999999927 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[33]" -type "matrix" "xform" 1 1 1 0 0 0 0 3.0480000000000445
		 -1.2192000000000007 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[34]" -type "matrix" "xform" 1 1 1 0 0 0 0 4.2671999999999457
		 -1.2192000000000007 -8.8817841970012523e-016 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[35]" -type "matrix" "xform" 1 1 1 0 0 0 0 9.1440000000000019
		 -3.0480000000000018 1.5235399408006021 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[36]" -type "matrix" "xform" 1 1 1 0 0 0 0 1.7313416490841362
		 -33.527929618108267 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[37]" -type "matrix" "xform" 1 1 1 0 0 0 0 -1.7763568394002505e-015
		 -35.96646023127164 -5.48640001637769 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[38]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 -8.1408702310564554
		 6.0960001435024829 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[39]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 -1.7763568394002505e-015
		 12.192013440835272 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[40]" -type "matrix" "xform" 1 1 1 -4.1955599518535706e-008 8.1982957152583522e-009
		 6.4723378262748155e-010 0 -9.1440000000000019 -3.0480316668745928 1.5235399408006021 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[41]" -type "matrix" "xform" 1 1 1 0 0 0 0 -1.731324960000002
		 -33.527968333125422 -3.1554436208840472e-030 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[42]" -type "matrix" "xform" 1 1 1 0 0 0 0 -5.3290705182007514e-015
		 -35.966399999999993 -5.4863999999999997 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[43]" -type "matrix" "xform" 1 1 1 0 0 0 0 1.7763568394002505e-015
		 -8.1408605960667302 6.0960000000000001 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[44]" -type "matrix" "xform" 1 1 1 0 0 0 0 -1.7763568394002505e-015
		 1.3322676295501878e-015 12.192 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr -s 45 ".m";
	setAttr -s 45 ".p";
	setAttr ".bp" yes;
createNode skinCluster -n "skinCluster2";
	setAttr -s 32 ".wl";
	setAttr ".wl[0].w[42]"  1;
	setAttr ".wl[1].w[42]"  1;
	setAttr ".wl[2].w[42]"  1;
	setAttr ".wl[3].w[42]"  1;
	setAttr ".wl[4].w[42]"  1;
	setAttr ".wl[5].w[42]"  1;
	setAttr ".wl[6].w[42]"  1;
	setAttr ".wl[7].w[42]"  1;
	setAttr ".wl[8].w[42]"  1;
	setAttr -s 2 ".wl[9].w[42:43]"  0.51285213 0.48714793;
	setAttr -s 2 ".wl[10].w[42:43]"  0.5 0.5;
	setAttr -s 2 ".wl[11].w[42:43]"  0.52012557 0.47987446;
	setAttr ".wl[12].w[42]"  1;
	setAttr ".wl[13].w[42]"  1;
	setAttr -s 2 ".wl[14].w[42:43]"  0.32865497 0.67134506;
	setAttr -s 2 ".wl[15].w[42:43]"  0.40541667 0.59458327;
	setAttr ".wl[16].w[43]"  1;
	setAttr ".wl[17].w[43]"  1;
	setAttr ".wl[18].w[43]"  1;
	setAttr ".wl[19].w[43]"  1;
	setAttr ".wl[20].w[43]"  1;
	setAttr ".wl[21].w[43]"  0.99999994;
	setAttr ".wl[22].w[43]"  1;
	setAttr ".wl[23].w[43]"  1;
	setAttr ".wl[24].w[43]"  1;
	setAttr ".wl[25].w[43]"  1;
	setAttr ".wl[26].w[42]"  1;
	setAttr ".wl[27].w[42]"  1;
	setAttr ".wl[28].w[42]"  1;
	setAttr ".wl[29].w[42]"  1;
	setAttr ".wl[30].w[43]"  1;
	setAttr ".wl[31].w[43]"  1;
	setAttr -s 45 ".pm";
	setAttr ".pm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -82.905600000000007 1.5235399408006025 1;
	setAttr ".pm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -96.316800000000001 -2.2204460492503131e-016 1;
	setAttr ".pm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -112.16640000000001 0.12451816054295495 1;
	setAttr ".pm[3]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -126.90278208834873 -0.19509691995282158 1;
	setAttr ".pm[4]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -145.07595133010403 1.2191999999999996 1;
	setAttr ".pm[5]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -148.12395133010398 -1.2192000000000005 1;
	setAttr ".pm[6]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -166.41195133010399 -0.60960000000000081 1;
	setAttr ".pm[7]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 10.722223920000001 -130.56032297236209 6.5925809435429965 1;
	setAttr ".pm[8]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 21.336000000000002 -138.37920000000003 3.0480000000000032 1;
	setAttr ".pm[9]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 45.719999999999985 -134.61561791165141 3.1717480164570038 1;
	setAttr ".pm[10]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 71.932799999999972 -132.28319999999999 3.6576000000000017 1;
	setAttr ".pm[11]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.199999999999974 -132.89280000000005 3.6576000000000013 1;
	setAttr ".pm[12]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 79.840525395620432 -133.50240000000008 2.2204460492503131e-015 1;
	setAttr ".pm[13]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.498125395620448 -132.89280000000008 -0.3004912146664338 1;
	setAttr ".pm[14]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.155725395620451 -131.67360000000002 -0.69545463276183173 1;
	setAttr ".pm[15]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 74.096561497334889 -131.67360000000008 -0.82854536723815997 1;
	setAttr ".pm[16]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.534961497334891 -130.45440000000005 -2.3525453672381595 1;
	setAttr ".pm[17]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.529365497334879 -129.23520000000005 -3.8273506472381591 1;
	setAttr ".pm[18]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.012234661144092 -133.50240000000005 4.8768000000000029 1;
	setAttr ".pm[19]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.66983466114408 -132.89280000000005 4.8768000000000038 1;
	setAttr ".pm[20]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.327434661144068 -131.67360000000005 4.8768000000000038 1;
	setAttr ".pm[21]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.722226103569733 -130.56038208834872 6.5925950459904277 1;
	setAttr ".pm[22]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -21.336000000000002 -138.37919999999997 3.0480000000000098 1;
	setAttr ".pm[23]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -45.719999999999985 -134.61561791165127 3.1717496975867028 1;
	setAttr ".pm[24]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -71.932800000000015 -132.28319999999997 3.6576000000000128 1;
	setAttr ".pm[25]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -76.200000000000017 -132.89280000000002 3.6576000000000133 1;
	setAttr ".pm[26]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.651273513656392 -133.50240000000002 5.773159728050814e-015 1;
	setAttr ".pm[27]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -83.30887351365638 -132.89280000000005 -0.27933108636088111 1;
	setAttr ".pm[28]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.966473513656368 -132.28320000000005 -0.6095999999999947 1;
	setAttr ".pm[29]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -74.045160190930289 -131.67359999999999 -0.60959999999999459 1;
	setAttr ".pm[30]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -75.873960190930291 -131.06400000000002 -2.4383999999999943 1;
	setAttr ".pm[31]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -80.750760190930293 -128.7133061190454 -3.6575999999999942 1;
	setAttr ".pm[32]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.611369072747692 -134.11199999999999 4.8768000000000065 1;
	setAttr ".pm[33]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -82.659369072747737 -132.89279999999999 4.8768000000000065 1;
	setAttr ".pm[34]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.926569072747682 -131.67359999999999 4.8768000000000074 1;
	setAttr ".pm[35]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -9.1440000000000019 -79.857600000000005 4.4408920985006262e-016 1;
	setAttr ".pm[36]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084138 -46.329670381891738 4.4408920985006262e-016 1;
	setAttr ".pm[37]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -10.363210150620098 5.48640001637769 1;
	setAttr ".pm[38]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636429 -0.60960012712479283 1;
	setAttr ".pm[39]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636411 -12.801613567960064 1;
	setAttr ".pm[40]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 9.1440000000000001 -79.857568333125343 -3.3504721550646191e-006 1;
	setAttr ".pm[41]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000006 -46.329599999999921 -3.3504721550646187e-006 1;
	setAttr ".pm[42]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -10.363199999999924 5.4863966495278458 1;
	setAttr ".pm[43]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000009 -2.2223394039331943 -0.60960335047215453 1;
	setAttr ".pm[44]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -2.2223394039331952 -12.801603350472154 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 45 ".ma";
	setAttr -s 45 ".dpf[0:44]"  7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 
		7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7;
	setAttr -s 45 ".lw";
	setAttr -s 45 ".lw";
	setAttr ".mi" 4;
	setAttr ".ucm" yes;
createNode groupId -n "groupId165";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts4";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:55]";
createNode tweak -n "tweak2";
createNode objectSet -n "skinCluster2Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skinCluster2GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "skinCluster2GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode objectSet -n "tweakSet2";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId167";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts6";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode skinCluster -n "skinCluster3";
	setAttr -s 30 ".wl";
	setAttr -s 2 ".wl[0].w[0:1]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[1].w[0:1]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[2].w[0:1]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[3].w[0:1]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[4].w[0:1]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[5].w[0:1]"  0.69999999 0.30000001;
	setAttr ".wl[6].w[1]"  1;
	setAttr ".wl[7].w[1]"  1;
	setAttr ".wl[8].w[1]"  1;
	setAttr ".wl[9].w[1]"  1;
	setAttr ".wl[10].w[1]"  1;
	setAttr ".wl[11].w[1]"  1;
	setAttr -s 2 ".wl[12].w[0:1]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[13].w[0:1]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[14].w[0:1]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[15].w[0:1]"  0.69999999 0.30000001;
	setAttr ".wl[16].w[1]"  1;
	setAttr ".wl[17].w[1]"  1;
	setAttr ".wl[18].w[1]"  1;
	setAttr ".wl[19].w[1]"  1;
	setAttr -s 2 ".wl[20].w[1:2]"  0.5 0.5;
	setAttr -s 2 ".wl[21].w[1:2]"  0.5 0.5;
	setAttr -s 2 ".wl[22].w[1:2]"  0.5 0.5;
	setAttr -s 2 ".wl[23].w[1:2]"  0.5 0.5;
	setAttr -s 2 ".wl[24].w[1:2]"  0.49999997 0.5;
	setAttr -s 2 ".wl[25].w[1:2]"  0.5 0.5;
	setAttr -s 2 ".wl[26].w[1:2]"  0.5 0.5;
	setAttr -s 2 ".wl[27].w[1:2]"  0.5 0.5;
	setAttr -s 2 ".wl[28].w[1:2]"  0.49999997 0.5;
	setAttr -s 2 ".wl[29].w[1:2]"  0.49999997 0.5;
	setAttr -s 45 ".pm";
	setAttr ".pm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -82.905600000000007 1.5235399408006025 1;
	setAttr ".pm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -96.316800000000001 -2.2204460492503131e-016 1;
	setAttr ".pm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -112.16640000000001 0.12451816054295495 1;
	setAttr ".pm[3]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -126.90278208834873 -0.19509691995282158 1;
	setAttr ".pm[4]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -145.07595133010403 1.2191999999999996 1;
	setAttr ".pm[5]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -148.12395133010398 -1.2192000000000005 1;
	setAttr ".pm[6]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -166.41195133010399 -0.60960000000000081 1;
	setAttr ".pm[7]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 10.722223920000001 -130.56032297236209 6.5925809435429965 1;
	setAttr ".pm[8]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 21.336000000000002 -138.37920000000003 3.0480000000000032 1;
	setAttr ".pm[9]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 45.719999999999985 -134.61561791165141 3.1717480164570038 1;
	setAttr ".pm[10]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 71.932799999999972 -132.28319999999999 3.6576000000000017 1;
	setAttr ".pm[11]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.199999999999974 -132.89280000000005 3.6576000000000013 1;
	setAttr ".pm[12]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 79.840525395620432 -133.50240000000008 2.2204460492503131e-015 1;
	setAttr ".pm[13]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.498125395620448 -132.89280000000008 -0.3004912146664338 1;
	setAttr ".pm[14]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.155725395620451 -131.67360000000002 -0.69545463276183173 1;
	setAttr ".pm[15]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 74.096561497334889 -131.67360000000008 -0.82854536723815997 1;
	setAttr ".pm[16]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.534961497334891 -130.45440000000005 -2.3525453672381595 1;
	setAttr ".pm[17]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.529365497334879 -129.23520000000005 -3.8273506472381591 1;
	setAttr ".pm[18]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.012234661144092 -133.50240000000005 4.8768000000000029 1;
	setAttr ".pm[19]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.66983466114408 -132.89280000000005 4.8768000000000038 1;
	setAttr ".pm[20]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.327434661144068 -131.67360000000005 4.8768000000000038 1;
	setAttr ".pm[21]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.722226103569733 -130.56038208834872 6.5925950459904277 1;
	setAttr ".pm[22]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -21.336000000000002 -138.37919999999997 3.0480000000000098 1;
	setAttr ".pm[23]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -45.719999999999985 -134.61561791165127 3.1717496975867028 1;
	setAttr ".pm[24]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -71.932800000000015 -132.28319999999997 3.6576000000000128 1;
	setAttr ".pm[25]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -76.200000000000017 -132.89280000000002 3.6576000000000133 1;
	setAttr ".pm[26]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.651273513656392 -133.50240000000002 5.773159728050814e-015 1;
	setAttr ".pm[27]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -83.30887351365638 -132.89280000000005 -0.27933108636088111 1;
	setAttr ".pm[28]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.966473513656368 -132.28320000000005 -0.6095999999999947 1;
	setAttr ".pm[29]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -74.045160190930289 -131.67359999999999 -0.60959999999999459 1;
	setAttr ".pm[30]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -75.873960190930291 -131.06400000000002 -2.4383999999999943 1;
	setAttr ".pm[31]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -80.750760190930293 -128.7133061190454 -3.6575999999999942 1;
	setAttr ".pm[32]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.611369072747692 -134.11199999999999 4.8768000000000065 1;
	setAttr ".pm[33]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -82.659369072747737 -132.89279999999999 4.8768000000000065 1;
	setAttr ".pm[34]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.926569072747682 -131.67359999999999 4.8768000000000074 1;
	setAttr ".pm[35]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -9.1440000000000019 -79.857600000000005 4.4408920985006262e-016 1;
	setAttr ".pm[36]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084138 -46.329670381891738 4.4408920985006262e-016 1;
	setAttr ".pm[37]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -10.363210150620098 5.48640001637769 1;
	setAttr ".pm[38]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636429 -0.60960012712479283 1;
	setAttr ".pm[39]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636411 -12.801613567960064 1;
	setAttr ".pm[40]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 9.1440000000000001 -79.857568333125343 -3.3504721550646191e-006 1;
	setAttr ".pm[41]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000006 -46.329599999999921 -3.3504721550646187e-006 1;
	setAttr ".pm[42]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -10.363199999999924 5.4863966495278458 1;
	setAttr ".pm[43]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000009 -2.2223394039331943 -0.60960335047215453 1;
	setAttr ".pm[44]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -2.2223394039331952 -12.801603350472154 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 45 ".ma";
	setAttr -s 45 ".dpf[0:44]"  7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 
		7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7;
	setAttr -s 45 ".lw";
	setAttr -s 45 ".lw";
	setAttr ".mi" 4;
	setAttr ".ucm" yes;
createNode groupId -n "groupId168";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts7";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:39]";
createNode tweak -n "tweak3";
createNode objectSet -n "skinCluster3Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skinCluster3GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "skinCluster3GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode objectSet -n "tweakSet3";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId170";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts9";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode skinCluster -n "skinCluster4";
	setAttr -s 64 ".wl";
	setAttr -s 2 ".wl[0].w[1:2]"  0.5 0.5;
	setAttr -s 2 ".wl[1].w[1:2]"  0.5 0.5;
	setAttr -s 2 ".wl[2].w[1:2]"  0.5 0.5;
	setAttr -s 2 ".wl[3].w[1:2]"  0.5 0.5;
	setAttr -s 2 ".wl[4].w[1:2]"  0.49999997 0.5;
	setAttr -s 2 ".wl[5].w[1:2]"  0.5 0.5;
	setAttr -s 2 ".wl[6].w[1:2]"  0.5 0.5;
	setAttr -s 2 ".wl[7].w[1:2]"  0.5 0.5;
	setAttr -s 2 ".wl[8].w[1:2]"  0.49999997 0.5;
	setAttr -s 2 ".wl[9].w[1:2]"  0.49999997 0.5;
	setAttr ".wl[10].w[3]"  1;
	setAttr ".wl[11].w[3]"  1;
	setAttr ".wl[12].w[3]"  1;
	setAttr ".wl[13].w[3]"  1;
	setAttr ".wl[14].w[3]"  1;
	setAttr ".wl[15].w[3]"  1;
	setAttr ".wl[16].w[3]"  1;
	setAttr ".wl[17].w[3]"  1;
	setAttr ".wl[18].w[3]"  1;
	setAttr ".wl[19].w[3]"  1;
	setAttr ".wl[20].w[3]"  1;
	setAttr ".wl[21].w[3]"  1;
	setAttr ".wl[22].w[3]"  1;
	setAttr ".wl[23].w[3]"  1;
	setAttr ".wl[24].w[3]"  1;
	setAttr ".wl[25].w[3]"  1;
	setAttr ".wl[26].w[3]"  1;
	setAttr ".wl[27].w[3]"  1;
	setAttr ".wl[28].w[3]"  1;
	setAttr ".wl[29].w[3]"  1;
	setAttr ".wl[30].w[3]"  1;
	setAttr ".wl[31].w[3]"  1;
	setAttr ".wl[32].w[3]"  1;
	setAttr ".wl[33].w[3]"  1;
	setAttr ".wl[34].w[3]"  1;
	setAttr ".wl[35].w[3]"  1;
	setAttr ".wl[36].w[3]"  1;
	setAttr ".wl[37].w[3]"  1;
	setAttr ".wl[38].w[3]"  1;
	setAttr ".wl[39].w[3]"  1;
	setAttr ".wl[40].w[3]"  1;
	setAttr ".wl[41].w[3]"  1;
	setAttr ".wl[42].w[3]"  1;
	setAttr ".wl[43].w[3]"  1;
	setAttr ".wl[44].w[3]"  1;
	setAttr ".wl[45].w[3]"  1;
	setAttr ".wl[46].w[3]"  1;
	setAttr ".wl[47].w[3]"  1;
	setAttr ".wl[48].w[3]"  1;
	setAttr ".wl[49].w[3]"  1;
	setAttr ".wl[50].w[3]"  1;
	setAttr ".wl[51].w[3]"  1;
	setAttr ".wl[52].w[3]"  1;
	setAttr ".wl[53].w[3]"  1;
	setAttr ".wl[54].w[3]"  1;
	setAttr ".wl[55].w[3]"  1;
	setAttr ".wl[56].w[3]"  1;
	setAttr ".wl[57].w[3]"  1;
	setAttr ".wl[58].w[3]"  1;
	setAttr ".wl[59].w[3]"  1;
	setAttr ".wl[60].w[3]"  1;
	setAttr ".wl[61].w[3]"  1;
	setAttr ".wl[62].w[3]"  1;
	setAttr ".wl[63].w[3]"  1;
	setAttr -s 45 ".pm";
	setAttr ".pm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -82.905600000000007 1.5235399408006025 1;
	setAttr ".pm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -96.316800000000001 -2.2204460492503131e-016 1;
	setAttr ".pm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -112.16640000000001 0.12451816054295495 1;
	setAttr ".pm[3]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -126.90278208834873 -0.19509691995282158 1;
	setAttr ".pm[4]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -145.07595133010403 1.2191999999999996 1;
	setAttr ".pm[5]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -148.12395133010398 -1.2192000000000005 1;
	setAttr ".pm[6]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -166.41195133010399 -0.60960000000000081 1;
	setAttr ".pm[7]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 10.722223920000001 -130.56032297236209 6.5925809435429965 1;
	setAttr ".pm[8]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 21.336000000000002 -138.37920000000003 3.0480000000000032 1;
	setAttr ".pm[9]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 45.719999999999985 -134.61561791165141 3.1717480164570038 1;
	setAttr ".pm[10]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 71.932799999999972 -132.28319999999999 3.6576000000000017 1;
	setAttr ".pm[11]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.199999999999974 -132.89280000000005 3.6576000000000013 1;
	setAttr ".pm[12]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 79.840525395620432 -133.50240000000008 2.2204460492503131e-015 1;
	setAttr ".pm[13]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.498125395620448 -132.89280000000008 -0.3004912146664338 1;
	setAttr ".pm[14]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.155725395620451 -131.67360000000002 -0.69545463276183173 1;
	setAttr ".pm[15]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 74.096561497334889 -131.67360000000008 -0.82854536723815997 1;
	setAttr ".pm[16]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.534961497334891 -130.45440000000005 -2.3525453672381595 1;
	setAttr ".pm[17]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.529365497334879 -129.23520000000005 -3.8273506472381591 1;
	setAttr ".pm[18]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.012234661144092 -133.50240000000005 4.8768000000000029 1;
	setAttr ".pm[19]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.66983466114408 -132.89280000000005 4.8768000000000038 1;
	setAttr ".pm[20]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.327434661144068 -131.67360000000005 4.8768000000000038 1;
	setAttr ".pm[21]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.722226103569733 -130.56038208834872 6.5925950459904277 1;
	setAttr ".pm[22]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -21.336000000000002 -138.37919999999997 3.0480000000000098 1;
	setAttr ".pm[23]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -45.719999999999985 -134.61561791165127 3.1717496975867028 1;
	setAttr ".pm[24]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -71.932800000000015 -132.28319999999997 3.6576000000000128 1;
	setAttr ".pm[25]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -76.200000000000017 -132.89280000000002 3.6576000000000133 1;
	setAttr ".pm[26]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.651273513656392 -133.50240000000002 5.773159728050814e-015 1;
	setAttr ".pm[27]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -83.30887351365638 -132.89280000000005 -0.27933108636088111 1;
	setAttr ".pm[28]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.966473513656368 -132.28320000000005 -0.6095999999999947 1;
	setAttr ".pm[29]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -74.045160190930289 -131.67359999999999 -0.60959999999999459 1;
	setAttr ".pm[30]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -75.873960190930291 -131.06400000000002 -2.4383999999999943 1;
	setAttr ".pm[31]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -80.750760190930293 -128.7133061190454 -3.6575999999999942 1;
	setAttr ".pm[32]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.611369072747692 -134.11199999999999 4.8768000000000065 1;
	setAttr ".pm[33]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -82.659369072747737 -132.89279999999999 4.8768000000000065 1;
	setAttr ".pm[34]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.926569072747682 -131.67359999999999 4.8768000000000074 1;
	setAttr ".pm[35]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -9.1440000000000019 -79.857600000000005 4.4408920985006262e-016 1;
	setAttr ".pm[36]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084138 -46.329670381891738 4.4408920985006262e-016 1;
	setAttr ".pm[37]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -10.363210150620098 5.48640001637769 1;
	setAttr ".pm[38]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636429 -0.60960012712479283 1;
	setAttr ".pm[39]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636411 -12.801613567960064 1;
	setAttr ".pm[40]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 9.1440000000000001 -79.857568333125343 -3.3504721550646191e-006 1;
	setAttr ".pm[41]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000006 -46.329599999999921 -3.3504721550646187e-006 1;
	setAttr ".pm[42]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -10.363199999999924 5.4863966495278458 1;
	setAttr ".pm[43]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000009 -2.2223394039331943 -0.60960335047215453 1;
	setAttr ".pm[44]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -2.2223394039331952 -12.801603350472154 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 45 ".ma";
	setAttr -s 45 ".dpf[0:44]"  7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 
		7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7;
	setAttr -s 45 ".lw";
	setAttr -s 45 ".lw";
	setAttr ".mi" 4;
	setAttr ".ucm" yes;
createNode groupId -n "groupId171";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts10";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:95]";
createNode tweak -n "tweak4";
createNode objectSet -n "skinCluster4Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skinCluster4GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "skinCluster4GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode objectSet -n "tweakSet4";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId173";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts12";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode skinCluster -n "skinCluster5";
	setAttr -s 43 ".wl";
	setAttr ".wl[0].w[35]"  1;
	setAttr ".wl[1].w[35]"  1;
	setAttr ".wl[2].w[35]"  0.99999994;
	setAttr -s 2 ".wl[3].w";
	setAttr ".wl[3].w[0]" 0.69999998807907104;
	setAttr ".wl[3].w[35]" 0.30000001192092896;
	setAttr ".wl[4].w[0]"  1;
	setAttr ".wl[5].w[0]"  1;
	setAttr ".wl[6].w[0]"  1;
	setAttr -s 2 ".wl[7].w[36:37]"  0.5 0.5;
	setAttr -s 2 ".wl[8].w[36:37]"  0.49999997 0.49999997;
	setAttr -s 2 ".wl[9].w[36:37]"  0.5 0.5;
	setAttr ".wl[10].w[37]"  1;
	setAttr ".wl[11].w[37]"  1;
	setAttr ".wl[12].w[37]"  0.99999994;
	setAttr ".wl[13].w[36]"  1;
	setAttr ".wl[14].w[36]"  1;
	setAttr ".wl[15].w[36]"  1;
	setAttr ".wl[16].w[36]"  1;
	setAttr ".wl[17].w[36]"  1;
	setAttr ".wl[18].w[36]"  1;
	setAttr ".wl[19].w[36]"  1;
	setAttr ".wl[20].w[36]"  0.99999994;
	setAttr ".wl[21].w[36]"  1;
	setAttr -s 2 ".wl[22].w[35:36]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[23].w[35:36]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[24].w[35:36]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[25].w[35:36]"  0.39999998 0.60000002;
	setAttr -s 2 ".wl[26].w[35:36]"  0.39999998 0.60000002;
	setAttr -s 2 ".wl[27].w[35:36]"  0.5260312 0.47396874;
	setAttr -s 2 ".wl[28].w";
	setAttr ".wl[28].w[0]" 0.19999998807907104;
	setAttr ".wl[28].w[35]" 0.80000001192092896;
	setAttr ".wl[29].w[35]"  1;
	setAttr ".wl[30].w[35]"  1;
	setAttr ".wl[31].w[36]"  1;
	setAttr ".wl[32].w[36]"  1;
	setAttr ".wl[33].w[36]"  1;
	setAttr -s 2 ".wl[34].w[36:37]"  0.58948314 0.41051686;
	setAttr -s 2 ".wl[35].w[36:37]"  0.54704744 0.45295265;
	setAttr -s 2 ".wl[36].w[36:37]"  0.65343231 0.34656763;
	setAttr ".wl[37].w[0]"  1;
	setAttr ".wl[38].w[0]"  1;
	setAttr ".wl[39].w[0]"  0.99999994;
	setAttr ".wl[40].w[0]"  1;
	setAttr ".wl[41].w[0]"  1;
	setAttr ".wl[42].w[0]"  1;
	setAttr -s 45 ".pm";
	setAttr ".pm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -82.905600000000007 1.5235399408006025 1;
	setAttr ".pm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -96.316800000000001 -2.2204460492503131e-016 1;
	setAttr ".pm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -112.16640000000001 0.12451816054295495 1;
	setAttr ".pm[3]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -126.90278208834873 -0.19509691995282158 1;
	setAttr ".pm[4]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -145.07595133010403 1.2191999999999996 1;
	setAttr ".pm[5]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -148.12395133010398 -1.2192000000000005 1;
	setAttr ".pm[6]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -166.41195133010399 -0.60960000000000081 1;
	setAttr ".pm[7]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 10.722223920000001 -130.56032297236209 6.5925809435429965 1;
	setAttr ".pm[8]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 21.336000000000002 -138.37920000000003 3.0480000000000032 1;
	setAttr ".pm[9]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 45.719999999999985 -134.61561791165141 3.1717480164570038 1;
	setAttr ".pm[10]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 71.932799999999972 -132.28319999999999 3.6576000000000017 1;
	setAttr ".pm[11]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.199999999999974 -132.89280000000005 3.6576000000000013 1;
	setAttr ".pm[12]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 79.840525395620432 -133.50240000000008 2.2204460492503131e-015 1;
	setAttr ".pm[13]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.498125395620448 -132.89280000000008 -0.3004912146664338 1;
	setAttr ".pm[14]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.155725395620451 -131.67360000000002 -0.69545463276183173 1;
	setAttr ".pm[15]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 74.096561497334889 -131.67360000000008 -0.82854536723815997 1;
	setAttr ".pm[16]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.534961497334891 -130.45440000000005 -2.3525453672381595 1;
	setAttr ".pm[17]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.529365497334879 -129.23520000000005 -3.8273506472381591 1;
	setAttr ".pm[18]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.012234661144092 -133.50240000000005 4.8768000000000029 1;
	setAttr ".pm[19]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.66983466114408 -132.89280000000005 4.8768000000000038 1;
	setAttr ".pm[20]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.327434661144068 -131.67360000000005 4.8768000000000038 1;
	setAttr ".pm[21]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.722226103569733 -130.56038208834872 6.5925950459904277 1;
	setAttr ".pm[22]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -21.336000000000002 -138.37919999999997 3.0480000000000098 1;
	setAttr ".pm[23]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -45.719999999999985 -134.61561791165127 3.1717496975867028 1;
	setAttr ".pm[24]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -71.932800000000015 -132.28319999999997 3.6576000000000128 1;
	setAttr ".pm[25]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -76.200000000000017 -132.89280000000002 3.6576000000000133 1;
	setAttr ".pm[26]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.651273513656392 -133.50240000000002 5.773159728050814e-015 1;
	setAttr ".pm[27]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -83.30887351365638 -132.89280000000005 -0.27933108636088111 1;
	setAttr ".pm[28]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.966473513656368 -132.28320000000005 -0.6095999999999947 1;
	setAttr ".pm[29]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -74.045160190930289 -131.67359999999999 -0.60959999999999459 1;
	setAttr ".pm[30]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -75.873960190930291 -131.06400000000002 -2.4383999999999943 1;
	setAttr ".pm[31]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -80.750760190930293 -128.7133061190454 -3.6575999999999942 1;
	setAttr ".pm[32]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.611369072747692 -134.11199999999999 4.8768000000000065 1;
	setAttr ".pm[33]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -82.659369072747737 -132.89279999999999 4.8768000000000065 1;
	setAttr ".pm[34]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.926569072747682 -131.67359999999999 4.8768000000000074 1;
	setAttr ".pm[35]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -9.1440000000000019 -79.857600000000005 4.4408920985006262e-016 1;
	setAttr ".pm[36]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084138 -46.329670381891738 4.4408920985006262e-016 1;
	setAttr ".pm[37]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -10.363210150620098 5.48640001637769 1;
	setAttr ".pm[38]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636429 -0.60960012712479283 1;
	setAttr ".pm[39]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636411 -12.801613567960064 1;
	setAttr ".pm[40]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 9.1440000000000001 -79.857568333125343 -3.3504721550646191e-006 1;
	setAttr ".pm[41]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000006 -46.329599999999921 -3.3504721550646187e-006 1;
	setAttr ".pm[42]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -10.363199999999924 5.4863966495278458 1;
	setAttr ".pm[43]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000009 -2.2223394039331943 -0.60960335047215453 1;
	setAttr ".pm[44]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -2.2223394039331952 -12.801603350472154 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 45 ".ma";
	setAttr -s 45 ".dpf[0:44]"  7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 
		7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7;
	setAttr -s 45 ".lw";
	setAttr -s 45 ".lw";
	setAttr ".mi" 4;
	setAttr ".ucm" yes;
createNode groupId -n "groupId174";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts13";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:70]";
createNode tweak -n "tweak5";
createNode objectSet -n "skinCluster5Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skinCluster5GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "skinCluster5GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode objectSet -n "tweakSet5";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId176";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts15";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode skinCluster -n "skinCluster6";
	setAttr -s 43 ".wl";
	setAttr ".wl[0].w[0]"  1;
	setAttr ".wl[1].w[0]"  1;
	setAttr ".wl[2].w[0]"  1;
	setAttr ".wl[3].w[0]"  1;
	setAttr ".wl[4].w[0]"  1;
	setAttr ".wl[5].w[0]"  1;
	setAttr ".wl[6].w[40]"  0.99999994;
	setAttr ".wl[7].w[40]"  1;
	setAttr ".wl[8].w[40]"  1;
	setAttr -s 2 ".wl[9].w";
	setAttr ".wl[9].w[0]" 0.69999998807907104;
	setAttr ".wl[9].w[40]" 0.30000001192092896;
	setAttr -s 2 ".wl[10].w";
	setAttr ".wl[10].w[0]" 0.56993037462234497;
	setAttr ".wl[10].w[40]" 0.43006965517997742;
	setAttr -s 2 ".wl[11].w";
	setAttr ".wl[11].w[0]" 0.50081044435501099;
	setAttr ".wl[11].w[40]" 0.49918961524963379;
	setAttr -s 2 ".wl[12].w";
	setAttr ".wl[12].w[0]" 0.49999997019767761;
	setAttr ".wl[12].w[40]" 0.49999997019767761;
	setAttr -s 2 ".wl[13].w[41:42]"  0.49919048 0.50080949;
	setAttr -s 2 ".wl[14].w[41:42]"  0.49999997 0.49999997;
	setAttr -s 2 ".wl[15].w[41:42]"  0.3757484 0.62425154;
	setAttr ".wl[16].w[42]"  1;
	setAttr ".wl[17].w[42]"  1;
	setAttr ".wl[18].w[42]"  1;
	setAttr ".wl[19].w[41]"  0.99999994;
	setAttr ".wl[20].w[41]"  1;
	setAttr ".wl[21].w[41]"  1;
	setAttr ".wl[22].w[41]"  1;
	setAttr ".wl[23].w[41]"  1;
	setAttr ".wl[24].w[41]"  1;
	setAttr ".wl[25].w[41]"  1;
	setAttr ".wl[26].w[41]"  1;
	setAttr ".wl[27].w[41]"  1;
	setAttr ".wl[28].w[41]"  1;
	setAttr ".wl[29].w[41]"  1;
	setAttr ".wl[30].w[41]"  1;
	setAttr -s 2 ".wl[31].w[40:41]"  0.48529071 0.51470935;
	setAttr -s 2 ".wl[32].w[40:41]"  0.51173609 0.48826393;
	setAttr -s 2 ".wl[33].w[40:41]"  0.5260331 0.47396687;
	setAttr -s 2 ".wl[34].w[40:41]"  0.51152784 0.48847216;
	setAttr -s 2 ".wl[35].w[40:41]"  0.51196569 0.48803431;
	setAttr -s 2 ".wl[36].w[40:41]"  0.5 0.5;
	setAttr ".wl[37].w[41]"  1;
	setAttr ".wl[38].w[41]"  1;
	setAttr -s 2 ".wl[39].w[41:42]"  0.67740142 0.32259855;
	setAttr -s 2 ".wl[40].w[41:42]"  0.5894835 0.4105165;
	setAttr -s 2 ".wl[41].w[41:42]"  0.57490385 0.42509618;
	setAttr -s 2 ".wl[42].w[41:42]"  0.65343362 0.34656635;
	setAttr -s 45 ".pm";
	setAttr ".pm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -82.905600000000007 1.5235399408006025 1;
	setAttr ".pm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -96.316800000000001 -2.2204460492503131e-016 1;
	setAttr ".pm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -112.16640000000001 0.12451816054295495 1;
	setAttr ".pm[3]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -126.90278208834873 -0.19509691995282158 1;
	setAttr ".pm[4]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -145.07595133010403 1.2191999999999996 1;
	setAttr ".pm[5]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -148.12395133010398 -1.2192000000000005 1;
	setAttr ".pm[6]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -166.41195133010399 -0.60960000000000081 1;
	setAttr ".pm[7]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 10.722223920000001 -130.56032297236209 6.5925809435429965 1;
	setAttr ".pm[8]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 21.336000000000002 -138.37920000000003 3.0480000000000032 1;
	setAttr ".pm[9]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 45.719999999999985 -134.61561791165141 3.1717480164570038 1;
	setAttr ".pm[10]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 71.932799999999972 -132.28319999999999 3.6576000000000017 1;
	setAttr ".pm[11]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.199999999999974 -132.89280000000005 3.6576000000000013 1;
	setAttr ".pm[12]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 79.840525395620432 -133.50240000000008 2.2204460492503131e-015 1;
	setAttr ".pm[13]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.498125395620448 -132.89280000000008 -0.3004912146664338 1;
	setAttr ".pm[14]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.155725395620451 -131.67360000000002 -0.69545463276183173 1;
	setAttr ".pm[15]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 74.096561497334889 -131.67360000000008 -0.82854536723815997 1;
	setAttr ".pm[16]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.534961497334891 -130.45440000000005 -2.3525453672381595 1;
	setAttr ".pm[17]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.529365497334879 -129.23520000000005 -3.8273506472381591 1;
	setAttr ".pm[18]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.012234661144092 -133.50240000000005 4.8768000000000029 1;
	setAttr ".pm[19]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.66983466114408 -132.89280000000005 4.8768000000000038 1;
	setAttr ".pm[20]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.327434661144068 -131.67360000000005 4.8768000000000038 1;
	setAttr ".pm[21]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.722226103569733 -130.56038208834872 6.5925950459904277 1;
	setAttr ".pm[22]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -21.336000000000002 -138.37919999999997 3.0480000000000098 1;
	setAttr ".pm[23]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -45.719999999999985 -134.61561791165127 3.1717496975867028 1;
	setAttr ".pm[24]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -71.932800000000015 -132.28319999999997 3.6576000000000128 1;
	setAttr ".pm[25]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -76.200000000000017 -132.89280000000002 3.6576000000000133 1;
	setAttr ".pm[26]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.651273513656392 -133.50240000000002 5.773159728050814e-015 1;
	setAttr ".pm[27]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -83.30887351365638 -132.89280000000005 -0.27933108636088111 1;
	setAttr ".pm[28]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.966473513656368 -132.28320000000005 -0.6095999999999947 1;
	setAttr ".pm[29]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -74.045160190930289 -131.67359999999999 -0.60959999999999459 1;
	setAttr ".pm[30]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -75.873960190930291 -131.06400000000002 -2.4383999999999943 1;
	setAttr ".pm[31]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -80.750760190930293 -128.7133061190454 -3.6575999999999942 1;
	setAttr ".pm[32]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.611369072747692 -134.11199999999999 4.8768000000000065 1;
	setAttr ".pm[33]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -82.659369072747737 -132.89279999999999 4.8768000000000065 1;
	setAttr ".pm[34]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.926569072747682 -131.67359999999999 4.8768000000000074 1;
	setAttr ".pm[35]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -9.1440000000000019 -79.857600000000005 4.4408920985006262e-016 1;
	setAttr ".pm[36]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084138 -46.329670381891738 4.4408920985006262e-016 1;
	setAttr ".pm[37]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -10.363210150620098 5.48640001637769 1;
	setAttr ".pm[38]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636429 -0.60960012712479283 1;
	setAttr ".pm[39]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636411 -12.801613567960064 1;
	setAttr ".pm[40]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 9.1440000000000001 -79.857568333125343 -3.3504721550646191e-006 1;
	setAttr ".pm[41]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000006 -46.329599999999921 -3.3504721550646187e-006 1;
	setAttr ".pm[42]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -10.363199999999924 5.4863966495278458 1;
	setAttr ".pm[43]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000009 -2.2223394039331943 -0.60960335047215453 1;
	setAttr ".pm[44]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -2.2223394039331952 -12.801603350472154 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 45 ".ma";
	setAttr -s 45 ".dpf[0:44]"  7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 
		7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7;
	setAttr -s 45 ".lw";
	setAttr -s 45 ".lw";
	setAttr ".mi" 4;
	setAttr ".ucm" yes;
createNode groupId -n "groupId177";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts16";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:70]";
createNode tweak -n "tweak6";
createNode objectSet -n "skinCluster6Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skinCluster6GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "skinCluster6GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode objectSet -n "tweakSet6";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId179";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts18";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode skinCluster -n "skinCluster7";
	setAttr -s 48 ".wl";
	setAttr ".wl[0].w[22]"  0.99999994;
	setAttr ".wl[1].w[22]"  1;
	setAttr ".wl[2].w[22]"  0.99999994;
	setAttr ".wl[3].w[22]"  1;
	setAttr ".wl[4].w[22]"  1;
	setAttr ".wl[5].w[22]"  1;
	setAttr ".wl[6].w[22]"  1;
	setAttr ".wl[7].w[22]"  0.99999994;
	setAttr ".wl[8].w[22]"  0.99999994;
	setAttr ".wl[9].w[22]"  0.99999994;
	setAttr ".wl[10].w[22]"  1;
	setAttr ".wl[11].w[22]"  1;
	setAttr ".wl[12].w[22]"  1;
	setAttr ".wl[13].w[22]"  1;
	setAttr ".wl[14].w[22]"  1;
	setAttr ".wl[15].w[22]"  1;
	setAttr ".wl[16].w[22]"  0.99999994;
	setAttr ".wl[17].w[22]"  1;
	setAttr ".wl[18].w[22]"  1;
	setAttr ".wl[19].w[22]"  1;
	setAttr ".wl[20].w[22]"  1;
	setAttr ".wl[21].w[22]"  1;
	setAttr ".wl[22].w[22]"  0.99999994;
	setAttr ".wl[23].w[22]"  1;
	setAttr ".wl[24].w[22]"  1;
	setAttr -s 2 ".wl[25].w[22:23]"  0.69999999 0.30000001;
	setAttr ".wl[26].w[22]"  1;
	setAttr ".wl[27].w[22]"  1;
	setAttr ".wl[28].w[22]"  1;
	setAttr -s 2 ".wl[29].w[22:23]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[30].w[22:23]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[31].w[22:23]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[32].w";
	setAttr ".wl[32].w[3]" 0.5;
	setAttr ".wl[32].w[22]" 0.5;
	setAttr -s 2 ".wl[33].w";
	setAttr ".wl[33].w[3]" 0.5;
	setAttr ".wl[33].w[22]" 0.5;
	setAttr -s 2 ".wl[34].w";
	setAttr ".wl[34].w[3]" 0.5;
	setAttr ".wl[34].w[22]" 0.5;
	setAttr -s 2 ".wl[35].w";
	setAttr ".wl[35].w[3]" 0.5;
	setAttr ".wl[35].w[22]" 0.5;
	setAttr -s 2 ".wl[36].w";
	setAttr ".wl[36].w[3]" 0.5;
	setAttr ".wl[36].w[22]" 0.5;
	setAttr -s 2 ".wl[37].w";
	setAttr ".wl[37].w[3]" 0.5;
	setAttr ".wl[37].w[22]" 0.5;
	setAttr -s 2 ".wl[38].w";
	setAttr ".wl[38].w[3]" 0.5;
	setAttr ".wl[38].w[22]" 0.5;
	setAttr ".wl[39].w[22]"  1;
	setAttr ".wl[40].w[3]"  1;
	setAttr ".wl[41].w[3]"  1;
	setAttr ".wl[42].w[3]"  1;
	setAttr ".wl[43].w[3]"  1;
	setAttr ".wl[44].w[3]"  1;
	setAttr ".wl[45].w[3]"  1;
	setAttr ".wl[46].w[3]"  1;
	setAttr ".wl[47].w[3]"  1;
	setAttr -s 45 ".pm";
	setAttr ".pm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -82.905600000000007 1.5235399408006025 1;
	setAttr ".pm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -96.316800000000001 -2.2204460492503131e-016 1;
	setAttr ".pm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -112.16640000000001 0.12451816054295495 1;
	setAttr ".pm[3]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -126.90278208834873 -0.19509691995282158 1;
	setAttr ".pm[4]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -145.07595133010403 1.2191999999999996 1;
	setAttr ".pm[5]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -148.12395133010398 -1.2192000000000005 1;
	setAttr ".pm[6]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -166.41195133010399 -0.60960000000000081 1;
	setAttr ".pm[7]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 10.722223920000001 -130.56032297236209 6.5925809435429965 1;
	setAttr ".pm[8]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 21.336000000000002 -138.37920000000003 3.0480000000000032 1;
	setAttr ".pm[9]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 45.719999999999985 -134.61561791165141 3.1717480164570038 1;
	setAttr ".pm[10]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 71.932799999999972 -132.28319999999999 3.6576000000000017 1;
	setAttr ".pm[11]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.199999999999974 -132.89280000000005 3.6576000000000013 1;
	setAttr ".pm[12]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 79.840525395620432 -133.50240000000008 2.2204460492503131e-015 1;
	setAttr ".pm[13]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.498125395620448 -132.89280000000008 -0.3004912146664338 1;
	setAttr ".pm[14]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.155725395620451 -131.67360000000002 -0.69545463276183173 1;
	setAttr ".pm[15]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 74.096561497334889 -131.67360000000008 -0.82854536723815997 1;
	setAttr ".pm[16]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.534961497334891 -130.45440000000005 -2.3525453672381595 1;
	setAttr ".pm[17]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.529365497334879 -129.23520000000005 -3.8273506472381591 1;
	setAttr ".pm[18]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.012234661144092 -133.50240000000005 4.8768000000000029 1;
	setAttr ".pm[19]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.66983466114408 -132.89280000000005 4.8768000000000038 1;
	setAttr ".pm[20]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.327434661144068 -131.67360000000005 4.8768000000000038 1;
	setAttr ".pm[21]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.722226103569733 -130.56038208834872 6.5925950459904277 1;
	setAttr ".pm[22]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -21.336000000000002 -138.37919999999997 3.0480000000000098 1;
	setAttr ".pm[23]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -45.719999999999985 -134.61561791165127 3.1717496975867028 1;
	setAttr ".pm[24]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -71.932800000000015 -132.28319999999997 3.6576000000000128 1;
	setAttr ".pm[25]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -76.200000000000017 -132.89280000000002 3.6576000000000133 1;
	setAttr ".pm[26]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.651273513656392 -133.50240000000002 5.773159728050814e-015 1;
	setAttr ".pm[27]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -83.30887351365638 -132.89280000000005 -0.27933108636088111 1;
	setAttr ".pm[28]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.966473513656368 -132.28320000000005 -0.6095999999999947 1;
	setAttr ".pm[29]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -74.045160190930289 -131.67359999999999 -0.60959999999999459 1;
	setAttr ".pm[30]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -75.873960190930291 -131.06400000000002 -2.4383999999999943 1;
	setAttr ".pm[31]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -80.750760190930293 -128.7133061190454 -3.6575999999999942 1;
	setAttr ".pm[32]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.611369072747692 -134.11199999999999 4.8768000000000065 1;
	setAttr ".pm[33]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -82.659369072747737 -132.89279999999999 4.8768000000000065 1;
	setAttr ".pm[34]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.926569072747682 -131.67359999999999 4.8768000000000074 1;
	setAttr ".pm[35]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -9.1440000000000019 -79.857600000000005 4.4408920985006262e-016 1;
	setAttr ".pm[36]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084138 -46.329670381891738 4.4408920985006262e-016 1;
	setAttr ".pm[37]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -10.363210150620098 5.48640001637769 1;
	setAttr ".pm[38]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636429 -0.60960012712479283 1;
	setAttr ".pm[39]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636411 -12.801613567960064 1;
	setAttr ".pm[40]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 9.1440000000000001 -79.857568333125343 -3.3504721550646191e-006 1;
	setAttr ".pm[41]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000006 -46.329599999999921 -3.3504721550646187e-006 1;
	setAttr ".pm[42]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -10.363199999999924 5.4863966495278458 1;
	setAttr ".pm[43]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000009 -2.2223394039331943 -0.60960335047215453 1;
	setAttr ".pm[44]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -2.2223394039331952 -12.801603350472154 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 45 ".ma";
	setAttr -s 45 ".dpf[0:44]"  7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 
		7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7;
	setAttr -s 45 ".lw";
	setAttr -s 45 ".lw";
	setAttr ".mi" 4;
	setAttr ".ucm" yes;
createNode groupId -n "groupId180";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts19";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:79]";
createNode tweak -n "tweak7";
createNode objectSet -n "skinCluster7Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skinCluster7GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "skinCluster7GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode objectSet -n "tweakSet7";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId182";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts21";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode skinCluster -n "skinCluster8";
	setAttr -s 24 ".wl";
	setAttr ".wl[0].w[23]"  1;
	setAttr ".wl[1].w[23]"  1;
	setAttr ".wl[2].w[23]"  1;
	setAttr ".wl[3].w[23]"  1;
	setAttr ".wl[4].w[23]"  1;
	setAttr ".wl[5].w[23]"  1;
	setAttr ".wl[6].w[23]"  1;
	setAttr ".wl[7].w[23]"  1;
	setAttr -s 2 ".wl[8].w[22:23]"  0.69999999 0.30000001;
	setAttr ".wl[9].w[22]"  1;
	setAttr ".wl[10].w[22]"  1;
	setAttr ".wl[11].w[22]"  1;
	setAttr ".wl[12].w[22]"  1;
	setAttr -s 2 ".wl[13].w[22:23]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[14].w[22:23]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[15].w[22:23]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[16].w[23:24]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[17].w[23:24]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[18].w[23:24]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[19].w[23:24]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[20].w[23:24]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[21].w[23:24]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[22].w[23:24]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[23].w[23:24]"  0.69999999 0.30000001;
	setAttr -s 45 ".pm";
	setAttr ".pm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -82.905600000000007 1.5235399408006025 1;
	setAttr ".pm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -96.316800000000001 -2.2204460492503131e-016 1;
	setAttr ".pm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -112.16640000000001 0.12451816054295495 1;
	setAttr ".pm[3]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -126.90278208834873 -0.19509691995282158 1;
	setAttr ".pm[4]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -145.07595133010403 1.2191999999999996 1;
	setAttr ".pm[5]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -148.12395133010398 -1.2192000000000005 1;
	setAttr ".pm[6]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -166.41195133010399 -0.60960000000000081 1;
	setAttr ".pm[7]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 10.722223920000001 -130.56032297236209 6.5925809435429965 1;
	setAttr ".pm[8]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 21.336000000000002 -138.37920000000003 3.0480000000000032 1;
	setAttr ".pm[9]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 45.719999999999985 -134.61561791165141 3.1717480164570038 1;
	setAttr ".pm[10]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 71.932799999999972 -132.28319999999999 3.6576000000000017 1;
	setAttr ".pm[11]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.199999999999974 -132.89280000000005 3.6576000000000013 1;
	setAttr ".pm[12]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 79.840525395620432 -133.50240000000008 2.2204460492503131e-015 1;
	setAttr ".pm[13]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.498125395620448 -132.89280000000008 -0.3004912146664338 1;
	setAttr ".pm[14]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.155725395620451 -131.67360000000002 -0.69545463276183173 1;
	setAttr ".pm[15]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 74.096561497334889 -131.67360000000008 -0.82854536723815997 1;
	setAttr ".pm[16]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.534961497334891 -130.45440000000005 -2.3525453672381595 1;
	setAttr ".pm[17]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.529365497334879 -129.23520000000005 -3.8273506472381591 1;
	setAttr ".pm[18]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.012234661144092 -133.50240000000005 4.8768000000000029 1;
	setAttr ".pm[19]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.66983466114408 -132.89280000000005 4.8768000000000038 1;
	setAttr ".pm[20]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.327434661144068 -131.67360000000005 4.8768000000000038 1;
	setAttr ".pm[21]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.722226103569733 -130.56038208834872 6.5925950459904277 1;
	setAttr ".pm[22]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -21.336000000000002 -138.37919999999997 3.0480000000000098 1;
	setAttr ".pm[23]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -45.719999999999985 -134.61561791165127 3.1717496975867028 1;
	setAttr ".pm[24]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -71.932800000000015 -132.28319999999997 3.6576000000000128 1;
	setAttr ".pm[25]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -76.200000000000017 -132.89280000000002 3.6576000000000133 1;
	setAttr ".pm[26]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.651273513656392 -133.50240000000002 5.773159728050814e-015 1;
	setAttr ".pm[27]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -83.30887351365638 -132.89280000000005 -0.27933108636088111 1;
	setAttr ".pm[28]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.966473513656368 -132.28320000000005 -0.6095999999999947 1;
	setAttr ".pm[29]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -74.045160190930289 -131.67359999999999 -0.60959999999999459 1;
	setAttr ".pm[30]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -75.873960190930291 -131.06400000000002 -2.4383999999999943 1;
	setAttr ".pm[31]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -80.750760190930293 -128.7133061190454 -3.6575999999999942 1;
	setAttr ".pm[32]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.611369072747692 -134.11199999999999 4.8768000000000065 1;
	setAttr ".pm[33]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -82.659369072747737 -132.89279999999999 4.8768000000000065 1;
	setAttr ".pm[34]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.926569072747682 -131.67359999999999 4.8768000000000074 1;
	setAttr ".pm[35]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -9.1440000000000019 -79.857600000000005 4.4408920985006262e-016 1;
	setAttr ".pm[36]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084138 -46.329670381891738 4.4408920985006262e-016 1;
	setAttr ".pm[37]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -10.363210150620098 5.48640001637769 1;
	setAttr ".pm[38]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636429 -0.60960012712479283 1;
	setAttr ".pm[39]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636411 -12.801613567960064 1;
	setAttr ".pm[40]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 9.1440000000000001 -79.857568333125343 -3.3504721550646191e-006 1;
	setAttr ".pm[41]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000006 -46.329599999999921 -3.3504721550646187e-006 1;
	setAttr ".pm[42]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -10.363199999999924 5.4863966495278458 1;
	setAttr ".pm[43]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000009 -2.2223394039331943 -0.60960335047215453 1;
	setAttr ".pm[44]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -2.2223394039331952 -12.801603350472154 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 45 ".ma";
	setAttr -s 45 ".dpf[0:44]"  7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 
		7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7;
	setAttr -s 45 ".lw";
	setAttr -s 45 ".lw";
	setAttr ".mi" 4;
	setAttr ".ucm" yes;
createNode groupId -n "groupId183";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts22";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:31]";
createNode tweak -n "tweak8";
createNode objectSet -n "skinCluster8Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skinCluster8GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "skinCluster8GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode objectSet -n "tweakSet8";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId185";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts24";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode skinCluster -n "skinCluster9";
	setAttr -s 48 ".wl";
	setAttr ".wl[0].w[8]"  1;
	setAttr ".wl[1].w[8]"  1;
	setAttr ".wl[2].w[8]"  1;
	setAttr ".wl[3].w[8]"  1;
	setAttr ".wl[4].w[8]"  1;
	setAttr ".wl[5].w[8]"  1;
	setAttr ".wl[6].w[8]"  1;
	setAttr ".wl[7].w[8]"  1;
	setAttr ".wl[8].w[8]"  1;
	setAttr ".wl[9].w[8]"  1;
	setAttr ".wl[10].w[8]"  1;
	setAttr ".wl[11].w[8]"  1;
	setAttr ".wl[12].w[8]"  1;
	setAttr ".wl[13].w[8]"  1;
	setAttr ".wl[14].w[8]"  1;
	setAttr ".wl[15].w[8]"  1;
	setAttr ".wl[16].w[8]"  1;
	setAttr ".wl[17].w[8]"  1;
	setAttr ".wl[18].w[3]"  1;
	setAttr -s 2 ".wl[19].w";
	setAttr ".wl[19].w[3]" 0.5;
	setAttr ".wl[19].w[8]" 0.5;
	setAttr ".wl[20].w[3]"  1;
	setAttr ".wl[21].w[3]"  1;
	setAttr ".wl[22].w[8]"  1;
	setAttr ".wl[23].w[3]"  1;
	setAttr ".wl[24].w[8]"  1;
	setAttr ".wl[25].w[3]"  1;
	setAttr ".wl[26].w[3]"  1;
	setAttr ".wl[27].w[8]"  0.99999994;
	setAttr ".wl[28].w[3]"  1;
	setAttr -s 2 ".wl[29].w";
	setAttr ".wl[29].w[3]" 0.5;
	setAttr ".wl[29].w[8]" 0.5;
	setAttr ".wl[30].w[3]"  1;
	setAttr -s 2 ".wl[31].w";
	setAttr ".wl[31].w[3]" 0.5;
	setAttr ".wl[31].w[8]" 0.5;
	setAttr ".wl[32].w[8]"  1;
	setAttr ".wl[33].w[8]"  1;
	setAttr ".wl[34].w[8]"  1;
	setAttr ".wl[35].w[8]"  1;
	setAttr ".wl[36].w[8]"  1;
	setAttr ".wl[37].w[8]"  1;
	setAttr ".wl[38].w[8]"  1;
	setAttr ".wl[39].w[8]"  1;
	setAttr -s 2 ".wl[40].w[8:9]"  0.30000001 0.69999999;
	setAttr ".wl[41].w[8]"  1;
	setAttr ".wl[42].w[8]"  1;
	setAttr ".wl[43].w[8]"  1;
	setAttr ".wl[44].w[8]"  1;
	setAttr ".wl[45].w[8]"  1;
	setAttr -s 2 ".wl[46].w[8:9]"  0.30000001 0.69999999;
	setAttr -s 2 ".wl[47].w[8:9]"  0.30000001 0.69999999;
	setAttr -s 45 ".pm";
	setAttr ".pm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -82.905600000000007 1.5235399408006025 1;
	setAttr ".pm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -96.316800000000001 -2.2204460492503131e-016 1;
	setAttr ".pm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -112.16640000000001 0.12451816054295495 1;
	setAttr ".pm[3]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -126.90278208834873 -0.19509691995282158 1;
	setAttr ".pm[4]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -145.07595133010403 1.2191999999999996 1;
	setAttr ".pm[5]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -148.12395133010398 -1.2192000000000005 1;
	setAttr ".pm[6]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -166.41195133010399 -0.60960000000000081 1;
	setAttr ".pm[7]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 10.722223920000001 -130.56032297236209 6.5925809435429965 1;
	setAttr ".pm[8]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 21.336000000000002 -138.37920000000003 3.0480000000000032 1;
	setAttr ".pm[9]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 45.719999999999985 -134.61561791165141 3.1717480164570038 1;
	setAttr ".pm[10]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 71.932799999999972 -132.28319999999999 3.6576000000000017 1;
	setAttr ".pm[11]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.199999999999974 -132.89280000000005 3.6576000000000013 1;
	setAttr ".pm[12]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 79.840525395620432 -133.50240000000008 2.2204460492503131e-015 1;
	setAttr ".pm[13]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.498125395620448 -132.89280000000008 -0.3004912146664338 1;
	setAttr ".pm[14]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.155725395620451 -131.67360000000002 -0.69545463276183173 1;
	setAttr ".pm[15]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 74.096561497334889 -131.67360000000008 -0.82854536723815997 1;
	setAttr ".pm[16]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.534961497334891 -130.45440000000005 -2.3525453672381595 1;
	setAttr ".pm[17]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.529365497334879 -129.23520000000005 -3.8273506472381591 1;
	setAttr ".pm[18]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.012234661144092 -133.50240000000005 4.8768000000000029 1;
	setAttr ".pm[19]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.66983466114408 -132.89280000000005 4.8768000000000038 1;
	setAttr ".pm[20]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.327434661144068 -131.67360000000005 4.8768000000000038 1;
	setAttr ".pm[21]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.722226103569733 -130.56038208834872 6.5925950459904277 1;
	setAttr ".pm[22]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -21.336000000000002 -138.37919999999997 3.0480000000000098 1;
	setAttr ".pm[23]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -45.719999999999985 -134.61561791165127 3.1717496975867028 1;
	setAttr ".pm[24]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -71.932800000000015 -132.28319999999997 3.6576000000000128 1;
	setAttr ".pm[25]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -76.200000000000017 -132.89280000000002 3.6576000000000133 1;
	setAttr ".pm[26]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.651273513656392 -133.50240000000002 5.773159728050814e-015 1;
	setAttr ".pm[27]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -83.30887351365638 -132.89280000000005 -0.27933108636088111 1;
	setAttr ".pm[28]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.966473513656368 -132.28320000000005 -0.6095999999999947 1;
	setAttr ".pm[29]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -74.045160190930289 -131.67359999999999 -0.60959999999999459 1;
	setAttr ".pm[30]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -75.873960190930291 -131.06400000000002 -2.4383999999999943 1;
	setAttr ".pm[31]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -80.750760190930293 -128.7133061190454 -3.6575999999999942 1;
	setAttr ".pm[32]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.611369072747692 -134.11199999999999 4.8768000000000065 1;
	setAttr ".pm[33]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -82.659369072747737 -132.89279999999999 4.8768000000000065 1;
	setAttr ".pm[34]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.926569072747682 -131.67359999999999 4.8768000000000074 1;
	setAttr ".pm[35]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -9.1440000000000019 -79.857600000000005 4.4408920985006262e-016 1;
	setAttr ".pm[36]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084138 -46.329670381891738 4.4408920985006262e-016 1;
	setAttr ".pm[37]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -10.363210150620098 5.48640001637769 1;
	setAttr ".pm[38]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636429 -0.60960012712479283 1;
	setAttr ".pm[39]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636411 -12.801613567960064 1;
	setAttr ".pm[40]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 9.1440000000000001 -79.857568333125343 -3.3504721550646191e-006 1;
	setAttr ".pm[41]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000006 -46.329599999999921 -3.3504721550646187e-006 1;
	setAttr ".pm[42]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -10.363199999999924 5.4863966495278458 1;
	setAttr ".pm[43]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000009 -2.2223394039331943 -0.60960335047215453 1;
	setAttr ".pm[44]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -2.2223394039331952 -12.801603350472154 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 45 ".ma";
	setAttr -s 45 ".dpf[0:44]"  7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 
		7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7;
	setAttr -s 45 ".lw";
	setAttr -s 45 ".lw";
	setAttr ".mi" 4;
	setAttr ".ucm" yes;
createNode groupId -n "groupId186";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts25";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:79]";
createNode tweak -n "tweak9";
createNode objectSet -n "skinCluster9Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skinCluster9GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "skinCluster9GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode objectSet -n "tweakSet9";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId188";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts27";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode skinCluster -n "skinCluster10";
	setAttr -s 24 ".wl";
	setAttr ".wl[0].w[9]"  1;
	setAttr ".wl[1].w[9]"  1;
	setAttr ".wl[2].w[9]"  1;
	setAttr ".wl[3].w[9]"  1;
	setAttr ".wl[4].w[9]"  1;
	setAttr ".wl[5].w[9]"  1;
	setAttr ".wl[6].w[9]"  1;
	setAttr ".wl[7].w[9]"  1;
	setAttr -s 2 ".wl[8].w[8:9]"  0.30000001 0.69999999;
	setAttr ".wl[9].w[8]"  1;
	setAttr ".wl[10].w[8]"  1;
	setAttr ".wl[11].w[8]"  1;
	setAttr ".wl[12].w[8]"  1;
	setAttr ".wl[13].w[8]"  1;
	setAttr -s 2 ".wl[14].w[8:9]"  0.30000001 0.69999999;
	setAttr -s 2 ".wl[15].w[8:9]"  0.30000001 0.69999999;
	setAttr -s 2 ".wl[16].w[9:10]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[17].w[9:10]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[18].w[9:10]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[19].w[9:10]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[20].w[9:10]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[21].w[9:10]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[22].w[9:10]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[23].w[9:10]"  0.69999999 0.30000001;
	setAttr -s 45 ".pm";
	setAttr ".pm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -82.905600000000007 1.5235399408006025 1;
	setAttr ".pm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -96.316800000000001 -2.2204460492503131e-016 1;
	setAttr ".pm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -112.16640000000001 0.12451816054295495 1;
	setAttr ".pm[3]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -126.90278208834873 -0.19509691995282158 1;
	setAttr ".pm[4]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -145.07595133010403 1.2191999999999996 1;
	setAttr ".pm[5]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -148.12395133010398 -1.2192000000000005 1;
	setAttr ".pm[6]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -166.41195133010399 -0.60960000000000081 1;
	setAttr ".pm[7]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 10.722223920000001 -130.56032297236209 6.5925809435429965 1;
	setAttr ".pm[8]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 21.336000000000002 -138.37920000000003 3.0480000000000032 1;
	setAttr ".pm[9]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 45.719999999999985 -134.61561791165141 3.1717480164570038 1;
	setAttr ".pm[10]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 71.932799999999972 -132.28319999999999 3.6576000000000017 1;
	setAttr ".pm[11]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.199999999999974 -132.89280000000005 3.6576000000000013 1;
	setAttr ".pm[12]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 79.840525395620432 -133.50240000000008 2.2204460492503131e-015 1;
	setAttr ".pm[13]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.498125395620448 -132.89280000000008 -0.3004912146664338 1;
	setAttr ".pm[14]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.155725395620451 -131.67360000000002 -0.69545463276183173 1;
	setAttr ".pm[15]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 74.096561497334889 -131.67360000000008 -0.82854536723815997 1;
	setAttr ".pm[16]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.534961497334891 -130.45440000000005 -2.3525453672381595 1;
	setAttr ".pm[17]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.529365497334879 -129.23520000000005 -3.8273506472381591 1;
	setAttr ".pm[18]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.012234661144092 -133.50240000000005 4.8768000000000029 1;
	setAttr ".pm[19]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.66983466114408 -132.89280000000005 4.8768000000000038 1;
	setAttr ".pm[20]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.327434661144068 -131.67360000000005 4.8768000000000038 1;
	setAttr ".pm[21]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.722226103569733 -130.56038208834872 6.5925950459904277 1;
	setAttr ".pm[22]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -21.336000000000002 -138.37919999999997 3.0480000000000098 1;
	setAttr ".pm[23]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -45.719999999999985 -134.61561791165127 3.1717496975867028 1;
	setAttr ".pm[24]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -71.932800000000015 -132.28319999999997 3.6576000000000128 1;
	setAttr ".pm[25]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -76.200000000000017 -132.89280000000002 3.6576000000000133 1;
	setAttr ".pm[26]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.651273513656392 -133.50240000000002 5.773159728050814e-015 1;
	setAttr ".pm[27]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -83.30887351365638 -132.89280000000005 -0.27933108636088111 1;
	setAttr ".pm[28]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.966473513656368 -132.28320000000005 -0.6095999999999947 1;
	setAttr ".pm[29]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -74.045160190930289 -131.67359999999999 -0.60959999999999459 1;
	setAttr ".pm[30]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -75.873960190930291 -131.06400000000002 -2.4383999999999943 1;
	setAttr ".pm[31]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -80.750760190930293 -128.7133061190454 -3.6575999999999942 1;
	setAttr ".pm[32]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.611369072747692 -134.11199999999999 4.8768000000000065 1;
	setAttr ".pm[33]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -82.659369072747737 -132.89279999999999 4.8768000000000065 1;
	setAttr ".pm[34]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.926569072747682 -131.67359999999999 4.8768000000000074 1;
	setAttr ".pm[35]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -9.1440000000000019 -79.857600000000005 4.4408920985006262e-016 1;
	setAttr ".pm[36]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084138 -46.329670381891738 4.4408920985006262e-016 1;
	setAttr ".pm[37]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -10.363210150620098 5.48640001637769 1;
	setAttr ".pm[38]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636429 -0.60960012712479283 1;
	setAttr ".pm[39]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636411 -12.801613567960064 1;
	setAttr ".pm[40]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 9.1440000000000001 -79.857568333125343 -3.3504721550646191e-006 1;
	setAttr ".pm[41]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000006 -46.329599999999921 -3.3504721550646187e-006 1;
	setAttr ".pm[42]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -10.363199999999924 5.4863966495278458 1;
	setAttr ".pm[43]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000009 -2.2223394039331943 -0.60960335047215453 1;
	setAttr ".pm[44]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -2.2223394039331952 -12.801603350472154 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 45 ".ma";
	setAttr -s 45 ".dpf[0:44]"  7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 
		7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7;
	setAttr -s 45 ".lw";
	setAttr -s 45 ".lw";
	setAttr ".mi" 4;
	setAttr ".ucm" yes;
createNode groupId -n "groupId189";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts28";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:31]";
createNode tweak -n "tweak10";
createNode objectSet -n "skinCluster10Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skinCluster10GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "skinCluster10GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode objectSet -n "tweakSet10";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId191";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts30";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode skinCluster -n "skinCluster11";
	setAttr -s 237 ".wl";
	setAttr ".wl[0].w[4]"  1;
	setAttr ".wl[1].w[4]"  1;
	setAttr ".wl[2].w[4]"  1;
	setAttr ".wl[3].w[4]"  1;
	setAttr ".wl[4].w[4]"  1;
	setAttr ".wl[5].w[4]"  1;
	setAttr ".wl[6].w[4]"  1;
	setAttr ".wl[7].w[4]"  1;
	setAttr ".wl[8].w[4]"  1;
	setAttr ".wl[9].w[4]"  1;
	setAttr ".wl[10].w[4]"  1;
	setAttr ".wl[11].w[4]"  1;
	setAttr ".wl[12].w[4]"  1;
	setAttr ".wl[13].w[4]"  1;
	setAttr ".wl[14].w[4]"  1;
	setAttr ".wl[15].w[4]"  1;
	setAttr ".wl[16].w[4]"  1;
	setAttr ".wl[17].w[4]"  1;
	setAttr ".wl[18].w[4]"  1;
	setAttr ".wl[19].w[4]"  1;
	setAttr ".wl[20].w[4]"  1;
	setAttr ".wl[21].w[4]"  1;
	setAttr ".wl[22].w[4]"  1;
	setAttr ".wl[23].w[4]"  1;
	setAttr ".wl[24].w[4]"  1;
	setAttr ".wl[25].w[4]"  1;
	setAttr ".wl[26].w[4]"  1;
	setAttr ".wl[27].w[4]"  1;
	setAttr ".wl[28].w[4]"  1;
	setAttr ".wl[29].w[4]"  1;
	setAttr ".wl[30].w[4]"  1;
	setAttr ".wl[31].w[4]"  1;
	setAttr ".wl[32].w[4]"  1;
	setAttr ".wl[33].w[4]"  1;
	setAttr ".wl[34].w[4]"  1;
	setAttr ".wl[35].w[4]"  1;
	setAttr ".wl[36].w[4]"  1;
	setAttr ".wl[37].w[4]"  1;
	setAttr ".wl[38].w[4]"  1;
	setAttr ".wl[39].w[4]"  1;
	setAttr ".wl[40].w[4]"  1;
	setAttr ".wl[41].w[4]"  1;
	setAttr ".wl[42].w[4]"  1;
	setAttr ".wl[43].w[4]"  1;
	setAttr ".wl[44].w[4]"  1;
	setAttr ".wl[45].w[4]"  1;
	setAttr ".wl[46].w[4]"  1;
	setAttr ".wl[47].w[4]"  1;
	setAttr ".wl[48].w[4]"  1;
	setAttr ".wl[49].w[4]"  1;
	setAttr ".wl[50].w[4]"  1;
	setAttr ".wl[51].w[4]"  1;
	setAttr ".wl[52].w[4]"  1;
	setAttr ".wl[53].w[4]"  1;
	setAttr ".wl[54].w[4]"  1;
	setAttr ".wl[55].w[4]"  1;
	setAttr ".wl[56].w[4]"  1;
	setAttr ".wl[57].w[4]"  1;
	setAttr ".wl[58].w[4]"  1;
	setAttr ".wl[59].w[4]"  1;
	setAttr ".wl[60].w[4]"  1;
	setAttr ".wl[61].w[4]"  1;
	setAttr ".wl[62].w[4]"  1;
	setAttr ".wl[63].w[4]"  1;
	setAttr ".wl[64].w[4]"  1;
	setAttr ".wl[65].w[4]"  1;
	setAttr ".wl[66].w[4]"  1;
	setAttr ".wl[67].w[4]"  1;
	setAttr ".wl[68].w[4]"  1;
	setAttr ".wl[69].w[4]"  1;
	setAttr ".wl[70].w[4]"  1;
	setAttr ".wl[71].w[4]"  1;
	setAttr ".wl[72].w[4]"  1;
	setAttr ".wl[73].w[4]"  1;
	setAttr ".wl[74].w[4]"  1;
	setAttr ".wl[75].w[4]"  1;
	setAttr ".wl[76].w[4]"  1;
	setAttr ".wl[77].w[4]"  1;
	setAttr ".wl[78].w[4]"  1;
	setAttr ".wl[79].w[4]"  1;
	setAttr ".wl[80].w[4]"  1;
	setAttr ".wl[81].w[4]"  1;
	setAttr ".wl[82].w[4]"  1;
	setAttr ".wl[83].w[4]"  1;
	setAttr ".wl[84].w[4]"  1;
	setAttr ".wl[85].w[4]"  1;
	setAttr ".wl[86].w[4]"  1;
	setAttr ".wl[87].w[4]"  1;
	setAttr ".wl[88].w[4]"  1;
	setAttr ".wl[89].w[4]"  1;
	setAttr ".wl[90].w[4]"  1;
	setAttr ".wl[91].w[4]"  1;
	setAttr ".wl[92].w[4]"  1;
	setAttr ".wl[93].w[4]"  1;
	setAttr ".wl[94].w[4]"  1;
	setAttr ".wl[95].w[4]"  1;
	setAttr ".wl[96].w[4]"  1;
	setAttr ".wl[97].w[4]"  1;
	setAttr ".wl[98].w[4]"  1;
	setAttr ".wl[99].w[4]"  1;
	setAttr ".wl[100].w[4]"  1;
	setAttr ".wl[101].w[4]"  1;
	setAttr ".wl[102].w[4]"  1;
	setAttr ".wl[103].w[4]"  1;
	setAttr ".wl[104].w[4]"  1;
	setAttr ".wl[105].w[4]"  1;
	setAttr ".wl[106].w[4]"  1;
	setAttr ".wl[107].w[4]"  1;
	setAttr ".wl[108].w[4]"  1;
	setAttr ".wl[109].w[4]"  1;
	setAttr ".wl[110].w[4]"  1;
	setAttr ".wl[111].w[4]"  1;
	setAttr ".wl[112].w[4]"  1;
	setAttr ".wl[113].w[4]"  1;
	setAttr ".wl[114].w[4]"  1;
	setAttr ".wl[115].w[4]"  1;
	setAttr ".wl[116].w[4]"  1;
	setAttr ".wl[117].w[4]"  1;
	setAttr ".wl[118].w[4]"  1;
	setAttr ".wl[119].w[4]"  1;
	setAttr ".wl[120].w[4]"  1;
	setAttr ".wl[121].w[4]"  1;
	setAttr ".wl[122].w[4]"  1;
	setAttr ".wl[123].w[4]"  1;
	setAttr ".wl[124].w[4]"  1;
	setAttr ".wl[125].w[4]"  1;
	setAttr ".wl[126].w[4]"  1;
	setAttr ".wl[127].w[4]"  1;
	setAttr ".wl[128].w[4]"  1;
	setAttr ".wl[129].w[4]"  1;
	setAttr ".wl[130].w[4]"  1;
	setAttr ".wl[131].w[4]"  1;
	setAttr ".wl[132].w[4]"  1;
	setAttr ".wl[133].w[4]"  1;
	setAttr ".wl[134].w[4]"  1;
	setAttr ".wl[135].w[4]"  1;
	setAttr ".wl[136].w[4]"  1;
	setAttr ".wl[137].w[4]"  1;
	setAttr ".wl[138].w[4]"  1;
	setAttr ".wl[139].w[4]"  1;
	setAttr ".wl[140].w[4]"  1;
	setAttr ".wl[141].w[4]"  1;
	setAttr ".wl[142].w[4]"  1;
	setAttr ".wl[143].w[4]"  1;
	setAttr ".wl[144].w[4]"  1;
	setAttr ".wl[145].w[4]"  1;
	setAttr ".wl[146].w[4]"  1;
	setAttr ".wl[147].w[4]"  1;
	setAttr ".wl[148].w[4]"  1;
	setAttr ".wl[149].w[4]"  1;
	setAttr ".wl[150].w[4]"  1;
	setAttr ".wl[151].w[4]"  1;
	setAttr ".wl[152].w[4]"  1;
	setAttr ".wl[153].w[4]"  1;
	setAttr ".wl[154].w[4]"  1;
	setAttr ".wl[155].w[4]"  1;
	setAttr ".wl[156].w[4]"  1;
	setAttr ".wl[157].w[4]"  1;
	setAttr ".wl[158].w[4]"  1;
	setAttr ".wl[159].w[4]"  1;
	setAttr ".wl[160].w[4]"  1;
	setAttr ".wl[161].w[4]"  1;
	setAttr ".wl[162].w[4]"  1;
	setAttr ".wl[163].w[4]"  1;
	setAttr ".wl[164].w[4]"  1;
	setAttr ".wl[165].w[4]"  1;
	setAttr ".wl[166].w[4]"  1;
	setAttr ".wl[167].w[4]"  1;
	setAttr ".wl[168].w[4]"  1;
	setAttr ".wl[169].w[4]"  1;
	setAttr ".wl[170].w[4]"  1;
	setAttr ".wl[171].w[4]"  1;
	setAttr ".wl[172].w[4]"  1;
	setAttr ".wl[173].w[4]"  1;
	setAttr ".wl[174].w[4]"  1;
	setAttr ".wl[175].w[4]"  1;
	setAttr ".wl[176].w[4]"  1;
	setAttr ".wl[177].w[4]"  1;
	setAttr ".wl[178].w[4]"  1;
	setAttr ".wl[179].w[4]"  1;
	setAttr ".wl[180].w[4]"  1;
	setAttr ".wl[181].w[4]"  1;
	setAttr ".wl[182].w[4]"  1;
	setAttr ".wl[183].w[4]"  1;
	setAttr ".wl[184].w[4]"  1;
	setAttr ".wl[185].w[4]"  1;
	setAttr ".wl[186].w[4]"  1;
	setAttr ".wl[187].w[4]"  1;
	setAttr ".wl[188].w[4]"  1;
	setAttr ".wl[189].w[4]"  1;
	setAttr ".wl[190].w[4]"  1;
	setAttr ".wl[191].w[4]"  1;
	setAttr ".wl[192].w[4]"  1;
	setAttr ".wl[193].w[4]"  1;
	setAttr ".wl[194].w[4]"  1;
	setAttr ".wl[195].w[4]"  1;
	setAttr ".wl[196].w[4]"  1;
	setAttr ".wl[197].w[4]"  1;
	setAttr ".wl[198].w[4]"  1;
	setAttr ".wl[199].w[4]"  1;
	setAttr ".wl[200].w[4]"  1;
	setAttr ".wl[201].w[4]"  1;
	setAttr ".wl[202].w[4]"  1;
	setAttr ".wl[203].w[4]"  1;
	setAttr ".wl[204].w[4]"  1;
	setAttr ".wl[205].w[4]"  1;
	setAttr ".wl[206].w[4]"  1;
	setAttr ".wl[207].w[4]"  1;
	setAttr ".wl[208].w[4]"  1;
	setAttr ".wl[209].w[4]"  1;
	setAttr ".wl[210].w[4]"  1;
	setAttr ".wl[211].w[4]"  1;
	setAttr ".wl[212].w[4]"  1;
	setAttr ".wl[213].w[4]"  1;
	setAttr ".wl[214].w[4]"  1;
	setAttr ".wl[215].w[4]"  1;
	setAttr ".wl[216].w[4]"  1;
	setAttr ".wl[217].w[4]"  1;
	setAttr ".wl[218].w[4]"  1;
	setAttr ".wl[219].w[4]"  1;
	setAttr ".wl[220].w[4]"  1;
	setAttr ".wl[221].w[4]"  1;
	setAttr ".wl[222].w[4]"  1;
	setAttr ".wl[223].w[4]"  1;
	setAttr ".wl[224].w[4]"  1;
	setAttr ".wl[225].w[4]"  1;
	setAttr ".wl[226].w[4]"  1;
	setAttr -s 2 ".wl[227].w";
	setAttr ".wl[227].w[2]" 0.30000001192092896;
	setAttr ".wl[227].w[4]" 0.69999998807907104;
	setAttr -s 2 ".wl[228].w";
	setAttr ".wl[228].w[2]" 0.30000001192092896;
	setAttr ".wl[228].w[4]" 0.69999998807907104;
	setAttr -s 2 ".wl[229].w";
	setAttr ".wl[229].w[2]" 0.30000001192092896;
	setAttr ".wl[229].w[4]" 0.69999998807907104;
	setAttr -s 2 ".wl[230].w";
	setAttr ".wl[230].w[2]" 0.30000001192092896;
	setAttr ".wl[230].w[4]" 0.69999998807907104;
	setAttr -s 2 ".wl[231].w";
	setAttr ".wl[231].w[2]" 0.30000001192092896;
	setAttr ".wl[231].w[4]" 0.69999998807907104;
	setAttr -s 2 ".wl[232].w";
	setAttr ".wl[232].w[2]" 0.30000001192092896;
	setAttr ".wl[232].w[4]" 0.69999998807907104;
	setAttr -s 2 ".wl[233].w";
	setAttr ".wl[233].w[2]" 0.30000001192092896;
	setAttr ".wl[233].w[4]" 0.69999998807907104;
	setAttr -s 2 ".wl[234].w";
	setAttr ".wl[234].w[2]" 0.30000001192092896;
	setAttr ".wl[234].w[4]" 0.69999998807907104;
	setAttr -s 2 ".wl[235].w";
	setAttr ".wl[235].w[2]" 0.30000001192092896;
	setAttr ".wl[235].w[4]" 0.69999998807907104;
	setAttr -s 2 ".wl[236].w";
	setAttr ".wl[236].w[2]" 0.30000001192092896;
	setAttr ".wl[236].w[4]" 0.69999998807907104;
	setAttr -s 45 ".pm";
	setAttr ".pm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -82.905600000000007 1.5235399408006025 1;
	setAttr ".pm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -96.316800000000001 -2.2204460492503131e-016 1;
	setAttr ".pm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -112.16640000000001 0.12451816054295495 1;
	setAttr ".pm[3]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -126.90278208834873 -0.19509691995282158 1;
	setAttr ".pm[4]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -145.07595133010403 1.2191999999999996 1;
	setAttr ".pm[5]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -148.12395133010398 -1.2192000000000005 1;
	setAttr ".pm[6]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -166.41195133010399 -0.60960000000000081 1;
	setAttr ".pm[7]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 10.722223920000001 -130.56032297236209 6.5925809435429965 1;
	setAttr ".pm[8]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 21.336000000000002 -138.37920000000003 3.0480000000000032 1;
	setAttr ".pm[9]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 45.719999999999985 -134.61561791165141 3.1717480164570038 1;
	setAttr ".pm[10]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 71.932799999999972 -132.28319999999999 3.6576000000000017 1;
	setAttr ".pm[11]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.199999999999974 -132.89280000000005 3.6576000000000013 1;
	setAttr ".pm[12]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 79.840525395620432 -133.50240000000008 2.2204460492503131e-015 1;
	setAttr ".pm[13]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.498125395620448 -132.89280000000008 -0.3004912146664338 1;
	setAttr ".pm[14]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.155725395620451 -131.67360000000002 -0.69545463276183173 1;
	setAttr ".pm[15]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 74.096561497334889 -131.67360000000008 -0.82854536723815997 1;
	setAttr ".pm[16]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.534961497334891 -130.45440000000005 -2.3525453672381595 1;
	setAttr ".pm[17]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.529365497334879 -129.23520000000005 -3.8273506472381591 1;
	setAttr ".pm[18]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.012234661144092 -133.50240000000005 4.8768000000000029 1;
	setAttr ".pm[19]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.66983466114408 -132.89280000000005 4.8768000000000038 1;
	setAttr ".pm[20]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.327434661144068 -131.67360000000005 4.8768000000000038 1;
	setAttr ".pm[21]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.722226103569733 -130.56038208834872 6.5925950459904277 1;
	setAttr ".pm[22]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -21.336000000000002 -138.37919999999997 3.0480000000000098 1;
	setAttr ".pm[23]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -45.719999999999985 -134.61561791165127 3.1717496975867028 1;
	setAttr ".pm[24]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -71.932800000000015 -132.28319999999997 3.6576000000000128 1;
	setAttr ".pm[25]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -76.200000000000017 -132.89280000000002 3.6576000000000133 1;
	setAttr ".pm[26]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.651273513656392 -133.50240000000002 5.773159728050814e-015 1;
	setAttr ".pm[27]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -83.30887351365638 -132.89280000000005 -0.27933108636088111 1;
	setAttr ".pm[28]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.966473513656368 -132.28320000000005 -0.6095999999999947 1;
	setAttr ".pm[29]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -74.045160190930289 -131.67359999999999 -0.60959999999999459 1;
	setAttr ".pm[30]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -75.873960190930291 -131.06400000000002 -2.4383999999999943 1;
	setAttr ".pm[31]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -80.750760190930293 -128.7133061190454 -3.6575999999999942 1;
	setAttr ".pm[32]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.611369072747692 -134.11199999999999 4.8768000000000065 1;
	setAttr ".pm[33]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -82.659369072747737 -132.89279999999999 4.8768000000000065 1;
	setAttr ".pm[34]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.926569072747682 -131.67359999999999 4.8768000000000074 1;
	setAttr ".pm[35]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -9.1440000000000019 -79.857600000000005 4.4408920985006262e-016 1;
	setAttr ".pm[36]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084138 -46.329670381891738 4.4408920985006262e-016 1;
	setAttr ".pm[37]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -10.363210150620098 5.48640001637769 1;
	setAttr ".pm[38]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636429 -0.60960012712479283 1;
	setAttr ".pm[39]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636411 -12.801613567960064 1;
	setAttr ".pm[40]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 9.1440000000000001 -79.857568333125343 -3.3504721550646191e-006 1;
	setAttr ".pm[41]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000006 -46.329599999999921 -3.3504721550646187e-006 1;
	setAttr ".pm[42]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -10.363199999999924 5.4863966495278458 1;
	setAttr ".pm[43]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000009 -2.2223394039331943 -0.60960335047215453 1;
	setAttr ".pm[44]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -2.2223394039331952 -12.801603350472154 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 45 ".ma";
	setAttr -s 45 ".dpf[0:44]"  7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 
		7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7;
	setAttr -s 45 ".lw";
	setAttr -s 45 ".lw";
	setAttr ".mi" 4;
	setAttr ".ucm" yes;
createNode groupId -n "groupId192";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts31";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:441]";
createNode tweak -n "tweak11";
	setAttr -s 2 ".vl[0].vt";
	setAttr ".vl[0].vt[121]" -type "float3" -0.032656718 0 0 ;
	setAttr ".vl[0].vt[206]" -type "float3" 0.032656718 0 0 ;
createNode objectSet -n "skinCluster11Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skinCluster11GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "skinCluster11GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode objectSet -n "tweakSet11";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId194";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts33";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode skinCluster -n "skinCluster12";
	setAttr -s 17 ".wl";
	setAttr -s 2 ".wl[0].w";
	setAttr ".wl[0].w[25]" 0.43333590030670166;
	setAttr ".wl[0].w[29]" 0.56666404008865356;
	setAttr -s 2 ".wl[1].w[29:30]"  0.36623093 0.63376909;
	setAttr -s 2 ".wl[2].w[29:30]"  0.49982703 0.50017291;
	setAttr -s 2 ".wl[3].w";
	setAttr ".wl[3].w[25]" 0.47552165389060974;
	setAttr ".wl[3].w[29]" 0.52447831630706787;
	setAttr ".wl[4].w[30]"  0.99999994;
	setAttr ".wl[5].w[30]"  1;
	setAttr ".wl[6].w[30]"  1;
	setAttr ".wl[7].w[30]"  1;
	setAttr -s 2 ".wl[8].w[30:31]"  0.5 0.5;
	setAttr -s 2 ".wl[9].w[30:31]"  0.5 0.5;
	setAttr -s 2 ".wl[10].w[30:31]"  0.5 0.5;
	setAttr -s 2 ".wl[11].w[30:31]"  0.49999893 0.49999893;
	setAttr ".wl[12].w[24]"  1;
	setAttr -s 2 ".wl[13].w";
	setAttr ".wl[13].w[24]" 1;
	setAttr ".wl[13].w[30]" 1.9522717589672695e-013;
	setAttr -s 3 ".wl[14].w";
	setAttr ".wl[14].w[24]" 1;
	setAttr ".wl[14].w[29:30]" 9.8495261155028685e-014 9.673184697906248e-014;
	setAttr ".wl[15].w[24]"  1;
	setAttr ".wl[16].w[24]"  1;
	setAttr -s 45 ".pm";
	setAttr ".pm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -82.905600000000007 1.5235399408006025 1;
	setAttr ".pm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -96.316800000000001 -2.2204460492503131e-016 1;
	setAttr ".pm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -112.16640000000001 0.12451816054295495 1;
	setAttr ".pm[3]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -126.90278208834873 -0.19509691995282158 1;
	setAttr ".pm[4]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -145.07595133010403 1.2191999999999996 1;
	setAttr ".pm[5]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -148.12395133010398 -1.2192000000000005 1;
	setAttr ".pm[6]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -166.41195133010399 -0.60960000000000081 1;
	setAttr ".pm[7]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 10.722223920000001 -130.56032297236209 6.5925809435429965 1;
	setAttr ".pm[8]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 21.336000000000002 -138.37920000000003 3.0480000000000032 1;
	setAttr ".pm[9]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 45.719999999999985 -134.61561791165141 3.1717480164570038 1;
	setAttr ".pm[10]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 71.932799999999972 -132.28319999999999 3.6576000000000017 1;
	setAttr ".pm[11]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.199999999999974 -132.89280000000005 3.6576000000000013 1;
	setAttr ".pm[12]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 79.840525395620432 -133.50240000000008 2.2204460492503131e-015 1;
	setAttr ".pm[13]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.498125395620448 -132.89280000000008 -0.3004912146664338 1;
	setAttr ".pm[14]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.155725395620451 -131.67360000000002 -0.69545463276183173 1;
	setAttr ".pm[15]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 74.096561497334889 -131.67360000000008 -0.82854536723815997 1;
	setAttr ".pm[16]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.534961497334891 -130.45440000000005 -2.3525453672381595 1;
	setAttr ".pm[17]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.529365497334879 -129.23520000000005 -3.8273506472381591 1;
	setAttr ".pm[18]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.012234661144092 -133.50240000000005 4.8768000000000029 1;
	setAttr ".pm[19]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.66983466114408 -132.89280000000005 4.8768000000000038 1;
	setAttr ".pm[20]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.327434661144068 -131.67360000000005 4.8768000000000038 1;
	setAttr ".pm[21]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.722226103569733 -130.56038208834872 6.5925950459904277 1;
	setAttr ".pm[22]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -21.336000000000002 -138.37919999999997 3.0480000000000098 1;
	setAttr ".pm[23]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -45.719999999999985 -134.61561791165127 3.1717496975867028 1;
	setAttr ".pm[24]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -71.932800000000015 -132.28319999999997 3.6576000000000128 1;
	setAttr ".pm[25]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -76.200000000000017 -132.89280000000002 3.6576000000000133 1;
	setAttr ".pm[26]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.651273513656392 -133.50240000000002 5.773159728050814e-015 1;
	setAttr ".pm[27]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -83.30887351365638 -132.89280000000005 -0.27933108636088111 1;
	setAttr ".pm[28]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.966473513656368 -132.28320000000005 -0.6095999999999947 1;
	setAttr ".pm[29]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -74.045160190930289 -131.67359999999999 -0.60959999999999459 1;
	setAttr ".pm[30]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -75.873960190930291 -131.06400000000002 -2.4383999999999943 1;
	setAttr ".pm[31]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -80.750760190930293 -128.7133061190454 -3.6575999999999942 1;
	setAttr ".pm[32]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.611369072747692 -134.11199999999999 4.8768000000000065 1;
	setAttr ".pm[33]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -82.659369072747737 -132.89279999999999 4.8768000000000065 1;
	setAttr ".pm[34]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.926569072747682 -131.67359999999999 4.8768000000000074 1;
	setAttr ".pm[35]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -9.1440000000000019 -79.857600000000005 4.4408920985006262e-016 1;
	setAttr ".pm[36]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084138 -46.329670381891738 4.4408920985006262e-016 1;
	setAttr ".pm[37]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -10.363210150620098 5.48640001637769 1;
	setAttr ".pm[38]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636429 -0.60960012712479283 1;
	setAttr ".pm[39]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636411 -12.801613567960064 1;
	setAttr ".pm[40]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 9.1440000000000001 -79.857568333125343 -3.3504721550646191e-006 1;
	setAttr ".pm[41]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000006 -46.329599999999921 -3.3504721550646187e-006 1;
	setAttr ".pm[42]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -10.363199999999924 5.4863966495278458 1;
	setAttr ".pm[43]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000009 -2.2223394039331943 -0.60960335047215453 1;
	setAttr ".pm[44]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -2.2223394039331952 -12.801603350472154 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 45 ".ma";
	setAttr -s 45 ".dpf[0:44]"  7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 
		7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7;
	setAttr -s 45 ".lw";
	setAttr -s 45 ".lw";
	setAttr ".mi" 4;
	setAttr ".ucm" yes;
createNode groupId -n "groupId195";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts34";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:26]";
createNode tweak -n "tweak12";
createNode objectSet -n "skinCluster12Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skinCluster12GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "skinCluster12GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode objectSet -n "tweakSet12";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId197";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts36";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode skinCluster -n "skinCluster13";
	setAttr -s 14 ".wl";
	setAttr ".wl[0].w[26]"  1;
	setAttr ".wl[1].w[26]"  1;
	setAttr ".wl[2].w[27]"  1;
	setAttr ".wl[3].w[27]"  1;
	setAttr ".wl[4].w[27]"  0.99999994;
	setAttr ".wl[5].w[27]"  1;
	setAttr ".wl[6].w[27]"  1;
	setAttr ".wl[7].w[27]"  1;
	setAttr ".wl[8].w[27]"  1;
	setAttr ".wl[9].w[27]"  1;
	setAttr -s 3 ".wl[10].w[24:26]"  1 1.2667103e-013 6.8556129e-014;
	setAttr -s 3 ".wl[11].w[24:26]"  1 1.3438049e-013 6.0846625e-014;
	setAttr -s 3 ".wl[12].w[24:26]"  1 9.7613588e-014 9.7613588e-014;
	setAttr -s 2 ".wl[13].w";
	setAttr ".wl[13].w[24]" 1;
	setAttr ".wl[13].w[30]" 1.9522717589672695e-013;
	setAttr -s 45 ".pm";
	setAttr ".pm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -82.905600000000007 1.5235399408006025 1;
	setAttr ".pm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -96.316800000000001 -2.2204460492503131e-016 1;
	setAttr ".pm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -112.16640000000001 0.12451816054295495 1;
	setAttr ".pm[3]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -126.90278208834873 -0.19509691995282158 1;
	setAttr ".pm[4]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -145.07595133010403 1.2191999999999996 1;
	setAttr ".pm[5]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -148.12395133010398 -1.2192000000000005 1;
	setAttr ".pm[6]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -166.41195133010399 -0.60960000000000081 1;
	setAttr ".pm[7]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 10.722223920000001 -130.56032297236209 6.5925809435429965 1;
	setAttr ".pm[8]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 21.336000000000002 -138.37920000000003 3.0480000000000032 1;
	setAttr ".pm[9]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 45.719999999999985 -134.61561791165141 3.1717480164570038 1;
	setAttr ".pm[10]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 71.932799999999972 -132.28319999999999 3.6576000000000017 1;
	setAttr ".pm[11]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.199999999999974 -132.89280000000005 3.6576000000000013 1;
	setAttr ".pm[12]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 79.840525395620432 -133.50240000000008 2.2204460492503131e-015 1;
	setAttr ".pm[13]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.498125395620448 -132.89280000000008 -0.3004912146664338 1;
	setAttr ".pm[14]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.155725395620451 -131.67360000000002 -0.69545463276183173 1;
	setAttr ".pm[15]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 74.096561497334889 -131.67360000000008 -0.82854536723815997 1;
	setAttr ".pm[16]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.534961497334891 -130.45440000000005 -2.3525453672381595 1;
	setAttr ".pm[17]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.529365497334879 -129.23520000000005 -3.8273506472381591 1;
	setAttr ".pm[18]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.012234661144092 -133.50240000000005 4.8768000000000029 1;
	setAttr ".pm[19]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.66983466114408 -132.89280000000005 4.8768000000000038 1;
	setAttr ".pm[20]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.327434661144068 -131.67360000000005 4.8768000000000038 1;
	setAttr ".pm[21]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.722226103569733 -130.56038208834872 6.5925950459904277 1;
	setAttr ".pm[22]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -21.336000000000002 -138.37919999999997 3.0480000000000098 1;
	setAttr ".pm[23]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -45.719999999999985 -134.61561791165127 3.1717496975867028 1;
	setAttr ".pm[24]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -71.932800000000015 -132.28319999999997 3.6576000000000128 1;
	setAttr ".pm[25]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -76.200000000000017 -132.89280000000002 3.6576000000000133 1;
	setAttr ".pm[26]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.651273513656392 -133.50240000000002 5.773159728050814e-015 1;
	setAttr ".pm[27]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -83.30887351365638 -132.89280000000005 -0.27933108636088111 1;
	setAttr ".pm[28]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.966473513656368 -132.28320000000005 -0.6095999999999947 1;
	setAttr ".pm[29]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -74.045160190930289 -131.67359999999999 -0.60959999999999459 1;
	setAttr ".pm[30]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -75.873960190930291 -131.06400000000002 -2.4383999999999943 1;
	setAttr ".pm[31]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -80.750760190930293 -128.7133061190454 -3.6575999999999942 1;
	setAttr ".pm[32]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.611369072747692 -134.11199999999999 4.8768000000000065 1;
	setAttr ".pm[33]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -82.659369072747737 -132.89279999999999 4.8768000000000065 1;
	setAttr ".pm[34]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.926569072747682 -131.67359999999999 4.8768000000000074 1;
	setAttr ".pm[35]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -9.1440000000000019 -79.857600000000005 4.4408920985006262e-016 1;
	setAttr ".pm[36]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084138 -46.329670381891738 4.4408920985006262e-016 1;
	setAttr ".pm[37]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -10.363210150620098 5.48640001637769 1;
	setAttr ".pm[38]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636429 -0.60960012712479283 1;
	setAttr ".pm[39]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636411 -12.801613567960064 1;
	setAttr ".pm[40]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 9.1440000000000001 -79.857568333125343 -3.3504721550646191e-006 1;
	setAttr ".pm[41]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000006 -46.329599999999921 -3.3504721550646187e-006 1;
	setAttr ".pm[42]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -10.363199999999924 5.4863966495278458 1;
	setAttr ".pm[43]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000009 -2.2223394039331943 -0.60960335047215453 1;
	setAttr ".pm[44]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -2.2223394039331952 -12.801603350472154 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 45 ".ma";
	setAttr -s 45 ".dpf[0:44]"  7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 
		7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7;
	setAttr -s 45 ".lw";
	setAttr -s 45 ".lw";
	setAttr ".mi" 4;
	setAttr ".ucm" yes;
createNode groupId -n "groupId198";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts37";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:21]";
createNode tweak -n "tweak13";
createNode objectSet -n "skinCluster13Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skinCluster13GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "skinCluster13GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode objectSet -n "tweakSet13";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId200";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts39";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode skinCluster -n "skinCluster14";
	setAttr -s 34 ".wl";
	setAttr -s 2 ".wl[0].w[23:24]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[1].w[23:24]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[2].w[23:24]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[3].w[23:24]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[4].w[23:24]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[5].w[23:24]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[6].w[23:24]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[7].w[23:24]"  0.69999999 0.30000001;
	setAttr -s 3 ".wl[8].w[24:26]"  1 1.2042304e-013 7.4804143e-014;
	setAttr -s 2 ".wl[9].w[23:24]"  0.5 0.5;
	setAttr -s 3 ".wl[10].w";
	setAttr ".wl[10].w[24:25]" 1 1.3221232919233272e-013;
	setAttr ".wl[10].w[32]" 6.3014792494285599e-014;
	setAttr -s 2 ".wl[11].w[23:24]"  0.5 0.5;
	setAttr -s 3 ".wl[12].w";
	setAttr ".wl[12].w[24:25]" 1 1.3019408684825096e-013;
	setAttr ".wl[12].w[32]" 6.5033041614630943e-014;
	setAttr -s 2 ".wl[13].w[23:24]"  0.5 0.5;
	setAttr -s 2 ".wl[14].w[24:25]"  1 1.9522718e-013;
	setAttr ".wl[15].w[24]"  1;
	setAttr -s 2 ".wl[16].w[23:24]"  0.5 0.5;
	setAttr -s 2 ".wl[17].w[23:24]"  0.5 0.5;
	setAttr -s 3 ".wl[18].w";
	setAttr ".wl[18].w[24:25]" 1 1.1847724949547167e-013;
	setAttr ".wl[18].w[32]" 7.6749872191146651e-014;
	setAttr ".wl[19].w[24]"  1;
	setAttr -s 3 ".wl[20].w";
	setAttr ".wl[20].w[24]" 1;
	setAttr ".wl[20].w[29:30]" 9.8495288260082997e-014 9.673184697906248e-014;
	setAttr -s 3 ".wl[21].w";
	setAttr ".wl[21].w[24:25]" 1 7.9576543108878656e-014;
	setAttr ".wl[21].w[32]" 1.1565063956411187e-013;
	setAttr -s 2 ".wl[22].w";
	setAttr ".wl[22].w[24]" 1;
	setAttr ".wl[22].w[32]" 1.9522717589672695e-013;
	setAttr -s 3 ".wl[23].w";
	setAttr ".wl[23].w[24:25]" 1 9.7613587948363473e-014;
	setAttr ".wl[23].w[32]" 9.7613587948363473e-014;
	setAttr -s 3 ".wl[24].w[24:26]"  1 1.3437919e-013 6.0847974e-014;
	setAttr -s 3 ".wl[25].w";
	setAttr ".wl[25].w[24:25]" 1 1.0068393330436159e-013;
	setAttr ".wl[25].w[32]" 9.4543168053465992e-014;
	setAttr -s 2 ".wl[26].w";
	setAttr ".wl[26].w[24]" 1;
	setAttr ".wl[26].w[30]" 1.9522717589672695e-013;
	setAttr -s 3 ".wl[27].w[24:26]"  1 9.7613588e-014 9.7613588e-014;
	setAttr -s 3 ".wl[28].w[24:26]"  1 1.2667054e-013 6.8556644e-014;
	setAttr -s 2 ".wl[29].w";
	setAttr ".wl[29].w[24]" 1;
	setAttr ".wl[29].w[30]" 1.9522717589672695e-013;
	setAttr ".wl[30].w[24]"  1;
	setAttr -s 3 ".wl[31].w";
	setAttr ".wl[31].w[24:25]" 1 9.7613587948363473e-014;
	setAttr ".wl[31].w[32]" 9.7613587948363473e-014;
	setAttr -s 3 ".wl[32].w";
	setAttr ".wl[32].w[24:25]" 1 8.2234830652960084e-014;
	setAttr ".wl[32].w[32]" 1.1299227748113108e-013;
	setAttr ".wl[33].w[24]"  1;
	setAttr -s 45 ".pm";
	setAttr ".pm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -82.905600000000007 1.5235399408006025 1;
	setAttr ".pm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -96.316800000000001 -2.2204460492503131e-016 1;
	setAttr ".pm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -112.16640000000001 0.12451816054295495 1;
	setAttr ".pm[3]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -126.90278208834873 -0.19509691995282158 1;
	setAttr ".pm[4]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -145.07595133010403 1.2191999999999996 1;
	setAttr ".pm[5]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -148.12395133010398 -1.2192000000000005 1;
	setAttr ".pm[6]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -166.41195133010399 -0.60960000000000081 1;
	setAttr ".pm[7]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 10.722223920000001 -130.56032297236209 6.5925809435429965 1;
	setAttr ".pm[8]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 21.336000000000002 -138.37920000000003 3.0480000000000032 1;
	setAttr ".pm[9]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 45.719999999999985 -134.61561791165141 3.1717480164570038 1;
	setAttr ".pm[10]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 71.932799999999972 -132.28319999999999 3.6576000000000017 1;
	setAttr ".pm[11]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.199999999999974 -132.89280000000005 3.6576000000000013 1;
	setAttr ".pm[12]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 79.840525395620432 -133.50240000000008 2.2204460492503131e-015 1;
	setAttr ".pm[13]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.498125395620448 -132.89280000000008 -0.3004912146664338 1;
	setAttr ".pm[14]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.155725395620451 -131.67360000000002 -0.69545463276183173 1;
	setAttr ".pm[15]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 74.096561497334889 -131.67360000000008 -0.82854536723815997 1;
	setAttr ".pm[16]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.534961497334891 -130.45440000000005 -2.3525453672381595 1;
	setAttr ".pm[17]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.529365497334879 -129.23520000000005 -3.8273506472381591 1;
	setAttr ".pm[18]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.012234661144092 -133.50240000000005 4.8768000000000029 1;
	setAttr ".pm[19]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.66983466114408 -132.89280000000005 4.8768000000000038 1;
	setAttr ".pm[20]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.327434661144068 -131.67360000000005 4.8768000000000038 1;
	setAttr ".pm[21]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.722226103569733 -130.56038208834872 6.5925950459904277 1;
	setAttr ".pm[22]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -21.336000000000002 -138.37919999999997 3.0480000000000098 1;
	setAttr ".pm[23]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -45.719999999999985 -134.61561791165127 3.1717496975867028 1;
	setAttr ".pm[24]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -71.932800000000015 -132.28319999999997 3.6576000000000128 1;
	setAttr ".pm[25]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -76.200000000000017 -132.89280000000002 3.6576000000000133 1;
	setAttr ".pm[26]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.651273513656392 -133.50240000000002 5.773159728050814e-015 1;
	setAttr ".pm[27]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -83.30887351365638 -132.89280000000005 -0.27933108636088111 1;
	setAttr ".pm[28]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.966473513656368 -132.28320000000005 -0.6095999999999947 1;
	setAttr ".pm[29]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -74.045160190930289 -131.67359999999999 -0.60959999999999459 1;
	setAttr ".pm[30]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -75.873960190930291 -131.06400000000002 -2.4383999999999943 1;
	setAttr ".pm[31]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -80.750760190930293 -128.7133061190454 -3.6575999999999942 1;
	setAttr ".pm[32]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.611369072747692 -134.11199999999999 4.8768000000000065 1;
	setAttr ".pm[33]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -82.659369072747737 -132.89279999999999 4.8768000000000065 1;
	setAttr ".pm[34]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.926569072747682 -131.67359999999999 4.8768000000000074 1;
	setAttr ".pm[35]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -9.1440000000000019 -79.857600000000005 4.4408920985006262e-016 1;
	setAttr ".pm[36]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084138 -46.329670381891738 4.4408920985006262e-016 1;
	setAttr ".pm[37]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -10.363210150620098 5.48640001637769 1;
	setAttr ".pm[38]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636429 -0.60960012712479283 1;
	setAttr ".pm[39]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636411 -12.801613567960064 1;
	setAttr ".pm[40]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 9.1440000000000001 -79.857568333125343 -3.3504721550646191e-006 1;
	setAttr ".pm[41]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000006 -46.329599999999921 -3.3504721550646187e-006 1;
	setAttr ".pm[42]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -10.363199999999924 5.4863966495278458 1;
	setAttr ".pm[43]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000009 -2.2223394039331943 -0.60960335047215453 1;
	setAttr ".pm[44]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -2.2223394039331952 -12.801603350472154 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 45 ".ma";
	setAttr -s 45 ".dpf[0:44]"  7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 
		7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7;
	setAttr -s 45 ".lw";
	setAttr -s 45 ".lw";
	setAttr ".mi" 4;
	setAttr ".ucm" yes;
createNode groupId -n "groupId201";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts40";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:46]";
createNode tweak -n "tweak14";
createNode objectSet -n "skinCluster14Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skinCluster14GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "skinCluster14GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode objectSet -n "tweakSet14";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId203";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts42";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode skinCluster -n "skinCluster15";
	setAttr -s 24 ".wl";
	setAttr -s 3 ".wl[0].w";
	setAttr ".wl[0].w[27:28]" 2.9636510134878336e-007 2.9636510134878336e-007;
	setAttr ".wl[0].w[33]" 0.99999940395355225;
	setAttr -s 2 ".wl[1].w[33:34]"  0.99999964 3.8466465e-007;
	setAttr -s 3 ".wl[2].w";
	setAttr ".wl[2].w[27:28]" 2.9636510134878336e-007 2.9636510134878336e-007;
	setAttr ".wl[2].w[33]" 0.99999940395355225;
	setAttr ".wl[3].w[32]"  1;
	setAttr ".wl[4].w[32]"  1;
	setAttr -s 2 ".wl[5].w";
	setAttr ".wl[5].w[27]" 5.9273020269756671e-007;
	setAttr ".wl[5].w[33]" 0.99999940395355225;
	setAttr ".wl[6].w[33]"  1;
	setAttr -s 3 ".wl[7].w";
	setAttr ".wl[7].w[26:27]" 2.0416226220731915e-007 3.8856785522511927e-007;
	setAttr ".wl[7].w[33]" 0.99999940395355225;
	setAttr -s 2 ".wl[8].w[33:34]"  0.99999964 3.8466465e-007;
	setAttr ".wl[9].w[32]"  1;
	setAttr ".wl[10].w[33]"  1;
	setAttr -s 2 ".wl[11].w[33:34]"  0.9999997 2.8003461e-007;
	setAttr -s 2 ".wl[12].w[33:34]"  1 4.7545585e-009;
	setAttr ".wl[13].w[32]"  1;
	setAttr -s 2 ".wl[14].w[32:33]"  2.2662118e-007 0.99999976;
	setAttr -s 2 ".wl[15].w[32:33]"  2.3618905e-007 0.99999976;
	setAttr -s 3 ".wl[16].w";
	setAttr ".wl[16].w[24:25]" 1 1.0068332344063957e-013;
	setAttr ".wl[16].w[32]" 9.4543805022242328e-014;
	setAttr -s 3 ".wl[17].w[24:26]"  1 1.3437919e-013 6.0847974e-014;
	setAttr -s 3 ".wl[18].w[24:26]"  1 1.266705e-013 6.8556644e-014;
	setAttr -s 3 ".wl[19].w";
	setAttr ".wl[19].w[24:25]" 1 8.2235562489426511e-014;
	setAttr ".wl[19].w[32]" 1.1299149821081961e-013;
	setAttr -s 3 ".wl[20].w";
	setAttr ".wl[20].w[24:25]" 1 9.7613587948363473e-014;
	setAttr ".wl[20].w[32]" 9.7613587948363473e-014;
	setAttr -s 2 ".wl[21].w";
	setAttr ".wl[21].w[24]" 1;
	setAttr ".wl[21].w[32]" 1.9522717589672695e-013;
	setAttr -s 3 ".wl[22].w";
	setAttr ".wl[22].w[24:25]" 1 7.9576543108878656e-014;
	setAttr ".wl[22].w[32]" 1.1565063956411187e-013;
	setAttr -s 3 ".wl[23].w";
	setAttr ".wl[23].w[24:25]" 1 9.7613587948363473e-014;
	setAttr ".wl[23].w[32]" 9.7613587948363473e-014;
	setAttr -s 45 ".pm";
	setAttr ".pm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -82.905600000000007 1.5235399408006025 1;
	setAttr ".pm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -96.316800000000001 -2.2204460492503131e-016 1;
	setAttr ".pm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -112.16640000000001 0.12451816054295495 1;
	setAttr ".pm[3]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -126.90278208834873 -0.19509691995282158 1;
	setAttr ".pm[4]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -145.07595133010403 1.2191999999999996 1;
	setAttr ".pm[5]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -148.12395133010398 -1.2192000000000005 1;
	setAttr ".pm[6]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -166.41195133010399 -0.60960000000000081 1;
	setAttr ".pm[7]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 10.722223920000001 -130.56032297236209 6.5925809435429965 1;
	setAttr ".pm[8]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 21.336000000000002 -138.37920000000003 3.0480000000000032 1;
	setAttr ".pm[9]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 45.719999999999985 -134.61561791165141 3.1717480164570038 1;
	setAttr ".pm[10]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 71.932799999999972 -132.28319999999999 3.6576000000000017 1;
	setAttr ".pm[11]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.199999999999974 -132.89280000000005 3.6576000000000013 1;
	setAttr ".pm[12]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 79.840525395620432 -133.50240000000008 2.2204460492503131e-015 1;
	setAttr ".pm[13]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.498125395620448 -132.89280000000008 -0.3004912146664338 1;
	setAttr ".pm[14]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.155725395620451 -131.67360000000002 -0.69545463276183173 1;
	setAttr ".pm[15]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 74.096561497334889 -131.67360000000008 -0.82854536723815997 1;
	setAttr ".pm[16]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.534961497334891 -130.45440000000005 -2.3525453672381595 1;
	setAttr ".pm[17]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.529365497334879 -129.23520000000005 -3.8273506472381591 1;
	setAttr ".pm[18]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.012234661144092 -133.50240000000005 4.8768000000000029 1;
	setAttr ".pm[19]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.66983466114408 -132.89280000000005 4.8768000000000038 1;
	setAttr ".pm[20]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.327434661144068 -131.67360000000005 4.8768000000000038 1;
	setAttr ".pm[21]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.722226103569733 -130.56038208834872 6.5925950459904277 1;
	setAttr ".pm[22]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -21.336000000000002 -138.37919999999997 3.0480000000000098 1;
	setAttr ".pm[23]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -45.719999999999985 -134.61561791165127 3.1717496975867028 1;
	setAttr ".pm[24]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -71.932800000000015 -132.28319999999997 3.6576000000000128 1;
	setAttr ".pm[25]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -76.200000000000017 -132.89280000000002 3.6576000000000133 1;
	setAttr ".pm[26]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.651273513656392 -133.50240000000002 5.773159728050814e-015 1;
	setAttr ".pm[27]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -83.30887351365638 -132.89280000000005 -0.27933108636088111 1;
	setAttr ".pm[28]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.966473513656368 -132.28320000000005 -0.6095999999999947 1;
	setAttr ".pm[29]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -74.045160190930289 -131.67359999999999 -0.60959999999999459 1;
	setAttr ".pm[30]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -75.873960190930291 -131.06400000000002 -2.4383999999999943 1;
	setAttr ".pm[31]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -80.750760190930293 -128.7133061190454 -3.6575999999999942 1;
	setAttr ".pm[32]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.611369072747692 -134.11199999999999 4.8768000000000065 1;
	setAttr ".pm[33]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -82.659369072747737 -132.89279999999999 4.8768000000000065 1;
	setAttr ".pm[34]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.926569072747682 -131.67359999999999 4.8768000000000074 1;
	setAttr ".pm[35]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -9.1440000000000019 -79.857600000000005 4.4408920985006262e-016 1;
	setAttr ".pm[36]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084138 -46.329670381891738 4.4408920985006262e-016 1;
	setAttr ".pm[37]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -10.363210150620098 5.48640001637769 1;
	setAttr ".pm[38]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636429 -0.60960012712479283 1;
	setAttr ".pm[39]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636411 -12.801613567960064 1;
	setAttr ".pm[40]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 9.1440000000000001 -79.857568333125343 -3.3504721550646191e-006 1;
	setAttr ".pm[41]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000006 -46.329599999999921 -3.3504721550646187e-006 1;
	setAttr ".pm[42]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -10.363199999999924 5.4863966495278458 1;
	setAttr ".pm[43]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000009 -2.2223394039331943 -0.60960335047215453 1;
	setAttr ".pm[44]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -2.2223394039331952 -12.801603350472154 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 45 ".ma";
	setAttr -s 45 ".dpf[0:44]"  7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 
		7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7;
	setAttr -s 45 ".lw";
	setAttr -s 45 ".lw";
	setAttr ".mi" 4;
	setAttr ".ucm" yes;
createNode groupId -n "groupId204";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts43";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:37]";
createNode tweak -n "tweak15";
createNode objectSet -n "skinCluster15Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skinCluster15GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "skinCluster15GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode objectSet -n "tweakSet15";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId206";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts45";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode skinCluster -n "skinCluster16";
	setAttr -s 17 ".wl";
	setAttr -s 3 ".wl[0].w";
	setAttr ".wl[0].w[11]" 8.1912033173025048e-015;
	setAttr ".wl[0].w[15:16]" 8.1912033173025048e-015 1;
	setAttr -s 3 ".wl[1].w";
	setAttr ".wl[1].w[11]" 7.622403752562297e-015;
	setAttr ".wl[1].w[15:16]" 8.760001187976818e-015 1;
	setAttr -s 2 ".wl[2].w[15:16]"  6.425359e-015 1;
	setAttr -s 2 ".wl[3].w[15:16]"  3.9779276e-015 1;
	setAttr ".wl[4].w[16]"  1;
	setAttr -s 2 ".wl[5].w[16:17]"  1 3.9779276e-015;
	setAttr -s 2 ".wl[6].w[16:17]"  1 3.9779276e-015;
	setAttr -s 2 ".wl[7].w[16:17]"  1 3.9779276e-015;
	setAttr -s 2 ".wl[8].w[16:17]"  1 3.9779276e-015;
	setAttr ".wl[9].w[16]"  1;
	setAttr ".wl[10].w[16]"  1;
	setAttr ".wl[11].w[16]"  1;
	setAttr ".wl[12].w[10]"  1;
	setAttr ".wl[13].w[10]"  1;
	setAttr -s 2 ".wl[14].w[9:10]"  0.5 0.5;
	setAttr ".wl[15].w[10]"  1;
	setAttr -s 2 ".wl[16].w[9:10]"  0.5 0.5;
	setAttr -s 45 ".pm";
	setAttr ".pm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -82.905600000000007 1.5235399408006025 1;
	setAttr ".pm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -96.316800000000001 -2.2204460492503131e-016 1;
	setAttr ".pm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -112.16640000000001 0.12451816054295495 1;
	setAttr ".pm[3]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -126.90278208834873 -0.19509691995282158 1;
	setAttr ".pm[4]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -145.07595133010403 1.2191999999999996 1;
	setAttr ".pm[5]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -148.12395133010398 -1.2192000000000005 1;
	setAttr ".pm[6]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -166.41195133010399 -0.60960000000000081 1;
	setAttr ".pm[7]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 10.722223920000001 -130.56032297236209 6.5925809435429965 1;
	setAttr ".pm[8]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 21.336000000000002 -138.37920000000003 3.0480000000000032 1;
	setAttr ".pm[9]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 45.719999999999985 -134.61561791165141 3.1717480164570038 1;
	setAttr ".pm[10]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 71.932799999999972 -132.28319999999999 3.6576000000000017 1;
	setAttr ".pm[11]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.199999999999974 -132.89280000000005 3.6576000000000013 1;
	setAttr ".pm[12]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 79.840525395620432 -133.50240000000008 2.2204460492503131e-015 1;
	setAttr ".pm[13]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.498125395620448 -132.89280000000008 -0.3004912146664338 1;
	setAttr ".pm[14]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.155725395620451 -131.67360000000002 -0.69545463276183173 1;
	setAttr ".pm[15]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 74.096561497334889 -131.67360000000008 -0.82854536723815997 1;
	setAttr ".pm[16]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.534961497334891 -130.45440000000005 -2.3525453672381595 1;
	setAttr ".pm[17]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.529365497334879 -129.23520000000005 -3.8273506472381591 1;
	setAttr ".pm[18]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.012234661144092 -133.50240000000005 4.8768000000000029 1;
	setAttr ".pm[19]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.66983466114408 -132.89280000000005 4.8768000000000038 1;
	setAttr ".pm[20]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.327434661144068 -131.67360000000005 4.8768000000000038 1;
	setAttr ".pm[21]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.722226103569733 -130.56038208834872 6.5925950459904277 1;
	setAttr ".pm[22]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -21.336000000000002 -138.37919999999997 3.0480000000000098 1;
	setAttr ".pm[23]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -45.719999999999985 -134.61561791165127 3.1717496975867028 1;
	setAttr ".pm[24]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -71.932800000000015 -132.28319999999997 3.6576000000000128 1;
	setAttr ".pm[25]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -76.200000000000017 -132.89280000000002 3.6576000000000133 1;
	setAttr ".pm[26]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.651273513656392 -133.50240000000002 5.773159728050814e-015 1;
	setAttr ".pm[27]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -83.30887351365638 -132.89280000000005 -0.27933108636088111 1;
	setAttr ".pm[28]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.966473513656368 -132.28320000000005 -0.6095999999999947 1;
	setAttr ".pm[29]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -74.045160190930289 -131.67359999999999 -0.60959999999999459 1;
	setAttr ".pm[30]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -75.873960190930291 -131.06400000000002 -2.4383999999999943 1;
	setAttr ".pm[31]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -80.750760190930293 -128.7133061190454 -3.6575999999999942 1;
	setAttr ".pm[32]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.611369072747692 -134.11199999999999 4.8768000000000065 1;
	setAttr ".pm[33]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -82.659369072747737 -132.89279999999999 4.8768000000000065 1;
	setAttr ".pm[34]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.926569072747682 -131.67359999999999 4.8768000000000074 1;
	setAttr ".pm[35]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -9.1440000000000019 -79.857600000000005 4.4408920985006262e-016 1;
	setAttr ".pm[36]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084138 -46.329670381891738 4.4408920985006262e-016 1;
	setAttr ".pm[37]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -10.363210150620098 5.48640001637769 1;
	setAttr ".pm[38]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636429 -0.60960012712479283 1;
	setAttr ".pm[39]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636411 -12.801613567960064 1;
	setAttr ".pm[40]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 9.1440000000000001 -79.857568333125343 -3.3504721550646191e-006 1;
	setAttr ".pm[41]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000006 -46.329599999999921 -3.3504721550646187e-006 1;
	setAttr ".pm[42]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -10.363199999999924 5.4863966495278458 1;
	setAttr ".pm[43]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000009 -2.2223394039331943 -0.60960335047215453 1;
	setAttr ".pm[44]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -2.2223394039331952 -12.801603350472154 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 45 ".ma";
	setAttr -s 45 ".dpf[0:44]"  7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 
		7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7;
	setAttr -s 45 ".lw";
	setAttr -s 45 ".lw";
	setAttr ".mi" 4;
	setAttr ".ucm" yes;
createNode groupId -n "groupId207";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts46";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:26]";
createNode tweak -n "tweak16";
createNode objectSet -n "skinCluster16Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skinCluster16GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "skinCluster16GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode objectSet -n "tweakSet16";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId209";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts48";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode skinCluster -n "skinCluster17";
	setAttr -s 14 ".wl";
	setAttr ".wl[0].w[13]"  1;
	setAttr ".wl[1].w[13]"  1;
	setAttr ".wl[2].w[13]"  1;
	setAttr ".wl[3].w[13]"  1;
	setAttr ".wl[4].w[12]"  1;
	setAttr ".wl[5].w[12]"  1;
	setAttr ".wl[6].w[13]"  1;
	setAttr ".wl[7].w[13]"  1;
	setAttr ".wl[8].w[13]"  1;
	setAttr ".wl[9].w[13]"  1;
	setAttr ".wl[10].w[10]"  1;
	setAttr ".wl[11].w[10]"  1;
	setAttr ".wl[12].w[10]"  1;
	setAttr ".wl[13].w[10]"  1;
	setAttr -s 45 ".pm";
	setAttr ".pm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -82.905600000000007 1.5235399408006025 1;
	setAttr ".pm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -96.316800000000001 -2.2204460492503131e-016 1;
	setAttr ".pm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -112.16640000000001 0.12451816054295495 1;
	setAttr ".pm[3]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -126.90278208834873 -0.19509691995282158 1;
	setAttr ".pm[4]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -145.07595133010403 1.2191999999999996 1;
	setAttr ".pm[5]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -148.12395133010398 -1.2192000000000005 1;
	setAttr ".pm[6]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -166.41195133010399 -0.60960000000000081 1;
	setAttr ".pm[7]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 10.722223920000001 -130.56032297236209 6.5925809435429965 1;
	setAttr ".pm[8]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 21.336000000000002 -138.37920000000003 3.0480000000000032 1;
	setAttr ".pm[9]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 45.719999999999985 -134.61561791165141 3.1717480164570038 1;
	setAttr ".pm[10]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 71.932799999999972 -132.28319999999999 3.6576000000000017 1;
	setAttr ".pm[11]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.199999999999974 -132.89280000000005 3.6576000000000013 1;
	setAttr ".pm[12]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 79.840525395620432 -133.50240000000008 2.2204460492503131e-015 1;
	setAttr ".pm[13]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.498125395620448 -132.89280000000008 -0.3004912146664338 1;
	setAttr ".pm[14]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.155725395620451 -131.67360000000002 -0.69545463276183173 1;
	setAttr ".pm[15]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 74.096561497334889 -131.67360000000008 -0.82854536723815997 1;
	setAttr ".pm[16]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.534961497334891 -130.45440000000005 -2.3525453672381595 1;
	setAttr ".pm[17]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.529365497334879 -129.23520000000005 -3.8273506472381591 1;
	setAttr ".pm[18]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.012234661144092 -133.50240000000005 4.8768000000000029 1;
	setAttr ".pm[19]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.66983466114408 -132.89280000000005 4.8768000000000038 1;
	setAttr ".pm[20]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.327434661144068 -131.67360000000005 4.8768000000000038 1;
	setAttr ".pm[21]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.722226103569733 -130.56038208834872 6.5925950459904277 1;
	setAttr ".pm[22]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -21.336000000000002 -138.37919999999997 3.0480000000000098 1;
	setAttr ".pm[23]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -45.719999999999985 -134.61561791165127 3.1717496975867028 1;
	setAttr ".pm[24]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -71.932800000000015 -132.28319999999997 3.6576000000000128 1;
	setAttr ".pm[25]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -76.200000000000017 -132.89280000000002 3.6576000000000133 1;
	setAttr ".pm[26]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.651273513656392 -133.50240000000002 5.773159728050814e-015 1;
	setAttr ".pm[27]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -83.30887351365638 -132.89280000000005 -0.27933108636088111 1;
	setAttr ".pm[28]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.966473513656368 -132.28320000000005 -0.6095999999999947 1;
	setAttr ".pm[29]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -74.045160190930289 -131.67359999999999 -0.60959999999999459 1;
	setAttr ".pm[30]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -75.873960190930291 -131.06400000000002 -2.4383999999999943 1;
	setAttr ".pm[31]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -80.750760190930293 -128.7133061190454 -3.6575999999999942 1;
	setAttr ".pm[32]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.611369072747692 -134.11199999999999 4.8768000000000065 1;
	setAttr ".pm[33]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -82.659369072747737 -132.89279999999999 4.8768000000000065 1;
	setAttr ".pm[34]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.926569072747682 -131.67359999999999 4.8768000000000074 1;
	setAttr ".pm[35]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -9.1440000000000019 -79.857600000000005 4.4408920985006262e-016 1;
	setAttr ".pm[36]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084138 -46.329670381891738 4.4408920985006262e-016 1;
	setAttr ".pm[37]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -10.363210150620098 5.48640001637769 1;
	setAttr ".pm[38]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636429 -0.60960012712479283 1;
	setAttr ".pm[39]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636411 -12.801613567960064 1;
	setAttr ".pm[40]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 9.1440000000000001 -79.857568333125343 -3.3504721550646191e-006 1;
	setAttr ".pm[41]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000006 -46.329599999999921 -3.3504721550646187e-006 1;
	setAttr ".pm[42]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -10.363199999999924 5.4863966495278458 1;
	setAttr ".pm[43]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000009 -2.2223394039331943 -0.60960335047215453 1;
	setAttr ".pm[44]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -2.2223394039331952 -12.801603350472154 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 45 ".ma";
	setAttr -s 45 ".dpf[0:44]"  7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 
		7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7;
	setAttr -s 45 ".lw";
	setAttr -s 45 ".lw";
	setAttr ".mi" 4;
	setAttr ".ucm" yes;
createNode groupId -n "groupId210";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts49";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:21]";
createNode tweak -n "tweak17";
createNode objectSet -n "skinCluster17Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skinCluster17GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "skinCluster17GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode objectSet -n "tweakSet17";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId212";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts51";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode skinCluster -n "skinCluster18";
	setAttr -s 34 ".wl";
	setAttr -s 2 ".wl[0].w[9:10]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[1].w[9:10]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[2].w[9:10]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[3].w[9:10]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[4].w[9:10]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[5].w[9:10]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[6].w[9:10]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[7].w[9:10]"  0.69999999 0.30000001;
	setAttr -s 2 ".wl[8].w[9:10]"  0.5 0.5;
	setAttr -s 2 ".wl[9].w";
	setAttr ".wl[9].w[10]" 1;
	setAttr ".wl[9].w[15]" 4.100574666681914e-025;
	setAttr -s 3 ".wl[10].w[10:12]"  1 2.6727276e-025 1.4278451e-025;
	setAttr -s 3 ".wl[11].w[10:12]"  1 2.0502873e-025 2.0502873e-025;
	setAttr -s 2 ".wl[12].w[10:11]"  1 4.1005747e-025;
	setAttr -s 2 ".wl[13].w[9:10]"  0.5 0.5;
	setAttr -s 2 ".wl[14].w[10:11]"  1 4.1005747e-025;
	setAttr -s 2 ".wl[15].w[9:10]"  0.5 0.5;
	setAttr -s 3 ".wl[16].w";
	setAttr ".wl[16].w[10:11]" 1 2.6893555088335934e-025;
	setAttr ".wl[16].w[18]" 1.4112169391770246e-025;
	setAttr -s 2 ".wl[17].w[9:10]"  0.49999967 0.5;
	setAttr -s 3 ".wl[18].w";
	setAttr ".wl[18].w[10:11]" 1 2.6105202012322658e-025;
	setAttr ".wl[18].w[18]" 1.4900539724115824e-025;
	setAttr ".wl[19].w[10]"  1;
	setAttr -s 2 ".wl[20].w[9:10]"  0.49999994 0.5;
	setAttr -s 2 ".wl[21].w[10:11]"  1 4.1005747e-025;
	setAttr -s 3 ".wl[22].w";
	setAttr ".wl[22].w[10:11]" 1 2.0256581098038255e-025;
	setAttr ".wl[22].w[18]" 2.0749142149472761e-025;
	setAttr -s 3 ".wl[23].w";
	setAttr ".wl[23].w[10:11]" 1 2.0324397251388809e-025;
	setAttr ".wl[23].w[18]" 2.0681339554669015e-025;
	setAttr -s 3 ".wl[24].w";
	setAttr ".wl[24].w[10:11]" 1 2.050287333340957e-025;
	setAttr ".wl[24].w[18]" 2.050287333340957e-025;
	setAttr -s 3 ".wl[25].w";
	setAttr ".wl[25].w[10:11]" 1 2.4751240597646575e-025;
	setAttr ".wl[25].w[18]" 1.6254522092909703e-025;
	setAttr -s 2 ".wl[26].w[10:11]"  1 4.1005747e-025;
	setAttr -s 2 ".wl[27].w";
	setAttr ".wl[27].w[10]" 1;
	setAttr ".wl[27].w[16]" 4.100574666681914e-025;
	setAttr -s 3 ".wl[28].w";
	setAttr ".wl[28].w[10]" 1;
	setAttr ".wl[28].w[15:16]" 2.0394253349736459e-025 2.0611474828155215e-025;
	setAttr -s 2 ".wl[29].w[10:11]"  1 4.1005747e-025;
	setAttr ".wl[30].w[10]"  1;
	setAttr -s 3 ".wl[31].w";
	setAttr ".wl[31].w[10:11]" 1 2.050287333340957e-025;
	setAttr ".wl[31].w[18]" 2.050287333340957e-025;
	setAttr -s 3 ".wl[32].w";
	setAttr ".wl[32].w[10:11]" 1 2.4344908206128547e-025;
	setAttr ".wl[32].w[18]" 1.6660833530309936e-025;
	setAttr -s 2 ".wl[33].w[9:10]"  0.5 0.5;
	setAttr -s 45 ".pm";
	setAttr ".pm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -82.905600000000007 1.5235399408006025 1;
	setAttr ".pm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -96.316800000000001 -2.2204460492503131e-016 1;
	setAttr ".pm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -112.16640000000001 0.12451816054295495 1;
	setAttr ".pm[3]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -126.90278208834873 -0.19509691995282158 1;
	setAttr ".pm[4]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -145.07595133010403 1.2191999999999996 1;
	setAttr ".pm[5]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -148.12395133010398 -1.2192000000000005 1;
	setAttr ".pm[6]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -166.41195133010399 -0.60960000000000081 1;
	setAttr ".pm[7]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 10.722223920000001 -130.56032297236209 6.5925809435429965 1;
	setAttr ".pm[8]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 21.336000000000002 -138.37920000000003 3.0480000000000032 1;
	setAttr ".pm[9]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 45.719999999999985 -134.61561791165141 3.1717480164570038 1;
	setAttr ".pm[10]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 71.932799999999972 -132.28319999999999 3.6576000000000017 1;
	setAttr ".pm[11]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.199999999999974 -132.89280000000005 3.6576000000000013 1;
	setAttr ".pm[12]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 79.840525395620432 -133.50240000000008 2.2204460492503131e-015 1;
	setAttr ".pm[13]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.498125395620448 -132.89280000000008 -0.3004912146664338 1;
	setAttr ".pm[14]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.155725395620451 -131.67360000000002 -0.69545463276183173 1;
	setAttr ".pm[15]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 74.096561497334889 -131.67360000000008 -0.82854536723815997 1;
	setAttr ".pm[16]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.534961497334891 -130.45440000000005 -2.3525453672381595 1;
	setAttr ".pm[17]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.529365497334879 -129.23520000000005 -3.8273506472381591 1;
	setAttr ".pm[18]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.012234661144092 -133.50240000000005 4.8768000000000029 1;
	setAttr ".pm[19]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.66983466114408 -132.89280000000005 4.8768000000000038 1;
	setAttr ".pm[20]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.327434661144068 -131.67360000000005 4.8768000000000038 1;
	setAttr ".pm[21]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.722226103569733 -130.56038208834872 6.5925950459904277 1;
	setAttr ".pm[22]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -21.336000000000002 -138.37919999999997 3.0480000000000098 1;
	setAttr ".pm[23]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -45.719999999999985 -134.61561791165127 3.1717496975867028 1;
	setAttr ".pm[24]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -71.932800000000015 -132.28319999999997 3.6576000000000128 1;
	setAttr ".pm[25]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -76.200000000000017 -132.89280000000002 3.6576000000000133 1;
	setAttr ".pm[26]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.651273513656392 -133.50240000000002 5.773159728050814e-015 1;
	setAttr ".pm[27]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -83.30887351365638 -132.89280000000005 -0.27933108636088111 1;
	setAttr ".pm[28]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.966473513656368 -132.28320000000005 -0.6095999999999947 1;
	setAttr ".pm[29]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -74.045160190930289 -131.67359999999999 -0.60959999999999459 1;
	setAttr ".pm[30]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -75.873960190930291 -131.06400000000002 -2.4383999999999943 1;
	setAttr ".pm[31]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -80.750760190930293 -128.7133061190454 -3.6575999999999942 1;
	setAttr ".pm[32]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.611369072747692 -134.11199999999999 4.8768000000000065 1;
	setAttr ".pm[33]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -82.659369072747737 -132.89279999999999 4.8768000000000065 1;
	setAttr ".pm[34]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.926569072747682 -131.67359999999999 4.8768000000000074 1;
	setAttr ".pm[35]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -9.1440000000000019 -79.857600000000005 4.4408920985006262e-016 1;
	setAttr ".pm[36]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084138 -46.329670381891738 4.4408920985006262e-016 1;
	setAttr ".pm[37]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -10.363210150620098 5.48640001637769 1;
	setAttr ".pm[38]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636429 -0.60960012712479283 1;
	setAttr ".pm[39]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636411 -12.801613567960064 1;
	setAttr ".pm[40]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 9.1440000000000001 -79.857568333125343 -3.3504721550646191e-006 1;
	setAttr ".pm[41]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000006 -46.329599999999921 -3.3504721550646187e-006 1;
	setAttr ".pm[42]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -10.363199999999924 5.4863966495278458 1;
	setAttr ".pm[43]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000009 -2.2223394039331943 -0.60960335047215453 1;
	setAttr ".pm[44]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -2.2223394039331952 -12.801603350472154 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 45 ".ma";
	setAttr -s 45 ".dpf[0:44]"  7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 
		7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7;
	setAttr -s 45 ".lw";
	setAttr -s 45 ".lw";
	setAttr ".mi" 4;
	setAttr ".ucm" yes;
createNode groupId -n "groupId213";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts52";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:46]";
createNode tweak -n "tweak18";
createNode objectSet -n "skinCluster18Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skinCluster18GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "skinCluster18GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode objectSet -n "tweakSet18";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId215";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts54";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode skinCluster -n "skinCluster19";
	setAttr -s 24 ".wl";
	setAttr ".wl[0].w[19]"  1;
	setAttr ".wl[1].w[19]"  1;
	setAttr ".wl[2].w[19]"  1;
	setAttr ".wl[3].w[19]"  1;
	setAttr ".wl[4].w[18]"  1;
	setAttr ".wl[5].w[18]"  1;
	setAttr ".wl[6].w[19]"  1;
	setAttr ".wl[7].w[19]"  1;
	setAttr ".wl[8].w[19]"  1;
	setAttr ".wl[9].w[19]"  1;
	setAttr ".wl[10].w[18]"  1;
	setAttr ".wl[11].w[19]"  1;
	setAttr ".wl[12].w[19]"  1;
	setAttr ".wl[13].w[18]"  1;
	setAttr ".wl[14].w[19]"  1;
	setAttr ".wl[15].w[19]"  1;
	setAttr ".wl[16].w[10]"  1;
	setAttr ".wl[17].w[10]"  1;
	setAttr ".wl[18].w[10]"  1;
	setAttr ".wl[19].w[10]"  1;
	setAttr ".wl[20].w[10]"  1;
	setAttr ".wl[21].w[10]"  1;
	setAttr ".wl[22].w[10]"  1;
	setAttr ".wl[23].w[10]"  1;
	setAttr -s 45 ".pm";
	setAttr ".pm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -82.905600000000007 1.5235399408006025 1;
	setAttr ".pm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -96.316800000000001 -2.2204460492503131e-016 1;
	setAttr ".pm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -112.16640000000001 0.12451816054295495 1;
	setAttr ".pm[3]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -126.90278208834873 -0.19509691995282158 1;
	setAttr ".pm[4]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -145.07595133010403 1.2191999999999996 1;
	setAttr ".pm[5]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -148.12395133010398 -1.2192000000000005 1;
	setAttr ".pm[6]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -166.41195133010399 -0.60960000000000081 1;
	setAttr ".pm[7]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 10.722223920000001 -130.56032297236209 6.5925809435429965 1;
	setAttr ".pm[8]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 21.336000000000002 -138.37920000000003 3.0480000000000032 1;
	setAttr ".pm[9]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 45.719999999999985 -134.61561791165141 3.1717480164570038 1;
	setAttr ".pm[10]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 71.932799999999972 -132.28319999999999 3.6576000000000017 1;
	setAttr ".pm[11]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.199999999999974 -132.89280000000005 3.6576000000000013 1;
	setAttr ".pm[12]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 79.840525395620432 -133.50240000000008 2.2204460492503131e-015 1;
	setAttr ".pm[13]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.498125395620448 -132.89280000000008 -0.3004912146664338 1;
	setAttr ".pm[14]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.155725395620451 -131.67360000000002 -0.69545463276183173 1;
	setAttr ".pm[15]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 74.096561497334889 -131.67360000000008 -0.82854536723815997 1;
	setAttr ".pm[16]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 76.534961497334891 -130.45440000000005 -2.3525453672381595 1;
	setAttr ".pm[17]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.529365497334879 -129.23520000000005 -3.8273506472381591 1;
	setAttr ".pm[18]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 80.012234661144092 -133.50240000000005 4.8768000000000029 1;
	setAttr ".pm[19]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 83.66983466114408 -132.89280000000005 4.8768000000000038 1;
	setAttr ".pm[20]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 87.327434661144068 -131.67360000000005 4.8768000000000038 1;
	setAttr ".pm[21]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.722226103569733 -130.56038208834872 6.5925950459904277 1;
	setAttr ".pm[22]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -21.336000000000002 -138.37919999999997 3.0480000000000098 1;
	setAttr ".pm[23]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -45.719999999999985 -134.61561791165127 3.1717496975867028 1;
	setAttr ".pm[24]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -71.932800000000015 -132.28319999999997 3.6576000000000128 1;
	setAttr ".pm[25]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -76.200000000000017 -132.89280000000002 3.6576000000000133 1;
	setAttr ".pm[26]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.651273513656392 -133.50240000000002 5.773159728050814e-015 1;
	setAttr ".pm[27]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -83.30887351365638 -132.89280000000005 -0.27933108636088111 1;
	setAttr ".pm[28]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.966473513656368 -132.28320000000005 -0.6095999999999947 1;
	setAttr ".pm[29]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -74.045160190930289 -131.67359999999999 -0.60959999999999459 1;
	setAttr ".pm[30]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -75.873960190930291 -131.06400000000002 -2.4383999999999943 1;
	setAttr ".pm[31]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -80.750760190930293 -128.7133061190454 -3.6575999999999942 1;
	setAttr ".pm[32]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -79.611369072747692 -134.11199999999999 4.8768000000000065 1;
	setAttr ".pm[33]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -82.659369072747737 -132.89279999999999 4.8768000000000065 1;
	setAttr ".pm[34]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -86.926569072747682 -131.67359999999999 4.8768000000000074 1;
	setAttr ".pm[35]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -9.1440000000000019 -79.857600000000005 4.4408920985006262e-016 1;
	setAttr ".pm[36]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084138 -46.329670381891738 4.4408920985006262e-016 1;
	setAttr ".pm[37]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -10.363210150620098 5.48640001637769 1;
	setAttr ".pm[38]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636429 -0.60960012712479283 1;
	setAttr ".pm[39]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -10.875341649084136 -2.2223399195636411 -12.801613567960064 1;
	setAttr ".pm[40]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 9.1440000000000001 -79.857568333125343 -3.3504721550646191e-006 1;
	setAttr ".pm[41]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000006 -46.329599999999921 -3.3504721550646187e-006 1;
	setAttr ".pm[42]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -10.363199999999924 5.4863966495278458 1;
	setAttr ".pm[43]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000009 -2.2223394039331943 -0.60960335047215453 1;
	setAttr ".pm[44]" -type "matrix" 1 0 0 0 0 0.99999999999999911 4.19555995185357e-008 0
		 0 -4.19555995185357e-008 0.99999999999999911 0 10.875324960000011 -2.2223394039331952 -12.801603350472154 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 45 ".ma";
	setAttr -s 45 ".dpf[0:44]"  7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 
		7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7;
	setAttr -s 45 ".lw";
	setAttr -s 45 ".lw";
	setAttr ".mi" 4;
	setAttr ".ucm" yes;
createNode groupId -n "groupId216";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts55";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:37]";
createNode tweak -n "tweak19";
createNode objectSet -n "skinCluster19Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skinCluster19GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "skinCluster19GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode objectSet -n "tweakSet19";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId218";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts57";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode animCurveTU -n "chest_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 1 1 9 1 17 1 25 1 33 1;
	setAttr -s 6 ".kot[0:5]"  5 5 5 5 5 5;
createNode animCurveTL -n "chest_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 1 0 9 0 17 0 25 0 33 0;
createNode animCurveTL -n "chest_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0.48347710263611282 1 0.48347710263611282 
		9 0.48347710263611282 17 0.48347710263611282 25 0.48347710263611282 33 0.48347710263611282;
createNode animCurveTL -n "chest_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0.010486059071383743 1 0.010486059071383743 
		9 0.010486059071383743 17 0.010486059071383743 25 0.010486059071383743 33 
		0.010486059071383743;
createNode animCurveTA -n "chest_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 1 0 9 0 17 0 25 0 33 0;
createNode animCurveTA -n "chest_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 1 -10.000000000000002 9 0 17 
		10.000000000000002 25 0 33 -10.000000000000002;
createNode animCurveTA -n "chest_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 1 0 9 5 17 -5 25 5 33 0;
createNode animCurveTU -n "chest_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 1 1 9 1 17 1 25 1 33 1;
createNode animCurveTU -n "chest_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 1 1 9 1 17 1 25 1 33 1;
createNode animCurveTU -n "chest_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 1 1 9 1 17 1 25 1 33 1;
createNode animCurveTU -n "god_joint_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 1 1 1 5 1 9 1 17 1 21 1 25 1 
		33 1;
	setAttr -s 8 ".kot[0:7]"  5 5 5 5 5 5 5 
		5;
createNode animCurveTL -n "god_joint_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 0 1 0 5 0.012500000000000001 
		9 0.025000000000000001 17 0.050000000000000003 21 0.0375 25 0.025000000000000001 
		33 0;
createNode animCurveTL -n "god_joint_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 2.7200000000000002 1 2.6 5 2.5500000000000003 
		9 2.6500000000000004 17 2.6 21 2.5500000000000003 25 2.6500000000000004 33 
		2.6;
createNode animCurveTL -n "god_joint_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 -0.04998490619424549 1 -0.04998490619424549 
		5 -0.04998490619424549 9 -0.04998490619424549 17 -0.04998490619424549 21 
		-0.04998490619424549 25 -0.04998490619424549 33 -0.04998490619424549;
createNode animCurveTA -n "god_joint_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 0 1 0 5 0 9 0 17 0 21 0 25 0 
		33 0;
createNode animCurveTA -n "god_joint_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 0 1 5 5 5.0000000000000009 9 
		0 17 -5 21 -5.0000000000000009 25 0 33 5;
createNode animCurveTA -n "god_joint_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 0 1 0 5 -2.4999999999999996 9 
		-5 17 0 21 2.4999999999999996 25 -5 33 0;
createNode animCurveTU -n "god_joint_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 1 1 1 5 1 9 1 17 1 21 1 25 1 
		33 1;
createNode animCurveTU -n "god_joint_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 1 1 1 5 1 9 1 17 1 21 1 25 1 
		33 1;
createNode animCurveTU -n "god_joint_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 1 1 1 5 1 9 1 17 1 21 1 25 1 
		33 1;
createNode animCurveTU -n "spine_1_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 1 1 1 9 1 17 1 21 1 25 1 33 1;
	setAttr -s 7 ".kot[0:6]"  5 5 5 5 5 5 5;
createNode animCurveTL -n "spine_1_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0 1 0 9 0 17 0 21 0 25 0 33 0;
createNode animCurveTL -n "spine_1_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0.43999999999999978 1 0.43999999999999978 
		9 0.43999999999999978 17 0.43999999999999978 21 0.43999999999999978 25 0.43999999999999978 
		33 0.43999999999999978;
createNode animCurveTL -n "spine_1_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0.049984906194245497 1 0.049984906194245497 
		9 0.049984906194245497 17 0.049984906194245497 21 0.049984906194245497 25 
		0.049984906194245497 33 0.049984906194245497;
createNode animCurveTA -n "spine_1_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0 1 10.000000000000002 9 5 17 
		10 21 7.5000000000000009 25 5 33 10.000000000000002;
createNode animCurveTA -n "spine_1_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0 1 0 9 0 17 0 21 0 25 0 33 0;
createNode animCurveTA -n "spine_1_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0 1 0 9 5 17 2.5000000000000004 
		21 0 25 5 33 0;
createNode animCurveTU -n "spine_1_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 1 1 1 9 1 17 1 21 1 25 1 33 1;
createNode animCurveTU -n "spine_1_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 1 1 1 9 1 17 1 21 1 25 1 33 1;
createNode animCurveTU -n "spine_1_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 1 1 1 9 1 17 1 21 1 25 1 33 1;
createNode animCurveTU -n "spine_2_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  0 1 1 1 25 1 33 1;
	setAttr -s 4 ".kot[0:3]"  5 5 5 5;
createNode animCurveTL -n "spine_2_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  0 0 1 0 25 0 33 0;
createNode animCurveTL -n "spine_2_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  0 0.52000000000000035 1 0.52000000000000035 
		25 0.52000000000000035 33 0.52000000000000035;
createNode animCurveTL -n "spine_2_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  0 -0.0040852414876297628 1 -0.0040852414876297628 
		25 -0.0040852414876297628 33 -0.0040852414876297628;
createNode animCurveTA -n "spine_2_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  0 0 1 -5.0000000000000027 25 -5.0000000000000027 
		33 -5.0000000000000027;
createNode animCurveTA -n "spine_2_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  0 0 1 0 25 0 33 0;
createNode animCurveTA -n "spine_2_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  0 0 1 0 25 0 33 0;
createNode animCurveTU -n "spine_2_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  0 1 1 1 25 1 33 1;
createNode animCurveTU -n "spine_2_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  0 1 1 1 25 1 33 1;
createNode animCurveTU -n "spine_2_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  0 1 1 1 25 1 33 1;
createNode animCurveTU -n "shoulder_left_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 1 1 7 1 11 1 19 1 33 1;
	setAttr -s 6 ".kot[0:5]"  5 5 5 5 5 5;
createNode animCurveTL -n "shoulder_left_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0.34822092836057311 1 0.34822092836057311 
		7 0.34822092836057311 11 0.34822092836057311 19 0.34822092836057311 33 0.34822092836057311;
createNode animCurveTL -n "shoulder_left_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0.25652289736388623 1 0.25652289736388623 
		7 0.25652289736388623 11 0.25652289736388623 19 0.25652289736388623 33 0.25652289736388623;
createNode animCurveTL -n "shoulder_left_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0.1162924883855124 1 0.1162924883855124 
		7 0.1162924883855124 11 0.1162924883855124 19 0.1162924883855124 33 0.1162924883855124;
createNode animCurveTA -n "shoulder_left_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 1 3.9908798545555505e-016 7 
		0 11 -3.9908798545555496e-016 19 0 33 3.9908798545555505e-016;
createNode animCurveTA -n "shoulder_left_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 1 -5 7 -40.000000000000021 
		11 5.0000000000000009 19 60.000000000000007 33 -5;
createNode animCurveTA -n "shoulder_left_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 1 -65.000000000000014 7 -65 
		11 -65.000000000000085 19 -65.000000000000185 33 -65.000000000000014;
createNode animCurveTU -n "shoulder_left_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 1 1 7 1 11 1 19 1 33 1;
createNode animCurveTU -n "shoulder_left_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 1 1 7 1 11 1 19 1 33 1;
createNode animCurveTU -n "shoulder_left_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 1 1 7 1 11 1 19 1 33 1;
createNode animCurveTU -n "shoulder_right_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 1 1 7 1 11 1 21 1 33 1;
	setAttr -s 6 ".kot[0:5]"  5 5 5 5 5 5;
createNode animCurveTL -n "shoulder_right_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 -0.348221 1 -0.348221 7 -0.348221 
		11 -0.348221 21 -0.348221 33 -0.348221;
createNode animCurveTL -n "shoulder_right_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0.25652483686476174 1 0.25652483686476174 
		7 0.25652483686476174 11 0.25652483686476174 21 0.25652483686476174 33 0.25652483686476174;
createNode animCurveTL -n "shoulder_right_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0.11629202570679112 1 0.11629202570679112 
		7 0.11629202570679112 11 0.11629202570679112 21 0.11629202570679112 33 0.11629202570679112;
createNode animCurveTA -n "shoulder_right_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 1 0 7 0 11 0 21 4.151919265302379e-015 
		33 0;
createNode animCurveTA -n "shoulder_right_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 1 -5.0000000000000009 7 -55.000000000000043 
		11 -15.00000000000005 21 40.000000000000007 33 -5.0000000000000009;
createNode animCurveTA -n "shoulder_right_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 1 65.000000000000085 7 65.000000000000085 
		11 65.000000000000085 21 65.000000000000156 33 65.000000000000085;
createNode animCurveTU -n "shoulder_right_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 1 1 7 1 11 1 21 1 33 1;
createNode animCurveTU -n "shoulder_right_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 1 1 7 1 11 1 21 1 33 1;
createNode animCurveTU -n "shoulder_right_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 1 1 7 1 11 1 21 1 33 1;
createNode animCurveTU -n "hip_left_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 1 1 1 5 1 9 1 13 1 17 1 21 1 
		25 1 33 1;
	setAttr -s 9 ".kot[0:8]"  5 5 5 5 5 5 5 
		5 5;
createNode animCurveTL -n "hip_left_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 0.30000000000000004 1 0.30000000000000004 
		5 0.30000000000000004 9 0.30000000000000004 13 0.30000000000000004 17 0.30000000000000004 
		21 0.30000000000000004 25 0.30000000000000004 33 0.30000000000000004;
createNode animCurveTL -n "hip_left_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 -0.10000000000000006 1 -0.10000000000000006 
		5 -0.10000000000000006 9 -0.10000000000000006 13 -0.10000000000000006 17 
		-0.10000000000000006 21 -0.10000000000000006 25 -0.10000000000000006 33 -0.10000000000000006;
createNode animCurveTL -n "hip_left_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 0.049984906194245476 1 0.049984906194245476 
		5 0.049984906194245476 9 0.049984906194245476 13 0.049984906194245476 17 
		0.049984906194245476 21 0.049984906194245476 25 0.049984906194245476 33 0.049984906194245476;
createNode animCurveTA -n "hip_left_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 0 1 19.999999999999975 5 9.9999999999999858 
		9 -20 13 -29.999999999999993 17 -39.999999999999993 21 -14.999999999999993 
		25 -5 33 19.999999999999975;
createNode animCurveTA -n "hip_left_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 0 1 0 5 0 9 -1.987846675914697e-016 
		13 0 17 0 21 0 25 0 33 0;
createNode animCurveTA -n "hip_left_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 0 1 0 5 2.4999999999999996 9 
		5.0000000000000062 13 2.5000000000000013 17 0 21 -2.4999999999999996 25 5 
		33 0;
createNode animCurveTU -n "hip_left_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 1 1 1 5 1 9 1 13 1 17 1 21 1 
		25 1 33 1;
createNode animCurveTU -n "hip_left_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 1 1 1 5 1 9 1 13 1 17 1 21 1 
		25 1 33 1;
createNode animCurveTU -n "hip_left_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 1 1 1 5 1 9 1 13 1 17 1 21 1 
		25 1 33 1;
createNode animCurveTU -n "hip_right_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 1 1 1 5 1 9 1 17 1 21 1 25 1 
		33 1;
	setAttr -s 8 ".kot[0:7]"  5 5 5 5 5 5 5 
		5;
createNode animCurveTL -n "hip_right_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 -0.30000000000000004 1 -0.30000000000000004 
		5 -0.30000000000000004 9 -0.30000000000000004 17 -0.30000000000000004 21 
		-0.30000000000000004 25 -0.30000000000000004 33 -0.30000000000000004;
createNode animCurveTL -n "hip_right_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 -0.10000103893945514 1 -0.10000103893945514 
		5 -0.10000103893945514 9 -0.10000103893945514 17 -0.10000103893945514 21 
		-0.10000103893945514 25 -0.10000103893945514 33 -0.10000103893945514;
createNode animCurveTL -n "hip_right_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 0.049984906194245476 1 0.049984906194245476 
		5 0.049984906194245476 9 0.049984906194245476 17 0.049984906194245476 21 
		0.049984906194245476 25 0.049984906194245476 33 0.049984906194245476;
createNode animCurveTA -n "hip_right_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 -2.4038787793532049e-006 1 -40.000000000000021 
		5 -14.999999999999998 9 -5 17 20 21 10.000000000000002 25 -25 33 -40.000000000000021;
createNode animCurveTA -n "hip_right_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 4.6972774368449011e-007 1 0 5 
		4.9696166897867449e-017 9 0 17 0 21 0 25 0 33 0;
createNode animCurveTA -n "hip_right_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 3.7083764102842433e-008 1 0 5 
		2.4999999999999991 9 5 17 0 21 -2.4999999999999996 25 5 33 0;
createNode animCurveTU -n "hip_right_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 1 1 1 5 1 9 1 17 1 21 1 25 1 
		33 1;
createNode animCurveTU -n "hip_right_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 1 1 1 5 1 9 1 17 1 21 1 25 1 
		33 1;
createNode animCurveTU -n "hip_right_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 1 1 1 5 1 9 1 17 1 21 1 25 1 
		33 1;
createNode animCurveTU -n "knee_right_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 1 1 1 5 1 9 1 17 1 21 1 25 1 
		33 1;
	setAttr -s 8 ".kot[0:7]"  5 5 5 5 5 5 5 
		5;
createNode animCurveTL -n "knee_right_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 -0.056802000000000068 1 -0.056802000000000068 
		5 -0.056802000000000068 9 -0.056802000000000068 17 -0.056802000000000068 
		21 -0.056802000000000068 25 -0.056802000000000068 33 -0.056802000000000068;
createNode animCurveTL -n "knee_right_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 -1.0999989610605454 1 -1.0999989610605454 
		5 -1.0999989610605454 9 -1.0999989610605454 17 -1.0999989610605454 21 -1.0999989610605454 
		25 -1.0999989610605454 33 -1.0999989610605454;
createNode animCurveTL -n "knee_right_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 -1.0352505317861047e-031 1 -1.0352505317861047e-031 
		5 -1.0352505317861047e-031 9 -1.0352505317861047e-031 17 -1.0352505317861047e-031 
		21 -1.0352505317861047e-031 25 -1.0352505317861047e-031 33 -1.0352505317861047e-031;
createNode animCurveTA -n "knee_right_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 0 1 20 5 35 9 20 17 10.000000000000002 
		21 50.000000000000036 25 80 33 20;
createNode animCurveTA -n "knee_right_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 0 1 0 5 0 9 0 17 0 21 0 25 0 
		33 0;
createNode animCurveTA -n "knee_right_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 0 1 0 5 0 9 0 17 0 21 0 25 0 
		33 0;
createNode animCurveTU -n "knee_right_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 1 1 1 5 1 9 1 17 1 21 1 25 1 
		33 1;
createNode animCurveTU -n "knee_right_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 1 1 1 5 1 9 1 17 1 21 1 25 1 
		33 1;
createNode animCurveTU -n "knee_right_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 1 1 1 5 1 9 1 17 1 21 1 25 1 
		33 1;
createNode animCurveTU -n "knee_left_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 1 1 1 5 1 9 1 13 1 17 1 21 1 
		25 1 33 1;
	setAttr -s 9 ".kot[0:8]"  5 5 5 5 5 5 5 
		5 5;
createNode animCurveTL -n "knee_left_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 0.056802547542130453 1 0.056802547542130453 
		5 0.056802547542130453 9 0.056802547542130453 13 0.056802547542130453 17 
		0.056802547542130453 21 0.056802547542130453 25 0.056802547542130453 33 0.056802547542130453;
createNode animCurveTL -n "knee_left_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 -1.0999976908828171 1 -1.0999976908828171 
		5 -1.0999976908828171 9 -1.0999976908828171 13 -1.0999976908828171 17 -1.0999976908828171 
		21 -1.0999976908828171 25 -1.0999976908828171 33 -1.0999976908828171;
createNode animCurveTL -n "knee_left_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 0 1 0 5 0 9 0 13 0 17 0 21 0 
		25 0 33 0;
createNode animCurveTA -n "knee_left_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 0 1 10.000000000000002 5 50.000000000000007 
		9 80 13 80 17 20 21 35 25 24.999999999999996 33 10.000000000000002;
createNode animCurveTA -n "knee_left_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 0 1 0 5 0 9 0 13 0 17 0 21 0 
		25 0 33 0;
createNode animCurveTA -n "knee_left_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 0 1 0 5 0 9 0 13 0 17 0 21 0 
		25 0 33 0;
createNode animCurveTU -n "knee_left_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 1 1 1 5 1 9 1 13 1 17 1 21 1 
		25 1 33 1;
createNode animCurveTU -n "knee_left_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 1 1 1 5 1 9 1 13 1 17 1 21 1 
		25 1 33 1;
createNode animCurveTU -n "knee_left_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 1 1 1 5 1 9 1 13 1 17 1 21 1 
		25 1 33 1;
createNode animCurveTU -n "ankle_right_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 1 1 1 5 1 9 1 17 1 21 1 25 1 
		33 1;
	setAttr -s 8 ".kot[0:7]"  5 5 5 5 5 5 5 
		5;
createNode animCurveTL -n "ankle_right_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 -1.7483827159451283e-016 1 -1.7483827159451283e-016 
		5 -1.7483827159451283e-016 9 -1.7483827159451283e-016 17 -1.7483827159451283e-016 
		21 -1.7483827159451283e-016 25 -1.7483827159451283e-016 33 -1.7483827159451283e-016;
createNode animCurveTL -n "ankle_right_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 -1.1799999999999997 1 -1.1799999999999997 
		5 -1.1799999999999997 9 -1.1799999999999997 17 -1.1799999999999997 21 -1.1799999999999997 
		25 -1.1799999999999997 33 -1.1799999999999997;
createNode animCurveTL -n "ankle_right_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 -0.18 1 -0.18 5 -0.18 9 -0.18 
		17 -0.18 21 -0.18 25 -0.18 33 -0.18;
createNode animCurveTA -n "ankle_right_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 0 1 0 5 -20 9 5.0000000000000009 
		17 10.000000000000004 21 20 25 40.000000000000021 33 0;
createNode animCurveTA -n "ankle_right_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 0 1 0 5 0 9 0 17 0 21 0 25 0 
		33 0;
createNode animCurveTA -n "ankle_right_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 0 1 0 5 0 9 0 17 0 21 0 25 0 
		33 0;
createNode animCurveTU -n "ankle_right_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 1 1 1 5 1 9 1 17 1 21 1 25 1 
		33 1;
createNode animCurveTU -n "ankle_right_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 1 1 1 5 1 9 1 17 1 21 1 25 1 
		33 1;
createNode animCurveTU -n "ankle_right_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 1 1 1 5 1 9 1 17 1 21 1 25 1 
		33 1;
createNode animCurveTU -n "ankle_left_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 1 1 1 5 1 9 1 13 1 21 1 25 1 
		33 1;
	setAttr -s 8 ".kot[0:7]"  5 5 5 5 5 5 5 
		5;
createNode animCurveTL -n "ankle_left_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 -5.8279423864837613e-017 1 -5.8279423864837613e-017 
		5 -5.8279423864837613e-017 9 -5.8279423864837613e-017 13 -5.8279423864837613e-017 
		21 -5.8279423864837613e-017 25 -5.8279423864837613e-017 33 -5.8279423864837613e-017;
createNode animCurveTL -n "ankle_left_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 -1.1800019760915892 1 -1.1800019760915892 
		5 -1.1800019760915892 9 -1.1800019760915892 13 -1.1800019760915892 21 -1.1800019760915892 
		25 -1.1800019760915892 33 -1.1800019760915892;
createNode animCurveTL -n "ankle_left_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 -0.18000000053732579 1 -0.18000000053732579 
		5 -0.18000000053732579 9 -0.18000000053732579 13 -0.18000000053732579 21 
		-0.18000000053732579 25 -0.18000000053732579 33 -0.18000000053732579;
createNode animCurveTA -n "ankle_left_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 0 1 0 5 4.9999999999999858 9 
		24.999999999999996 13 20.000000000000021 21 -20 25 -10.000000000000002 33 
		0;
createNode animCurveTA -n "ankle_left_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 0 1 0 5 0 9 0 13 0 21 0 25 0 
		33 0;
createNode animCurveTA -n "ankle_left_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 0 1 0 5 0 9 0 13 0 21 0 25 0 
		33 0;
createNode animCurveTU -n "ankle_left_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 1 1 1 5 1 9 1 13 1 21 1 25 1 
		33 1;
createNode animCurveTU -n "ankle_left_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 1 1 1 5 1 9 1 13 1 21 1 25 1 
		33 1;
createNode animCurveTU -n "ankle_left_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 1 1 1 5 1 9 1 13 1 21 1 25 1 
		33 1;
createNode animCurveTU -n "foot_right_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 1 1 5 1 9 1 21 1 33 1;
	setAttr -s 6 ".kot[0:5]"  5 5 5 5 5 5;
createNode animCurveTL -n "foot_right_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 5.8279423864837613e-017 1 5.8279423864837613e-017 
		5 5.8279423864837613e-017 9 5.8279423864837613e-017 21 5.8279423864837613e-017 
		33 5.8279423864837613e-017;
createNode animCurveTL -n "foot_right_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 -0.26708860223316044 1 -0.26708860223316044 
		5 -0.26708860223316044 9 -0.26708860223316044 21 -0.26708860223316044 33 
		-0.26708860223316044;
createNode animCurveTL -n "foot_right_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0.20000000000000001 1 0.20000000000000001 
		5 0.20000000000000001 9 0.20000000000000001 21 0.20000000000000001 33 0.20000000000000001;
createNode animCurveTA -n "foot_right_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 1 0 5 0 9 -20 21 0 33 0;
createNode animCurveTA -n "foot_right_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 1 0 5 0 9 0 21 0 33 0;
createNode animCurveTA -n "foot_right_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 1 0 5 0 9 0 21 0 33 0;
createNode animCurveTU -n "foot_right_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 1 1 5 1 9 1 21 1 33 1;
createNode animCurveTU -n "foot_right_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 1 1 5 1 9 1 21 1 33 1;
createNode animCurveTU -n "foot_right_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 1 1 5 1 9 1 21 1 33 1;
createNode animCurveTU -n "foot_left_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  0 1 1 1 25 1 33 1;
	setAttr -s 4 ".kot[0:3]"  5 5 5 5;
createNode animCurveTL -n "foot_left_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  0 0 1 0 25 0 33 0;
createNode animCurveTL -n "foot_left_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  0 -0.26708891834174719 1 -0.26708891834174719 
		25 -0.26708891834174719 33 -0.26708891834174719;
createNode animCurveTL -n "foot_left_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  0 0.20000000470808671 1 0.20000000470808671 
		25 0.20000000470808671 33 0.20000000470808671;
createNode animCurveTA -n "foot_left_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  0 0 1 0 25 -5 33 0;
createNode animCurveTA -n "foot_left_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  0 0 1 0 25 0 33 0;
createNode animCurveTA -n "foot_left_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  0 0 1 0 25 0 33 0;
createNode animCurveTU -n "foot_left_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  0 1 1 1 25 1 33 1;
createNode animCurveTU -n "foot_left_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  0 1 1 1 25 1 33 1;
createNode animCurveTU -n "foot_left_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  0 1 1 1 25 1 33 1;
createNode animCurveTU -n "elbow_left_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 1 1 7 1 11 1 19 1 33 1;
	setAttr -s 6 ".kot[0:5]"  5 5 5 5 5 5;
createNode animCurveTL -n "elbow_left_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0.79999999999999949 1 0.79999999999999949 
		7 0.79999999999999949 11 0.79999999999999949 19 0.79999999999999949 33 0.79999999999999949;
createNode animCurveTL -n "elbow_left_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 -0.12347710263611215 1 -0.12347710263611215 
		7 -0.12347710263611215 11 -0.12347710263611215 19 -0.12347710263611215 33 
		-0.12347710263611215;
createNode animCurveTL -n "elbow_left_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 -0.0040600294483823154 1 -0.0040600294483823154 
		7 -0.0040600294483823154 11 -0.0040600294483823154 19 -0.0040600294483823154 
		33 -0.0040600294483823154;
createNode animCurveTA -n "elbow_left_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 1 0 7 0 11 0 19 0 33 0;
createNode animCurveTA -n "elbow_left_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 1 -20 7 -35 11 -30.000000000000028 
		19 -65.000000000000057 33 -20;
createNode animCurveTA -n "elbow_left_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 1 0 7 0 11 0 19 0 33 0;
createNode animCurveTU -n "elbow_left_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 1 1 7 1 11 1 19 1 33 1;
createNode animCurveTU -n "elbow_left_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 1 1 7 1 11 1 19 1 33 1;
createNode animCurveTU -n "elbow_left_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 1 1 7 1 11 1 19 1 33 1;
createNode animCurveTU -n "wrist_left_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 1 1 7 1 11 1 19 1 33 1;
	setAttr -s 6 ".kot[0:5]"  5 5 5 5 5 5;
createNode animCurveTL -n "wrist_left_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0.86000000000000076 1 0.86000000000000076 
		7 0.86000000000000076 11 0.86000000000000076 19 0.86000000000000076 33 0.86000000000000076;
createNode animCurveTL -n "wrist_left_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 -0.076522897363887954 1 -0.076522897363887954 
		7 -0.076522897363887954 11 -0.076522897363887954 19 -0.076522897363887954 
		33 -0.076522897363887954;
createNode animCurveTL -n "wrist_left_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 -0.015939970551617784 1 -0.015939970551617784 
		7 -0.015939970551617784 11 -0.015939970551617784 19 -0.015939970551617784 
		33 -0.015939970551617784;
createNode animCurveTA -n "wrist_left_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 1 0 7 0 11 0 19 0 33 0;
createNode animCurveTA -n "wrist_left_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 1 15.000000000000002 7 15.000000000000002 
		11 -14.999999999999998 19 -25 33 15.000000000000002;
createNode animCurveTA -n "wrist_left_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 1 -25 7 -24.999999999999993 
		11 -24.999999999999989 19 -25.000000000000011 33 -25;
createNode animCurveTU -n "wrist_left_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 1 1 7 1 11 1 19 1 33 1;
createNode animCurveTU -n "wrist_left_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 1 1 7 1 11 1 19 1 33 1;
createNode animCurveTU -n "wrist_left_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 1 1 7 1 11 1 19 1 33 1;
createNode animCurveTU -n "index1_left_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTL -n "index1_left_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.11323075832205953 1 0.11323075832205953 
		33 0.11323075832205953;
createNode animCurveTL -n "index1_left_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.020000000000000011 1 0.020000000000000011 
		33 0.020000000000000011;
createNode animCurveTL -n "index1_left_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.12000000000000025 1 0.12000000000000025 
		33 0.12000000000000025;
createNode animCurveTA -n "index1_left_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 33 0;
createNode animCurveTA -n "index1_left_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 33 0;
createNode animCurveTA -n "index1_left_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 -24.999999999999996 33 -24.999999999999996;
createNode animCurveTU -n "index1_left_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
createNode animCurveTU -n "index1_left_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
createNode animCurveTU -n "index1_left_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
createNode animCurveTU -n "index2_left_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTL -n "index2_left_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.11999999999999961 1 0.11999999999999961 
		33 0.11999999999999961;
createNode animCurveTL -n "index2_left_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.019999999999999078 1 -0.019999999999999078 
		33 -0.019999999999999078;
createNode animCurveTL -n "index2_left_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.0091644057205015374 1 0.0091644057205015374 
		33 0.0091644057205015374;
createNode animCurveTA -n "index2_left_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 33 0;
createNode animCurveTA -n "index2_left_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 33 0;
createNode animCurveTA -n "index2_left_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 -29.999999999999993 33 -29.999999999999993;
createNode animCurveTU -n "index2_left_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
createNode animCurveTU -n "index2_left_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
createNode animCurveTU -n "index2_left_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
createNode animCurveTU -n "fingers1_left_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTL -n "fingers1_left_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.11192155750484498 1 0.11192155750484498 
		33 0.11192155750484498;
createNode animCurveTL -n "fingers1_left_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.039999999999999092 1 0.039999999999999092 
		33 0.039999999999999092;
createNode animCurveTL -n "fingers1_left_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.039999999999999758 1 -0.039999999999999758 
		33 -0.039999999999999758;
createNode animCurveTA -n "fingers1_left_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 33 0;
createNode animCurveTA -n "fingers1_left_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 33 0;
createNode animCurveTA -n "fingers1_left_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 -10.000000000000002 33 -10.000000000000002;
createNode animCurveTU -n "fingers1_left_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
createNode animCurveTU -n "fingers1_left_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
createNode animCurveTU -n "fingers1_left_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
createNode animCurveTU -n "fingers2_left_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTL -n "fingers2_left_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.10000000000000146 1 0.10000000000000146 
		33 0.10000000000000146;
createNode animCurveTL -n "fingers2_left_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.040000000000000022 1 -0.040000000000000022 
		33 -0.040000000000000022;
createNode animCurveTL -n "fingers2_left_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 33 0;
createNode animCurveTA -n "fingers2_left_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 33 0;
createNode animCurveTA -n "fingers2_left_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 33 0;
createNode animCurveTA -n "fingers2_left_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 -34.999999999999993 33 -34.999999999999993;
createNode animCurveTU -n "fingers2_left_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
createNode animCurveTU -n "fingers2_left_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
createNode animCurveTU -n "fingers2_left_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
createNode animCurveTU -n "wrist_right_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 1 1 7 1 11 1 21 1 33 1;
	setAttr -s 6 ".kot[0:5]"  5 5 5 5 5 5;
createNode animCurveTL -n "wrist_right_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 -0.85999999999999954 1 -0.85999999999999954 
		7 -0.85999999999999954 11 -0.85999999999999954 21 -0.85999999999999954 33 
		-0.85999999999999954;
createNode animCurveTL -n "wrist_right_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 -0.076522897363891687 1 -0.076522897363891687 
		7 -0.076522897363891687 11 -0.076522897363891687 21 -0.076522897363891687 
		33 -0.076522897363891687;
createNode animCurveTL -n "wrist_right_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 -0.015940025706791271 1 -0.015940025706791271 
		7 -0.015940025706791271 11 -0.015940025706791271 21 -0.015940025706791271 
		33 -0.015940025706791271;
createNode animCurveTA -n "wrist_right_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 1 0 7 0 11 -9.9771996363888764e-017 
		21 2.1154222475985504e-016 33 0;
createNode animCurveTA -n "wrist_right_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 1 10.000000000000002 7 40.000000000000028 
		11 -5.0000000000000027 21 -20.000000000000007 33 10.000000000000002;
createNode animCurveTA -n "wrist_right_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 1 10 7 10.000000000000009 11 
		10.000000000000007 21 10.000000000000034 33 10;
createNode animCurveTU -n "wrist_right_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 1 1 7 1 11 1 21 1 33 1;
createNode animCurveTU -n "wrist_right_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 1 1 7 1 11 1 21 1 33 1;
createNode animCurveTU -n "wrist_right_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 1 1 7 1 11 1 21 1 33 1;
createNode animCurveTU -n "elbow_right_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 1 1 7 1 11 1 21 1 33 1;
	setAttr -s 6 ".kot[0:5]"  5 5 5 5 5 5;
createNode animCurveTL -n "elbow_right_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 -0.79999999999999927 1 -0.79999999999999927 
		7 -0.79999999999999927 11 -0.79999999999999927 21 -0.79999999999999927 33 
		-0.79999999999999927;
createNode animCurveTL -n "elbow_right_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 -0.12347710263610936 1 -0.12347710263610936 
		7 -0.12347710263610936 11 -0.12347710263610936 21 -0.12347710263610936 33 
		-0.12347710263610936;
createNode animCurveTL -n "elbow_right_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 -0.0040599742932086813 1 -0.0040599742932086813 
		7 -0.0040599742932086813 11 -0.0040599742932086813 21 -0.0040599742932086813 
		33 -0.0040599742932086813;
createNode animCurveTA -n "elbow_right_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 1 0 7 0 11 0 21 0 33 0;
createNode animCurveTA -n "elbow_right_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 1 10.000000000000002 7 55.000000000000014 
		11 35.000000000000028 21 40.000000000000021 33 10.000000000000002;
createNode animCurveTA -n "elbow_right_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 1 0 7 0 11 0 21 0 33 0;
createNode animCurveTU -n "elbow_right_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 1 1 7 1 11 1 21 1 33 1;
createNode animCurveTU -n "elbow_right_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 1 1 7 1 11 1 21 1 33 1;
createNode animCurveTU -n "elbow_right_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 1 1 7 1 11 1 21 1 33 1;
createNode animCurveTU -n "index1_right_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTL -n "index1_right_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.11943980956760031 1 -0.11943980956760031 
		33 -0.11943980956760031;
createNode animCurveTL -n "index1_right_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.020000000000000944 1 0.020000000000000944 
		33 0.020000000000000944;
createNode animCurveTL -n "index1_right_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.11999999999999997 1 0.11999999999999997 
		33 0.11999999999999997;
createNode animCurveTA -n "index1_right_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 33 0;
createNode animCurveTA -n "index1_right_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 33 0;
createNode animCurveTA -n "index1_right_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 20 33 20;
createNode animCurveTU -n "index1_right_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
createNode animCurveTU -n "index1_right_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
createNode animCurveTU -n "index1_right_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
createNode animCurveTU -n "index2_right_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTL -n "index2_right_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.12000000000000054 1 -0.12000000000000054 
		33 -0.12000000000000054;
createNode animCurveTL -n "index2_right_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.020000000000000011 1 -0.020000000000000011 
		33 -0.020000000000000011;
createNode animCurveTL -n "index2_right_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.0098586356517859578 1 0.0098586356517859578 
		33 0.0098586356517859578;
createNode animCurveTA -n "index2_right_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 33 0;
createNode animCurveTA -n "index2_right_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 33 0;
createNode animCurveTA -n "index2_right_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 15.000000000000002 33 15.000000000000002;
createNode animCurveTU -n "index2_right_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
createNode animCurveTU -n "index2_right_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
createNode animCurveTU -n "index2_right_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
createNode animCurveTU -n "fingers1_right_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTL -n "fingers1_right_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.12507331565433455 1 -0.12507331565433455 
		33 -0.12507331565433455;
createNode animCurveTL -n "fingers1_right_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.020000000000000011 1 0.020000000000000011 
		33 0.020000000000000011;
createNode animCurveTL -n "fingers1_right_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.040000000000000049 1 -0.040000000000000049 
		33 -0.040000000000000049;
createNode animCurveTA -n "fingers1_right_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 33 0;
createNode animCurveTA -n "fingers1_right_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 33 0;
createNode animCurveTA -n "fingers1_right_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 10.000000000000002 33 10.000000000000002;
createNode animCurveTU -n "fingers1_right_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
createNode animCurveTU -n "fingers1_right_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
createNode animCurveTU -n "fingers1_right_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
createNode animCurveTU -n "fingers2_right_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTL -n "fingers2_right_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.11999999999999961 1 -0.11999999999999961 
		33 -0.11999999999999961;
createNode animCurveTL -n "fingers2_right_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.020000000000000011 1 -0.020000000000000011 
		33 -0.020000000000000011;
createNode animCurveTL -n "fingers2_right_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -2.9139711932418806e-017 1 -2.9139711932418806e-017 
		33 -2.9139711932418806e-017;
createNode animCurveTA -n "fingers2_right_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 33 0;
createNode animCurveTA -n "fingers2_right_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 33 0;
createNode animCurveTA -n "fingers2_right_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 20 33 20;
createNode animCurveTU -n "fingers2_right_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
createNode animCurveTU -n "fingers2_right_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
createNode animCurveTU -n "fingers2_right_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
createNode animCurveTU -n "thumb1_right_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTL -n "thumb1_right_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.069010449562502796 1 0.069010449562502796 
		33 0.069010449562502796;
createNode animCurveTL -n "thumb1_right_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.039999999999999092 1 -0.039999999999999092 
		33 -0.039999999999999092;
createNode animCurveTL -n "thumb1_right_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.1471832469566326 1 0.1471832469566326 
		33 0.1471832469566326;
createNode animCurveTA -n "thumb1_right_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 33 0;
createNode animCurveTA -n "thumb1_right_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 -10.000000000000002 33 -10.000000000000002;
createNode animCurveTA -n "thumb1_right_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 33 0;
createNode animCurveTU -n "thumb1_right_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
createNode animCurveTU -n "thumb1_right_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
createNode animCurveTU -n "thumb1_right_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
createNode animCurveTU -n "thumb2_right_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTL -n "thumb2_right_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.080000000000000043 1 -0.080000000000000043 
		33 -0.080000000000000043;
createNode animCurveTL -n "thumb2_right_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -0.040000000000000958 1 -0.040000000000000958 
		33 -0.040000000000000958;
createNode animCurveTL -n "thumb2_right_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0.049999999999999989 1 0.049999999999999989 
		33 0.049999999999999989;
createNode animCurveTA -n "thumb2_right_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 33 0;
createNode animCurveTA -n "thumb2_right_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 -10.000000000000002 33 -10.000000000000002;
createNode animCurveTA -n "thumb2_right_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 1 0 33 0;
createNode animCurveTU -n "thumb2_right_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
createNode animCurveTU -n "thumb2_right_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
createNode animCurveTU -n "thumb2_right_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 1 1 33 1;
createNode animCurveTU -n "neck_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 1 1 1 5 1 9 1 17 1 21 1 25 1 
		33 1;
	setAttr -s 8 ".kot[0:7]"  5 5 5 5 5 5 5 
		5;
createNode animCurveTL -n "neck_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 0 1 0 5 0 9 0 17 0 21 0 25 0 
		33 0;
createNode animCurveTL -n "neck_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 0.59623258667176238 1 0.59623258667176238 
		5 0.59623258667176238 9 0.59623258667176238 17 0.59623258667176238 21 0.59623258667176238 
		25 0.59623258667176238 33 0.59623258667176238;
createNode animCurveTL -n "neck_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 -0.04640081758375398 1 -0.04640081758375398 
		5 -0.04640081758375398 9 -0.04640081758375398 17 -0.04640081758375398 21 
		-0.04640081758375398 25 -0.04640081758375398 33 -0.04640081758375398;
createNode animCurveTA -n "neck_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 0 1 0 5 0 9 0 17 0 21 0 25 0 
		33 0;
createNode animCurveTA -n "neck_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 0 1 0 5 0 9 0 17 -5 21 0 25 0 
		33 0;
createNode animCurveTA -n "neck_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 0 1 0 5 -5 9 -5 17 0 21 -5 25 
		-5 33 0;
createNode animCurveTU -n "neck_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 1 1 1 5 1 9 1 17 1 21 1 25 1 
		33 1;
createNode animCurveTU -n "neck_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 1 1 1 5 1 9 1 17 1 21 1 25 1 
		33 1;
createNode animCurveTU -n "neck_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 1 1 1 5 1 9 1 17 1 21 1 25 1 
		33 1;
createNode animCurveTU -n "clavicle_right_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr ".kot[0]"  5;
createNode animCurveTL -n "clavicle_right_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -0.351779;
createNode animCurveTL -n "clavicle_right_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.11999806049912637;
createNode animCurveTL -n "clavicle_right_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -0.22269284329054523;
createNode animCurveTA -n "clavicle_right_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "clavicle_right_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "clavicle_right_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTU -n "clavicle_right_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "clavicle_right_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "clavicle_right_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "clavicle_left_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr ".kot[0]"  5;
createNode animCurveTL -n "clavicle_left_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.35177907163942695;
createNode animCurveTL -n "clavicle_left_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.12000000000000006;
createNode animCurveTL -n "clavicle_left_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -0.2226933059692667;
createNode animCurveTA -n "clavicle_left_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "clavicle_left_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "clavicle_left_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTU -n "clavicle_left_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "clavicle_left_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "clavicle_left_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "head_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr ".kot[0]"  5;
createNode animCurveTL -n "head_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTL -n "head_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.099999999999998188;
createNode animCurveTL -n "head_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.08;
createNode animCurveTA -n "head_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "head_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "head_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTU -n "head_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "head_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "head_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "toe_left_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr ".kot[0]"  5;
createNode animCurveTL -n "toe_left_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTL -n "toe_left_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -5.8279423864837613e-017;
createNode animCurveTL -n "toe_left_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.40000044097228582;
createNode animCurveTA -n "toe_left_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "toe_left_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "toe_left_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTU -n "toe_left_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "toe_left_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "toe_left_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "toe_right_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr ".kot[0]"  5;
createNode animCurveTL -n "toe_right_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -5.8279423864837613e-017;
createNode animCurveTL -n "toe_right_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 4.3709567898628207e-017;
createNode animCurveTL -n "toe_right_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.40000000000000002;
createNode animCurveTA -n "toe_right_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "toe_right_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "toe_right_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTU -n "toe_right_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "toe_right_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "toe_right_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "head_end_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr ".kot[0]"  5;
createNode animCurveTL -n "head_end_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTL -n "head_end_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.60000000000000031;
createNode animCurveTL -n "head_end_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -0.01999999999999999;
createNode animCurveTA -n "head_end_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "head_end_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "head_end_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTU -n "head_end_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "head_end_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "head_end_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "hand_right_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr ".kot[0]"  5;
createNode animCurveTL -n "hand_right_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -0.14000000000000007;
createNode animCurveTL -n "hand_right_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.020000000000001874;
createNode animCurveTL -n "hand_right_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1.4569855966209403e-017;
createNode animCurveTA -n "hand_right_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "hand_right_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "hand_right_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTU -n "hand_right_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "hand_right_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "hand_right_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "hand_left_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr ".kot[0]"  5;
createNode animCurveTL -n "hand_left_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.14000000000000007;
createNode animCurveTL -n "hand_left_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.020000000000001874;
createNode animCurveTL -n "hand_left_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -1.4569855966209403e-017;
createNode animCurveTA -n "hand_left_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "hand_left_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "hand_left_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTU -n "hand_left_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "hand_left_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "hand_left_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "thumb1_left_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr ".kot[0]"  5;
createNode animCurveTL -n "thumb1_left_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -0.070696844129584255;
createNode animCurveTL -n "thumb1_left_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -0.040000000000000958;
createNode animCurveTL -n "thumb1_left_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.14000000000000026;
createNode animCurveTA -n "thumb1_left_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "thumb1_left_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "thumb1_left_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTU -n "thumb1_left_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "thumb1_left_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "thumb1_left_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "thumb2_left_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr ".kot[0]"  5;
createNode animCurveTL -n "thumb2_left_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.060000000000000032;
createNode animCurveTL -n "thumb2_left_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -0.019999999999999078;
createNode animCurveTL -n "thumb2_left_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.059999999999999991;
createNode animCurveTA -n "thumb2_left_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "thumb2_left_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "thumb2_left_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTU -n "thumb2_left_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "thumb2_left_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "thumb2_left_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "index_end_right_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr ".kot[0]"  5;
createNode animCurveTL -n "index_end_right_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -0.12000000000000006;
createNode animCurveTL -n "index_end_right_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -0.040000000000001888;
createNode animCurveTL -n "index_end_right_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.012958117391581297;
createNode animCurveTA -n "index_end_right_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "index_end_right_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "index_end_right_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTU -n "index_end_right_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "index_end_right_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "index_end_right_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "thumb_end_right_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr ".kot[0]"  5;
createNode animCurveTL -n "thumb_end_right_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -0.13104999999999964;
createNode animCurveTL -n "thumb_end_right_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -0.040000000000000022;
createNode animCurveTL -n "thumb_end_right_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.048385999999999985;
createNode animCurveTA -n "thumb_end_right_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "thumb_end_right_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "thumb_end_right_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTU -n "thumb_end_right_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "thumb_end_right_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "thumb_end_right_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "fingers_end_right_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr ".kot[0]"  5;
createNode animCurveTL -n "fingers_end_right_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -0.11999999999999961;
createNode animCurveTL -n "fingers_end_right_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -0.040000000000000022;
createNode animCurveTL -n "fingers_end_right_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "fingers_end_right_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "fingers_end_right_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "fingers_end_right_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTU -n "fingers_end_right_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "fingers_end_right_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "fingers_end_right_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "index_end_left_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr ".kot[0]"  5;
createNode animCurveTL -n "index_end_left_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.11999999999999961;
createNode animCurveTL -n "index_end_left_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -0.020000000000000011;
createNode animCurveTL -n "index_end_left_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.010835594279498477;
createNode animCurveTA -n "index_end_left_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "index_end_left_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "index_end_left_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTU -n "index_end_left_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "index_end_left_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "index_end_left_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "thumb_end_left_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr ".kot[0]"  5;
createNode animCurveTL -n "thumb_end_left_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.16000000000000009;
createNode animCurveTL -n "thumb_end_left_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -0.077122502655991562;
createNode animCurveTL -n "thumb_end_left_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.039999999999999994;
createNode animCurveTA -n "thumb_end_left_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "thumb_end_left_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "thumb_end_left_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTU -n "thumb_end_left_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "thumb_end_left_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "thumb_end_left_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "fingers_end_left_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr ".kot[0]"  5;
createNode animCurveTL -n "fingers_end_left_translateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.13999999999999821;
createNode animCurveTL -n "fingers_end_left_translateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -0.040000000000000022;
createNode animCurveTL -n "fingers_end_left_translateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -2.9139711932418806e-017;
createNode animCurveTA -n "fingers_end_left_rotateX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "fingers_end_left_rotateY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "fingers_end_left_rotateZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTU -n "fingers_end_left_scaleX";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "fingers_end_left_scaleY";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "fingers_end_left_scaleZ";
	setAttr ".tan" 3;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
select -ne :time1;
	setAttr ".o" 1;
select -ne :renderPartition;
	setAttr -s 3 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 3 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
select -ne :lightList1;
select -ne :defaultTextureList1;
select -ne :initialShadingGroup;
	setAttr -k on ".nds";
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultRenderGlobals;
	setAttr ".top" 767;
	setAttr ".rght" 1023;
	setAttr ".fs" 1;
	setAttr ".ef" 10;
	setAttr -l on ".bfs";
select -ne :defaultRenderQuality;
	setAttr ".rfl" 10;
	setAttr ".rfr" 10;
	setAttr ".sl" 10;
	setAttr ".eaa" 0;
	setAttr ".ufil" yes;
	setAttr ".ss" 2;
select -ne :defaultResolution;
	setAttr ".w" 1024;
	setAttr ".h" 768;
	setAttr ".dar" 1.3329999446868896;
	setAttr ".ldar" yes;
select -ne :ikSystem;
	setAttr -s 3 ".sol";
connectAttr "god_joint_scaleX.o" "god_joint.sx";
connectAttr "god_joint_scaleY.o" "god_joint.sy";
connectAttr "god_joint_scaleZ.o" "god_joint.sz";
connectAttr "god_joint_visibility.o" "god_joint.v";
connectAttr "god_joint_translateX.o" "god_joint.tx";
connectAttr "god_joint_translateY.o" "god_joint.ty";
connectAttr "god_joint_translateZ.o" "god_joint.tz";
connectAttr "god_joint_rotateX.o" "god_joint.rx";
connectAttr "god_joint_rotateY.o" "god_joint.ry";
connectAttr "god_joint_rotateZ.o" "god_joint.rz";
connectAttr "god_joint.s" "spine_1.is";
connectAttr "spine_1_scaleX.o" "spine_1.sx";
connectAttr "spine_1_scaleY.o" "spine_1.sy";
connectAttr "spine_1_scaleZ.o" "spine_1.sz";
connectAttr "spine_1_visibility.o" "spine_1.v";
connectAttr "spine_1_translateX.o" "spine_1.tx";
connectAttr "spine_1_translateY.o" "spine_1.ty";
connectAttr "spine_1_translateZ.o" "spine_1.tz";
connectAttr "spine_1_rotateX.o" "spine_1.rx";
connectAttr "spine_1_rotateY.o" "spine_1.ry";
connectAttr "spine_1_rotateZ.o" "spine_1.rz";
connectAttr "spine_1.s" "spine_2.is";
connectAttr "spine_2_scaleX.o" "spine_2.sx";
connectAttr "spine_2_scaleY.o" "spine_2.sy";
connectAttr "spine_2_scaleZ.o" "spine_2.sz";
connectAttr "spine_2_visibility.o" "spine_2.v";
connectAttr "spine_2_translateX.o" "spine_2.tx";
connectAttr "spine_2_translateY.o" "spine_2.ty";
connectAttr "spine_2_translateZ.o" "spine_2.tz";
connectAttr "spine_2_rotateX.o" "spine_2.rx";
connectAttr "spine_2_rotateY.o" "spine_2.ry";
connectAttr "spine_2_rotateZ.o" "spine_2.rz";
connectAttr "spine_2.s" "|god_joint|spine_1|spine_2|chest.is";
connectAttr "chest_scaleX.o" "|god_joint|spine_1|spine_2|chest.sx";
connectAttr "chest_scaleY.o" "|god_joint|spine_1|spine_2|chest.sy";
connectAttr "chest_scaleZ.o" "|god_joint|spine_1|spine_2|chest.sz";
connectAttr "chest_visibility.o" "|god_joint|spine_1|spine_2|chest.v";
connectAttr "chest_translateX.o" "|god_joint|spine_1|spine_2|chest.tx";
connectAttr "chest_translateY.o" "|god_joint|spine_1|spine_2|chest.ty";
connectAttr "chest_translateZ.o" "|god_joint|spine_1|spine_2|chest.tz";
connectAttr "chest_rotateX.o" "|god_joint|spine_1|spine_2|chest.rx";
connectAttr "chest_rotateY.o" "|god_joint|spine_1|spine_2|chest.ry";
connectAttr "chest_rotateZ.o" "|god_joint|spine_1|spine_2|chest.rz";
connectAttr "|god_joint|spine_1|spine_2|chest.s" "neck.is";
connectAttr "neck_scaleX.o" "neck.sx";
connectAttr "neck_scaleY.o" "neck.sy";
connectAttr "neck_scaleZ.o" "neck.sz";
connectAttr "neck_visibility.o" "neck.v";
connectAttr "neck_translateX.o" "neck.tx";
connectAttr "neck_translateY.o" "neck.ty";
connectAttr "neck_translateZ.o" "neck.tz";
connectAttr "neck_rotateX.o" "neck.rx";
connectAttr "neck_rotateY.o" "neck.ry";
connectAttr "neck_rotateZ.o" "neck.rz";
connectAttr "neck.s" "|god_joint|spine_1|spine_2|chest|neck|head.is";
connectAttr "head_scaleX.o" "|god_joint|spine_1|spine_2|chest|neck|head.sx"
		;
connectAttr "head_scaleY.o" "|god_joint|spine_1|spine_2|chest|neck|head.sy"
		;
connectAttr "head_scaleZ.o" "|god_joint|spine_1|spine_2|chest|neck|head.sz"
		;
connectAttr "head_visibility.o" "|god_joint|spine_1|spine_2|chest|neck|head.v"
		;
connectAttr "head_translateX.o" "|god_joint|spine_1|spine_2|chest|neck|head.tx"
		;
connectAttr "head_translateY.o" "|god_joint|spine_1|spine_2|chest|neck|head.ty"
		;
connectAttr "head_translateZ.o" "|god_joint|spine_1|spine_2|chest|neck|head.tz"
		;
connectAttr "head_rotateX.o" "|god_joint|spine_1|spine_2|chest|neck|head.rx"
		;
connectAttr "head_rotateY.o" "|god_joint|spine_1|spine_2|chest|neck|head.ry"
		;
connectAttr "head_rotateZ.o" "|god_joint|spine_1|spine_2|chest|neck|head.rz"
		;
connectAttr "head_end_translateZ.o" "head_end.tz";
connectAttr "head_end_translateX.o" "head_end.tx";
connectAttr "head_end_translateY.o" "head_end.ty";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.s" "head_end.is"
		;
connectAttr "head_end_visibility.o" "head_end.v";
connectAttr "head_end_rotateX.o" "head_end.rx";
connectAttr "head_end_rotateY.o" "head_end.ry";
connectAttr "head_end_rotateZ.o" "head_end.rz";
connectAttr "head_end_scaleX.o" "head_end.sx";
connectAttr "head_end_scaleY.o" "head_end.sy";
connectAttr "head_end_scaleZ.o" "head_end.sz";
connectAttr "|god_joint|spine_1|spine_2|chest.s" "clavicle_right.is";
connectAttr "clavicle_right_scaleX.o" "clavicle_right.sx";
connectAttr "clavicle_right_scaleY.o" "clavicle_right.sy";
connectAttr "clavicle_right_scaleZ.o" "clavicle_right.sz";
connectAttr "clavicle_right_visibility.o" "clavicle_right.v";
connectAttr "clavicle_right_translateX.o" "clavicle_right.tx";
connectAttr "clavicle_right_translateY.o" "clavicle_right.ty";
connectAttr "clavicle_right_translateZ.o" "clavicle_right.tz";
connectAttr "clavicle_right_rotateX.o" "clavicle_right.rx";
connectAttr "clavicle_right_rotateY.o" "clavicle_right.ry";
connectAttr "clavicle_right_rotateZ.o" "clavicle_right.rz";
connectAttr "clavicle_right.s" "shoulder_right.is";
connectAttr "shoulder_right_scaleX.o" "shoulder_right.sx";
connectAttr "shoulder_right_scaleY.o" "shoulder_right.sy";
connectAttr "shoulder_right_scaleZ.o" "shoulder_right.sz";
connectAttr "shoulder_right_visibility.o" "shoulder_right.v";
connectAttr "shoulder_right_translateX.o" "shoulder_right.tx";
connectAttr "shoulder_right_translateY.o" "shoulder_right.ty";
connectAttr "shoulder_right_translateZ.o" "shoulder_right.tz";
connectAttr "shoulder_right_rotateX.o" "shoulder_right.rx";
connectAttr "shoulder_right_rotateY.o" "shoulder_right.ry";
connectAttr "shoulder_right_rotateZ.o" "shoulder_right.rz";
connectAttr "shoulder_right.s" "elbow_right.is";
connectAttr "elbow_right_scaleX.o" "elbow_right.sx";
connectAttr "elbow_right_scaleY.o" "elbow_right.sy";
connectAttr "elbow_right_scaleZ.o" "elbow_right.sz";
connectAttr "elbow_right_visibility.o" "elbow_right.v";
connectAttr "elbow_right_translateX.o" "elbow_right.tx";
connectAttr "elbow_right_translateY.o" "elbow_right.ty";
connectAttr "elbow_right_translateZ.o" "elbow_right.tz";
connectAttr "elbow_right_rotateX.o" "elbow_right.rx";
connectAttr "elbow_right_rotateY.o" "elbow_right.ry";
connectAttr "elbow_right_rotateZ.o" "elbow_right.rz";
connectAttr "elbow_right.s" "wrist_right.is";
connectAttr "wrist_right_scaleX.o" "wrist_right.sx";
connectAttr "wrist_right_scaleY.o" "wrist_right.sy";
connectAttr "wrist_right_scaleZ.o" "wrist_right.sz";
connectAttr "wrist_right_visibility.o" "wrist_right.v";
connectAttr "wrist_right_translateX.o" "wrist_right.tx";
connectAttr "wrist_right_translateY.o" "wrist_right.ty";
connectAttr "wrist_right_translateZ.o" "wrist_right.tz";
connectAttr "wrist_right_rotateX.o" "wrist_right.rx";
connectAttr "wrist_right_rotateY.o" "wrist_right.ry";
connectAttr "wrist_right_rotateZ.o" "wrist_right.rz";
connectAttr "hand_right_translateX.o" "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.tx"
		;
connectAttr "hand_right_translateY.o" "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.ty"
		;
connectAttr "hand_right_translateZ.o" "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.tz"
		;
connectAttr "wrist_right.s" "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.is"
		;
connectAttr "hand_right_scaleX.o" "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.sx"
		;
connectAttr "hand_right_scaleY.o" "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.sy"
		;
connectAttr "hand_right_scaleZ.o" "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.sz"
		;
connectAttr "hand_right_visibility.o" "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.v"
		;
connectAttr "hand_right_rotateX.o" "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.rx"
		;
connectAttr "hand_right_rotateY.o" "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.ry"
		;
connectAttr "hand_right_rotateZ.o" "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.rz"
		;
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.s" "index1_right.is"
		;
connectAttr "index1_right_scaleX.o" "index1_right.sx";
connectAttr "index1_right_scaleY.o" "index1_right.sy";
connectAttr "index1_right_scaleZ.o" "index1_right.sz";
connectAttr "index1_right_visibility.o" "index1_right.v";
connectAttr "index1_right_translateX.o" "index1_right.tx";
connectAttr "index1_right_translateY.o" "index1_right.ty";
connectAttr "index1_right_translateZ.o" "index1_right.tz";
connectAttr "index1_right_rotateX.o" "index1_right.rx";
connectAttr "index1_right_rotateY.o" "index1_right.ry";
connectAttr "index1_right_rotateZ.o" "index1_right.rz";
connectAttr "index1_right.s" "index2_right.is";
connectAttr "index2_right_scaleX.o" "index2_right.sx";
connectAttr "index2_right_scaleY.o" "index2_right.sy";
connectAttr "index2_right_scaleZ.o" "index2_right.sz";
connectAttr "index2_right_visibility.o" "index2_right.v";
connectAttr "index2_right_translateX.o" "index2_right.tx";
connectAttr "index2_right_translateY.o" "index2_right.ty";
connectAttr "index2_right_translateZ.o" "index2_right.tz";
connectAttr "index2_right_rotateX.o" "index2_right.rx";
connectAttr "index2_right_rotateY.o" "index2_right.ry";
connectAttr "index2_right_rotateZ.o" "index2_right.rz";
connectAttr "index2_right.s" "index_end_right.is";
connectAttr "index_end_right_visibility.o" "index_end_right.v";
connectAttr "index_end_right_translateX.o" "index_end_right.tx";
connectAttr "index_end_right_translateY.o" "index_end_right.ty";
connectAttr "index_end_right_translateZ.o" "index_end_right.tz";
connectAttr "index_end_right_rotateX.o" "index_end_right.rx";
connectAttr "index_end_right_rotateY.o" "index_end_right.ry";
connectAttr "index_end_right_rotateZ.o" "index_end_right.rz";
connectAttr "index_end_right_scaleX.o" "index_end_right.sx";
connectAttr "index_end_right_scaleY.o" "index_end_right.sy";
connectAttr "index_end_right_scaleZ.o" "index_end_right.sz";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.s" "thumb1_right.is"
		;
connectAttr "thumb1_right_scaleX.o" "thumb1_right.sx";
connectAttr "thumb1_right_scaleY.o" "thumb1_right.sy";
connectAttr "thumb1_right_scaleZ.o" "thumb1_right.sz";
connectAttr "thumb1_right_visibility.o" "thumb1_right.v";
connectAttr "thumb1_right_translateX.o" "thumb1_right.tx";
connectAttr "thumb1_right_translateY.o" "thumb1_right.ty";
connectAttr "thumb1_right_translateZ.o" "thumb1_right.tz";
connectAttr "thumb1_right_rotateX.o" "thumb1_right.rx";
connectAttr "thumb1_right_rotateY.o" "thumb1_right.ry";
connectAttr "thumb1_right_rotateZ.o" "thumb1_right.rz";
connectAttr "thumb1_right.s" "thumb2_right.is";
connectAttr "thumb2_right_scaleX.o" "thumb2_right.sx";
connectAttr "thumb2_right_scaleY.o" "thumb2_right.sy";
connectAttr "thumb2_right_scaleZ.o" "thumb2_right.sz";
connectAttr "thumb2_right_visibility.o" "thumb2_right.v";
connectAttr "thumb2_right_translateX.o" "thumb2_right.tx";
connectAttr "thumb2_right_translateY.o" "thumb2_right.ty";
connectAttr "thumb2_right_translateZ.o" "thumb2_right.tz";
connectAttr "thumb2_right_rotateX.o" "thumb2_right.rx";
connectAttr "thumb2_right_rotateY.o" "thumb2_right.ry";
connectAttr "thumb2_right_rotateZ.o" "thumb2_right.rz";
connectAttr "thumb_end_right_translateY.o" "thumb_end_right.ty";
connectAttr "thumb_end_right_translateZ.o" "thumb_end_right.tz";
connectAttr "thumb_end_right_translateX.o" "thumb_end_right.tx";
connectAttr "thumb2_right.s" "thumb_end_right.is";
connectAttr "thumb_end_right_visibility.o" "thumb_end_right.v";
connectAttr "thumb_end_right_rotateX.o" "thumb_end_right.rx";
connectAttr "thumb_end_right_rotateY.o" "thumb_end_right.ry";
connectAttr "thumb_end_right_rotateZ.o" "thumb_end_right.rz";
connectAttr "thumb_end_right_scaleX.o" "thumb_end_right.sx";
connectAttr "thumb_end_right_scaleY.o" "thumb_end_right.sy";
connectAttr "thumb_end_right_scaleZ.o" "thumb_end_right.sz";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.s" "fingers1_right.is"
		;
connectAttr "fingers1_right_scaleX.o" "fingers1_right.sx";
connectAttr "fingers1_right_scaleY.o" "fingers1_right.sy";
connectAttr "fingers1_right_scaleZ.o" "fingers1_right.sz";
connectAttr "fingers1_right_visibility.o" "fingers1_right.v";
connectAttr "fingers1_right_translateX.o" "fingers1_right.tx";
connectAttr "fingers1_right_translateY.o" "fingers1_right.ty";
connectAttr "fingers1_right_translateZ.o" "fingers1_right.tz";
connectAttr "fingers1_right_rotateX.o" "fingers1_right.rx";
connectAttr "fingers1_right_rotateY.o" "fingers1_right.ry";
connectAttr "fingers1_right_rotateZ.o" "fingers1_right.rz";
connectAttr "fingers1_right.s" "fingers2_right.is";
connectAttr "fingers2_right_scaleX.o" "fingers2_right.sx";
connectAttr "fingers2_right_scaleY.o" "fingers2_right.sy";
connectAttr "fingers2_right_scaleZ.o" "fingers2_right.sz";
connectAttr "fingers2_right_visibility.o" "fingers2_right.v";
connectAttr "fingers2_right_translateX.o" "fingers2_right.tx";
connectAttr "fingers2_right_translateY.o" "fingers2_right.ty";
connectAttr "fingers2_right_translateZ.o" "fingers2_right.tz";
connectAttr "fingers2_right_rotateX.o" "fingers2_right.rx";
connectAttr "fingers2_right_rotateY.o" "fingers2_right.ry";
connectAttr "fingers2_right_rotateZ.o" "fingers2_right.rz";
connectAttr "fingers_end_right_translateX.o" "fingers_end_right.tx";
connectAttr "fingers_end_right_translateY.o" "fingers_end_right.ty";
connectAttr "fingers_end_right_translateZ.o" "fingers_end_right.tz";
connectAttr "fingers2_right.s" "fingers_end_right.is";
connectAttr "fingers_end_right_visibility.o" "fingers_end_right.v";
connectAttr "fingers_end_right_rotateX.o" "fingers_end_right.rx";
connectAttr "fingers_end_right_rotateY.o" "fingers_end_right.ry";
connectAttr "fingers_end_right_rotateZ.o" "fingers_end_right.rz";
connectAttr "fingers_end_right_scaleX.o" "fingers_end_right.sx";
connectAttr "fingers_end_right_scaleY.o" "fingers_end_right.sy";
connectAttr "fingers_end_right_scaleZ.o" "fingers_end_right.sz";
connectAttr "|god_joint|spine_1|spine_2|chest.s" "clavicle_left.is";
connectAttr "clavicle_left_scaleX.o" "clavicle_left.sx";
connectAttr "clavicle_left_scaleY.o" "clavicle_left.sy";
connectAttr "clavicle_left_scaleZ.o" "clavicle_left.sz";
connectAttr "clavicle_left_visibility.o" "clavicle_left.v";
connectAttr "clavicle_left_translateX.o" "clavicle_left.tx";
connectAttr "clavicle_left_translateY.o" "clavicle_left.ty";
connectAttr "clavicle_left_translateZ.o" "clavicle_left.tz";
connectAttr "clavicle_left_rotateX.o" "clavicle_left.rx";
connectAttr "clavicle_left_rotateY.o" "clavicle_left.ry";
connectAttr "clavicle_left_rotateZ.o" "clavicle_left.rz";
connectAttr "clavicle_left.s" "shoulder_left.is";
connectAttr "shoulder_left_scaleX.o" "shoulder_left.sx";
connectAttr "shoulder_left_scaleY.o" "shoulder_left.sy";
connectAttr "shoulder_left_scaleZ.o" "shoulder_left.sz";
connectAttr "shoulder_left_visibility.o" "shoulder_left.v";
connectAttr "shoulder_left_translateX.o" "shoulder_left.tx";
connectAttr "shoulder_left_translateY.o" "shoulder_left.ty";
connectAttr "shoulder_left_translateZ.o" "shoulder_left.tz";
connectAttr "shoulder_left_rotateX.o" "shoulder_left.rx";
connectAttr "shoulder_left_rotateY.o" "shoulder_left.ry";
connectAttr "shoulder_left_rotateZ.o" "shoulder_left.rz";
connectAttr "shoulder_left.s" "elbow_left.is";
connectAttr "elbow_left_scaleX.o" "elbow_left.sx";
connectAttr "elbow_left_scaleY.o" "elbow_left.sy";
connectAttr "elbow_left_scaleZ.o" "elbow_left.sz";
connectAttr "elbow_left_visibility.o" "elbow_left.v";
connectAttr "elbow_left_translateX.o" "elbow_left.tx";
connectAttr "elbow_left_translateY.o" "elbow_left.ty";
connectAttr "elbow_left_translateZ.o" "elbow_left.tz";
connectAttr "elbow_left_rotateX.o" "elbow_left.rx";
connectAttr "elbow_left_rotateY.o" "elbow_left.ry";
connectAttr "elbow_left_rotateZ.o" "elbow_left.rz";
connectAttr "elbow_left.s" "wrist_left.is";
connectAttr "wrist_left_scaleX.o" "wrist_left.sx";
connectAttr "wrist_left_scaleY.o" "wrist_left.sy";
connectAttr "wrist_left_scaleZ.o" "wrist_left.sz";
connectAttr "wrist_left_visibility.o" "wrist_left.v";
connectAttr "wrist_left_translateX.o" "wrist_left.tx";
connectAttr "wrist_left_translateY.o" "wrist_left.ty";
connectAttr "wrist_left_translateZ.o" "wrist_left.tz";
connectAttr "wrist_left_rotateX.o" "wrist_left.rx";
connectAttr "wrist_left_rotateY.o" "wrist_left.ry";
connectAttr "wrist_left_rotateZ.o" "wrist_left.rz";
connectAttr "hand_left_translateX.o" "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.tx"
		;
connectAttr "hand_left_translateY.o" "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.ty"
		;
connectAttr "hand_left_translateZ.o" "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.tz"
		;
connectAttr "wrist_left.s" "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.is"
		;
connectAttr "hand_left_scaleX.o" "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.sx"
		;
connectAttr "hand_left_scaleY.o" "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.sy"
		;
connectAttr "hand_left_scaleZ.o" "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.sz"
		;
connectAttr "hand_left_visibility.o" "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.v"
		;
connectAttr "hand_left_rotateX.o" "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.rx"
		;
connectAttr "hand_left_rotateY.o" "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.ry"
		;
connectAttr "hand_left_rotateZ.o" "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.rz"
		;
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.s" "index1_left.is"
		;
connectAttr "index1_left_scaleX.o" "index1_left.sx";
connectAttr "index1_left_scaleY.o" "index1_left.sy";
connectAttr "index1_left_scaleZ.o" "index1_left.sz";
connectAttr "index1_left_visibility.o" "index1_left.v";
connectAttr "index1_left_translateX.o" "index1_left.tx";
connectAttr "index1_left_translateY.o" "index1_left.ty";
connectAttr "index1_left_translateZ.o" "index1_left.tz";
connectAttr "index1_left_rotateX.o" "index1_left.rx";
connectAttr "index1_left_rotateY.o" "index1_left.ry";
connectAttr "index1_left_rotateZ.o" "index1_left.rz";
connectAttr "index1_left.s" "index2_left.is";
connectAttr "index2_left_scaleX.o" "index2_left.sx";
connectAttr "index2_left_scaleY.o" "index2_left.sy";
connectAttr "index2_left_scaleZ.o" "index2_left.sz";
connectAttr "index2_left_visibility.o" "index2_left.v";
connectAttr "index2_left_translateX.o" "index2_left.tx";
connectAttr "index2_left_translateY.o" "index2_left.ty";
connectAttr "index2_left_translateZ.o" "index2_left.tz";
connectAttr "index2_left_rotateX.o" "index2_left.rx";
connectAttr "index2_left_rotateY.o" "index2_left.ry";
connectAttr "index2_left_rotateZ.o" "index2_left.rz";
connectAttr "index2_left.s" "index_end_left.is";
connectAttr "index_end_left_visibility.o" "index_end_left.v";
connectAttr "index_end_left_translateX.o" "index_end_left.tx";
connectAttr "index_end_left_translateY.o" "index_end_left.ty";
connectAttr "index_end_left_translateZ.o" "index_end_left.tz";
connectAttr "index_end_left_rotateX.o" "index_end_left.rx";
connectAttr "index_end_left_rotateY.o" "index_end_left.ry";
connectAttr "index_end_left_rotateZ.o" "index_end_left.rz";
connectAttr "index_end_left_scaleX.o" "index_end_left.sx";
connectAttr "index_end_left_scaleY.o" "index_end_left.sy";
connectAttr "index_end_left_scaleZ.o" "index_end_left.sz";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.s" "thumb1_left.is"
		;
connectAttr "thumb1_left_scaleX.o" "thumb1_left.sx";
connectAttr "thumb1_left_scaleY.o" "thumb1_left.sy";
connectAttr "thumb1_left_scaleZ.o" "thumb1_left.sz";
connectAttr "thumb1_left_visibility.o" "thumb1_left.v";
connectAttr "thumb1_left_translateX.o" "thumb1_left.tx";
connectAttr "thumb1_left_translateY.o" "thumb1_left.ty";
connectAttr "thumb1_left_translateZ.o" "thumb1_left.tz";
connectAttr "thumb1_left_rotateX.o" "thumb1_left.rx";
connectAttr "thumb1_left_rotateY.o" "thumb1_left.ry";
connectAttr "thumb1_left_rotateZ.o" "thumb1_left.rz";
connectAttr "thumb1_left.s" "thumb2_left.is";
connectAttr "thumb2_left_scaleX.o" "thumb2_left.sx";
connectAttr "thumb2_left_scaleY.o" "thumb2_left.sy";
connectAttr "thumb2_left_scaleZ.o" "thumb2_left.sz";
connectAttr "thumb2_left_visibility.o" "thumb2_left.v";
connectAttr "thumb2_left_translateX.o" "thumb2_left.tx";
connectAttr "thumb2_left_translateY.o" "thumb2_left.ty";
connectAttr "thumb2_left_translateZ.o" "thumb2_left.tz";
connectAttr "thumb2_left_rotateX.o" "thumb2_left.rx";
connectAttr "thumb2_left_rotateY.o" "thumb2_left.ry";
connectAttr "thumb2_left_rotateZ.o" "thumb2_left.rz";
connectAttr "thumb_end_left_translateX.o" "thumb_end_left.tx";
connectAttr "thumb_end_left_translateY.o" "thumb_end_left.ty";
connectAttr "thumb_end_left_translateZ.o" "thumb_end_left.tz";
connectAttr "thumb2_left.s" "thumb_end_left.is";
connectAttr "thumb_end_left_visibility.o" "thumb_end_left.v";
connectAttr "thumb_end_left_rotateX.o" "thumb_end_left.rx";
connectAttr "thumb_end_left_rotateY.o" "thumb_end_left.ry";
connectAttr "thumb_end_left_rotateZ.o" "thumb_end_left.rz";
connectAttr "thumb_end_left_scaleX.o" "thumb_end_left.sx";
connectAttr "thumb_end_left_scaleY.o" "thumb_end_left.sy";
connectAttr "thumb_end_left_scaleZ.o" "thumb_end_left.sz";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.s" "fingers1_left.is"
		;
connectAttr "fingers1_left_scaleX.o" "fingers1_left.sx";
connectAttr "fingers1_left_scaleY.o" "fingers1_left.sy";
connectAttr "fingers1_left_scaleZ.o" "fingers1_left.sz";
connectAttr "fingers1_left_visibility.o" "fingers1_left.v";
connectAttr "fingers1_left_translateX.o" "fingers1_left.tx";
connectAttr "fingers1_left_translateY.o" "fingers1_left.ty";
connectAttr "fingers1_left_translateZ.o" "fingers1_left.tz";
connectAttr "fingers1_left_rotateX.o" "fingers1_left.rx";
connectAttr "fingers1_left_rotateY.o" "fingers1_left.ry";
connectAttr "fingers1_left_rotateZ.o" "fingers1_left.rz";
connectAttr "fingers1_left.s" "fingers2_left.is";
connectAttr "fingers2_left_scaleX.o" "fingers2_left.sx";
connectAttr "fingers2_left_scaleY.o" "fingers2_left.sy";
connectAttr "fingers2_left_scaleZ.o" "fingers2_left.sz";
connectAttr "fingers2_left_visibility.o" "fingers2_left.v";
connectAttr "fingers2_left_translateX.o" "fingers2_left.tx";
connectAttr "fingers2_left_translateY.o" "fingers2_left.ty";
connectAttr "fingers2_left_translateZ.o" "fingers2_left.tz";
connectAttr "fingers2_left_rotateX.o" "fingers2_left.rx";
connectAttr "fingers2_left_rotateY.o" "fingers2_left.ry";
connectAttr "fingers2_left_rotateZ.o" "fingers2_left.rz";
connectAttr "fingers2_left.s" "fingers_end_left.is";
connectAttr "fingers_end_left_visibility.o" "fingers_end_left.v";
connectAttr "fingers_end_left_translateX.o" "fingers_end_left.tx";
connectAttr "fingers_end_left_translateY.o" "fingers_end_left.ty";
connectAttr "fingers_end_left_translateZ.o" "fingers_end_left.tz";
connectAttr "fingers_end_left_rotateX.o" "fingers_end_left.rx";
connectAttr "fingers_end_left_rotateY.o" "fingers_end_left.ry";
connectAttr "fingers_end_left_rotateZ.o" "fingers_end_left.rz";
connectAttr "fingers_end_left_scaleX.o" "fingers_end_left.sx";
connectAttr "fingers_end_left_scaleY.o" "fingers_end_left.sy";
connectAttr "fingers_end_left_scaleZ.o" "fingers_end_left.sz";
connectAttr "god_joint.s" "hip_left.is";
connectAttr "hip_left_scaleX.o" "hip_left.sx";
connectAttr "hip_left_scaleY.o" "hip_left.sy";
connectAttr "hip_left_scaleZ.o" "hip_left.sz";
connectAttr "hip_left_visibility.o" "hip_left.v";
connectAttr "hip_left_translateX.o" "hip_left.tx";
connectAttr "hip_left_translateY.o" "hip_left.ty";
connectAttr "hip_left_translateZ.o" "hip_left.tz";
connectAttr "hip_left_rotateX.o" "hip_left.rx";
connectAttr "hip_left_rotateY.o" "hip_left.ry";
connectAttr "hip_left_rotateZ.o" "hip_left.rz";
connectAttr "hip_left.s" "knee_left.is";
connectAttr "knee_left_scaleX.o" "knee_left.sx";
connectAttr "knee_left_scaleY.o" "knee_left.sy";
connectAttr "knee_left_scaleZ.o" "knee_left.sz";
connectAttr "knee_left_visibility.o" "knee_left.v";
connectAttr "knee_left_translateX.o" "knee_left.tx";
connectAttr "knee_left_translateY.o" "knee_left.ty";
connectAttr "knee_left_translateZ.o" "knee_left.tz";
connectAttr "knee_left_rotateX.o" "knee_left.rx";
connectAttr "knee_left_rotateY.o" "knee_left.ry";
connectAttr "knee_left_rotateZ.o" "knee_left.rz";
connectAttr "knee_left.s" "ankle_left.is";
connectAttr "ankle_left_scaleX.o" "ankle_left.sx";
connectAttr "ankle_left_scaleY.o" "ankle_left.sy";
connectAttr "ankle_left_scaleZ.o" "ankle_left.sz";
connectAttr "ankle_left_visibility.o" "ankle_left.v";
connectAttr "ankle_left_translateX.o" "ankle_left.tx";
connectAttr "ankle_left_translateY.o" "ankle_left.ty";
connectAttr "ankle_left_translateZ.o" "ankle_left.tz";
connectAttr "ankle_left_rotateX.o" "ankle_left.rx";
connectAttr "ankle_left_rotateY.o" "ankle_left.ry";
connectAttr "ankle_left_rotateZ.o" "ankle_left.rz";
connectAttr "ankle_left.s" "|god_joint|hip_left|knee_left|ankle_left|foot_left.is"
		;
connectAttr "foot_left_scaleX.o" "|god_joint|hip_left|knee_left|ankle_left|foot_left.sx"
		;
connectAttr "foot_left_scaleY.o" "|god_joint|hip_left|knee_left|ankle_left|foot_left.sy"
		;
connectAttr "foot_left_scaleZ.o" "|god_joint|hip_left|knee_left|ankle_left|foot_left.sz"
		;
connectAttr "foot_left_visibility.o" "|god_joint|hip_left|knee_left|ankle_left|foot_left.v"
		;
connectAttr "foot_left_translateX.o" "|god_joint|hip_left|knee_left|ankle_left|foot_left.tx"
		;
connectAttr "foot_left_translateY.o" "|god_joint|hip_left|knee_left|ankle_left|foot_left.ty"
		;
connectAttr "foot_left_translateZ.o" "|god_joint|hip_left|knee_left|ankle_left|foot_left.tz"
		;
connectAttr "foot_left_rotateX.o" "|god_joint|hip_left|knee_left|ankle_left|foot_left.rx"
		;
connectAttr "foot_left_rotateY.o" "|god_joint|hip_left|knee_left|ankle_left|foot_left.ry"
		;
connectAttr "foot_left_rotateZ.o" "|god_joint|hip_left|knee_left|ankle_left|foot_left.rz"
		;
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.s" "toe_left.is"
		;
connectAttr "toe_left_visibility.o" "toe_left.v";
connectAttr "toe_left_translateX.o" "toe_left.tx";
connectAttr "toe_left_translateY.o" "toe_left.ty";
connectAttr "toe_left_translateZ.o" "toe_left.tz";
connectAttr "toe_left_rotateX.o" "toe_left.rx";
connectAttr "toe_left_rotateY.o" "toe_left.ry";
connectAttr "toe_left_rotateZ.o" "toe_left.rz";
connectAttr "toe_left_scaleX.o" "toe_left.sx";
connectAttr "toe_left_scaleY.o" "toe_left.sy";
connectAttr "toe_left_scaleZ.o" "toe_left.sz";
connectAttr "god_joint.s" "hip_right.is";
connectAttr "hip_right_scaleX.o" "hip_right.sx";
connectAttr "hip_right_scaleY.o" "hip_right.sy";
connectAttr "hip_right_scaleZ.o" "hip_right.sz";
connectAttr "hip_right_visibility.o" "hip_right.v";
connectAttr "hip_right_translateX.o" "hip_right.tx";
connectAttr "hip_right_translateY.o" "hip_right.ty";
connectAttr "hip_right_translateZ.o" "hip_right.tz";
connectAttr "hip_right_rotateX.o" "hip_right.rx";
connectAttr "hip_right_rotateY.o" "hip_right.ry";
connectAttr "hip_right_rotateZ.o" "hip_right.rz";
connectAttr "hip_right.s" "knee_right.is";
connectAttr "knee_right_scaleX.o" "knee_right.sx";
connectAttr "knee_right_scaleY.o" "knee_right.sy";
connectAttr "knee_right_scaleZ.o" "knee_right.sz";
connectAttr "knee_right_visibility.o" "knee_right.v";
connectAttr "knee_right_translateX.o" "knee_right.tx";
connectAttr "knee_right_translateY.o" "knee_right.ty";
connectAttr "knee_right_translateZ.o" "knee_right.tz";
connectAttr "knee_right_rotateX.o" "knee_right.rx";
connectAttr "knee_right_rotateY.o" "knee_right.ry";
connectAttr "knee_right_rotateZ.o" "knee_right.rz";
connectAttr "knee_right.s" "ankle_right.is";
connectAttr "ankle_right_scaleX.o" "ankle_right.sx";
connectAttr "ankle_right_scaleY.o" "ankle_right.sy";
connectAttr "ankle_right_scaleZ.o" "ankle_right.sz";
connectAttr "ankle_right_visibility.o" "ankle_right.v";
connectAttr "ankle_right_translateX.o" "ankle_right.tx";
connectAttr "ankle_right_translateY.o" "ankle_right.ty";
connectAttr "ankle_right_translateZ.o" "ankle_right.tz";
connectAttr "ankle_right_rotateX.o" "ankle_right.rx";
connectAttr "ankle_right_rotateY.o" "ankle_right.ry";
connectAttr "ankle_right_rotateZ.o" "ankle_right.rz";
connectAttr "ankle_right.s" "|god_joint|hip_right|knee_right|ankle_right|foot_right.is"
		;
connectAttr "foot_right_scaleX.o" "|god_joint|hip_right|knee_right|ankle_right|foot_right.sx"
		;
connectAttr "foot_right_scaleY.o" "|god_joint|hip_right|knee_right|ankle_right|foot_right.sy"
		;
connectAttr "foot_right_scaleZ.o" "|god_joint|hip_right|knee_right|ankle_right|foot_right.sz"
		;
connectAttr "foot_right_visibility.o" "|god_joint|hip_right|knee_right|ankle_right|foot_right.v"
		;
connectAttr "foot_right_translateX.o" "|god_joint|hip_right|knee_right|ankle_right|foot_right.tx"
		;
connectAttr "foot_right_translateY.o" "|god_joint|hip_right|knee_right|ankle_right|foot_right.ty"
		;
connectAttr "foot_right_translateZ.o" "|god_joint|hip_right|knee_right|ankle_right|foot_right.tz"
		;
connectAttr "foot_right_rotateX.o" "|god_joint|hip_right|knee_right|ankle_right|foot_right.rx"
		;
connectAttr "foot_right_rotateY.o" "|god_joint|hip_right|knee_right|ankle_right|foot_right.ry"
		;
connectAttr "foot_right_rotateZ.o" "|god_joint|hip_right|knee_right|ankle_right|foot_right.rz"
		;
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.s" "toe_right.is"
		;
connectAttr "toe_right_visibility.o" "toe_right.v";
connectAttr "toe_right_translateX.o" "toe_right.tx";
connectAttr "toe_right_translateY.o" "toe_right.ty";
connectAttr "toe_right_translateZ.o" "toe_right.tz";
connectAttr "toe_right_rotateX.o" "toe_right.rx";
connectAttr "toe_right_rotateY.o" "toe_right.ry";
connectAttr "toe_right_rotateZ.o" "toe_right.rz";
connectAttr "toe_right_scaleX.o" "toe_right.sx";
connectAttr "toe_right_scaleY.o" "toe_right.sy";
connectAttr "toe_right_scaleZ.o" "toe_right.sz";
connectAttr "groupId162.id" "foot_leftShape.iog.og[3].gid";
connectAttr "lambert2SG.mwc" "foot_leftShape.iog.og[3].gco";
connectAttr "skinCluster1GroupId.id" "foot_leftShape.iog.og[4].gid";
connectAttr "skinCluster1Set.mwc" "foot_leftShape.iog.og[4].gco";
connectAttr "groupId164.id" "foot_leftShape.iog.og[5].gid";
connectAttr "tweakSet1.mwc" "foot_leftShape.iog.og[5].gco";
connectAttr "skinCluster1.og[0]" "foot_leftShape.i";
connectAttr "tweak1.vl[0].vt[0]" "foot_leftShape.twl";
connectAttr "groupId165.id" "foot_rightShape.iog.og[6].gid";
connectAttr "lambert2SG.mwc" "foot_rightShape.iog.og[6].gco";
connectAttr "skinCluster2GroupId.id" "foot_rightShape.iog.og[7].gid";
connectAttr "skinCluster2Set.mwc" "foot_rightShape.iog.og[7].gco";
connectAttr "groupId167.id" "foot_rightShape.iog.og[8].gid";
connectAttr "tweakSet2.mwc" "foot_rightShape.iog.og[8].gco";
connectAttr "skinCluster2.og[0]" "foot_rightShape.i";
connectAttr "tweak2.vl[0].vt[0]" "foot_rightShape.twl";
connectAttr "groupId168.id" "midsectionShape.iog.og[3].gid";
connectAttr "lambert2SG.mwc" "midsectionShape.iog.og[3].gco";
connectAttr "skinCluster3GroupId.id" "midsectionShape.iog.og[4].gid";
connectAttr "skinCluster3Set.mwc" "midsectionShape.iog.og[4].gco";
connectAttr "groupId170.id" "midsectionShape.iog.og[5].gid";
connectAttr "tweakSet3.mwc" "midsectionShape.iog.og[5].gco";
connectAttr "skinCluster3.og[0]" "midsectionShape.i";
connectAttr "tweak3.vl[0].vt[0]" "midsectionShape.twl";
connectAttr "groupId171.id" "chestShape.iog.og[3].gid";
connectAttr "lambert2SG.mwc" "chestShape.iog.og[3].gco";
connectAttr "skinCluster4GroupId.id" "chestShape.iog.og[4].gid";
connectAttr "skinCluster4Set.mwc" "chestShape.iog.og[4].gco";
connectAttr "groupId173.id" "chestShape.iog.og[5].gid";
connectAttr "tweakSet4.mwc" "chestShape.iog.og[5].gco";
connectAttr "skinCluster4.og[0]" "chestShape.i";
connectAttr "tweak4.vl[0].vt[0]" "chestShape.twl";
connectAttr "groupId174.id" "leg_leftShape.iog.og[3].gid";
connectAttr "lambert2SG.mwc" "leg_leftShape.iog.og[3].gco";
connectAttr "skinCluster5GroupId.id" "leg_leftShape.iog.og[4].gid";
connectAttr "skinCluster5Set.mwc" "leg_leftShape.iog.og[4].gco";
connectAttr "groupId176.id" "leg_leftShape.iog.og[5].gid";
connectAttr "tweakSet5.mwc" "leg_leftShape.iog.og[5].gco";
connectAttr "skinCluster5.og[0]" "leg_leftShape.i";
connectAttr "tweak5.vl[0].vt[0]" "leg_leftShape.twl";
connectAttr "groupId177.id" "leg_rightShape.iog.og[3].gid";
connectAttr "lambert2SG.mwc" "leg_rightShape.iog.og[3].gco";
connectAttr "skinCluster6GroupId.id" "leg_rightShape.iog.og[4].gid";
connectAttr "skinCluster6Set.mwc" "leg_rightShape.iog.og[4].gco";
connectAttr "groupId179.id" "leg_rightShape.iog.og[5].gid";
connectAttr "tweakSet6.mwc" "leg_rightShape.iog.og[5].gco";
connectAttr "skinCluster6.og[0]" "leg_rightShape.i";
connectAttr "tweak6.vl[0].vt[0]" "leg_rightShape.twl";
connectAttr "groupId180.id" "upperarm_leftShape.iog.og[3].gid";
connectAttr "lambert2SG.mwc" "upperarm_leftShape.iog.og[3].gco";
connectAttr "skinCluster7GroupId.id" "upperarm_leftShape.iog.og[4].gid";
connectAttr "skinCluster7Set.mwc" "upperarm_leftShape.iog.og[4].gco";
connectAttr "groupId182.id" "upperarm_leftShape.iog.og[5].gid";
connectAttr "tweakSet7.mwc" "upperarm_leftShape.iog.og[5].gco";
connectAttr "skinCluster7.og[0]" "upperarm_leftShape.i";
connectAttr "tweak7.vl[0].vt[0]" "upperarm_leftShape.twl";
connectAttr "groupId183.id" "lowerarm_leftShape.iog.og[3].gid";
connectAttr "lambert2SG.mwc" "lowerarm_leftShape.iog.og[3].gco";
connectAttr "skinCluster8GroupId.id" "lowerarm_leftShape.iog.og[4].gid";
connectAttr "skinCluster8Set.mwc" "lowerarm_leftShape.iog.og[4].gco";
connectAttr "groupId185.id" "lowerarm_leftShape.iog.og[5].gid";
connectAttr "tweakSet8.mwc" "lowerarm_leftShape.iog.og[5].gco";
connectAttr "skinCluster8.og[0]" "lowerarm_leftShape.i";
connectAttr "tweak8.vl[0].vt[0]" "lowerarm_leftShape.twl";
connectAttr "groupId186.id" "upperarm_rightShape.iog.og[5].gid";
connectAttr "lambert2SG.mwc" "upperarm_rightShape.iog.og[5].gco";
connectAttr "skinCluster9GroupId.id" "upperarm_rightShape.iog.og[6].gid"
		;
connectAttr "skinCluster9Set.mwc" "upperarm_rightShape.iog.og[6].gco";
connectAttr "groupId188.id" "upperarm_rightShape.iog.og[7].gid";
connectAttr "tweakSet9.mwc" "upperarm_rightShape.iog.og[7].gco";
connectAttr "skinCluster9.og[0]" "upperarm_rightShape.i";
connectAttr "tweak9.vl[0].vt[0]" "upperarm_rightShape.twl";
connectAttr "groupId189.id" "lowerarm_rightShape.iog.og[5].gid";
connectAttr "lambert2SG.mwc" "lowerarm_rightShape.iog.og[5].gco";
connectAttr "skinCluster10GroupId.id" "lowerarm_rightShape.iog.og[6].gid"
		;
connectAttr "skinCluster10Set.mwc" "lowerarm_rightShape.iog.og[6].gco";
connectAttr "groupId191.id" "lowerarm_rightShape.iog.og[7].gid";
connectAttr "tweakSet10.mwc" "lowerarm_rightShape.iog.og[7].gco";
connectAttr "skinCluster10.og[0]" "lowerarm_rightShape.i";
connectAttr "tweak10.vl[0].vt[0]" "lowerarm_rightShape.twl";
connectAttr "groupId192.id" "headShape.iog.og[3].gid";
connectAttr "lambert2SG.mwc" "headShape.iog.og[3].gco";
connectAttr "skinCluster11GroupId.id" "headShape.iog.og[4].gid";
connectAttr "skinCluster11Set.mwc" "headShape.iog.og[4].gco";
connectAttr "groupId194.id" "headShape.iog.og[5].gid";
connectAttr "tweakSet11.mwc" "headShape.iog.og[5].gco";
connectAttr "skinCluster11.og[0]" "headShape.i";
connectAttr "tweak11.vl[0].vt[0]" "headShape.twl";
connectAttr "groupId195.id" "thumb_leftShape.iog.og[3].gid";
connectAttr "lambert2SG.mwc" "thumb_leftShape.iog.og[3].gco";
connectAttr "skinCluster12GroupId.id" "thumb_leftShape.iog.og[4].gid";
connectAttr "skinCluster12Set.mwc" "thumb_leftShape.iog.og[4].gco";
connectAttr "groupId197.id" "thumb_leftShape.iog.og[5].gid";
connectAttr "tweakSet12.mwc" "thumb_leftShape.iog.og[5].gco";
connectAttr "skinCluster12.og[0]" "thumb_leftShape.i";
connectAttr "tweak12.vl[0].vt[0]" "thumb_leftShape.twl";
connectAttr "groupId198.id" "index_leftShape.iog.og[3].gid";
connectAttr "lambert2SG.mwc" "index_leftShape.iog.og[3].gco";
connectAttr "skinCluster13GroupId.id" "index_leftShape.iog.og[4].gid";
connectAttr "skinCluster13Set.mwc" "index_leftShape.iog.og[4].gco";
connectAttr "groupId200.id" "index_leftShape.iog.og[5].gid";
connectAttr "tweakSet13.mwc" "index_leftShape.iog.og[5].gco";
connectAttr "skinCluster13.og[0]" "index_leftShape.i";
connectAttr "tweak13.vl[0].vt[0]" "index_leftShape.twl";
connectAttr "groupId201.id" "hand_leftShape.iog.og[3].gid";
connectAttr "lambert2SG.mwc" "hand_leftShape.iog.og[3].gco";
connectAttr "skinCluster14GroupId.id" "hand_leftShape.iog.og[4].gid";
connectAttr "skinCluster14Set.mwc" "hand_leftShape.iog.og[4].gco";
connectAttr "groupId203.id" "hand_leftShape.iog.og[5].gid";
connectAttr "tweakSet14.mwc" "hand_leftShape.iog.og[5].gco";
connectAttr "skinCluster14.og[0]" "hand_leftShape.i";
connectAttr "tweak14.vl[0].vt[0]" "hand_leftShape.twl";
connectAttr "groupId204.id" "fingers_leftShape.iog.og[3].gid";
connectAttr "lambert2SG.mwc" "fingers_leftShape.iog.og[3].gco";
connectAttr "skinCluster15GroupId.id" "fingers_leftShape.iog.og[4].gid";
connectAttr "skinCluster15Set.mwc" "fingers_leftShape.iog.og[4].gco";
connectAttr "groupId206.id" "fingers_leftShape.iog.og[5].gid";
connectAttr "tweakSet15.mwc" "fingers_leftShape.iog.og[5].gco";
connectAttr "skinCluster15.og[0]" "fingers_leftShape.i";
connectAttr "tweak15.vl[0].vt[0]" "fingers_leftShape.twl";
connectAttr "groupId207.id" "thumb_rightShape.iog.og[3].gid";
connectAttr "lambert2SG.mwc" "thumb_rightShape.iog.og[3].gco";
connectAttr "skinCluster16GroupId.id" "thumb_rightShape.iog.og[4].gid";
connectAttr "skinCluster16Set.mwc" "thumb_rightShape.iog.og[4].gco";
connectAttr "groupId209.id" "thumb_rightShape.iog.og[5].gid";
connectAttr "tweakSet16.mwc" "thumb_rightShape.iog.og[5].gco";
connectAttr "skinCluster16.og[0]" "thumb_rightShape.i";
connectAttr "tweak16.vl[0].vt[0]" "thumb_rightShape.twl";
connectAttr "groupId210.id" "index_rightShape.iog.og[3].gid";
connectAttr "lambert2SG.mwc" "index_rightShape.iog.og[3].gco";
connectAttr "skinCluster17GroupId.id" "index_rightShape.iog.og[4].gid";
connectAttr "skinCluster17Set.mwc" "index_rightShape.iog.og[4].gco";
connectAttr "groupId212.id" "index_rightShape.iog.og[5].gid";
connectAttr "tweakSet17.mwc" "index_rightShape.iog.og[5].gco";
connectAttr "skinCluster17.og[0]" "index_rightShape.i";
connectAttr "tweak17.vl[0].vt[0]" "index_rightShape.twl";
connectAttr "groupId213.id" "hand_rightShape.iog.og[3].gid";
connectAttr "lambert2SG.mwc" "hand_rightShape.iog.og[3].gco";
connectAttr "skinCluster18GroupId.id" "hand_rightShape.iog.og[4].gid";
connectAttr "skinCluster18Set.mwc" "hand_rightShape.iog.og[4].gco";
connectAttr "groupId215.id" "hand_rightShape.iog.og[5].gid";
connectAttr "tweakSet18.mwc" "hand_rightShape.iog.og[5].gco";
connectAttr "skinCluster18.og[0]" "hand_rightShape.i";
connectAttr "tweak18.vl[0].vt[0]" "hand_rightShape.twl";
connectAttr "groupId216.id" "fingers_rightShape.iog.og[3].gid";
connectAttr "lambert2SG.mwc" "fingers_rightShape.iog.og[3].gco";
connectAttr "skinCluster19GroupId.id" "fingers_rightShape.iog.og[4].gid"
		;
connectAttr "skinCluster19Set.mwc" "fingers_rightShape.iog.og[4].gco";
connectAttr "groupId218.id" "fingers_rightShape.iog.og[5].gid";
connectAttr "tweakSet19.mwc" "fingers_rightShape.iog.og[5].gco";
connectAttr "skinCluster19.og[0]" "fingers_rightShape.i";
connectAttr "tweak19.vl[0].vt[0]" "fingers_rightShape.twl";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[0].llnk";
connectAttr ":initialShadingGroup.msg" "lightLinker1.lnk[0].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[1].llnk";
connectAttr ":initialParticleSE.msg" "lightLinker1.lnk[1].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[2].llnk";
connectAttr "lambert2SG.msg" "lightLinker1.lnk[2].olnk";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "file1.oc" "itguy_mat.c";
connectAttr "itguy_mat.oc" "lambert2SG.ss";
connectAttr "foot_leftShape.iog.og[3]" "lambert2SG.dsm" -na;
connectAttr "foot_rightShape.iog.og[6]" "lambert2SG.dsm" -na;
connectAttr "midsectionShape.iog.og[3]" "lambert2SG.dsm" -na;
connectAttr "chestShape.iog.og[3]" "lambert2SG.dsm" -na;
connectAttr "leg_leftShape.iog.og[3]" "lambert2SG.dsm" -na;
connectAttr "leg_rightShape.iog.og[3]" "lambert2SG.dsm" -na;
connectAttr "upperarm_leftShape.iog.og[3]" "lambert2SG.dsm" -na;
connectAttr "lowerarm_leftShape.iog.og[3]" "lambert2SG.dsm" -na;
connectAttr "upperarm_rightShape.iog.og[5]" "lambert2SG.dsm" -na;
connectAttr "lowerarm_rightShape.iog.og[5]" "lambert2SG.dsm" -na;
connectAttr "headShape.iog.og[3]" "lambert2SG.dsm" -na;
connectAttr "thumb_leftShape.iog.og[3]" "lambert2SG.dsm" -na;
connectAttr "index_leftShape.iog.og[3]" "lambert2SG.dsm" -na;
connectAttr "hand_leftShape.iog.og[3]" "lambert2SG.dsm" -na;
connectAttr "fingers_leftShape.iog.og[3]" "lambert2SG.dsm" -na;
connectAttr "thumb_rightShape.iog.og[3]" "lambert2SG.dsm" -na;
connectAttr "index_rightShape.iog.og[3]" "lambert2SG.dsm" -na;
connectAttr "hand_rightShape.iog.og[3]" "lambert2SG.dsm" -na;
connectAttr "fingers_rightShape.iog.og[3]" "lambert2SG.dsm" -na;
connectAttr "groupId162.msg" "lambert2SG.gn" -na;
connectAttr "groupId165.msg" "lambert2SG.gn" -na;
connectAttr "groupId168.msg" "lambert2SG.gn" -na;
connectAttr "groupId171.msg" "lambert2SG.gn" -na;
connectAttr "groupId174.msg" "lambert2SG.gn" -na;
connectAttr "groupId177.msg" "lambert2SG.gn" -na;
connectAttr "groupId180.msg" "lambert2SG.gn" -na;
connectAttr "groupId183.msg" "lambert2SG.gn" -na;
connectAttr "groupId186.msg" "lambert2SG.gn" -na;
connectAttr "groupId189.msg" "lambert2SG.gn" -na;
connectAttr "groupId192.msg" "lambert2SG.gn" -na;
connectAttr "groupId195.msg" "lambert2SG.gn" -na;
connectAttr "groupId198.msg" "lambert2SG.gn" -na;
connectAttr "groupId201.msg" "lambert2SG.gn" -na;
connectAttr "groupId204.msg" "lambert2SG.gn" -na;
connectAttr "groupId207.msg" "lambert2SG.gn" -na;
connectAttr "groupId210.msg" "lambert2SG.gn" -na;
connectAttr "groupId213.msg" "lambert2SG.gn" -na;
connectAttr "groupId216.msg" "lambert2SG.gn" -na;
connectAttr "lambert2SG.msg" "materialInfo1.sg";
connectAttr "place2dTexture1.c" "file1.c";
connectAttr "place2dTexture1.tf" "file1.tf";
connectAttr "place2dTexture1.rf" "file1.rf";
connectAttr "place2dTexture1.mu" "file1.mu";
connectAttr "place2dTexture1.mv" "file1.mv";
connectAttr "place2dTexture1.s" "file1.s";
connectAttr "place2dTexture1.wu" "file1.wu";
connectAttr "place2dTexture1.wv" "file1.wv";
connectAttr "place2dTexture1.re" "file1.re";
connectAttr "place2dTexture1.of" "file1.of";
connectAttr "place2dTexture1.r" "file1.ro";
connectAttr "place2dTexture1.n" "file1.n";
connectAttr "place2dTexture1.vt1" "file1.vt1";
connectAttr "place2dTexture1.vt2" "file1.vt2";
connectAttr "place2dTexture1.vt3" "file1.vt3";
connectAttr "place2dTexture1.vc1" "file1.vc1";
connectAttr "place2dTexture1.o" "file1.uv";
connectAttr "place2dTexture1.ofs" "file1.fs";
connectAttr "skinCluster1GroupParts.og" "skinCluster1.ip[0].ig";
connectAttr "skinCluster1GroupId.id" "skinCluster1.ip[0].gi";
connectAttr "god_joint.wm" "skinCluster1.ma[0]";
connectAttr "spine_1.wm" "skinCluster1.ma[1]";
connectAttr "spine_2.wm" "skinCluster1.ma[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.wm" "skinCluster1.ma[3]";
connectAttr "neck.wm" "skinCluster1.ma[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.wm" "skinCluster1.ma[5]"
		;
connectAttr "head_end.wm" "skinCluster1.ma[6]";
connectAttr "clavicle_right.wm" "skinCluster1.ma[7]";
connectAttr "shoulder_right.wm" "skinCluster1.ma[8]";
connectAttr "elbow_right.wm" "skinCluster1.ma[9]";
connectAttr "wrist_right.wm" "skinCluster1.ma[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.wm" "skinCluster1.ma[11]"
		;
connectAttr "index1_right.wm" "skinCluster1.ma[12]";
connectAttr "index2_right.wm" "skinCluster1.ma[13]";
connectAttr "index_end_right.wm" "skinCluster1.ma[14]";
connectAttr "thumb1_right.wm" "skinCluster1.ma[15]";
connectAttr "thumb2_right.wm" "skinCluster1.ma[16]";
connectAttr "thumb_end_right.wm" "skinCluster1.ma[17]";
connectAttr "fingers1_right.wm" "skinCluster1.ma[18]";
connectAttr "fingers2_right.wm" "skinCluster1.ma[19]";
connectAttr "fingers_end_right.wm" "skinCluster1.ma[20]";
connectAttr "clavicle_left.wm" "skinCluster1.ma[21]";
connectAttr "shoulder_left.wm" "skinCluster1.ma[22]";
connectAttr "elbow_left.wm" "skinCluster1.ma[23]";
connectAttr "wrist_left.wm" "skinCluster1.ma[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.wm" "skinCluster1.ma[25]"
		;
connectAttr "index1_left.wm" "skinCluster1.ma[26]";
connectAttr "index2_left.wm" "skinCluster1.ma[27]";
connectAttr "index_end_left.wm" "skinCluster1.ma[28]";
connectAttr "thumb1_left.wm" "skinCluster1.ma[29]";
connectAttr "thumb2_left.wm" "skinCluster1.ma[30]";
connectAttr "thumb_end_left.wm" "skinCluster1.ma[31]";
connectAttr "fingers1_left.wm" "skinCluster1.ma[32]";
connectAttr "fingers2_left.wm" "skinCluster1.ma[33]";
connectAttr "fingers_end_left.wm" "skinCluster1.ma[34]";
connectAttr "hip_left.wm" "skinCluster1.ma[35]";
connectAttr "knee_left.wm" "skinCluster1.ma[36]";
connectAttr "ankle_left.wm" "skinCluster1.ma[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.wm" "skinCluster1.ma[38]"
		;
connectAttr "toe_left.wm" "skinCluster1.ma[39]";
connectAttr "hip_right.wm" "skinCluster1.ma[40]";
connectAttr "knee_right.wm" "skinCluster1.ma[41]";
connectAttr "ankle_right.wm" "skinCluster1.ma[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.wm" "skinCluster1.ma[43]"
		;
connectAttr "toe_right.wm" "skinCluster1.ma[44]";
connectAttr "god_joint.liw" "skinCluster1.lw[0]";
connectAttr "spine_1.liw" "skinCluster1.lw[1]";
connectAttr "spine_2.liw" "skinCluster1.lw[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.liw" "skinCluster1.lw[3]";
connectAttr "neck.liw" "skinCluster1.lw[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.liw" "skinCluster1.lw[5]"
		;
connectAttr "head_end.liw" "skinCluster1.lw[6]";
connectAttr "clavicle_right.liw" "skinCluster1.lw[7]";
connectAttr "shoulder_right.liw" "skinCluster1.lw[8]";
connectAttr "elbow_right.liw" "skinCluster1.lw[9]";
connectAttr "wrist_right.liw" "skinCluster1.lw[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.liw" "skinCluster1.lw[11]"
		;
connectAttr "index1_right.liw" "skinCluster1.lw[12]";
connectAttr "index2_right.liw" "skinCluster1.lw[13]";
connectAttr "index_end_right.liw" "skinCluster1.lw[14]";
connectAttr "thumb1_right.liw" "skinCluster1.lw[15]";
connectAttr "thumb2_right.liw" "skinCluster1.lw[16]";
connectAttr "thumb_end_right.liw" "skinCluster1.lw[17]";
connectAttr "fingers1_right.liw" "skinCluster1.lw[18]";
connectAttr "fingers2_right.liw" "skinCluster1.lw[19]";
connectAttr "fingers_end_right.liw" "skinCluster1.lw[20]";
connectAttr "clavicle_left.liw" "skinCluster1.lw[21]";
connectAttr "shoulder_left.liw" "skinCluster1.lw[22]";
connectAttr "elbow_left.liw" "skinCluster1.lw[23]";
connectAttr "wrist_left.liw" "skinCluster1.lw[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.liw" "skinCluster1.lw[25]"
		;
connectAttr "index1_left.liw" "skinCluster1.lw[26]";
connectAttr "index2_left.liw" "skinCluster1.lw[27]";
connectAttr "index_end_left.liw" "skinCluster1.lw[28]";
connectAttr "thumb1_left.liw" "skinCluster1.lw[29]";
connectAttr "thumb2_left.liw" "skinCluster1.lw[30]";
connectAttr "thumb_end_left.liw" "skinCluster1.lw[31]";
connectAttr "fingers1_left.liw" "skinCluster1.lw[32]";
connectAttr "fingers2_left.liw" "skinCluster1.lw[33]";
connectAttr "fingers_end_left.liw" "skinCluster1.lw[34]";
connectAttr "hip_left.liw" "skinCluster1.lw[35]";
connectAttr "knee_left.liw" "skinCluster1.lw[36]";
connectAttr "ankle_left.liw" "skinCluster1.lw[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.liw" "skinCluster1.lw[38]"
		;
connectAttr "toe_left.liw" "skinCluster1.lw[39]";
connectAttr "hip_right.liw" "skinCluster1.lw[40]";
connectAttr "knee_right.liw" "skinCluster1.lw[41]";
connectAttr "ankle_right.liw" "skinCluster1.lw[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.liw" "skinCluster1.lw[43]"
		;
connectAttr "toe_right.liw" "skinCluster1.lw[44]";
connectAttr "foot_leftShapeOrig.w" "groupParts1.ig";
connectAttr "groupId162.id" "groupParts1.gi";
connectAttr "groupParts3.og" "tweak1.ip[0].ig";
connectAttr "groupId164.id" "tweak1.ip[0].gi";
connectAttr "skinCluster1GroupId.msg" "skinCluster1Set.gn" -na;
connectAttr "foot_leftShape.iog.og[4]" "skinCluster1Set.dsm" -na;
connectAttr "skinCluster1.msg" "skinCluster1Set.ub[0]";
connectAttr "tweak1.og[0]" "skinCluster1GroupParts.ig";
connectAttr "skinCluster1GroupId.id" "skinCluster1GroupParts.gi";
connectAttr "groupId164.msg" "tweakSet1.gn" -na;
connectAttr "foot_leftShape.iog.og[5]" "tweakSet1.dsm" -na;
connectAttr "tweak1.msg" "tweakSet1.ub[0]";
connectAttr "groupParts1.og" "groupParts3.ig";
connectAttr "groupId164.id" "groupParts3.gi";
connectAttr "god_joint.msg" "bindPose1.m[0]";
connectAttr "spine_1.msg" "bindPose1.m[1]";
connectAttr "spine_2.msg" "bindPose1.m[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.msg" "bindPose1.m[3]";
connectAttr "neck.msg" "bindPose1.m[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.msg" "bindPose1.m[5]"
		;
connectAttr "head_end.msg" "bindPose1.m[6]";
connectAttr "clavicle_right.msg" "bindPose1.m[7]";
connectAttr "shoulder_right.msg" "bindPose1.m[8]";
connectAttr "elbow_right.msg" "bindPose1.m[9]";
connectAttr "wrist_right.msg" "bindPose1.m[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.msg" "bindPose1.m[11]"
		;
connectAttr "index1_right.msg" "bindPose1.m[12]";
connectAttr "index2_right.msg" "bindPose1.m[13]";
connectAttr "index_end_right.msg" "bindPose1.m[14]";
connectAttr "thumb1_right.msg" "bindPose1.m[15]";
connectAttr "thumb2_right.msg" "bindPose1.m[16]";
connectAttr "thumb_end_right.msg" "bindPose1.m[17]";
connectAttr "fingers1_right.msg" "bindPose1.m[18]";
connectAttr "fingers2_right.msg" "bindPose1.m[19]";
connectAttr "fingers_end_right.msg" "bindPose1.m[20]";
connectAttr "clavicle_left.msg" "bindPose1.m[21]";
connectAttr "shoulder_left.msg" "bindPose1.m[22]";
connectAttr "elbow_left.msg" "bindPose1.m[23]";
connectAttr "wrist_left.msg" "bindPose1.m[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.msg" "bindPose1.m[25]"
		;
connectAttr "index1_left.msg" "bindPose1.m[26]";
connectAttr "index2_left.msg" "bindPose1.m[27]";
connectAttr "index_end_left.msg" "bindPose1.m[28]";
connectAttr "thumb1_left.msg" "bindPose1.m[29]";
connectAttr "thumb2_left.msg" "bindPose1.m[30]";
connectAttr "thumb_end_left.msg" "bindPose1.m[31]";
connectAttr "fingers1_left.msg" "bindPose1.m[32]";
connectAttr "fingers2_left.msg" "bindPose1.m[33]";
connectAttr "fingers_end_left.msg" "bindPose1.m[34]";
connectAttr "hip_left.msg" "bindPose1.m[35]";
connectAttr "knee_left.msg" "bindPose1.m[36]";
connectAttr "ankle_left.msg" "bindPose1.m[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.msg" "bindPose1.m[38]"
		;
connectAttr "toe_left.msg" "bindPose1.m[39]";
connectAttr "hip_right.msg" "bindPose1.m[40]";
connectAttr "knee_right.msg" "bindPose1.m[41]";
connectAttr "ankle_right.msg" "bindPose1.m[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.msg" "bindPose1.m[43]"
		;
connectAttr "toe_right.msg" "bindPose1.m[44]";
connectAttr "bindPose1.w" "bindPose1.p[0]";
connectAttr "bindPose1.m[0]" "bindPose1.p[1]";
connectAttr "bindPose1.m[1]" "bindPose1.p[2]";
connectAttr "bindPose1.m[2]" "bindPose1.p[3]";
connectAttr "bindPose1.m[3]" "bindPose1.p[4]";
connectAttr "bindPose1.m[4]" "bindPose1.p[5]";
connectAttr "bindPose1.m[5]" "bindPose1.p[6]";
connectAttr "bindPose1.m[3]" "bindPose1.p[7]";
connectAttr "bindPose1.m[7]" "bindPose1.p[8]";
connectAttr "bindPose1.m[8]" "bindPose1.p[9]";
connectAttr "bindPose1.m[9]" "bindPose1.p[10]";
connectAttr "bindPose1.m[10]" "bindPose1.p[11]";
connectAttr "bindPose1.m[11]" "bindPose1.p[12]";
connectAttr "bindPose1.m[12]" "bindPose1.p[13]";
connectAttr "bindPose1.m[13]" "bindPose1.p[14]";
connectAttr "bindPose1.m[11]" "bindPose1.p[15]";
connectAttr "bindPose1.m[15]" "bindPose1.p[16]";
connectAttr "bindPose1.m[16]" "bindPose1.p[17]";
connectAttr "bindPose1.m[11]" "bindPose1.p[18]";
connectAttr "bindPose1.m[18]" "bindPose1.p[19]";
connectAttr "bindPose1.m[19]" "bindPose1.p[20]";
connectAttr "bindPose1.m[3]" "bindPose1.p[21]";
connectAttr "bindPose1.m[21]" "bindPose1.p[22]";
connectAttr "bindPose1.m[22]" "bindPose1.p[23]";
connectAttr "bindPose1.m[23]" "bindPose1.p[24]";
connectAttr "bindPose1.m[24]" "bindPose1.p[25]";
connectAttr "bindPose1.m[25]" "bindPose1.p[26]";
connectAttr "bindPose1.m[26]" "bindPose1.p[27]";
connectAttr "bindPose1.m[27]" "bindPose1.p[28]";
connectAttr "bindPose1.m[25]" "bindPose1.p[29]";
connectAttr "bindPose1.m[29]" "bindPose1.p[30]";
connectAttr "bindPose1.m[30]" "bindPose1.p[31]";
connectAttr "bindPose1.m[25]" "bindPose1.p[32]";
connectAttr "bindPose1.m[32]" "bindPose1.p[33]";
connectAttr "bindPose1.m[33]" "bindPose1.p[34]";
connectAttr "bindPose1.m[0]" "bindPose1.p[35]";
connectAttr "bindPose1.m[35]" "bindPose1.p[36]";
connectAttr "bindPose1.m[36]" "bindPose1.p[37]";
connectAttr "bindPose1.m[37]" "bindPose1.p[38]";
connectAttr "bindPose1.m[38]" "bindPose1.p[39]";
connectAttr "bindPose1.m[0]" "bindPose1.p[40]";
connectAttr "bindPose1.m[40]" "bindPose1.p[41]";
connectAttr "bindPose1.m[41]" "bindPose1.p[42]";
connectAttr "bindPose1.m[42]" "bindPose1.p[43]";
connectAttr "bindPose1.m[43]" "bindPose1.p[44]";
connectAttr "god_joint.bps" "bindPose1.wm[0]";
connectAttr "spine_1.bps" "bindPose1.wm[1]";
connectAttr "spine_2.bps" "bindPose1.wm[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.bps" "bindPose1.wm[3]";
connectAttr "neck.bps" "bindPose1.wm[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.bps" "bindPose1.wm[5]"
		;
connectAttr "head_end.bps" "bindPose1.wm[6]";
connectAttr "clavicle_right.bps" "bindPose1.wm[7]";
connectAttr "shoulder_right.bps" "bindPose1.wm[8]";
connectAttr "elbow_right.bps" "bindPose1.wm[9]";
connectAttr "wrist_right.bps" "bindPose1.wm[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.bps" "bindPose1.wm[11]"
		;
connectAttr "index1_right.bps" "bindPose1.wm[12]";
connectAttr "index2_right.bps" "bindPose1.wm[13]";
connectAttr "index_end_right.bps" "bindPose1.wm[14]";
connectAttr "thumb1_right.bps" "bindPose1.wm[15]";
connectAttr "thumb2_right.bps" "bindPose1.wm[16]";
connectAttr "thumb_end_right.bps" "bindPose1.wm[17]";
connectAttr "fingers1_right.bps" "bindPose1.wm[18]";
connectAttr "fingers2_right.bps" "bindPose1.wm[19]";
connectAttr "fingers_end_right.bps" "bindPose1.wm[20]";
connectAttr "clavicle_left.bps" "bindPose1.wm[21]";
connectAttr "shoulder_left.bps" "bindPose1.wm[22]";
connectAttr "elbow_left.bps" "bindPose1.wm[23]";
connectAttr "wrist_left.bps" "bindPose1.wm[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.bps" "bindPose1.wm[25]"
		;
connectAttr "index1_left.bps" "bindPose1.wm[26]";
connectAttr "index2_left.bps" "bindPose1.wm[27]";
connectAttr "index_end_left.bps" "bindPose1.wm[28]";
connectAttr "thumb1_left.bps" "bindPose1.wm[29]";
connectAttr "thumb2_left.bps" "bindPose1.wm[30]";
connectAttr "thumb_end_left.bps" "bindPose1.wm[31]";
connectAttr "fingers1_left.bps" "bindPose1.wm[32]";
connectAttr "fingers2_left.bps" "bindPose1.wm[33]";
connectAttr "fingers_end_left.bps" "bindPose1.wm[34]";
connectAttr "hip_left.bps" "bindPose1.wm[35]";
connectAttr "knee_left.bps" "bindPose1.wm[36]";
connectAttr "ankle_left.bps" "bindPose1.wm[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.bps" "bindPose1.wm[38]"
		;
connectAttr "toe_left.bps" "bindPose1.wm[39]";
connectAttr "hip_right.bps" "bindPose1.wm[40]";
connectAttr "knee_right.bps" "bindPose1.wm[41]";
connectAttr "ankle_right.bps" "bindPose1.wm[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.bps" "bindPose1.wm[43]"
		;
connectAttr "toe_right.bps" "bindPose1.wm[44]";
connectAttr "skinCluster2GroupParts.og" "skinCluster2.ip[0].ig";
connectAttr "skinCluster2GroupId.id" "skinCluster2.ip[0].gi";
connectAttr "god_joint.wm" "skinCluster2.ma[0]";
connectAttr "spine_1.wm" "skinCluster2.ma[1]";
connectAttr "spine_2.wm" "skinCluster2.ma[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.wm" "skinCluster2.ma[3]";
connectAttr "neck.wm" "skinCluster2.ma[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.wm" "skinCluster2.ma[5]"
		;
connectAttr "head_end.wm" "skinCluster2.ma[6]";
connectAttr "clavicle_right.wm" "skinCluster2.ma[7]";
connectAttr "shoulder_right.wm" "skinCluster2.ma[8]";
connectAttr "elbow_right.wm" "skinCluster2.ma[9]";
connectAttr "wrist_right.wm" "skinCluster2.ma[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.wm" "skinCluster2.ma[11]"
		;
connectAttr "index1_right.wm" "skinCluster2.ma[12]";
connectAttr "index2_right.wm" "skinCluster2.ma[13]";
connectAttr "index_end_right.wm" "skinCluster2.ma[14]";
connectAttr "thumb1_right.wm" "skinCluster2.ma[15]";
connectAttr "thumb2_right.wm" "skinCluster2.ma[16]";
connectAttr "thumb_end_right.wm" "skinCluster2.ma[17]";
connectAttr "fingers1_right.wm" "skinCluster2.ma[18]";
connectAttr "fingers2_right.wm" "skinCluster2.ma[19]";
connectAttr "fingers_end_right.wm" "skinCluster2.ma[20]";
connectAttr "clavicle_left.wm" "skinCluster2.ma[21]";
connectAttr "shoulder_left.wm" "skinCluster2.ma[22]";
connectAttr "elbow_left.wm" "skinCluster2.ma[23]";
connectAttr "wrist_left.wm" "skinCluster2.ma[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.wm" "skinCluster2.ma[25]"
		;
connectAttr "index1_left.wm" "skinCluster2.ma[26]";
connectAttr "index2_left.wm" "skinCluster2.ma[27]";
connectAttr "index_end_left.wm" "skinCluster2.ma[28]";
connectAttr "thumb1_left.wm" "skinCluster2.ma[29]";
connectAttr "thumb2_left.wm" "skinCluster2.ma[30]";
connectAttr "thumb_end_left.wm" "skinCluster2.ma[31]";
connectAttr "fingers1_left.wm" "skinCluster2.ma[32]";
connectAttr "fingers2_left.wm" "skinCluster2.ma[33]";
connectAttr "fingers_end_left.wm" "skinCluster2.ma[34]";
connectAttr "hip_left.wm" "skinCluster2.ma[35]";
connectAttr "knee_left.wm" "skinCluster2.ma[36]";
connectAttr "ankle_left.wm" "skinCluster2.ma[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.wm" "skinCluster2.ma[38]"
		;
connectAttr "toe_left.wm" "skinCluster2.ma[39]";
connectAttr "hip_right.wm" "skinCluster2.ma[40]";
connectAttr "knee_right.wm" "skinCluster2.ma[41]";
connectAttr "ankle_right.wm" "skinCluster2.ma[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.wm" "skinCluster2.ma[43]"
		;
connectAttr "toe_right.wm" "skinCluster2.ma[44]";
connectAttr "god_joint.liw" "skinCluster2.lw[0]";
connectAttr "spine_1.liw" "skinCluster2.lw[1]";
connectAttr "spine_2.liw" "skinCluster2.lw[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.liw" "skinCluster2.lw[3]";
connectAttr "neck.liw" "skinCluster2.lw[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.liw" "skinCluster2.lw[5]"
		;
connectAttr "head_end.liw" "skinCluster2.lw[6]";
connectAttr "clavicle_right.liw" "skinCluster2.lw[7]";
connectAttr "shoulder_right.liw" "skinCluster2.lw[8]";
connectAttr "elbow_right.liw" "skinCluster2.lw[9]";
connectAttr "wrist_right.liw" "skinCluster2.lw[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.liw" "skinCluster2.lw[11]"
		;
connectAttr "index1_right.liw" "skinCluster2.lw[12]";
connectAttr "index2_right.liw" "skinCluster2.lw[13]";
connectAttr "index_end_right.liw" "skinCluster2.lw[14]";
connectAttr "thumb1_right.liw" "skinCluster2.lw[15]";
connectAttr "thumb2_right.liw" "skinCluster2.lw[16]";
connectAttr "thumb_end_right.liw" "skinCluster2.lw[17]";
connectAttr "fingers1_right.liw" "skinCluster2.lw[18]";
connectAttr "fingers2_right.liw" "skinCluster2.lw[19]";
connectAttr "fingers_end_right.liw" "skinCluster2.lw[20]";
connectAttr "clavicle_left.liw" "skinCluster2.lw[21]";
connectAttr "shoulder_left.liw" "skinCluster2.lw[22]";
connectAttr "elbow_left.liw" "skinCluster2.lw[23]";
connectAttr "wrist_left.liw" "skinCluster2.lw[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.liw" "skinCluster2.lw[25]"
		;
connectAttr "index1_left.liw" "skinCluster2.lw[26]";
connectAttr "index2_left.liw" "skinCluster2.lw[27]";
connectAttr "index_end_left.liw" "skinCluster2.lw[28]";
connectAttr "thumb1_left.liw" "skinCluster2.lw[29]";
connectAttr "thumb2_left.liw" "skinCluster2.lw[30]";
connectAttr "thumb_end_left.liw" "skinCluster2.lw[31]";
connectAttr "fingers1_left.liw" "skinCluster2.lw[32]";
connectAttr "fingers2_left.liw" "skinCluster2.lw[33]";
connectAttr "fingers_end_left.liw" "skinCluster2.lw[34]";
connectAttr "hip_left.liw" "skinCluster2.lw[35]";
connectAttr "knee_left.liw" "skinCluster2.lw[36]";
connectAttr "ankle_left.liw" "skinCluster2.lw[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.liw" "skinCluster2.lw[38]"
		;
connectAttr "toe_left.liw" "skinCluster2.lw[39]";
connectAttr "hip_right.liw" "skinCluster2.lw[40]";
connectAttr "knee_right.liw" "skinCluster2.lw[41]";
connectAttr "ankle_right.liw" "skinCluster2.lw[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.liw" "skinCluster2.lw[43]"
		;
connectAttr "toe_right.liw" "skinCluster2.lw[44]";
connectAttr "foot_rightShapeOrig.w" "groupParts4.ig";
connectAttr "groupId165.id" "groupParts4.gi";
connectAttr "groupParts6.og" "tweak2.ip[0].ig";
connectAttr "groupId167.id" "tweak2.ip[0].gi";
connectAttr "skinCluster2GroupId.msg" "skinCluster2Set.gn" -na;
connectAttr "foot_rightShape.iog.og[7]" "skinCluster2Set.dsm" -na;
connectAttr "skinCluster2.msg" "skinCluster2Set.ub[0]";
connectAttr "tweak2.og[0]" "skinCluster2GroupParts.ig";
connectAttr "skinCluster2GroupId.id" "skinCluster2GroupParts.gi";
connectAttr "groupId167.msg" "tweakSet2.gn" -na;
connectAttr "foot_rightShape.iog.og[8]" "tweakSet2.dsm" -na;
connectAttr "tweak2.msg" "tweakSet2.ub[0]";
connectAttr "groupParts4.og" "groupParts6.ig";
connectAttr "groupId167.id" "groupParts6.gi";
connectAttr "skinCluster3GroupParts.og" "skinCluster3.ip[0].ig";
connectAttr "skinCluster3GroupId.id" "skinCluster3.ip[0].gi";
connectAttr "god_joint.wm" "skinCluster3.ma[0]";
connectAttr "spine_1.wm" "skinCluster3.ma[1]";
connectAttr "spine_2.wm" "skinCluster3.ma[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.wm" "skinCluster3.ma[3]";
connectAttr "neck.wm" "skinCluster3.ma[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.wm" "skinCluster3.ma[5]"
		;
connectAttr "head_end.wm" "skinCluster3.ma[6]";
connectAttr "clavicle_right.wm" "skinCluster3.ma[7]";
connectAttr "shoulder_right.wm" "skinCluster3.ma[8]";
connectAttr "elbow_right.wm" "skinCluster3.ma[9]";
connectAttr "wrist_right.wm" "skinCluster3.ma[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.wm" "skinCluster3.ma[11]"
		;
connectAttr "index1_right.wm" "skinCluster3.ma[12]";
connectAttr "index2_right.wm" "skinCluster3.ma[13]";
connectAttr "index_end_right.wm" "skinCluster3.ma[14]";
connectAttr "thumb1_right.wm" "skinCluster3.ma[15]";
connectAttr "thumb2_right.wm" "skinCluster3.ma[16]";
connectAttr "thumb_end_right.wm" "skinCluster3.ma[17]";
connectAttr "fingers1_right.wm" "skinCluster3.ma[18]";
connectAttr "fingers2_right.wm" "skinCluster3.ma[19]";
connectAttr "fingers_end_right.wm" "skinCluster3.ma[20]";
connectAttr "clavicle_left.wm" "skinCluster3.ma[21]";
connectAttr "shoulder_left.wm" "skinCluster3.ma[22]";
connectAttr "elbow_left.wm" "skinCluster3.ma[23]";
connectAttr "wrist_left.wm" "skinCluster3.ma[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.wm" "skinCluster3.ma[25]"
		;
connectAttr "index1_left.wm" "skinCluster3.ma[26]";
connectAttr "index2_left.wm" "skinCluster3.ma[27]";
connectAttr "index_end_left.wm" "skinCluster3.ma[28]";
connectAttr "thumb1_left.wm" "skinCluster3.ma[29]";
connectAttr "thumb2_left.wm" "skinCluster3.ma[30]";
connectAttr "thumb_end_left.wm" "skinCluster3.ma[31]";
connectAttr "fingers1_left.wm" "skinCluster3.ma[32]";
connectAttr "fingers2_left.wm" "skinCluster3.ma[33]";
connectAttr "fingers_end_left.wm" "skinCluster3.ma[34]";
connectAttr "hip_left.wm" "skinCluster3.ma[35]";
connectAttr "knee_left.wm" "skinCluster3.ma[36]";
connectAttr "ankle_left.wm" "skinCluster3.ma[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.wm" "skinCluster3.ma[38]"
		;
connectAttr "toe_left.wm" "skinCluster3.ma[39]";
connectAttr "hip_right.wm" "skinCluster3.ma[40]";
connectAttr "knee_right.wm" "skinCluster3.ma[41]";
connectAttr "ankle_right.wm" "skinCluster3.ma[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.wm" "skinCluster3.ma[43]"
		;
connectAttr "toe_right.wm" "skinCluster3.ma[44]";
connectAttr "god_joint.liw" "skinCluster3.lw[0]";
connectAttr "spine_1.liw" "skinCluster3.lw[1]";
connectAttr "spine_2.liw" "skinCluster3.lw[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.liw" "skinCluster3.lw[3]";
connectAttr "neck.liw" "skinCluster3.lw[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.liw" "skinCluster3.lw[5]"
		;
connectAttr "head_end.liw" "skinCluster3.lw[6]";
connectAttr "clavicle_right.liw" "skinCluster3.lw[7]";
connectAttr "shoulder_right.liw" "skinCluster3.lw[8]";
connectAttr "elbow_right.liw" "skinCluster3.lw[9]";
connectAttr "wrist_right.liw" "skinCluster3.lw[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.liw" "skinCluster3.lw[11]"
		;
connectAttr "index1_right.liw" "skinCluster3.lw[12]";
connectAttr "index2_right.liw" "skinCluster3.lw[13]";
connectAttr "index_end_right.liw" "skinCluster3.lw[14]";
connectAttr "thumb1_right.liw" "skinCluster3.lw[15]";
connectAttr "thumb2_right.liw" "skinCluster3.lw[16]";
connectAttr "thumb_end_right.liw" "skinCluster3.lw[17]";
connectAttr "fingers1_right.liw" "skinCluster3.lw[18]";
connectAttr "fingers2_right.liw" "skinCluster3.lw[19]";
connectAttr "fingers_end_right.liw" "skinCluster3.lw[20]";
connectAttr "clavicle_left.liw" "skinCluster3.lw[21]";
connectAttr "shoulder_left.liw" "skinCluster3.lw[22]";
connectAttr "elbow_left.liw" "skinCluster3.lw[23]";
connectAttr "wrist_left.liw" "skinCluster3.lw[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.liw" "skinCluster3.lw[25]"
		;
connectAttr "index1_left.liw" "skinCluster3.lw[26]";
connectAttr "index2_left.liw" "skinCluster3.lw[27]";
connectAttr "index_end_left.liw" "skinCluster3.lw[28]";
connectAttr "thumb1_left.liw" "skinCluster3.lw[29]";
connectAttr "thumb2_left.liw" "skinCluster3.lw[30]";
connectAttr "thumb_end_left.liw" "skinCluster3.lw[31]";
connectAttr "fingers1_left.liw" "skinCluster3.lw[32]";
connectAttr "fingers2_left.liw" "skinCluster3.lw[33]";
connectAttr "fingers_end_left.liw" "skinCluster3.lw[34]";
connectAttr "hip_left.liw" "skinCluster3.lw[35]";
connectAttr "knee_left.liw" "skinCluster3.lw[36]";
connectAttr "ankle_left.liw" "skinCluster3.lw[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.liw" "skinCluster3.lw[38]"
		;
connectAttr "toe_left.liw" "skinCluster3.lw[39]";
connectAttr "hip_right.liw" "skinCluster3.lw[40]";
connectAttr "knee_right.liw" "skinCluster3.lw[41]";
connectAttr "ankle_right.liw" "skinCluster3.lw[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.liw" "skinCluster3.lw[43]"
		;
connectAttr "toe_right.liw" "skinCluster3.lw[44]";
connectAttr "midsectionShapeOrig.w" "groupParts7.ig";
connectAttr "groupId168.id" "groupParts7.gi";
connectAttr "groupParts9.og" "tweak3.ip[0].ig";
connectAttr "groupId170.id" "tweak3.ip[0].gi";
connectAttr "skinCluster3GroupId.msg" "skinCluster3Set.gn" -na;
connectAttr "midsectionShape.iog.og[4]" "skinCluster3Set.dsm" -na;
connectAttr "skinCluster3.msg" "skinCluster3Set.ub[0]";
connectAttr "tweak3.og[0]" "skinCluster3GroupParts.ig";
connectAttr "skinCluster3GroupId.id" "skinCluster3GroupParts.gi";
connectAttr "groupId170.msg" "tweakSet3.gn" -na;
connectAttr "midsectionShape.iog.og[5]" "tweakSet3.dsm" -na;
connectAttr "tweak3.msg" "tweakSet3.ub[0]";
connectAttr "groupParts7.og" "groupParts9.ig";
connectAttr "groupId170.id" "groupParts9.gi";
connectAttr "skinCluster4GroupParts.og" "skinCluster4.ip[0].ig";
connectAttr "skinCluster4GroupId.id" "skinCluster4.ip[0].gi";
connectAttr "god_joint.wm" "skinCluster4.ma[0]";
connectAttr "spine_1.wm" "skinCluster4.ma[1]";
connectAttr "spine_2.wm" "skinCluster4.ma[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.wm" "skinCluster4.ma[3]";
connectAttr "neck.wm" "skinCluster4.ma[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.wm" "skinCluster4.ma[5]"
		;
connectAttr "head_end.wm" "skinCluster4.ma[6]";
connectAttr "clavicle_right.wm" "skinCluster4.ma[7]";
connectAttr "shoulder_right.wm" "skinCluster4.ma[8]";
connectAttr "elbow_right.wm" "skinCluster4.ma[9]";
connectAttr "wrist_right.wm" "skinCluster4.ma[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.wm" "skinCluster4.ma[11]"
		;
connectAttr "index1_right.wm" "skinCluster4.ma[12]";
connectAttr "index2_right.wm" "skinCluster4.ma[13]";
connectAttr "index_end_right.wm" "skinCluster4.ma[14]";
connectAttr "thumb1_right.wm" "skinCluster4.ma[15]";
connectAttr "thumb2_right.wm" "skinCluster4.ma[16]";
connectAttr "thumb_end_right.wm" "skinCluster4.ma[17]";
connectAttr "fingers1_right.wm" "skinCluster4.ma[18]";
connectAttr "fingers2_right.wm" "skinCluster4.ma[19]";
connectAttr "fingers_end_right.wm" "skinCluster4.ma[20]";
connectAttr "clavicle_left.wm" "skinCluster4.ma[21]";
connectAttr "shoulder_left.wm" "skinCluster4.ma[22]";
connectAttr "elbow_left.wm" "skinCluster4.ma[23]";
connectAttr "wrist_left.wm" "skinCluster4.ma[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.wm" "skinCluster4.ma[25]"
		;
connectAttr "index1_left.wm" "skinCluster4.ma[26]";
connectAttr "index2_left.wm" "skinCluster4.ma[27]";
connectAttr "index_end_left.wm" "skinCluster4.ma[28]";
connectAttr "thumb1_left.wm" "skinCluster4.ma[29]";
connectAttr "thumb2_left.wm" "skinCluster4.ma[30]";
connectAttr "thumb_end_left.wm" "skinCluster4.ma[31]";
connectAttr "fingers1_left.wm" "skinCluster4.ma[32]";
connectAttr "fingers2_left.wm" "skinCluster4.ma[33]";
connectAttr "fingers_end_left.wm" "skinCluster4.ma[34]";
connectAttr "hip_left.wm" "skinCluster4.ma[35]";
connectAttr "knee_left.wm" "skinCluster4.ma[36]";
connectAttr "ankle_left.wm" "skinCluster4.ma[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.wm" "skinCluster4.ma[38]"
		;
connectAttr "toe_left.wm" "skinCluster4.ma[39]";
connectAttr "hip_right.wm" "skinCluster4.ma[40]";
connectAttr "knee_right.wm" "skinCluster4.ma[41]";
connectAttr "ankle_right.wm" "skinCluster4.ma[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.wm" "skinCluster4.ma[43]"
		;
connectAttr "toe_right.wm" "skinCluster4.ma[44]";
connectAttr "god_joint.liw" "skinCluster4.lw[0]";
connectAttr "spine_1.liw" "skinCluster4.lw[1]";
connectAttr "spine_2.liw" "skinCluster4.lw[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.liw" "skinCluster4.lw[3]";
connectAttr "neck.liw" "skinCluster4.lw[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.liw" "skinCluster4.lw[5]"
		;
connectAttr "head_end.liw" "skinCluster4.lw[6]";
connectAttr "clavicle_right.liw" "skinCluster4.lw[7]";
connectAttr "shoulder_right.liw" "skinCluster4.lw[8]";
connectAttr "elbow_right.liw" "skinCluster4.lw[9]";
connectAttr "wrist_right.liw" "skinCluster4.lw[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.liw" "skinCluster4.lw[11]"
		;
connectAttr "index1_right.liw" "skinCluster4.lw[12]";
connectAttr "index2_right.liw" "skinCluster4.lw[13]";
connectAttr "index_end_right.liw" "skinCluster4.lw[14]";
connectAttr "thumb1_right.liw" "skinCluster4.lw[15]";
connectAttr "thumb2_right.liw" "skinCluster4.lw[16]";
connectAttr "thumb_end_right.liw" "skinCluster4.lw[17]";
connectAttr "fingers1_right.liw" "skinCluster4.lw[18]";
connectAttr "fingers2_right.liw" "skinCluster4.lw[19]";
connectAttr "fingers_end_right.liw" "skinCluster4.lw[20]";
connectAttr "clavicle_left.liw" "skinCluster4.lw[21]";
connectAttr "shoulder_left.liw" "skinCluster4.lw[22]";
connectAttr "elbow_left.liw" "skinCluster4.lw[23]";
connectAttr "wrist_left.liw" "skinCluster4.lw[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.liw" "skinCluster4.lw[25]"
		;
connectAttr "index1_left.liw" "skinCluster4.lw[26]";
connectAttr "index2_left.liw" "skinCluster4.lw[27]";
connectAttr "index_end_left.liw" "skinCluster4.lw[28]";
connectAttr "thumb1_left.liw" "skinCluster4.lw[29]";
connectAttr "thumb2_left.liw" "skinCluster4.lw[30]";
connectAttr "thumb_end_left.liw" "skinCluster4.lw[31]";
connectAttr "fingers1_left.liw" "skinCluster4.lw[32]";
connectAttr "fingers2_left.liw" "skinCluster4.lw[33]";
connectAttr "fingers_end_left.liw" "skinCluster4.lw[34]";
connectAttr "hip_left.liw" "skinCluster4.lw[35]";
connectAttr "knee_left.liw" "skinCluster4.lw[36]";
connectAttr "ankle_left.liw" "skinCluster4.lw[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.liw" "skinCluster4.lw[38]"
		;
connectAttr "toe_left.liw" "skinCluster4.lw[39]";
connectAttr "hip_right.liw" "skinCluster4.lw[40]";
connectAttr "knee_right.liw" "skinCluster4.lw[41]";
connectAttr "ankle_right.liw" "skinCluster4.lw[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.liw" "skinCluster4.lw[43]"
		;
connectAttr "toe_right.liw" "skinCluster4.lw[44]";
connectAttr "chestShapeOrig.w" "groupParts10.ig";
connectAttr "groupId171.id" "groupParts10.gi";
connectAttr "groupParts12.og" "tweak4.ip[0].ig";
connectAttr "groupId173.id" "tweak4.ip[0].gi";
connectAttr "skinCluster4GroupId.msg" "skinCluster4Set.gn" -na;
connectAttr "chestShape.iog.og[4]" "skinCluster4Set.dsm" -na;
connectAttr "skinCluster4.msg" "skinCluster4Set.ub[0]";
connectAttr "tweak4.og[0]" "skinCluster4GroupParts.ig";
connectAttr "skinCluster4GroupId.id" "skinCluster4GroupParts.gi";
connectAttr "groupId173.msg" "tweakSet4.gn" -na;
connectAttr "chestShape.iog.og[5]" "tweakSet4.dsm" -na;
connectAttr "tweak4.msg" "tweakSet4.ub[0]";
connectAttr "groupParts10.og" "groupParts12.ig";
connectAttr "groupId173.id" "groupParts12.gi";
connectAttr "skinCluster5GroupParts.og" "skinCluster5.ip[0].ig";
connectAttr "skinCluster5GroupId.id" "skinCluster5.ip[0].gi";
connectAttr "god_joint.wm" "skinCluster5.ma[0]";
connectAttr "spine_1.wm" "skinCluster5.ma[1]";
connectAttr "spine_2.wm" "skinCluster5.ma[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.wm" "skinCluster5.ma[3]";
connectAttr "neck.wm" "skinCluster5.ma[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.wm" "skinCluster5.ma[5]"
		;
connectAttr "head_end.wm" "skinCluster5.ma[6]";
connectAttr "clavicle_right.wm" "skinCluster5.ma[7]";
connectAttr "shoulder_right.wm" "skinCluster5.ma[8]";
connectAttr "elbow_right.wm" "skinCluster5.ma[9]";
connectAttr "wrist_right.wm" "skinCluster5.ma[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.wm" "skinCluster5.ma[11]"
		;
connectAttr "index1_right.wm" "skinCluster5.ma[12]";
connectAttr "index2_right.wm" "skinCluster5.ma[13]";
connectAttr "index_end_right.wm" "skinCluster5.ma[14]";
connectAttr "thumb1_right.wm" "skinCluster5.ma[15]";
connectAttr "thumb2_right.wm" "skinCluster5.ma[16]";
connectAttr "thumb_end_right.wm" "skinCluster5.ma[17]";
connectAttr "fingers1_right.wm" "skinCluster5.ma[18]";
connectAttr "fingers2_right.wm" "skinCluster5.ma[19]";
connectAttr "fingers_end_right.wm" "skinCluster5.ma[20]";
connectAttr "clavicle_left.wm" "skinCluster5.ma[21]";
connectAttr "shoulder_left.wm" "skinCluster5.ma[22]";
connectAttr "elbow_left.wm" "skinCluster5.ma[23]";
connectAttr "wrist_left.wm" "skinCluster5.ma[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.wm" "skinCluster5.ma[25]"
		;
connectAttr "index1_left.wm" "skinCluster5.ma[26]";
connectAttr "index2_left.wm" "skinCluster5.ma[27]";
connectAttr "index_end_left.wm" "skinCluster5.ma[28]";
connectAttr "thumb1_left.wm" "skinCluster5.ma[29]";
connectAttr "thumb2_left.wm" "skinCluster5.ma[30]";
connectAttr "thumb_end_left.wm" "skinCluster5.ma[31]";
connectAttr "fingers1_left.wm" "skinCluster5.ma[32]";
connectAttr "fingers2_left.wm" "skinCluster5.ma[33]";
connectAttr "fingers_end_left.wm" "skinCluster5.ma[34]";
connectAttr "hip_left.wm" "skinCluster5.ma[35]";
connectAttr "knee_left.wm" "skinCluster5.ma[36]";
connectAttr "ankle_left.wm" "skinCluster5.ma[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.wm" "skinCluster5.ma[38]"
		;
connectAttr "toe_left.wm" "skinCluster5.ma[39]";
connectAttr "hip_right.wm" "skinCluster5.ma[40]";
connectAttr "knee_right.wm" "skinCluster5.ma[41]";
connectAttr "ankle_right.wm" "skinCluster5.ma[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.wm" "skinCluster5.ma[43]"
		;
connectAttr "toe_right.wm" "skinCluster5.ma[44]";
connectAttr "god_joint.liw" "skinCluster5.lw[0]";
connectAttr "spine_1.liw" "skinCluster5.lw[1]";
connectAttr "spine_2.liw" "skinCluster5.lw[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.liw" "skinCluster5.lw[3]";
connectAttr "neck.liw" "skinCluster5.lw[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.liw" "skinCluster5.lw[5]"
		;
connectAttr "head_end.liw" "skinCluster5.lw[6]";
connectAttr "clavicle_right.liw" "skinCluster5.lw[7]";
connectAttr "shoulder_right.liw" "skinCluster5.lw[8]";
connectAttr "elbow_right.liw" "skinCluster5.lw[9]";
connectAttr "wrist_right.liw" "skinCluster5.lw[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.liw" "skinCluster5.lw[11]"
		;
connectAttr "index1_right.liw" "skinCluster5.lw[12]";
connectAttr "index2_right.liw" "skinCluster5.lw[13]";
connectAttr "index_end_right.liw" "skinCluster5.lw[14]";
connectAttr "thumb1_right.liw" "skinCluster5.lw[15]";
connectAttr "thumb2_right.liw" "skinCluster5.lw[16]";
connectAttr "thumb_end_right.liw" "skinCluster5.lw[17]";
connectAttr "fingers1_right.liw" "skinCluster5.lw[18]";
connectAttr "fingers2_right.liw" "skinCluster5.lw[19]";
connectAttr "fingers_end_right.liw" "skinCluster5.lw[20]";
connectAttr "clavicle_left.liw" "skinCluster5.lw[21]";
connectAttr "shoulder_left.liw" "skinCluster5.lw[22]";
connectAttr "elbow_left.liw" "skinCluster5.lw[23]";
connectAttr "wrist_left.liw" "skinCluster5.lw[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.liw" "skinCluster5.lw[25]"
		;
connectAttr "index1_left.liw" "skinCluster5.lw[26]";
connectAttr "index2_left.liw" "skinCluster5.lw[27]";
connectAttr "index_end_left.liw" "skinCluster5.lw[28]";
connectAttr "thumb1_left.liw" "skinCluster5.lw[29]";
connectAttr "thumb2_left.liw" "skinCluster5.lw[30]";
connectAttr "thumb_end_left.liw" "skinCluster5.lw[31]";
connectAttr "fingers1_left.liw" "skinCluster5.lw[32]";
connectAttr "fingers2_left.liw" "skinCluster5.lw[33]";
connectAttr "fingers_end_left.liw" "skinCluster5.lw[34]";
connectAttr "hip_left.liw" "skinCluster5.lw[35]";
connectAttr "knee_left.liw" "skinCluster5.lw[36]";
connectAttr "ankle_left.liw" "skinCluster5.lw[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.liw" "skinCluster5.lw[38]"
		;
connectAttr "toe_left.liw" "skinCluster5.lw[39]";
connectAttr "hip_right.liw" "skinCluster5.lw[40]";
connectAttr "knee_right.liw" "skinCluster5.lw[41]";
connectAttr "ankle_right.liw" "skinCluster5.lw[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.liw" "skinCluster5.lw[43]"
		;
connectAttr "toe_right.liw" "skinCluster5.lw[44]";
connectAttr "leg_leftShapeOrig.w" "groupParts13.ig";
connectAttr "groupId174.id" "groupParts13.gi";
connectAttr "groupParts15.og" "tweak5.ip[0].ig";
connectAttr "groupId176.id" "tweak5.ip[0].gi";
connectAttr "skinCluster5GroupId.msg" "skinCluster5Set.gn" -na;
connectAttr "leg_leftShape.iog.og[4]" "skinCluster5Set.dsm" -na;
connectAttr "skinCluster5.msg" "skinCluster5Set.ub[0]";
connectAttr "tweak5.og[0]" "skinCluster5GroupParts.ig";
connectAttr "skinCluster5GroupId.id" "skinCluster5GroupParts.gi";
connectAttr "groupId176.msg" "tweakSet5.gn" -na;
connectAttr "leg_leftShape.iog.og[5]" "tweakSet5.dsm" -na;
connectAttr "tweak5.msg" "tweakSet5.ub[0]";
connectAttr "groupParts13.og" "groupParts15.ig";
connectAttr "groupId176.id" "groupParts15.gi";
connectAttr "skinCluster6GroupParts.og" "skinCluster6.ip[0].ig";
connectAttr "skinCluster6GroupId.id" "skinCluster6.ip[0].gi";
connectAttr "god_joint.wm" "skinCluster6.ma[0]";
connectAttr "spine_1.wm" "skinCluster6.ma[1]";
connectAttr "spine_2.wm" "skinCluster6.ma[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.wm" "skinCluster6.ma[3]";
connectAttr "neck.wm" "skinCluster6.ma[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.wm" "skinCluster6.ma[5]"
		;
connectAttr "head_end.wm" "skinCluster6.ma[6]";
connectAttr "clavicle_right.wm" "skinCluster6.ma[7]";
connectAttr "shoulder_right.wm" "skinCluster6.ma[8]";
connectAttr "elbow_right.wm" "skinCluster6.ma[9]";
connectAttr "wrist_right.wm" "skinCluster6.ma[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.wm" "skinCluster6.ma[11]"
		;
connectAttr "index1_right.wm" "skinCluster6.ma[12]";
connectAttr "index2_right.wm" "skinCluster6.ma[13]";
connectAttr "index_end_right.wm" "skinCluster6.ma[14]";
connectAttr "thumb1_right.wm" "skinCluster6.ma[15]";
connectAttr "thumb2_right.wm" "skinCluster6.ma[16]";
connectAttr "thumb_end_right.wm" "skinCluster6.ma[17]";
connectAttr "fingers1_right.wm" "skinCluster6.ma[18]";
connectAttr "fingers2_right.wm" "skinCluster6.ma[19]";
connectAttr "fingers_end_right.wm" "skinCluster6.ma[20]";
connectAttr "clavicle_left.wm" "skinCluster6.ma[21]";
connectAttr "shoulder_left.wm" "skinCluster6.ma[22]";
connectAttr "elbow_left.wm" "skinCluster6.ma[23]";
connectAttr "wrist_left.wm" "skinCluster6.ma[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.wm" "skinCluster6.ma[25]"
		;
connectAttr "index1_left.wm" "skinCluster6.ma[26]";
connectAttr "index2_left.wm" "skinCluster6.ma[27]";
connectAttr "index_end_left.wm" "skinCluster6.ma[28]";
connectAttr "thumb1_left.wm" "skinCluster6.ma[29]";
connectAttr "thumb2_left.wm" "skinCluster6.ma[30]";
connectAttr "thumb_end_left.wm" "skinCluster6.ma[31]";
connectAttr "fingers1_left.wm" "skinCluster6.ma[32]";
connectAttr "fingers2_left.wm" "skinCluster6.ma[33]";
connectAttr "fingers_end_left.wm" "skinCluster6.ma[34]";
connectAttr "hip_left.wm" "skinCluster6.ma[35]";
connectAttr "knee_left.wm" "skinCluster6.ma[36]";
connectAttr "ankle_left.wm" "skinCluster6.ma[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.wm" "skinCluster6.ma[38]"
		;
connectAttr "toe_left.wm" "skinCluster6.ma[39]";
connectAttr "hip_right.wm" "skinCluster6.ma[40]";
connectAttr "knee_right.wm" "skinCluster6.ma[41]";
connectAttr "ankle_right.wm" "skinCluster6.ma[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.wm" "skinCluster6.ma[43]"
		;
connectAttr "toe_right.wm" "skinCluster6.ma[44]";
connectAttr "god_joint.liw" "skinCluster6.lw[0]";
connectAttr "spine_1.liw" "skinCluster6.lw[1]";
connectAttr "spine_2.liw" "skinCluster6.lw[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.liw" "skinCluster6.lw[3]";
connectAttr "neck.liw" "skinCluster6.lw[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.liw" "skinCluster6.lw[5]"
		;
connectAttr "head_end.liw" "skinCluster6.lw[6]";
connectAttr "clavicle_right.liw" "skinCluster6.lw[7]";
connectAttr "shoulder_right.liw" "skinCluster6.lw[8]";
connectAttr "elbow_right.liw" "skinCluster6.lw[9]";
connectAttr "wrist_right.liw" "skinCluster6.lw[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.liw" "skinCluster6.lw[11]"
		;
connectAttr "index1_right.liw" "skinCluster6.lw[12]";
connectAttr "index2_right.liw" "skinCluster6.lw[13]";
connectAttr "index_end_right.liw" "skinCluster6.lw[14]";
connectAttr "thumb1_right.liw" "skinCluster6.lw[15]";
connectAttr "thumb2_right.liw" "skinCluster6.lw[16]";
connectAttr "thumb_end_right.liw" "skinCluster6.lw[17]";
connectAttr "fingers1_right.liw" "skinCluster6.lw[18]";
connectAttr "fingers2_right.liw" "skinCluster6.lw[19]";
connectAttr "fingers_end_right.liw" "skinCluster6.lw[20]";
connectAttr "clavicle_left.liw" "skinCluster6.lw[21]";
connectAttr "shoulder_left.liw" "skinCluster6.lw[22]";
connectAttr "elbow_left.liw" "skinCluster6.lw[23]";
connectAttr "wrist_left.liw" "skinCluster6.lw[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.liw" "skinCluster6.lw[25]"
		;
connectAttr "index1_left.liw" "skinCluster6.lw[26]";
connectAttr "index2_left.liw" "skinCluster6.lw[27]";
connectAttr "index_end_left.liw" "skinCluster6.lw[28]";
connectAttr "thumb1_left.liw" "skinCluster6.lw[29]";
connectAttr "thumb2_left.liw" "skinCluster6.lw[30]";
connectAttr "thumb_end_left.liw" "skinCluster6.lw[31]";
connectAttr "fingers1_left.liw" "skinCluster6.lw[32]";
connectAttr "fingers2_left.liw" "skinCluster6.lw[33]";
connectAttr "fingers_end_left.liw" "skinCluster6.lw[34]";
connectAttr "hip_left.liw" "skinCluster6.lw[35]";
connectAttr "knee_left.liw" "skinCluster6.lw[36]";
connectAttr "ankle_left.liw" "skinCluster6.lw[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.liw" "skinCluster6.lw[38]"
		;
connectAttr "toe_left.liw" "skinCluster6.lw[39]";
connectAttr "hip_right.liw" "skinCluster6.lw[40]";
connectAttr "knee_right.liw" "skinCluster6.lw[41]";
connectAttr "ankle_right.liw" "skinCluster6.lw[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.liw" "skinCluster6.lw[43]"
		;
connectAttr "toe_right.liw" "skinCluster6.lw[44]";
connectAttr "leg_rightShapeOrig.w" "groupParts16.ig";
connectAttr "groupId177.id" "groupParts16.gi";
connectAttr "groupParts18.og" "tweak6.ip[0].ig";
connectAttr "groupId179.id" "tweak6.ip[0].gi";
connectAttr "skinCluster6GroupId.msg" "skinCluster6Set.gn" -na;
connectAttr "leg_rightShape.iog.og[4]" "skinCluster6Set.dsm" -na;
connectAttr "skinCluster6.msg" "skinCluster6Set.ub[0]";
connectAttr "tweak6.og[0]" "skinCluster6GroupParts.ig";
connectAttr "skinCluster6GroupId.id" "skinCluster6GroupParts.gi";
connectAttr "groupId179.msg" "tweakSet6.gn" -na;
connectAttr "leg_rightShape.iog.og[5]" "tweakSet6.dsm" -na;
connectAttr "tweak6.msg" "tweakSet6.ub[0]";
connectAttr "groupParts16.og" "groupParts18.ig";
connectAttr "groupId179.id" "groupParts18.gi";
connectAttr "skinCluster7GroupParts.og" "skinCluster7.ip[0].ig";
connectAttr "skinCluster7GroupId.id" "skinCluster7.ip[0].gi";
connectAttr "god_joint.wm" "skinCluster7.ma[0]";
connectAttr "spine_1.wm" "skinCluster7.ma[1]";
connectAttr "spine_2.wm" "skinCluster7.ma[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.wm" "skinCluster7.ma[3]";
connectAttr "neck.wm" "skinCluster7.ma[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.wm" "skinCluster7.ma[5]"
		;
connectAttr "head_end.wm" "skinCluster7.ma[6]";
connectAttr "clavicle_right.wm" "skinCluster7.ma[7]";
connectAttr "shoulder_right.wm" "skinCluster7.ma[8]";
connectAttr "elbow_right.wm" "skinCluster7.ma[9]";
connectAttr "wrist_right.wm" "skinCluster7.ma[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.wm" "skinCluster7.ma[11]"
		;
connectAttr "index1_right.wm" "skinCluster7.ma[12]";
connectAttr "index2_right.wm" "skinCluster7.ma[13]";
connectAttr "index_end_right.wm" "skinCluster7.ma[14]";
connectAttr "thumb1_right.wm" "skinCluster7.ma[15]";
connectAttr "thumb2_right.wm" "skinCluster7.ma[16]";
connectAttr "thumb_end_right.wm" "skinCluster7.ma[17]";
connectAttr "fingers1_right.wm" "skinCluster7.ma[18]";
connectAttr "fingers2_right.wm" "skinCluster7.ma[19]";
connectAttr "fingers_end_right.wm" "skinCluster7.ma[20]";
connectAttr "clavicle_left.wm" "skinCluster7.ma[21]";
connectAttr "shoulder_left.wm" "skinCluster7.ma[22]";
connectAttr "elbow_left.wm" "skinCluster7.ma[23]";
connectAttr "wrist_left.wm" "skinCluster7.ma[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.wm" "skinCluster7.ma[25]"
		;
connectAttr "index1_left.wm" "skinCluster7.ma[26]";
connectAttr "index2_left.wm" "skinCluster7.ma[27]";
connectAttr "index_end_left.wm" "skinCluster7.ma[28]";
connectAttr "thumb1_left.wm" "skinCluster7.ma[29]";
connectAttr "thumb2_left.wm" "skinCluster7.ma[30]";
connectAttr "thumb_end_left.wm" "skinCluster7.ma[31]";
connectAttr "fingers1_left.wm" "skinCluster7.ma[32]";
connectAttr "fingers2_left.wm" "skinCluster7.ma[33]";
connectAttr "fingers_end_left.wm" "skinCluster7.ma[34]";
connectAttr "hip_left.wm" "skinCluster7.ma[35]";
connectAttr "knee_left.wm" "skinCluster7.ma[36]";
connectAttr "ankle_left.wm" "skinCluster7.ma[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.wm" "skinCluster7.ma[38]"
		;
connectAttr "toe_left.wm" "skinCluster7.ma[39]";
connectAttr "hip_right.wm" "skinCluster7.ma[40]";
connectAttr "knee_right.wm" "skinCluster7.ma[41]";
connectAttr "ankle_right.wm" "skinCluster7.ma[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.wm" "skinCluster7.ma[43]"
		;
connectAttr "toe_right.wm" "skinCluster7.ma[44]";
connectAttr "god_joint.liw" "skinCluster7.lw[0]";
connectAttr "spine_1.liw" "skinCluster7.lw[1]";
connectAttr "spine_2.liw" "skinCluster7.lw[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.liw" "skinCluster7.lw[3]";
connectAttr "neck.liw" "skinCluster7.lw[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.liw" "skinCluster7.lw[5]"
		;
connectAttr "head_end.liw" "skinCluster7.lw[6]";
connectAttr "clavicle_right.liw" "skinCluster7.lw[7]";
connectAttr "shoulder_right.liw" "skinCluster7.lw[8]";
connectAttr "elbow_right.liw" "skinCluster7.lw[9]";
connectAttr "wrist_right.liw" "skinCluster7.lw[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.liw" "skinCluster7.lw[11]"
		;
connectAttr "index1_right.liw" "skinCluster7.lw[12]";
connectAttr "index2_right.liw" "skinCluster7.lw[13]";
connectAttr "index_end_right.liw" "skinCluster7.lw[14]";
connectAttr "thumb1_right.liw" "skinCluster7.lw[15]";
connectAttr "thumb2_right.liw" "skinCluster7.lw[16]";
connectAttr "thumb_end_right.liw" "skinCluster7.lw[17]";
connectAttr "fingers1_right.liw" "skinCluster7.lw[18]";
connectAttr "fingers2_right.liw" "skinCluster7.lw[19]";
connectAttr "fingers_end_right.liw" "skinCluster7.lw[20]";
connectAttr "clavicle_left.liw" "skinCluster7.lw[21]";
connectAttr "shoulder_left.liw" "skinCluster7.lw[22]";
connectAttr "elbow_left.liw" "skinCluster7.lw[23]";
connectAttr "wrist_left.liw" "skinCluster7.lw[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.liw" "skinCluster7.lw[25]"
		;
connectAttr "index1_left.liw" "skinCluster7.lw[26]";
connectAttr "index2_left.liw" "skinCluster7.lw[27]";
connectAttr "index_end_left.liw" "skinCluster7.lw[28]";
connectAttr "thumb1_left.liw" "skinCluster7.lw[29]";
connectAttr "thumb2_left.liw" "skinCluster7.lw[30]";
connectAttr "thumb_end_left.liw" "skinCluster7.lw[31]";
connectAttr "fingers1_left.liw" "skinCluster7.lw[32]";
connectAttr "fingers2_left.liw" "skinCluster7.lw[33]";
connectAttr "fingers_end_left.liw" "skinCluster7.lw[34]";
connectAttr "hip_left.liw" "skinCluster7.lw[35]";
connectAttr "knee_left.liw" "skinCluster7.lw[36]";
connectAttr "ankle_left.liw" "skinCluster7.lw[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.liw" "skinCluster7.lw[38]"
		;
connectAttr "toe_left.liw" "skinCluster7.lw[39]";
connectAttr "hip_right.liw" "skinCluster7.lw[40]";
connectAttr "knee_right.liw" "skinCluster7.lw[41]";
connectAttr "ankle_right.liw" "skinCluster7.lw[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.liw" "skinCluster7.lw[43]"
		;
connectAttr "toe_right.liw" "skinCluster7.lw[44]";
connectAttr "upperarm_leftShapeOrig.w" "groupParts19.ig";
connectAttr "groupId180.id" "groupParts19.gi";
connectAttr "groupParts21.og" "tweak7.ip[0].ig";
connectAttr "groupId182.id" "tweak7.ip[0].gi";
connectAttr "skinCluster7GroupId.msg" "skinCluster7Set.gn" -na;
connectAttr "upperarm_leftShape.iog.og[4]" "skinCluster7Set.dsm" -na;
connectAttr "skinCluster7.msg" "skinCluster7Set.ub[0]";
connectAttr "tweak7.og[0]" "skinCluster7GroupParts.ig";
connectAttr "skinCluster7GroupId.id" "skinCluster7GroupParts.gi";
connectAttr "groupId182.msg" "tweakSet7.gn" -na;
connectAttr "upperarm_leftShape.iog.og[5]" "tweakSet7.dsm" -na;
connectAttr "tweak7.msg" "tweakSet7.ub[0]";
connectAttr "groupParts19.og" "groupParts21.ig";
connectAttr "groupId182.id" "groupParts21.gi";
connectAttr "skinCluster8GroupParts.og" "skinCluster8.ip[0].ig";
connectAttr "skinCluster8GroupId.id" "skinCluster8.ip[0].gi";
connectAttr "god_joint.wm" "skinCluster8.ma[0]";
connectAttr "spine_1.wm" "skinCluster8.ma[1]";
connectAttr "spine_2.wm" "skinCluster8.ma[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.wm" "skinCluster8.ma[3]";
connectAttr "neck.wm" "skinCluster8.ma[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.wm" "skinCluster8.ma[5]"
		;
connectAttr "head_end.wm" "skinCluster8.ma[6]";
connectAttr "clavicle_right.wm" "skinCluster8.ma[7]";
connectAttr "shoulder_right.wm" "skinCluster8.ma[8]";
connectAttr "elbow_right.wm" "skinCluster8.ma[9]";
connectAttr "wrist_right.wm" "skinCluster8.ma[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.wm" "skinCluster8.ma[11]"
		;
connectAttr "index1_right.wm" "skinCluster8.ma[12]";
connectAttr "index2_right.wm" "skinCluster8.ma[13]";
connectAttr "index_end_right.wm" "skinCluster8.ma[14]";
connectAttr "thumb1_right.wm" "skinCluster8.ma[15]";
connectAttr "thumb2_right.wm" "skinCluster8.ma[16]";
connectAttr "thumb_end_right.wm" "skinCluster8.ma[17]";
connectAttr "fingers1_right.wm" "skinCluster8.ma[18]";
connectAttr "fingers2_right.wm" "skinCluster8.ma[19]";
connectAttr "fingers_end_right.wm" "skinCluster8.ma[20]";
connectAttr "clavicle_left.wm" "skinCluster8.ma[21]";
connectAttr "shoulder_left.wm" "skinCluster8.ma[22]";
connectAttr "elbow_left.wm" "skinCluster8.ma[23]";
connectAttr "wrist_left.wm" "skinCluster8.ma[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.wm" "skinCluster8.ma[25]"
		;
connectAttr "index1_left.wm" "skinCluster8.ma[26]";
connectAttr "index2_left.wm" "skinCluster8.ma[27]";
connectAttr "index_end_left.wm" "skinCluster8.ma[28]";
connectAttr "thumb1_left.wm" "skinCluster8.ma[29]";
connectAttr "thumb2_left.wm" "skinCluster8.ma[30]";
connectAttr "thumb_end_left.wm" "skinCluster8.ma[31]";
connectAttr "fingers1_left.wm" "skinCluster8.ma[32]";
connectAttr "fingers2_left.wm" "skinCluster8.ma[33]";
connectAttr "fingers_end_left.wm" "skinCluster8.ma[34]";
connectAttr "hip_left.wm" "skinCluster8.ma[35]";
connectAttr "knee_left.wm" "skinCluster8.ma[36]";
connectAttr "ankle_left.wm" "skinCluster8.ma[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.wm" "skinCluster8.ma[38]"
		;
connectAttr "toe_left.wm" "skinCluster8.ma[39]";
connectAttr "hip_right.wm" "skinCluster8.ma[40]";
connectAttr "knee_right.wm" "skinCluster8.ma[41]";
connectAttr "ankle_right.wm" "skinCluster8.ma[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.wm" "skinCluster8.ma[43]"
		;
connectAttr "toe_right.wm" "skinCluster8.ma[44]";
connectAttr "god_joint.liw" "skinCluster8.lw[0]";
connectAttr "spine_1.liw" "skinCluster8.lw[1]";
connectAttr "spine_2.liw" "skinCluster8.lw[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.liw" "skinCluster8.lw[3]";
connectAttr "neck.liw" "skinCluster8.lw[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.liw" "skinCluster8.lw[5]"
		;
connectAttr "head_end.liw" "skinCluster8.lw[6]";
connectAttr "clavicle_right.liw" "skinCluster8.lw[7]";
connectAttr "shoulder_right.liw" "skinCluster8.lw[8]";
connectAttr "elbow_right.liw" "skinCluster8.lw[9]";
connectAttr "wrist_right.liw" "skinCluster8.lw[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.liw" "skinCluster8.lw[11]"
		;
connectAttr "index1_right.liw" "skinCluster8.lw[12]";
connectAttr "index2_right.liw" "skinCluster8.lw[13]";
connectAttr "index_end_right.liw" "skinCluster8.lw[14]";
connectAttr "thumb1_right.liw" "skinCluster8.lw[15]";
connectAttr "thumb2_right.liw" "skinCluster8.lw[16]";
connectAttr "thumb_end_right.liw" "skinCluster8.lw[17]";
connectAttr "fingers1_right.liw" "skinCluster8.lw[18]";
connectAttr "fingers2_right.liw" "skinCluster8.lw[19]";
connectAttr "fingers_end_right.liw" "skinCluster8.lw[20]";
connectAttr "clavicle_left.liw" "skinCluster8.lw[21]";
connectAttr "shoulder_left.liw" "skinCluster8.lw[22]";
connectAttr "elbow_left.liw" "skinCluster8.lw[23]";
connectAttr "wrist_left.liw" "skinCluster8.lw[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.liw" "skinCluster8.lw[25]"
		;
connectAttr "index1_left.liw" "skinCluster8.lw[26]";
connectAttr "index2_left.liw" "skinCluster8.lw[27]";
connectAttr "index_end_left.liw" "skinCluster8.lw[28]";
connectAttr "thumb1_left.liw" "skinCluster8.lw[29]";
connectAttr "thumb2_left.liw" "skinCluster8.lw[30]";
connectAttr "thumb_end_left.liw" "skinCluster8.lw[31]";
connectAttr "fingers1_left.liw" "skinCluster8.lw[32]";
connectAttr "fingers2_left.liw" "skinCluster8.lw[33]";
connectAttr "fingers_end_left.liw" "skinCluster8.lw[34]";
connectAttr "hip_left.liw" "skinCluster8.lw[35]";
connectAttr "knee_left.liw" "skinCluster8.lw[36]";
connectAttr "ankle_left.liw" "skinCluster8.lw[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.liw" "skinCluster8.lw[38]"
		;
connectAttr "toe_left.liw" "skinCluster8.lw[39]";
connectAttr "hip_right.liw" "skinCluster8.lw[40]";
connectAttr "knee_right.liw" "skinCluster8.lw[41]";
connectAttr "ankle_right.liw" "skinCluster8.lw[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.liw" "skinCluster8.lw[43]"
		;
connectAttr "toe_right.liw" "skinCluster8.lw[44]";
connectAttr "lowerarm_leftShapeOrig.w" "groupParts22.ig";
connectAttr "groupId183.id" "groupParts22.gi";
connectAttr "groupParts24.og" "tweak8.ip[0].ig";
connectAttr "groupId185.id" "tweak8.ip[0].gi";
connectAttr "skinCluster8GroupId.msg" "skinCluster8Set.gn" -na;
connectAttr "lowerarm_leftShape.iog.og[4]" "skinCluster8Set.dsm" -na;
connectAttr "skinCluster8.msg" "skinCluster8Set.ub[0]";
connectAttr "tweak8.og[0]" "skinCluster8GroupParts.ig";
connectAttr "skinCluster8GroupId.id" "skinCluster8GroupParts.gi";
connectAttr "groupId185.msg" "tweakSet8.gn" -na;
connectAttr "lowerarm_leftShape.iog.og[5]" "tweakSet8.dsm" -na;
connectAttr "tweak8.msg" "tweakSet8.ub[0]";
connectAttr "groupParts22.og" "groupParts24.ig";
connectAttr "groupId185.id" "groupParts24.gi";
connectAttr "skinCluster9GroupParts.og" "skinCluster9.ip[0].ig";
connectAttr "skinCluster9GroupId.id" "skinCluster9.ip[0].gi";
connectAttr "god_joint.wm" "skinCluster9.ma[0]";
connectAttr "spine_1.wm" "skinCluster9.ma[1]";
connectAttr "spine_2.wm" "skinCluster9.ma[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.wm" "skinCluster9.ma[3]";
connectAttr "neck.wm" "skinCluster9.ma[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.wm" "skinCluster9.ma[5]"
		;
connectAttr "head_end.wm" "skinCluster9.ma[6]";
connectAttr "clavicle_right.wm" "skinCluster9.ma[7]";
connectAttr "shoulder_right.wm" "skinCluster9.ma[8]";
connectAttr "elbow_right.wm" "skinCluster9.ma[9]";
connectAttr "wrist_right.wm" "skinCluster9.ma[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.wm" "skinCluster9.ma[11]"
		;
connectAttr "index1_right.wm" "skinCluster9.ma[12]";
connectAttr "index2_right.wm" "skinCluster9.ma[13]";
connectAttr "index_end_right.wm" "skinCluster9.ma[14]";
connectAttr "thumb1_right.wm" "skinCluster9.ma[15]";
connectAttr "thumb2_right.wm" "skinCluster9.ma[16]";
connectAttr "thumb_end_right.wm" "skinCluster9.ma[17]";
connectAttr "fingers1_right.wm" "skinCluster9.ma[18]";
connectAttr "fingers2_right.wm" "skinCluster9.ma[19]";
connectAttr "fingers_end_right.wm" "skinCluster9.ma[20]";
connectAttr "clavicle_left.wm" "skinCluster9.ma[21]";
connectAttr "shoulder_left.wm" "skinCluster9.ma[22]";
connectAttr "elbow_left.wm" "skinCluster9.ma[23]";
connectAttr "wrist_left.wm" "skinCluster9.ma[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.wm" "skinCluster9.ma[25]"
		;
connectAttr "index1_left.wm" "skinCluster9.ma[26]";
connectAttr "index2_left.wm" "skinCluster9.ma[27]";
connectAttr "index_end_left.wm" "skinCluster9.ma[28]";
connectAttr "thumb1_left.wm" "skinCluster9.ma[29]";
connectAttr "thumb2_left.wm" "skinCluster9.ma[30]";
connectAttr "thumb_end_left.wm" "skinCluster9.ma[31]";
connectAttr "fingers1_left.wm" "skinCluster9.ma[32]";
connectAttr "fingers2_left.wm" "skinCluster9.ma[33]";
connectAttr "fingers_end_left.wm" "skinCluster9.ma[34]";
connectAttr "hip_left.wm" "skinCluster9.ma[35]";
connectAttr "knee_left.wm" "skinCluster9.ma[36]";
connectAttr "ankle_left.wm" "skinCluster9.ma[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.wm" "skinCluster9.ma[38]"
		;
connectAttr "toe_left.wm" "skinCluster9.ma[39]";
connectAttr "hip_right.wm" "skinCluster9.ma[40]";
connectAttr "knee_right.wm" "skinCluster9.ma[41]";
connectAttr "ankle_right.wm" "skinCluster9.ma[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.wm" "skinCluster9.ma[43]"
		;
connectAttr "toe_right.wm" "skinCluster9.ma[44]";
connectAttr "god_joint.liw" "skinCluster9.lw[0]";
connectAttr "spine_1.liw" "skinCluster9.lw[1]";
connectAttr "spine_2.liw" "skinCluster9.lw[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.liw" "skinCluster9.lw[3]";
connectAttr "neck.liw" "skinCluster9.lw[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.liw" "skinCluster9.lw[5]"
		;
connectAttr "head_end.liw" "skinCluster9.lw[6]";
connectAttr "clavicle_right.liw" "skinCluster9.lw[7]";
connectAttr "shoulder_right.liw" "skinCluster9.lw[8]";
connectAttr "elbow_right.liw" "skinCluster9.lw[9]";
connectAttr "wrist_right.liw" "skinCluster9.lw[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.liw" "skinCluster9.lw[11]"
		;
connectAttr "index1_right.liw" "skinCluster9.lw[12]";
connectAttr "index2_right.liw" "skinCluster9.lw[13]";
connectAttr "index_end_right.liw" "skinCluster9.lw[14]";
connectAttr "thumb1_right.liw" "skinCluster9.lw[15]";
connectAttr "thumb2_right.liw" "skinCluster9.lw[16]";
connectAttr "thumb_end_right.liw" "skinCluster9.lw[17]";
connectAttr "fingers1_right.liw" "skinCluster9.lw[18]";
connectAttr "fingers2_right.liw" "skinCluster9.lw[19]";
connectAttr "fingers_end_right.liw" "skinCluster9.lw[20]";
connectAttr "clavicle_left.liw" "skinCluster9.lw[21]";
connectAttr "shoulder_left.liw" "skinCluster9.lw[22]";
connectAttr "elbow_left.liw" "skinCluster9.lw[23]";
connectAttr "wrist_left.liw" "skinCluster9.lw[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.liw" "skinCluster9.lw[25]"
		;
connectAttr "index1_left.liw" "skinCluster9.lw[26]";
connectAttr "index2_left.liw" "skinCluster9.lw[27]";
connectAttr "index_end_left.liw" "skinCluster9.lw[28]";
connectAttr "thumb1_left.liw" "skinCluster9.lw[29]";
connectAttr "thumb2_left.liw" "skinCluster9.lw[30]";
connectAttr "thumb_end_left.liw" "skinCluster9.lw[31]";
connectAttr "fingers1_left.liw" "skinCluster9.lw[32]";
connectAttr "fingers2_left.liw" "skinCluster9.lw[33]";
connectAttr "fingers_end_left.liw" "skinCluster9.lw[34]";
connectAttr "hip_left.liw" "skinCluster9.lw[35]";
connectAttr "knee_left.liw" "skinCluster9.lw[36]";
connectAttr "ankle_left.liw" "skinCluster9.lw[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.liw" "skinCluster9.lw[38]"
		;
connectAttr "toe_left.liw" "skinCluster9.lw[39]";
connectAttr "hip_right.liw" "skinCluster9.lw[40]";
connectAttr "knee_right.liw" "skinCluster9.lw[41]";
connectAttr "ankle_right.liw" "skinCluster9.lw[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.liw" "skinCluster9.lw[43]"
		;
connectAttr "toe_right.liw" "skinCluster9.lw[44]";
connectAttr "upperarm_rightShapeOrig.w" "groupParts25.ig";
connectAttr "groupId186.id" "groupParts25.gi";
connectAttr "groupParts27.og" "tweak9.ip[0].ig";
connectAttr "groupId188.id" "tweak9.ip[0].gi";
connectAttr "skinCluster9GroupId.msg" "skinCluster9Set.gn" -na;
connectAttr "upperarm_rightShape.iog.og[6]" "skinCluster9Set.dsm" -na;
connectAttr "skinCluster9.msg" "skinCluster9Set.ub[0]";
connectAttr "tweak9.og[0]" "skinCluster9GroupParts.ig";
connectAttr "skinCluster9GroupId.id" "skinCluster9GroupParts.gi";
connectAttr "groupId188.msg" "tweakSet9.gn" -na;
connectAttr "upperarm_rightShape.iog.og[7]" "tweakSet9.dsm" -na;
connectAttr "tweak9.msg" "tweakSet9.ub[0]";
connectAttr "groupParts25.og" "groupParts27.ig";
connectAttr "groupId188.id" "groupParts27.gi";
connectAttr "skinCluster10GroupParts.og" "skinCluster10.ip[0].ig";
connectAttr "skinCluster10GroupId.id" "skinCluster10.ip[0].gi";
connectAttr "god_joint.wm" "skinCluster10.ma[0]";
connectAttr "spine_1.wm" "skinCluster10.ma[1]";
connectAttr "spine_2.wm" "skinCluster10.ma[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.wm" "skinCluster10.ma[3]";
connectAttr "neck.wm" "skinCluster10.ma[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.wm" "skinCluster10.ma[5]"
		;
connectAttr "head_end.wm" "skinCluster10.ma[6]";
connectAttr "clavicle_right.wm" "skinCluster10.ma[7]";
connectAttr "shoulder_right.wm" "skinCluster10.ma[8]";
connectAttr "elbow_right.wm" "skinCluster10.ma[9]";
connectAttr "wrist_right.wm" "skinCluster10.ma[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.wm" "skinCluster10.ma[11]"
		;
connectAttr "index1_right.wm" "skinCluster10.ma[12]";
connectAttr "index2_right.wm" "skinCluster10.ma[13]";
connectAttr "index_end_right.wm" "skinCluster10.ma[14]";
connectAttr "thumb1_right.wm" "skinCluster10.ma[15]";
connectAttr "thumb2_right.wm" "skinCluster10.ma[16]";
connectAttr "thumb_end_right.wm" "skinCluster10.ma[17]";
connectAttr "fingers1_right.wm" "skinCluster10.ma[18]";
connectAttr "fingers2_right.wm" "skinCluster10.ma[19]";
connectAttr "fingers_end_right.wm" "skinCluster10.ma[20]";
connectAttr "clavicle_left.wm" "skinCluster10.ma[21]";
connectAttr "shoulder_left.wm" "skinCluster10.ma[22]";
connectAttr "elbow_left.wm" "skinCluster10.ma[23]";
connectAttr "wrist_left.wm" "skinCluster10.ma[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.wm" "skinCluster10.ma[25]"
		;
connectAttr "index1_left.wm" "skinCluster10.ma[26]";
connectAttr "index2_left.wm" "skinCluster10.ma[27]";
connectAttr "index_end_left.wm" "skinCluster10.ma[28]";
connectAttr "thumb1_left.wm" "skinCluster10.ma[29]";
connectAttr "thumb2_left.wm" "skinCluster10.ma[30]";
connectAttr "thumb_end_left.wm" "skinCluster10.ma[31]";
connectAttr "fingers1_left.wm" "skinCluster10.ma[32]";
connectAttr "fingers2_left.wm" "skinCluster10.ma[33]";
connectAttr "fingers_end_left.wm" "skinCluster10.ma[34]";
connectAttr "hip_left.wm" "skinCluster10.ma[35]";
connectAttr "knee_left.wm" "skinCluster10.ma[36]";
connectAttr "ankle_left.wm" "skinCluster10.ma[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.wm" "skinCluster10.ma[38]"
		;
connectAttr "toe_left.wm" "skinCluster10.ma[39]";
connectAttr "hip_right.wm" "skinCluster10.ma[40]";
connectAttr "knee_right.wm" "skinCluster10.ma[41]";
connectAttr "ankle_right.wm" "skinCluster10.ma[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.wm" "skinCluster10.ma[43]"
		;
connectAttr "toe_right.wm" "skinCluster10.ma[44]";
connectAttr "god_joint.liw" "skinCluster10.lw[0]";
connectAttr "spine_1.liw" "skinCluster10.lw[1]";
connectAttr "spine_2.liw" "skinCluster10.lw[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.liw" "skinCluster10.lw[3]"
		;
connectAttr "neck.liw" "skinCluster10.lw[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.liw" "skinCluster10.lw[5]"
		;
connectAttr "head_end.liw" "skinCluster10.lw[6]";
connectAttr "clavicle_right.liw" "skinCluster10.lw[7]";
connectAttr "shoulder_right.liw" "skinCluster10.lw[8]";
connectAttr "elbow_right.liw" "skinCluster10.lw[9]";
connectAttr "wrist_right.liw" "skinCluster10.lw[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.liw" "skinCluster10.lw[11]"
		;
connectAttr "index1_right.liw" "skinCluster10.lw[12]";
connectAttr "index2_right.liw" "skinCluster10.lw[13]";
connectAttr "index_end_right.liw" "skinCluster10.lw[14]";
connectAttr "thumb1_right.liw" "skinCluster10.lw[15]";
connectAttr "thumb2_right.liw" "skinCluster10.lw[16]";
connectAttr "thumb_end_right.liw" "skinCluster10.lw[17]";
connectAttr "fingers1_right.liw" "skinCluster10.lw[18]";
connectAttr "fingers2_right.liw" "skinCluster10.lw[19]";
connectAttr "fingers_end_right.liw" "skinCluster10.lw[20]";
connectAttr "clavicle_left.liw" "skinCluster10.lw[21]";
connectAttr "shoulder_left.liw" "skinCluster10.lw[22]";
connectAttr "elbow_left.liw" "skinCluster10.lw[23]";
connectAttr "wrist_left.liw" "skinCluster10.lw[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.liw" "skinCluster10.lw[25]"
		;
connectAttr "index1_left.liw" "skinCluster10.lw[26]";
connectAttr "index2_left.liw" "skinCluster10.lw[27]";
connectAttr "index_end_left.liw" "skinCluster10.lw[28]";
connectAttr "thumb1_left.liw" "skinCluster10.lw[29]";
connectAttr "thumb2_left.liw" "skinCluster10.lw[30]";
connectAttr "thumb_end_left.liw" "skinCluster10.lw[31]";
connectAttr "fingers1_left.liw" "skinCluster10.lw[32]";
connectAttr "fingers2_left.liw" "skinCluster10.lw[33]";
connectAttr "fingers_end_left.liw" "skinCluster10.lw[34]";
connectAttr "hip_left.liw" "skinCluster10.lw[35]";
connectAttr "knee_left.liw" "skinCluster10.lw[36]";
connectAttr "ankle_left.liw" "skinCluster10.lw[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.liw" "skinCluster10.lw[38]"
		;
connectAttr "toe_left.liw" "skinCluster10.lw[39]";
connectAttr "hip_right.liw" "skinCluster10.lw[40]";
connectAttr "knee_right.liw" "skinCluster10.lw[41]";
connectAttr "ankle_right.liw" "skinCluster10.lw[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.liw" "skinCluster10.lw[43]"
		;
connectAttr "toe_right.liw" "skinCluster10.lw[44]";
connectAttr "lowerarm_rightShapeOrig.w" "groupParts28.ig";
connectAttr "groupId189.id" "groupParts28.gi";
connectAttr "groupParts30.og" "tweak10.ip[0].ig";
connectAttr "groupId191.id" "tweak10.ip[0].gi";
connectAttr "skinCluster10GroupId.msg" "skinCluster10Set.gn" -na;
connectAttr "lowerarm_rightShape.iog.og[6]" "skinCluster10Set.dsm" -na;
connectAttr "skinCluster10.msg" "skinCluster10Set.ub[0]";
connectAttr "tweak10.og[0]" "skinCluster10GroupParts.ig";
connectAttr "skinCluster10GroupId.id" "skinCluster10GroupParts.gi";
connectAttr "groupId191.msg" "tweakSet10.gn" -na;
connectAttr "lowerarm_rightShape.iog.og[7]" "tweakSet10.dsm" -na;
connectAttr "tweak10.msg" "tweakSet10.ub[0]";
connectAttr "groupParts28.og" "groupParts30.ig";
connectAttr "groupId191.id" "groupParts30.gi";
connectAttr "skinCluster11GroupParts.og" "skinCluster11.ip[0].ig";
connectAttr "skinCluster11GroupId.id" "skinCluster11.ip[0].gi";
connectAttr "god_joint.wm" "skinCluster11.ma[0]";
connectAttr "spine_1.wm" "skinCluster11.ma[1]";
connectAttr "spine_2.wm" "skinCluster11.ma[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.wm" "skinCluster11.ma[3]";
connectAttr "neck.wm" "skinCluster11.ma[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.wm" "skinCluster11.ma[5]"
		;
connectAttr "head_end.wm" "skinCluster11.ma[6]";
connectAttr "clavicle_right.wm" "skinCluster11.ma[7]";
connectAttr "shoulder_right.wm" "skinCluster11.ma[8]";
connectAttr "elbow_right.wm" "skinCluster11.ma[9]";
connectAttr "wrist_right.wm" "skinCluster11.ma[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.wm" "skinCluster11.ma[11]"
		;
connectAttr "index1_right.wm" "skinCluster11.ma[12]";
connectAttr "index2_right.wm" "skinCluster11.ma[13]";
connectAttr "index_end_right.wm" "skinCluster11.ma[14]";
connectAttr "thumb1_right.wm" "skinCluster11.ma[15]";
connectAttr "thumb2_right.wm" "skinCluster11.ma[16]";
connectAttr "thumb_end_right.wm" "skinCluster11.ma[17]";
connectAttr "fingers1_right.wm" "skinCluster11.ma[18]";
connectAttr "fingers2_right.wm" "skinCluster11.ma[19]";
connectAttr "fingers_end_right.wm" "skinCluster11.ma[20]";
connectAttr "clavicle_left.wm" "skinCluster11.ma[21]";
connectAttr "shoulder_left.wm" "skinCluster11.ma[22]";
connectAttr "elbow_left.wm" "skinCluster11.ma[23]";
connectAttr "wrist_left.wm" "skinCluster11.ma[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.wm" "skinCluster11.ma[25]"
		;
connectAttr "index1_left.wm" "skinCluster11.ma[26]";
connectAttr "index2_left.wm" "skinCluster11.ma[27]";
connectAttr "index_end_left.wm" "skinCluster11.ma[28]";
connectAttr "thumb1_left.wm" "skinCluster11.ma[29]";
connectAttr "thumb2_left.wm" "skinCluster11.ma[30]";
connectAttr "thumb_end_left.wm" "skinCluster11.ma[31]";
connectAttr "fingers1_left.wm" "skinCluster11.ma[32]";
connectAttr "fingers2_left.wm" "skinCluster11.ma[33]";
connectAttr "fingers_end_left.wm" "skinCluster11.ma[34]";
connectAttr "hip_left.wm" "skinCluster11.ma[35]";
connectAttr "knee_left.wm" "skinCluster11.ma[36]";
connectAttr "ankle_left.wm" "skinCluster11.ma[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.wm" "skinCluster11.ma[38]"
		;
connectAttr "toe_left.wm" "skinCluster11.ma[39]";
connectAttr "hip_right.wm" "skinCluster11.ma[40]";
connectAttr "knee_right.wm" "skinCluster11.ma[41]";
connectAttr "ankle_right.wm" "skinCluster11.ma[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.wm" "skinCluster11.ma[43]"
		;
connectAttr "toe_right.wm" "skinCluster11.ma[44]";
connectAttr "god_joint.liw" "skinCluster11.lw[0]";
connectAttr "spine_1.liw" "skinCluster11.lw[1]";
connectAttr "spine_2.liw" "skinCluster11.lw[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.liw" "skinCluster11.lw[3]"
		;
connectAttr "neck.liw" "skinCluster11.lw[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.liw" "skinCluster11.lw[5]"
		;
connectAttr "head_end.liw" "skinCluster11.lw[6]";
connectAttr "clavicle_right.liw" "skinCluster11.lw[7]";
connectAttr "shoulder_right.liw" "skinCluster11.lw[8]";
connectAttr "elbow_right.liw" "skinCluster11.lw[9]";
connectAttr "wrist_right.liw" "skinCluster11.lw[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.liw" "skinCluster11.lw[11]"
		;
connectAttr "index1_right.liw" "skinCluster11.lw[12]";
connectAttr "index2_right.liw" "skinCluster11.lw[13]";
connectAttr "index_end_right.liw" "skinCluster11.lw[14]";
connectAttr "thumb1_right.liw" "skinCluster11.lw[15]";
connectAttr "thumb2_right.liw" "skinCluster11.lw[16]";
connectAttr "thumb_end_right.liw" "skinCluster11.lw[17]";
connectAttr "fingers1_right.liw" "skinCluster11.lw[18]";
connectAttr "fingers2_right.liw" "skinCluster11.lw[19]";
connectAttr "fingers_end_right.liw" "skinCluster11.lw[20]";
connectAttr "clavicle_left.liw" "skinCluster11.lw[21]";
connectAttr "shoulder_left.liw" "skinCluster11.lw[22]";
connectAttr "elbow_left.liw" "skinCluster11.lw[23]";
connectAttr "wrist_left.liw" "skinCluster11.lw[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.liw" "skinCluster11.lw[25]"
		;
connectAttr "index1_left.liw" "skinCluster11.lw[26]";
connectAttr "index2_left.liw" "skinCluster11.lw[27]";
connectAttr "index_end_left.liw" "skinCluster11.lw[28]";
connectAttr "thumb1_left.liw" "skinCluster11.lw[29]";
connectAttr "thumb2_left.liw" "skinCluster11.lw[30]";
connectAttr "thumb_end_left.liw" "skinCluster11.lw[31]";
connectAttr "fingers1_left.liw" "skinCluster11.lw[32]";
connectAttr "fingers2_left.liw" "skinCluster11.lw[33]";
connectAttr "fingers_end_left.liw" "skinCluster11.lw[34]";
connectAttr "hip_left.liw" "skinCluster11.lw[35]";
connectAttr "knee_left.liw" "skinCluster11.lw[36]";
connectAttr "ankle_left.liw" "skinCluster11.lw[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.liw" "skinCluster11.lw[38]"
		;
connectAttr "toe_left.liw" "skinCluster11.lw[39]";
connectAttr "hip_right.liw" "skinCluster11.lw[40]";
connectAttr "knee_right.liw" "skinCluster11.lw[41]";
connectAttr "ankle_right.liw" "skinCluster11.lw[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.liw" "skinCluster11.lw[43]"
		;
connectAttr "toe_right.liw" "skinCluster11.lw[44]";
connectAttr "headShapeOrig.w" "groupParts31.ig";
connectAttr "groupId192.id" "groupParts31.gi";
connectAttr "groupParts33.og" "tweak11.ip[0].ig";
connectAttr "groupId194.id" "tweak11.ip[0].gi";
connectAttr "skinCluster11GroupId.msg" "skinCluster11Set.gn" -na;
connectAttr "headShape.iog.og[4]" "skinCluster11Set.dsm" -na;
connectAttr "skinCluster11.msg" "skinCluster11Set.ub[0]";
connectAttr "tweak11.og[0]" "skinCluster11GroupParts.ig";
connectAttr "skinCluster11GroupId.id" "skinCluster11GroupParts.gi";
connectAttr "groupId194.msg" "tweakSet11.gn" -na;
connectAttr "headShape.iog.og[5]" "tweakSet11.dsm" -na;
connectAttr "tweak11.msg" "tweakSet11.ub[0]";
connectAttr "groupParts31.og" "groupParts33.ig";
connectAttr "groupId194.id" "groupParts33.gi";
connectAttr "skinCluster12GroupParts.og" "skinCluster12.ip[0].ig";
connectAttr "skinCluster12GroupId.id" "skinCluster12.ip[0].gi";
connectAttr "god_joint.wm" "skinCluster12.ma[0]";
connectAttr "spine_1.wm" "skinCluster12.ma[1]";
connectAttr "spine_2.wm" "skinCluster12.ma[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.wm" "skinCluster12.ma[3]";
connectAttr "neck.wm" "skinCluster12.ma[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.wm" "skinCluster12.ma[5]"
		;
connectAttr "head_end.wm" "skinCluster12.ma[6]";
connectAttr "clavicle_right.wm" "skinCluster12.ma[7]";
connectAttr "shoulder_right.wm" "skinCluster12.ma[8]";
connectAttr "elbow_right.wm" "skinCluster12.ma[9]";
connectAttr "wrist_right.wm" "skinCluster12.ma[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.wm" "skinCluster12.ma[11]"
		;
connectAttr "index1_right.wm" "skinCluster12.ma[12]";
connectAttr "index2_right.wm" "skinCluster12.ma[13]";
connectAttr "index_end_right.wm" "skinCluster12.ma[14]";
connectAttr "thumb1_right.wm" "skinCluster12.ma[15]";
connectAttr "thumb2_right.wm" "skinCluster12.ma[16]";
connectAttr "thumb_end_right.wm" "skinCluster12.ma[17]";
connectAttr "fingers1_right.wm" "skinCluster12.ma[18]";
connectAttr "fingers2_right.wm" "skinCluster12.ma[19]";
connectAttr "fingers_end_right.wm" "skinCluster12.ma[20]";
connectAttr "clavicle_left.wm" "skinCluster12.ma[21]";
connectAttr "shoulder_left.wm" "skinCluster12.ma[22]";
connectAttr "elbow_left.wm" "skinCluster12.ma[23]";
connectAttr "wrist_left.wm" "skinCluster12.ma[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.wm" "skinCluster12.ma[25]"
		;
connectAttr "index1_left.wm" "skinCluster12.ma[26]";
connectAttr "index2_left.wm" "skinCluster12.ma[27]";
connectAttr "index_end_left.wm" "skinCluster12.ma[28]";
connectAttr "thumb1_left.wm" "skinCluster12.ma[29]";
connectAttr "thumb2_left.wm" "skinCluster12.ma[30]";
connectAttr "thumb_end_left.wm" "skinCluster12.ma[31]";
connectAttr "fingers1_left.wm" "skinCluster12.ma[32]";
connectAttr "fingers2_left.wm" "skinCluster12.ma[33]";
connectAttr "fingers_end_left.wm" "skinCluster12.ma[34]";
connectAttr "hip_left.wm" "skinCluster12.ma[35]";
connectAttr "knee_left.wm" "skinCluster12.ma[36]";
connectAttr "ankle_left.wm" "skinCluster12.ma[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.wm" "skinCluster12.ma[38]"
		;
connectAttr "toe_left.wm" "skinCluster12.ma[39]";
connectAttr "hip_right.wm" "skinCluster12.ma[40]";
connectAttr "knee_right.wm" "skinCluster12.ma[41]";
connectAttr "ankle_right.wm" "skinCluster12.ma[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.wm" "skinCluster12.ma[43]"
		;
connectAttr "toe_right.wm" "skinCluster12.ma[44]";
connectAttr "god_joint.liw" "skinCluster12.lw[0]";
connectAttr "spine_1.liw" "skinCluster12.lw[1]";
connectAttr "spine_2.liw" "skinCluster12.lw[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.liw" "skinCluster12.lw[3]"
		;
connectAttr "neck.liw" "skinCluster12.lw[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.liw" "skinCluster12.lw[5]"
		;
connectAttr "head_end.liw" "skinCluster12.lw[6]";
connectAttr "clavicle_right.liw" "skinCluster12.lw[7]";
connectAttr "shoulder_right.liw" "skinCluster12.lw[8]";
connectAttr "elbow_right.liw" "skinCluster12.lw[9]";
connectAttr "wrist_right.liw" "skinCluster12.lw[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.liw" "skinCluster12.lw[11]"
		;
connectAttr "index1_right.liw" "skinCluster12.lw[12]";
connectAttr "index2_right.liw" "skinCluster12.lw[13]";
connectAttr "index_end_right.liw" "skinCluster12.lw[14]";
connectAttr "thumb1_right.liw" "skinCluster12.lw[15]";
connectAttr "thumb2_right.liw" "skinCluster12.lw[16]";
connectAttr "thumb_end_right.liw" "skinCluster12.lw[17]";
connectAttr "fingers1_right.liw" "skinCluster12.lw[18]";
connectAttr "fingers2_right.liw" "skinCluster12.lw[19]";
connectAttr "fingers_end_right.liw" "skinCluster12.lw[20]";
connectAttr "clavicle_left.liw" "skinCluster12.lw[21]";
connectAttr "shoulder_left.liw" "skinCluster12.lw[22]";
connectAttr "elbow_left.liw" "skinCluster12.lw[23]";
connectAttr "wrist_left.liw" "skinCluster12.lw[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.liw" "skinCluster12.lw[25]"
		;
connectAttr "index1_left.liw" "skinCluster12.lw[26]";
connectAttr "index2_left.liw" "skinCluster12.lw[27]";
connectAttr "index_end_left.liw" "skinCluster12.lw[28]";
connectAttr "thumb1_left.liw" "skinCluster12.lw[29]";
connectAttr "thumb2_left.liw" "skinCluster12.lw[30]";
connectAttr "thumb_end_left.liw" "skinCluster12.lw[31]";
connectAttr "fingers1_left.liw" "skinCluster12.lw[32]";
connectAttr "fingers2_left.liw" "skinCluster12.lw[33]";
connectAttr "fingers_end_left.liw" "skinCluster12.lw[34]";
connectAttr "hip_left.liw" "skinCluster12.lw[35]";
connectAttr "knee_left.liw" "skinCluster12.lw[36]";
connectAttr "ankle_left.liw" "skinCluster12.lw[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.liw" "skinCluster12.lw[38]"
		;
connectAttr "toe_left.liw" "skinCluster12.lw[39]";
connectAttr "hip_right.liw" "skinCluster12.lw[40]";
connectAttr "knee_right.liw" "skinCluster12.lw[41]";
connectAttr "ankle_right.liw" "skinCluster12.lw[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.liw" "skinCluster12.lw[43]"
		;
connectAttr "toe_right.liw" "skinCluster12.lw[44]";
connectAttr "thumb_leftShapeOrig.w" "groupParts34.ig";
connectAttr "groupId195.id" "groupParts34.gi";
connectAttr "groupParts36.og" "tweak12.ip[0].ig";
connectAttr "groupId197.id" "tweak12.ip[0].gi";
connectAttr "skinCluster12GroupId.msg" "skinCluster12Set.gn" -na;
connectAttr "thumb_leftShape.iog.og[4]" "skinCluster12Set.dsm" -na;
connectAttr "skinCluster12.msg" "skinCluster12Set.ub[0]";
connectAttr "tweak12.og[0]" "skinCluster12GroupParts.ig";
connectAttr "skinCluster12GroupId.id" "skinCluster12GroupParts.gi";
connectAttr "groupId197.msg" "tweakSet12.gn" -na;
connectAttr "thumb_leftShape.iog.og[5]" "tweakSet12.dsm" -na;
connectAttr "tweak12.msg" "tweakSet12.ub[0]";
connectAttr "groupParts34.og" "groupParts36.ig";
connectAttr "groupId197.id" "groupParts36.gi";
connectAttr "skinCluster13GroupParts.og" "skinCluster13.ip[0].ig";
connectAttr "skinCluster13GroupId.id" "skinCluster13.ip[0].gi";
connectAttr "god_joint.wm" "skinCluster13.ma[0]";
connectAttr "spine_1.wm" "skinCluster13.ma[1]";
connectAttr "spine_2.wm" "skinCluster13.ma[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.wm" "skinCluster13.ma[3]";
connectAttr "neck.wm" "skinCluster13.ma[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.wm" "skinCluster13.ma[5]"
		;
connectAttr "head_end.wm" "skinCluster13.ma[6]";
connectAttr "clavicle_right.wm" "skinCluster13.ma[7]";
connectAttr "shoulder_right.wm" "skinCluster13.ma[8]";
connectAttr "elbow_right.wm" "skinCluster13.ma[9]";
connectAttr "wrist_right.wm" "skinCluster13.ma[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.wm" "skinCluster13.ma[11]"
		;
connectAttr "index1_right.wm" "skinCluster13.ma[12]";
connectAttr "index2_right.wm" "skinCluster13.ma[13]";
connectAttr "index_end_right.wm" "skinCluster13.ma[14]";
connectAttr "thumb1_right.wm" "skinCluster13.ma[15]";
connectAttr "thumb2_right.wm" "skinCluster13.ma[16]";
connectAttr "thumb_end_right.wm" "skinCluster13.ma[17]";
connectAttr "fingers1_right.wm" "skinCluster13.ma[18]";
connectAttr "fingers2_right.wm" "skinCluster13.ma[19]";
connectAttr "fingers_end_right.wm" "skinCluster13.ma[20]";
connectAttr "clavicle_left.wm" "skinCluster13.ma[21]";
connectAttr "shoulder_left.wm" "skinCluster13.ma[22]";
connectAttr "elbow_left.wm" "skinCluster13.ma[23]";
connectAttr "wrist_left.wm" "skinCluster13.ma[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.wm" "skinCluster13.ma[25]"
		;
connectAttr "index1_left.wm" "skinCluster13.ma[26]";
connectAttr "index2_left.wm" "skinCluster13.ma[27]";
connectAttr "index_end_left.wm" "skinCluster13.ma[28]";
connectAttr "thumb1_left.wm" "skinCluster13.ma[29]";
connectAttr "thumb2_left.wm" "skinCluster13.ma[30]";
connectAttr "thumb_end_left.wm" "skinCluster13.ma[31]";
connectAttr "fingers1_left.wm" "skinCluster13.ma[32]";
connectAttr "fingers2_left.wm" "skinCluster13.ma[33]";
connectAttr "fingers_end_left.wm" "skinCluster13.ma[34]";
connectAttr "hip_left.wm" "skinCluster13.ma[35]";
connectAttr "knee_left.wm" "skinCluster13.ma[36]";
connectAttr "ankle_left.wm" "skinCluster13.ma[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.wm" "skinCluster13.ma[38]"
		;
connectAttr "toe_left.wm" "skinCluster13.ma[39]";
connectAttr "hip_right.wm" "skinCluster13.ma[40]";
connectAttr "knee_right.wm" "skinCluster13.ma[41]";
connectAttr "ankle_right.wm" "skinCluster13.ma[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.wm" "skinCluster13.ma[43]"
		;
connectAttr "toe_right.wm" "skinCluster13.ma[44]";
connectAttr "god_joint.liw" "skinCluster13.lw[0]";
connectAttr "spine_1.liw" "skinCluster13.lw[1]";
connectAttr "spine_2.liw" "skinCluster13.lw[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.liw" "skinCluster13.lw[3]"
		;
connectAttr "neck.liw" "skinCluster13.lw[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.liw" "skinCluster13.lw[5]"
		;
connectAttr "head_end.liw" "skinCluster13.lw[6]";
connectAttr "clavicle_right.liw" "skinCluster13.lw[7]";
connectAttr "shoulder_right.liw" "skinCluster13.lw[8]";
connectAttr "elbow_right.liw" "skinCluster13.lw[9]";
connectAttr "wrist_right.liw" "skinCluster13.lw[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.liw" "skinCluster13.lw[11]"
		;
connectAttr "index1_right.liw" "skinCluster13.lw[12]";
connectAttr "index2_right.liw" "skinCluster13.lw[13]";
connectAttr "index_end_right.liw" "skinCluster13.lw[14]";
connectAttr "thumb1_right.liw" "skinCluster13.lw[15]";
connectAttr "thumb2_right.liw" "skinCluster13.lw[16]";
connectAttr "thumb_end_right.liw" "skinCluster13.lw[17]";
connectAttr "fingers1_right.liw" "skinCluster13.lw[18]";
connectAttr "fingers2_right.liw" "skinCluster13.lw[19]";
connectAttr "fingers_end_right.liw" "skinCluster13.lw[20]";
connectAttr "clavicle_left.liw" "skinCluster13.lw[21]";
connectAttr "shoulder_left.liw" "skinCluster13.lw[22]";
connectAttr "elbow_left.liw" "skinCluster13.lw[23]";
connectAttr "wrist_left.liw" "skinCluster13.lw[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.liw" "skinCluster13.lw[25]"
		;
connectAttr "index1_left.liw" "skinCluster13.lw[26]";
connectAttr "index2_left.liw" "skinCluster13.lw[27]";
connectAttr "index_end_left.liw" "skinCluster13.lw[28]";
connectAttr "thumb1_left.liw" "skinCluster13.lw[29]";
connectAttr "thumb2_left.liw" "skinCluster13.lw[30]";
connectAttr "thumb_end_left.liw" "skinCluster13.lw[31]";
connectAttr "fingers1_left.liw" "skinCluster13.lw[32]";
connectAttr "fingers2_left.liw" "skinCluster13.lw[33]";
connectAttr "fingers_end_left.liw" "skinCluster13.lw[34]";
connectAttr "hip_left.liw" "skinCluster13.lw[35]";
connectAttr "knee_left.liw" "skinCluster13.lw[36]";
connectAttr "ankle_left.liw" "skinCluster13.lw[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.liw" "skinCluster13.lw[38]"
		;
connectAttr "toe_left.liw" "skinCluster13.lw[39]";
connectAttr "hip_right.liw" "skinCluster13.lw[40]";
connectAttr "knee_right.liw" "skinCluster13.lw[41]";
connectAttr "ankle_right.liw" "skinCluster13.lw[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.liw" "skinCluster13.lw[43]"
		;
connectAttr "toe_right.liw" "skinCluster13.lw[44]";
connectAttr "index_leftShapeOrig.w" "groupParts37.ig";
connectAttr "groupId198.id" "groupParts37.gi";
connectAttr "groupParts39.og" "tweak13.ip[0].ig";
connectAttr "groupId200.id" "tweak13.ip[0].gi";
connectAttr "skinCluster13GroupId.msg" "skinCluster13Set.gn" -na;
connectAttr "index_leftShape.iog.og[4]" "skinCluster13Set.dsm" -na;
connectAttr "skinCluster13.msg" "skinCluster13Set.ub[0]";
connectAttr "tweak13.og[0]" "skinCluster13GroupParts.ig";
connectAttr "skinCluster13GroupId.id" "skinCluster13GroupParts.gi";
connectAttr "groupId200.msg" "tweakSet13.gn" -na;
connectAttr "index_leftShape.iog.og[5]" "tweakSet13.dsm" -na;
connectAttr "tweak13.msg" "tweakSet13.ub[0]";
connectAttr "groupParts37.og" "groupParts39.ig";
connectAttr "groupId200.id" "groupParts39.gi";
connectAttr "skinCluster14GroupParts.og" "skinCluster14.ip[0].ig";
connectAttr "skinCluster14GroupId.id" "skinCluster14.ip[0].gi";
connectAttr "god_joint.wm" "skinCluster14.ma[0]";
connectAttr "spine_1.wm" "skinCluster14.ma[1]";
connectAttr "spine_2.wm" "skinCluster14.ma[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.wm" "skinCluster14.ma[3]";
connectAttr "neck.wm" "skinCluster14.ma[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.wm" "skinCluster14.ma[5]"
		;
connectAttr "head_end.wm" "skinCluster14.ma[6]";
connectAttr "clavicle_right.wm" "skinCluster14.ma[7]";
connectAttr "shoulder_right.wm" "skinCluster14.ma[8]";
connectAttr "elbow_right.wm" "skinCluster14.ma[9]";
connectAttr "wrist_right.wm" "skinCluster14.ma[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.wm" "skinCluster14.ma[11]"
		;
connectAttr "index1_right.wm" "skinCluster14.ma[12]";
connectAttr "index2_right.wm" "skinCluster14.ma[13]";
connectAttr "index_end_right.wm" "skinCluster14.ma[14]";
connectAttr "thumb1_right.wm" "skinCluster14.ma[15]";
connectAttr "thumb2_right.wm" "skinCluster14.ma[16]";
connectAttr "thumb_end_right.wm" "skinCluster14.ma[17]";
connectAttr "fingers1_right.wm" "skinCluster14.ma[18]";
connectAttr "fingers2_right.wm" "skinCluster14.ma[19]";
connectAttr "fingers_end_right.wm" "skinCluster14.ma[20]";
connectAttr "clavicle_left.wm" "skinCluster14.ma[21]";
connectAttr "shoulder_left.wm" "skinCluster14.ma[22]";
connectAttr "elbow_left.wm" "skinCluster14.ma[23]";
connectAttr "wrist_left.wm" "skinCluster14.ma[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.wm" "skinCluster14.ma[25]"
		;
connectAttr "index1_left.wm" "skinCluster14.ma[26]";
connectAttr "index2_left.wm" "skinCluster14.ma[27]";
connectAttr "index_end_left.wm" "skinCluster14.ma[28]";
connectAttr "thumb1_left.wm" "skinCluster14.ma[29]";
connectAttr "thumb2_left.wm" "skinCluster14.ma[30]";
connectAttr "thumb_end_left.wm" "skinCluster14.ma[31]";
connectAttr "fingers1_left.wm" "skinCluster14.ma[32]";
connectAttr "fingers2_left.wm" "skinCluster14.ma[33]";
connectAttr "fingers_end_left.wm" "skinCluster14.ma[34]";
connectAttr "hip_left.wm" "skinCluster14.ma[35]";
connectAttr "knee_left.wm" "skinCluster14.ma[36]";
connectAttr "ankle_left.wm" "skinCluster14.ma[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.wm" "skinCluster14.ma[38]"
		;
connectAttr "toe_left.wm" "skinCluster14.ma[39]";
connectAttr "hip_right.wm" "skinCluster14.ma[40]";
connectAttr "knee_right.wm" "skinCluster14.ma[41]";
connectAttr "ankle_right.wm" "skinCluster14.ma[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.wm" "skinCluster14.ma[43]"
		;
connectAttr "toe_right.wm" "skinCluster14.ma[44]";
connectAttr "god_joint.liw" "skinCluster14.lw[0]";
connectAttr "spine_1.liw" "skinCluster14.lw[1]";
connectAttr "spine_2.liw" "skinCluster14.lw[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.liw" "skinCluster14.lw[3]"
		;
connectAttr "neck.liw" "skinCluster14.lw[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.liw" "skinCluster14.lw[5]"
		;
connectAttr "head_end.liw" "skinCluster14.lw[6]";
connectAttr "clavicle_right.liw" "skinCluster14.lw[7]";
connectAttr "shoulder_right.liw" "skinCluster14.lw[8]";
connectAttr "elbow_right.liw" "skinCluster14.lw[9]";
connectAttr "wrist_right.liw" "skinCluster14.lw[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.liw" "skinCluster14.lw[11]"
		;
connectAttr "index1_right.liw" "skinCluster14.lw[12]";
connectAttr "index2_right.liw" "skinCluster14.lw[13]";
connectAttr "index_end_right.liw" "skinCluster14.lw[14]";
connectAttr "thumb1_right.liw" "skinCluster14.lw[15]";
connectAttr "thumb2_right.liw" "skinCluster14.lw[16]";
connectAttr "thumb_end_right.liw" "skinCluster14.lw[17]";
connectAttr "fingers1_right.liw" "skinCluster14.lw[18]";
connectAttr "fingers2_right.liw" "skinCluster14.lw[19]";
connectAttr "fingers_end_right.liw" "skinCluster14.lw[20]";
connectAttr "clavicle_left.liw" "skinCluster14.lw[21]";
connectAttr "shoulder_left.liw" "skinCluster14.lw[22]";
connectAttr "elbow_left.liw" "skinCluster14.lw[23]";
connectAttr "wrist_left.liw" "skinCluster14.lw[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.liw" "skinCluster14.lw[25]"
		;
connectAttr "index1_left.liw" "skinCluster14.lw[26]";
connectAttr "index2_left.liw" "skinCluster14.lw[27]";
connectAttr "index_end_left.liw" "skinCluster14.lw[28]";
connectAttr "thumb1_left.liw" "skinCluster14.lw[29]";
connectAttr "thumb2_left.liw" "skinCluster14.lw[30]";
connectAttr "thumb_end_left.liw" "skinCluster14.lw[31]";
connectAttr "fingers1_left.liw" "skinCluster14.lw[32]";
connectAttr "fingers2_left.liw" "skinCluster14.lw[33]";
connectAttr "fingers_end_left.liw" "skinCluster14.lw[34]";
connectAttr "hip_left.liw" "skinCluster14.lw[35]";
connectAttr "knee_left.liw" "skinCluster14.lw[36]";
connectAttr "ankle_left.liw" "skinCluster14.lw[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.liw" "skinCluster14.lw[38]"
		;
connectAttr "toe_left.liw" "skinCluster14.lw[39]";
connectAttr "hip_right.liw" "skinCluster14.lw[40]";
connectAttr "knee_right.liw" "skinCluster14.lw[41]";
connectAttr "ankle_right.liw" "skinCluster14.lw[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.liw" "skinCluster14.lw[43]"
		;
connectAttr "toe_right.liw" "skinCluster14.lw[44]";
connectAttr "hand_leftShapeOrig.w" "groupParts40.ig";
connectAttr "groupId201.id" "groupParts40.gi";
connectAttr "groupParts42.og" "tweak14.ip[0].ig";
connectAttr "groupId203.id" "tweak14.ip[0].gi";
connectAttr "skinCluster14GroupId.msg" "skinCluster14Set.gn" -na;
connectAttr "hand_leftShape.iog.og[4]" "skinCluster14Set.dsm" -na;
connectAttr "skinCluster14.msg" "skinCluster14Set.ub[0]";
connectAttr "tweak14.og[0]" "skinCluster14GroupParts.ig";
connectAttr "skinCluster14GroupId.id" "skinCluster14GroupParts.gi";
connectAttr "groupId203.msg" "tweakSet14.gn" -na;
connectAttr "hand_leftShape.iog.og[5]" "tweakSet14.dsm" -na;
connectAttr "tweak14.msg" "tweakSet14.ub[0]";
connectAttr "groupParts40.og" "groupParts42.ig";
connectAttr "groupId203.id" "groupParts42.gi";
connectAttr "skinCluster15GroupParts.og" "skinCluster15.ip[0].ig";
connectAttr "skinCluster15GroupId.id" "skinCluster15.ip[0].gi";
connectAttr "god_joint.wm" "skinCluster15.ma[0]";
connectAttr "spine_1.wm" "skinCluster15.ma[1]";
connectAttr "spine_2.wm" "skinCluster15.ma[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.wm" "skinCluster15.ma[3]";
connectAttr "neck.wm" "skinCluster15.ma[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.wm" "skinCluster15.ma[5]"
		;
connectAttr "head_end.wm" "skinCluster15.ma[6]";
connectAttr "clavicle_right.wm" "skinCluster15.ma[7]";
connectAttr "shoulder_right.wm" "skinCluster15.ma[8]";
connectAttr "elbow_right.wm" "skinCluster15.ma[9]";
connectAttr "wrist_right.wm" "skinCluster15.ma[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.wm" "skinCluster15.ma[11]"
		;
connectAttr "index1_right.wm" "skinCluster15.ma[12]";
connectAttr "index2_right.wm" "skinCluster15.ma[13]";
connectAttr "index_end_right.wm" "skinCluster15.ma[14]";
connectAttr "thumb1_right.wm" "skinCluster15.ma[15]";
connectAttr "thumb2_right.wm" "skinCluster15.ma[16]";
connectAttr "thumb_end_right.wm" "skinCluster15.ma[17]";
connectAttr "fingers1_right.wm" "skinCluster15.ma[18]";
connectAttr "fingers2_right.wm" "skinCluster15.ma[19]";
connectAttr "fingers_end_right.wm" "skinCluster15.ma[20]";
connectAttr "clavicle_left.wm" "skinCluster15.ma[21]";
connectAttr "shoulder_left.wm" "skinCluster15.ma[22]";
connectAttr "elbow_left.wm" "skinCluster15.ma[23]";
connectAttr "wrist_left.wm" "skinCluster15.ma[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.wm" "skinCluster15.ma[25]"
		;
connectAttr "index1_left.wm" "skinCluster15.ma[26]";
connectAttr "index2_left.wm" "skinCluster15.ma[27]";
connectAttr "index_end_left.wm" "skinCluster15.ma[28]";
connectAttr "thumb1_left.wm" "skinCluster15.ma[29]";
connectAttr "thumb2_left.wm" "skinCluster15.ma[30]";
connectAttr "thumb_end_left.wm" "skinCluster15.ma[31]";
connectAttr "fingers1_left.wm" "skinCluster15.ma[32]";
connectAttr "fingers2_left.wm" "skinCluster15.ma[33]";
connectAttr "fingers_end_left.wm" "skinCluster15.ma[34]";
connectAttr "hip_left.wm" "skinCluster15.ma[35]";
connectAttr "knee_left.wm" "skinCluster15.ma[36]";
connectAttr "ankle_left.wm" "skinCluster15.ma[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.wm" "skinCluster15.ma[38]"
		;
connectAttr "toe_left.wm" "skinCluster15.ma[39]";
connectAttr "hip_right.wm" "skinCluster15.ma[40]";
connectAttr "knee_right.wm" "skinCluster15.ma[41]";
connectAttr "ankle_right.wm" "skinCluster15.ma[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.wm" "skinCluster15.ma[43]"
		;
connectAttr "toe_right.wm" "skinCluster15.ma[44]";
connectAttr "god_joint.liw" "skinCluster15.lw[0]";
connectAttr "spine_1.liw" "skinCluster15.lw[1]";
connectAttr "spine_2.liw" "skinCluster15.lw[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.liw" "skinCluster15.lw[3]"
		;
connectAttr "neck.liw" "skinCluster15.lw[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.liw" "skinCluster15.lw[5]"
		;
connectAttr "head_end.liw" "skinCluster15.lw[6]";
connectAttr "clavicle_right.liw" "skinCluster15.lw[7]";
connectAttr "shoulder_right.liw" "skinCluster15.lw[8]";
connectAttr "elbow_right.liw" "skinCluster15.lw[9]";
connectAttr "wrist_right.liw" "skinCluster15.lw[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.liw" "skinCluster15.lw[11]"
		;
connectAttr "index1_right.liw" "skinCluster15.lw[12]";
connectAttr "index2_right.liw" "skinCluster15.lw[13]";
connectAttr "index_end_right.liw" "skinCluster15.lw[14]";
connectAttr "thumb1_right.liw" "skinCluster15.lw[15]";
connectAttr "thumb2_right.liw" "skinCluster15.lw[16]";
connectAttr "thumb_end_right.liw" "skinCluster15.lw[17]";
connectAttr "fingers1_right.liw" "skinCluster15.lw[18]";
connectAttr "fingers2_right.liw" "skinCluster15.lw[19]";
connectAttr "fingers_end_right.liw" "skinCluster15.lw[20]";
connectAttr "clavicle_left.liw" "skinCluster15.lw[21]";
connectAttr "shoulder_left.liw" "skinCluster15.lw[22]";
connectAttr "elbow_left.liw" "skinCluster15.lw[23]";
connectAttr "wrist_left.liw" "skinCluster15.lw[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.liw" "skinCluster15.lw[25]"
		;
connectAttr "index1_left.liw" "skinCluster15.lw[26]";
connectAttr "index2_left.liw" "skinCluster15.lw[27]";
connectAttr "index_end_left.liw" "skinCluster15.lw[28]";
connectAttr "thumb1_left.liw" "skinCluster15.lw[29]";
connectAttr "thumb2_left.liw" "skinCluster15.lw[30]";
connectAttr "thumb_end_left.liw" "skinCluster15.lw[31]";
connectAttr "fingers1_left.liw" "skinCluster15.lw[32]";
connectAttr "fingers2_left.liw" "skinCluster15.lw[33]";
connectAttr "fingers_end_left.liw" "skinCluster15.lw[34]";
connectAttr "hip_left.liw" "skinCluster15.lw[35]";
connectAttr "knee_left.liw" "skinCluster15.lw[36]";
connectAttr "ankle_left.liw" "skinCluster15.lw[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.liw" "skinCluster15.lw[38]"
		;
connectAttr "toe_left.liw" "skinCluster15.lw[39]";
connectAttr "hip_right.liw" "skinCluster15.lw[40]";
connectAttr "knee_right.liw" "skinCluster15.lw[41]";
connectAttr "ankle_right.liw" "skinCluster15.lw[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.liw" "skinCluster15.lw[43]"
		;
connectAttr "toe_right.liw" "skinCluster15.lw[44]";
connectAttr "fingers_leftShapeOrig.w" "groupParts43.ig";
connectAttr "groupId204.id" "groupParts43.gi";
connectAttr "groupParts45.og" "tweak15.ip[0].ig";
connectAttr "groupId206.id" "tweak15.ip[0].gi";
connectAttr "skinCluster15GroupId.msg" "skinCluster15Set.gn" -na;
connectAttr "fingers_leftShape.iog.og[4]" "skinCluster15Set.dsm" -na;
connectAttr "skinCluster15.msg" "skinCluster15Set.ub[0]";
connectAttr "tweak15.og[0]" "skinCluster15GroupParts.ig";
connectAttr "skinCluster15GroupId.id" "skinCluster15GroupParts.gi";
connectAttr "groupId206.msg" "tweakSet15.gn" -na;
connectAttr "fingers_leftShape.iog.og[5]" "tweakSet15.dsm" -na;
connectAttr "tweak15.msg" "tweakSet15.ub[0]";
connectAttr "groupParts43.og" "groupParts45.ig";
connectAttr "groupId206.id" "groupParts45.gi";
connectAttr "skinCluster16GroupParts.og" "skinCluster16.ip[0].ig";
connectAttr "skinCluster16GroupId.id" "skinCluster16.ip[0].gi";
connectAttr "god_joint.wm" "skinCluster16.ma[0]";
connectAttr "spine_1.wm" "skinCluster16.ma[1]";
connectAttr "spine_2.wm" "skinCluster16.ma[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.wm" "skinCluster16.ma[3]";
connectAttr "neck.wm" "skinCluster16.ma[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.wm" "skinCluster16.ma[5]"
		;
connectAttr "head_end.wm" "skinCluster16.ma[6]";
connectAttr "clavicle_right.wm" "skinCluster16.ma[7]";
connectAttr "shoulder_right.wm" "skinCluster16.ma[8]";
connectAttr "elbow_right.wm" "skinCluster16.ma[9]";
connectAttr "wrist_right.wm" "skinCluster16.ma[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.wm" "skinCluster16.ma[11]"
		;
connectAttr "index1_right.wm" "skinCluster16.ma[12]";
connectAttr "index2_right.wm" "skinCluster16.ma[13]";
connectAttr "index_end_right.wm" "skinCluster16.ma[14]";
connectAttr "thumb1_right.wm" "skinCluster16.ma[15]";
connectAttr "thumb2_right.wm" "skinCluster16.ma[16]";
connectAttr "thumb_end_right.wm" "skinCluster16.ma[17]";
connectAttr "fingers1_right.wm" "skinCluster16.ma[18]";
connectAttr "fingers2_right.wm" "skinCluster16.ma[19]";
connectAttr "fingers_end_right.wm" "skinCluster16.ma[20]";
connectAttr "clavicle_left.wm" "skinCluster16.ma[21]";
connectAttr "shoulder_left.wm" "skinCluster16.ma[22]";
connectAttr "elbow_left.wm" "skinCluster16.ma[23]";
connectAttr "wrist_left.wm" "skinCluster16.ma[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.wm" "skinCluster16.ma[25]"
		;
connectAttr "index1_left.wm" "skinCluster16.ma[26]";
connectAttr "index2_left.wm" "skinCluster16.ma[27]";
connectAttr "index_end_left.wm" "skinCluster16.ma[28]";
connectAttr "thumb1_left.wm" "skinCluster16.ma[29]";
connectAttr "thumb2_left.wm" "skinCluster16.ma[30]";
connectAttr "thumb_end_left.wm" "skinCluster16.ma[31]";
connectAttr "fingers1_left.wm" "skinCluster16.ma[32]";
connectAttr "fingers2_left.wm" "skinCluster16.ma[33]";
connectAttr "fingers_end_left.wm" "skinCluster16.ma[34]";
connectAttr "hip_left.wm" "skinCluster16.ma[35]";
connectAttr "knee_left.wm" "skinCluster16.ma[36]";
connectAttr "ankle_left.wm" "skinCluster16.ma[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.wm" "skinCluster16.ma[38]"
		;
connectAttr "toe_left.wm" "skinCluster16.ma[39]";
connectAttr "hip_right.wm" "skinCluster16.ma[40]";
connectAttr "knee_right.wm" "skinCluster16.ma[41]";
connectAttr "ankle_right.wm" "skinCluster16.ma[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.wm" "skinCluster16.ma[43]"
		;
connectAttr "toe_right.wm" "skinCluster16.ma[44]";
connectAttr "god_joint.liw" "skinCluster16.lw[0]";
connectAttr "spine_1.liw" "skinCluster16.lw[1]";
connectAttr "spine_2.liw" "skinCluster16.lw[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.liw" "skinCluster16.lw[3]"
		;
connectAttr "neck.liw" "skinCluster16.lw[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.liw" "skinCluster16.lw[5]"
		;
connectAttr "head_end.liw" "skinCluster16.lw[6]";
connectAttr "clavicle_right.liw" "skinCluster16.lw[7]";
connectAttr "shoulder_right.liw" "skinCluster16.lw[8]";
connectAttr "elbow_right.liw" "skinCluster16.lw[9]";
connectAttr "wrist_right.liw" "skinCluster16.lw[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.liw" "skinCluster16.lw[11]"
		;
connectAttr "index1_right.liw" "skinCluster16.lw[12]";
connectAttr "index2_right.liw" "skinCluster16.lw[13]";
connectAttr "index_end_right.liw" "skinCluster16.lw[14]";
connectAttr "thumb1_right.liw" "skinCluster16.lw[15]";
connectAttr "thumb2_right.liw" "skinCluster16.lw[16]";
connectAttr "thumb_end_right.liw" "skinCluster16.lw[17]";
connectAttr "fingers1_right.liw" "skinCluster16.lw[18]";
connectAttr "fingers2_right.liw" "skinCluster16.lw[19]";
connectAttr "fingers_end_right.liw" "skinCluster16.lw[20]";
connectAttr "clavicle_left.liw" "skinCluster16.lw[21]";
connectAttr "shoulder_left.liw" "skinCluster16.lw[22]";
connectAttr "elbow_left.liw" "skinCluster16.lw[23]";
connectAttr "wrist_left.liw" "skinCluster16.lw[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.liw" "skinCluster16.lw[25]"
		;
connectAttr "index1_left.liw" "skinCluster16.lw[26]";
connectAttr "index2_left.liw" "skinCluster16.lw[27]";
connectAttr "index_end_left.liw" "skinCluster16.lw[28]";
connectAttr "thumb1_left.liw" "skinCluster16.lw[29]";
connectAttr "thumb2_left.liw" "skinCluster16.lw[30]";
connectAttr "thumb_end_left.liw" "skinCluster16.lw[31]";
connectAttr "fingers1_left.liw" "skinCluster16.lw[32]";
connectAttr "fingers2_left.liw" "skinCluster16.lw[33]";
connectAttr "fingers_end_left.liw" "skinCluster16.lw[34]";
connectAttr "hip_left.liw" "skinCluster16.lw[35]";
connectAttr "knee_left.liw" "skinCluster16.lw[36]";
connectAttr "ankle_left.liw" "skinCluster16.lw[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.liw" "skinCluster16.lw[38]"
		;
connectAttr "toe_left.liw" "skinCluster16.lw[39]";
connectAttr "hip_right.liw" "skinCluster16.lw[40]";
connectAttr "knee_right.liw" "skinCluster16.lw[41]";
connectAttr "ankle_right.liw" "skinCluster16.lw[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.liw" "skinCluster16.lw[43]"
		;
connectAttr "toe_right.liw" "skinCluster16.lw[44]";
connectAttr "thumb_rightShape43Orig.w" "groupParts46.ig";
connectAttr "groupId207.id" "groupParts46.gi";
connectAttr "groupParts48.og" "tweak16.ip[0].ig";
connectAttr "groupId209.id" "tweak16.ip[0].gi";
connectAttr "skinCluster16GroupId.msg" "skinCluster16Set.gn" -na;
connectAttr "thumb_rightShape.iog.og[4]" "skinCluster16Set.dsm" -na;
connectAttr "skinCluster16.msg" "skinCluster16Set.ub[0]";
connectAttr "tweak16.og[0]" "skinCluster16GroupParts.ig";
connectAttr "skinCluster16GroupId.id" "skinCluster16GroupParts.gi";
connectAttr "groupId209.msg" "tweakSet16.gn" -na;
connectAttr "thumb_rightShape.iog.og[5]" "tweakSet16.dsm" -na;
connectAttr "tweak16.msg" "tweakSet16.ub[0]";
connectAttr "groupParts46.og" "groupParts48.ig";
connectAttr "groupId209.id" "groupParts48.gi";
connectAttr "skinCluster17GroupParts.og" "skinCluster17.ip[0].ig";
connectAttr "skinCluster17GroupId.id" "skinCluster17.ip[0].gi";
connectAttr "god_joint.wm" "skinCluster17.ma[0]";
connectAttr "spine_1.wm" "skinCluster17.ma[1]";
connectAttr "spine_2.wm" "skinCluster17.ma[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.wm" "skinCluster17.ma[3]";
connectAttr "neck.wm" "skinCluster17.ma[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.wm" "skinCluster17.ma[5]"
		;
connectAttr "head_end.wm" "skinCluster17.ma[6]";
connectAttr "clavicle_right.wm" "skinCluster17.ma[7]";
connectAttr "shoulder_right.wm" "skinCluster17.ma[8]";
connectAttr "elbow_right.wm" "skinCluster17.ma[9]";
connectAttr "wrist_right.wm" "skinCluster17.ma[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.wm" "skinCluster17.ma[11]"
		;
connectAttr "index1_right.wm" "skinCluster17.ma[12]";
connectAttr "index2_right.wm" "skinCluster17.ma[13]";
connectAttr "index_end_right.wm" "skinCluster17.ma[14]";
connectAttr "thumb1_right.wm" "skinCluster17.ma[15]";
connectAttr "thumb2_right.wm" "skinCluster17.ma[16]";
connectAttr "thumb_end_right.wm" "skinCluster17.ma[17]";
connectAttr "fingers1_right.wm" "skinCluster17.ma[18]";
connectAttr "fingers2_right.wm" "skinCluster17.ma[19]";
connectAttr "fingers_end_right.wm" "skinCluster17.ma[20]";
connectAttr "clavicle_left.wm" "skinCluster17.ma[21]";
connectAttr "shoulder_left.wm" "skinCluster17.ma[22]";
connectAttr "elbow_left.wm" "skinCluster17.ma[23]";
connectAttr "wrist_left.wm" "skinCluster17.ma[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.wm" "skinCluster17.ma[25]"
		;
connectAttr "index1_left.wm" "skinCluster17.ma[26]";
connectAttr "index2_left.wm" "skinCluster17.ma[27]";
connectAttr "index_end_left.wm" "skinCluster17.ma[28]";
connectAttr "thumb1_left.wm" "skinCluster17.ma[29]";
connectAttr "thumb2_left.wm" "skinCluster17.ma[30]";
connectAttr "thumb_end_left.wm" "skinCluster17.ma[31]";
connectAttr "fingers1_left.wm" "skinCluster17.ma[32]";
connectAttr "fingers2_left.wm" "skinCluster17.ma[33]";
connectAttr "fingers_end_left.wm" "skinCluster17.ma[34]";
connectAttr "hip_left.wm" "skinCluster17.ma[35]";
connectAttr "knee_left.wm" "skinCluster17.ma[36]";
connectAttr "ankle_left.wm" "skinCluster17.ma[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.wm" "skinCluster17.ma[38]"
		;
connectAttr "toe_left.wm" "skinCluster17.ma[39]";
connectAttr "hip_right.wm" "skinCluster17.ma[40]";
connectAttr "knee_right.wm" "skinCluster17.ma[41]";
connectAttr "ankle_right.wm" "skinCluster17.ma[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.wm" "skinCluster17.ma[43]"
		;
connectAttr "toe_right.wm" "skinCluster17.ma[44]";
connectAttr "god_joint.liw" "skinCluster17.lw[0]";
connectAttr "spine_1.liw" "skinCluster17.lw[1]";
connectAttr "spine_2.liw" "skinCluster17.lw[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.liw" "skinCluster17.lw[3]"
		;
connectAttr "neck.liw" "skinCluster17.lw[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.liw" "skinCluster17.lw[5]"
		;
connectAttr "head_end.liw" "skinCluster17.lw[6]";
connectAttr "clavicle_right.liw" "skinCluster17.lw[7]";
connectAttr "shoulder_right.liw" "skinCluster17.lw[8]";
connectAttr "elbow_right.liw" "skinCluster17.lw[9]";
connectAttr "wrist_right.liw" "skinCluster17.lw[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.liw" "skinCluster17.lw[11]"
		;
connectAttr "index1_right.liw" "skinCluster17.lw[12]";
connectAttr "index2_right.liw" "skinCluster17.lw[13]";
connectAttr "index_end_right.liw" "skinCluster17.lw[14]";
connectAttr "thumb1_right.liw" "skinCluster17.lw[15]";
connectAttr "thumb2_right.liw" "skinCluster17.lw[16]";
connectAttr "thumb_end_right.liw" "skinCluster17.lw[17]";
connectAttr "fingers1_right.liw" "skinCluster17.lw[18]";
connectAttr "fingers2_right.liw" "skinCluster17.lw[19]";
connectAttr "fingers_end_right.liw" "skinCluster17.lw[20]";
connectAttr "clavicle_left.liw" "skinCluster17.lw[21]";
connectAttr "shoulder_left.liw" "skinCluster17.lw[22]";
connectAttr "elbow_left.liw" "skinCluster17.lw[23]";
connectAttr "wrist_left.liw" "skinCluster17.lw[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.liw" "skinCluster17.lw[25]"
		;
connectAttr "index1_left.liw" "skinCluster17.lw[26]";
connectAttr "index2_left.liw" "skinCluster17.lw[27]";
connectAttr "index_end_left.liw" "skinCluster17.lw[28]";
connectAttr "thumb1_left.liw" "skinCluster17.lw[29]";
connectAttr "thumb2_left.liw" "skinCluster17.lw[30]";
connectAttr "thumb_end_left.liw" "skinCluster17.lw[31]";
connectAttr "fingers1_left.liw" "skinCluster17.lw[32]";
connectAttr "fingers2_left.liw" "skinCluster17.lw[33]";
connectAttr "fingers_end_left.liw" "skinCluster17.lw[34]";
connectAttr "hip_left.liw" "skinCluster17.lw[35]";
connectAttr "knee_left.liw" "skinCluster17.lw[36]";
connectAttr "ankle_left.liw" "skinCluster17.lw[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.liw" "skinCluster17.lw[38]"
		;
connectAttr "toe_left.liw" "skinCluster17.lw[39]";
connectAttr "hip_right.liw" "skinCluster17.lw[40]";
connectAttr "knee_right.liw" "skinCluster17.lw[41]";
connectAttr "ankle_right.liw" "skinCluster17.lw[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.liw" "skinCluster17.lw[43]"
		;
connectAttr "toe_right.liw" "skinCluster17.lw[44]";
connectAttr "index_rightShapeOrig.w" "groupParts49.ig";
connectAttr "groupId210.id" "groupParts49.gi";
connectAttr "groupParts51.og" "tweak17.ip[0].ig";
connectAttr "groupId212.id" "tweak17.ip[0].gi";
connectAttr "skinCluster17GroupId.msg" "skinCluster17Set.gn" -na;
connectAttr "index_rightShape.iog.og[4]" "skinCluster17Set.dsm" -na;
connectAttr "skinCluster17.msg" "skinCluster17Set.ub[0]";
connectAttr "tweak17.og[0]" "skinCluster17GroupParts.ig";
connectAttr "skinCluster17GroupId.id" "skinCluster17GroupParts.gi";
connectAttr "groupId212.msg" "tweakSet17.gn" -na;
connectAttr "index_rightShape.iog.og[5]" "tweakSet17.dsm" -na;
connectAttr "tweak17.msg" "tweakSet17.ub[0]";
connectAttr "groupParts49.og" "groupParts51.ig";
connectAttr "groupId212.id" "groupParts51.gi";
connectAttr "skinCluster18GroupParts.og" "skinCluster18.ip[0].ig";
connectAttr "skinCluster18GroupId.id" "skinCluster18.ip[0].gi";
connectAttr "god_joint.wm" "skinCluster18.ma[0]";
connectAttr "spine_1.wm" "skinCluster18.ma[1]";
connectAttr "spine_2.wm" "skinCluster18.ma[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.wm" "skinCluster18.ma[3]";
connectAttr "neck.wm" "skinCluster18.ma[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.wm" "skinCluster18.ma[5]"
		;
connectAttr "head_end.wm" "skinCluster18.ma[6]";
connectAttr "clavicle_right.wm" "skinCluster18.ma[7]";
connectAttr "shoulder_right.wm" "skinCluster18.ma[8]";
connectAttr "elbow_right.wm" "skinCluster18.ma[9]";
connectAttr "wrist_right.wm" "skinCluster18.ma[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.wm" "skinCluster18.ma[11]"
		;
connectAttr "index1_right.wm" "skinCluster18.ma[12]";
connectAttr "index2_right.wm" "skinCluster18.ma[13]";
connectAttr "index_end_right.wm" "skinCluster18.ma[14]";
connectAttr "thumb1_right.wm" "skinCluster18.ma[15]";
connectAttr "thumb2_right.wm" "skinCluster18.ma[16]";
connectAttr "thumb_end_right.wm" "skinCluster18.ma[17]";
connectAttr "fingers1_right.wm" "skinCluster18.ma[18]";
connectAttr "fingers2_right.wm" "skinCluster18.ma[19]";
connectAttr "fingers_end_right.wm" "skinCluster18.ma[20]";
connectAttr "clavicle_left.wm" "skinCluster18.ma[21]";
connectAttr "shoulder_left.wm" "skinCluster18.ma[22]";
connectAttr "elbow_left.wm" "skinCluster18.ma[23]";
connectAttr "wrist_left.wm" "skinCluster18.ma[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.wm" "skinCluster18.ma[25]"
		;
connectAttr "index1_left.wm" "skinCluster18.ma[26]";
connectAttr "index2_left.wm" "skinCluster18.ma[27]";
connectAttr "index_end_left.wm" "skinCluster18.ma[28]";
connectAttr "thumb1_left.wm" "skinCluster18.ma[29]";
connectAttr "thumb2_left.wm" "skinCluster18.ma[30]";
connectAttr "thumb_end_left.wm" "skinCluster18.ma[31]";
connectAttr "fingers1_left.wm" "skinCluster18.ma[32]";
connectAttr "fingers2_left.wm" "skinCluster18.ma[33]";
connectAttr "fingers_end_left.wm" "skinCluster18.ma[34]";
connectAttr "hip_left.wm" "skinCluster18.ma[35]";
connectAttr "knee_left.wm" "skinCluster18.ma[36]";
connectAttr "ankle_left.wm" "skinCluster18.ma[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.wm" "skinCluster18.ma[38]"
		;
connectAttr "toe_left.wm" "skinCluster18.ma[39]";
connectAttr "hip_right.wm" "skinCluster18.ma[40]";
connectAttr "knee_right.wm" "skinCluster18.ma[41]";
connectAttr "ankle_right.wm" "skinCluster18.ma[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.wm" "skinCluster18.ma[43]"
		;
connectAttr "toe_right.wm" "skinCluster18.ma[44]";
connectAttr "god_joint.liw" "skinCluster18.lw[0]";
connectAttr "spine_1.liw" "skinCluster18.lw[1]";
connectAttr "spine_2.liw" "skinCluster18.lw[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.liw" "skinCluster18.lw[3]"
		;
connectAttr "neck.liw" "skinCluster18.lw[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.liw" "skinCluster18.lw[5]"
		;
connectAttr "head_end.liw" "skinCluster18.lw[6]";
connectAttr "clavicle_right.liw" "skinCluster18.lw[7]";
connectAttr "shoulder_right.liw" "skinCluster18.lw[8]";
connectAttr "elbow_right.liw" "skinCluster18.lw[9]";
connectAttr "wrist_right.liw" "skinCluster18.lw[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.liw" "skinCluster18.lw[11]"
		;
connectAttr "index1_right.liw" "skinCluster18.lw[12]";
connectAttr "index2_right.liw" "skinCluster18.lw[13]";
connectAttr "index_end_right.liw" "skinCluster18.lw[14]";
connectAttr "thumb1_right.liw" "skinCluster18.lw[15]";
connectAttr "thumb2_right.liw" "skinCluster18.lw[16]";
connectAttr "thumb_end_right.liw" "skinCluster18.lw[17]";
connectAttr "fingers1_right.liw" "skinCluster18.lw[18]";
connectAttr "fingers2_right.liw" "skinCluster18.lw[19]";
connectAttr "fingers_end_right.liw" "skinCluster18.lw[20]";
connectAttr "clavicle_left.liw" "skinCluster18.lw[21]";
connectAttr "shoulder_left.liw" "skinCluster18.lw[22]";
connectAttr "elbow_left.liw" "skinCluster18.lw[23]";
connectAttr "wrist_left.liw" "skinCluster18.lw[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.liw" "skinCluster18.lw[25]"
		;
connectAttr "index1_left.liw" "skinCluster18.lw[26]";
connectAttr "index2_left.liw" "skinCluster18.lw[27]";
connectAttr "index_end_left.liw" "skinCluster18.lw[28]";
connectAttr "thumb1_left.liw" "skinCluster18.lw[29]";
connectAttr "thumb2_left.liw" "skinCluster18.lw[30]";
connectAttr "thumb_end_left.liw" "skinCluster18.lw[31]";
connectAttr "fingers1_left.liw" "skinCluster18.lw[32]";
connectAttr "fingers2_left.liw" "skinCluster18.lw[33]";
connectAttr "fingers_end_left.liw" "skinCluster18.lw[34]";
connectAttr "hip_left.liw" "skinCluster18.lw[35]";
connectAttr "knee_left.liw" "skinCluster18.lw[36]";
connectAttr "ankle_left.liw" "skinCluster18.lw[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.liw" "skinCluster18.lw[38]"
		;
connectAttr "toe_left.liw" "skinCluster18.lw[39]";
connectAttr "hip_right.liw" "skinCluster18.lw[40]";
connectAttr "knee_right.liw" "skinCluster18.lw[41]";
connectAttr "ankle_right.liw" "skinCluster18.lw[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.liw" "skinCluster18.lw[43]"
		;
connectAttr "toe_right.liw" "skinCluster18.lw[44]";
connectAttr "hand_rightShapeOrig.w" "groupParts52.ig";
connectAttr "groupId213.id" "groupParts52.gi";
connectAttr "groupParts54.og" "tweak18.ip[0].ig";
connectAttr "groupId215.id" "tweak18.ip[0].gi";
connectAttr "skinCluster18GroupId.msg" "skinCluster18Set.gn" -na;
connectAttr "hand_rightShape.iog.og[4]" "skinCluster18Set.dsm" -na;
connectAttr "skinCluster18.msg" "skinCluster18Set.ub[0]";
connectAttr "tweak18.og[0]" "skinCluster18GroupParts.ig";
connectAttr "skinCluster18GroupId.id" "skinCluster18GroupParts.gi";
connectAttr "groupId215.msg" "tweakSet18.gn" -na;
connectAttr "hand_rightShape.iog.og[5]" "tweakSet18.dsm" -na;
connectAttr "tweak18.msg" "tweakSet18.ub[0]";
connectAttr "groupParts52.og" "groupParts54.ig";
connectAttr "groupId215.id" "groupParts54.gi";
connectAttr "skinCluster19GroupParts.og" "skinCluster19.ip[0].ig";
connectAttr "skinCluster19GroupId.id" "skinCluster19.ip[0].gi";
connectAttr "god_joint.wm" "skinCluster19.ma[0]";
connectAttr "spine_1.wm" "skinCluster19.ma[1]";
connectAttr "spine_2.wm" "skinCluster19.ma[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.wm" "skinCluster19.ma[3]";
connectAttr "neck.wm" "skinCluster19.ma[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.wm" "skinCluster19.ma[5]"
		;
connectAttr "head_end.wm" "skinCluster19.ma[6]";
connectAttr "clavicle_right.wm" "skinCluster19.ma[7]";
connectAttr "shoulder_right.wm" "skinCluster19.ma[8]";
connectAttr "elbow_right.wm" "skinCluster19.ma[9]";
connectAttr "wrist_right.wm" "skinCluster19.ma[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.wm" "skinCluster19.ma[11]"
		;
connectAttr "index1_right.wm" "skinCluster19.ma[12]";
connectAttr "index2_right.wm" "skinCluster19.ma[13]";
connectAttr "index_end_right.wm" "skinCluster19.ma[14]";
connectAttr "thumb1_right.wm" "skinCluster19.ma[15]";
connectAttr "thumb2_right.wm" "skinCluster19.ma[16]";
connectAttr "thumb_end_right.wm" "skinCluster19.ma[17]";
connectAttr "fingers1_right.wm" "skinCluster19.ma[18]";
connectAttr "fingers2_right.wm" "skinCluster19.ma[19]";
connectAttr "fingers_end_right.wm" "skinCluster19.ma[20]";
connectAttr "clavicle_left.wm" "skinCluster19.ma[21]";
connectAttr "shoulder_left.wm" "skinCluster19.ma[22]";
connectAttr "elbow_left.wm" "skinCluster19.ma[23]";
connectAttr "wrist_left.wm" "skinCluster19.ma[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.wm" "skinCluster19.ma[25]"
		;
connectAttr "index1_left.wm" "skinCluster19.ma[26]";
connectAttr "index2_left.wm" "skinCluster19.ma[27]";
connectAttr "index_end_left.wm" "skinCluster19.ma[28]";
connectAttr "thumb1_left.wm" "skinCluster19.ma[29]";
connectAttr "thumb2_left.wm" "skinCluster19.ma[30]";
connectAttr "thumb_end_left.wm" "skinCluster19.ma[31]";
connectAttr "fingers1_left.wm" "skinCluster19.ma[32]";
connectAttr "fingers2_left.wm" "skinCluster19.ma[33]";
connectAttr "fingers_end_left.wm" "skinCluster19.ma[34]";
connectAttr "hip_left.wm" "skinCluster19.ma[35]";
connectAttr "knee_left.wm" "skinCluster19.ma[36]";
connectAttr "ankle_left.wm" "skinCluster19.ma[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.wm" "skinCluster19.ma[38]"
		;
connectAttr "toe_left.wm" "skinCluster19.ma[39]";
connectAttr "hip_right.wm" "skinCluster19.ma[40]";
connectAttr "knee_right.wm" "skinCluster19.ma[41]";
connectAttr "ankle_right.wm" "skinCluster19.ma[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.wm" "skinCluster19.ma[43]"
		;
connectAttr "toe_right.wm" "skinCluster19.ma[44]";
connectAttr "god_joint.liw" "skinCluster19.lw[0]";
connectAttr "spine_1.liw" "skinCluster19.lw[1]";
connectAttr "spine_2.liw" "skinCluster19.lw[2]";
connectAttr "|god_joint|spine_1|spine_2|chest.liw" "skinCluster19.lw[3]"
		;
connectAttr "neck.liw" "skinCluster19.lw[4]";
connectAttr "|god_joint|spine_1|spine_2|chest|neck|head.liw" "skinCluster19.lw[5]"
		;
connectAttr "head_end.liw" "skinCluster19.lw[6]";
connectAttr "clavicle_right.liw" "skinCluster19.lw[7]";
connectAttr "shoulder_right.liw" "skinCluster19.lw[8]";
connectAttr "elbow_right.liw" "skinCluster19.lw[9]";
connectAttr "wrist_right.liw" "skinCluster19.lw[10]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_right|shoulder_right|elbow_right|wrist_right|hand_right.liw" "skinCluster19.lw[11]"
		;
connectAttr "index1_right.liw" "skinCluster19.lw[12]";
connectAttr "index2_right.liw" "skinCluster19.lw[13]";
connectAttr "index_end_right.liw" "skinCluster19.lw[14]";
connectAttr "thumb1_right.liw" "skinCluster19.lw[15]";
connectAttr "thumb2_right.liw" "skinCluster19.lw[16]";
connectAttr "thumb_end_right.liw" "skinCluster19.lw[17]";
connectAttr "fingers1_right.liw" "skinCluster19.lw[18]";
connectAttr "fingers2_right.liw" "skinCluster19.lw[19]";
connectAttr "fingers_end_right.liw" "skinCluster19.lw[20]";
connectAttr "clavicle_left.liw" "skinCluster19.lw[21]";
connectAttr "shoulder_left.liw" "skinCluster19.lw[22]";
connectAttr "elbow_left.liw" "skinCluster19.lw[23]";
connectAttr "wrist_left.liw" "skinCluster19.lw[24]";
connectAttr "|god_joint|spine_1|spine_2|chest|clavicle_left|shoulder_left|elbow_left|wrist_left|hand_left.liw" "skinCluster19.lw[25]"
		;
connectAttr "index1_left.liw" "skinCluster19.lw[26]";
connectAttr "index2_left.liw" "skinCluster19.lw[27]";
connectAttr "index_end_left.liw" "skinCluster19.lw[28]";
connectAttr "thumb1_left.liw" "skinCluster19.lw[29]";
connectAttr "thumb2_left.liw" "skinCluster19.lw[30]";
connectAttr "thumb_end_left.liw" "skinCluster19.lw[31]";
connectAttr "fingers1_left.liw" "skinCluster19.lw[32]";
connectAttr "fingers2_left.liw" "skinCluster19.lw[33]";
connectAttr "fingers_end_left.liw" "skinCluster19.lw[34]";
connectAttr "hip_left.liw" "skinCluster19.lw[35]";
connectAttr "knee_left.liw" "skinCluster19.lw[36]";
connectAttr "ankle_left.liw" "skinCluster19.lw[37]";
connectAttr "|god_joint|hip_left|knee_left|ankle_left|foot_left.liw" "skinCluster19.lw[38]"
		;
connectAttr "toe_left.liw" "skinCluster19.lw[39]";
connectAttr "hip_right.liw" "skinCluster19.lw[40]";
connectAttr "knee_right.liw" "skinCluster19.lw[41]";
connectAttr "ankle_right.liw" "skinCluster19.lw[42]";
connectAttr "|god_joint|hip_right|knee_right|ankle_right|foot_right.liw" "skinCluster19.lw[43]"
		;
connectAttr "toe_right.liw" "skinCluster19.lw[44]";
connectAttr "fingers_rightShapeOrig.w" "groupParts55.ig";
connectAttr "groupId216.id" "groupParts55.gi";
connectAttr "groupParts57.og" "tweak19.ip[0].ig";
connectAttr "groupId218.id" "tweak19.ip[0].gi";
connectAttr "skinCluster19GroupId.msg" "skinCluster19Set.gn" -na;
connectAttr "fingers_rightShape.iog.og[4]" "skinCluster19Set.dsm" -na;
connectAttr "skinCluster19.msg" "skinCluster19Set.ub[0]";
connectAttr "tweak19.og[0]" "skinCluster19GroupParts.ig";
connectAttr "skinCluster19GroupId.id" "skinCluster19GroupParts.gi";
connectAttr "groupId218.msg" "tweakSet19.gn" -na;
connectAttr "fingers_rightShape.iog.og[5]" "tweakSet19.dsm" -na;
connectAttr "tweak19.msg" "tweakSet19.ub[0]";
connectAttr "groupParts55.og" "groupParts57.ig";
connectAttr "groupId218.id" "groupParts57.gi";
connectAttr "lambert2SG.pa" ":renderPartition.st" -na;
connectAttr "itguy_mat.msg" ":defaultShaderList1.s" -na;
connectAttr "place2dTexture1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "lightLinker1.msg" ":lightList1.ln" -na;
connectAttr "file1.msg" ":defaultTextureList1.tx" -na;
// End of itguy_walk.ma
