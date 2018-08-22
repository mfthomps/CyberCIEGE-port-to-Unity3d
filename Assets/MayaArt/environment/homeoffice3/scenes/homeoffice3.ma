//Maya ASCII 8.5 scene
//Name: homeoffice3.ma
//Last modified: Tue, Dec 02, 2008 10:35:45 AM
//Codeset: 1252
requires maya "8.5";
currentUnit -l foot -a degree -t ntsc;
fileInfo "application" "maya";
fileInfo "product" "Maya Complete 8.5";
fileInfo "version" "8.5";
fileInfo "cutIdentifier" "200612162224-692032";
fileInfo "osv" "Microsoft Windows XP Service Pack 2 (Build 2600)\n";
createNode transform -s -n "persp";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 22.11287073264403 11.013563735886253 5.84886091762964 ;
	setAttr ".r" -type "double3" -36.347190082612194 -9993.3999999769403 0 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".ncp" 1;
	setAttr ".coi" 23.808513058557971;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" -0.461273193359375 152.22032928466797 -0.40155029296875 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -12.790341985121527 100.5734563596852 -5.324070117829506 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100;
	setAttr ".ow" 9.7374309653572464;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 12.97614159544937 3.7150772470723874 100 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100;
	setAttr ".ow" 19.986127386817113;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 100 0.93616559275562872 -0.62979401793024992 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100;
	setAttr ".ow" 29.424820504830087;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "homeoffice1";
createNode transform -n "floor" -p "homeoffice1";
createNode mesh -n "floorShape" -p "floor";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 132 ".uvst[0].uvsp[0:131]" -type "float2" 0.69089544 0.19187951 
		0.9945966 0.19187951 0.99551308 0.49649715 0.99551308 0.19279599 0.99551308 0.49649715 
		0.9945966 0.19187951 0.69089544 0.19187951 0.38056314 0.18914971 0.67663103 0.19257538 
		0.38056314 0.19257538 0.67891479 0.19485916 0.68348235 0.19371727 0.67663103 0.49614745 
		0.38056314 0.49614745 0.67891479 0.49614745 0.68348235 0.49614745 0.9945966 0.19187951 
		0.9945966 0.49741364 0.69089544 0.49741364 0.68348235 0.18914971 0.68348235 0.49614745 
		0.38056314 0.49614745 0.99551308 0.19279599 0.68997896 0.49649715 0.68997896 0.19279599 
		0.69089544 0.19187951 0.9945966 0.49741364 0.69089544 0.49741364 0.9945966 0.49741364 
		0.69089544 0.49741364 0.68997896 0.49649715 0.68997896 0.19279599 0.38056314 0.19371727 
		0.38056314 0.49614745 0.38284689 0.19485916 0.38284689 0.49614745 0.65609282 0.47624916 
		0.65609282 0.20969404 0.67519397 0.20969391 0.67519397 0.4762491 0.65609282 0.47624916 
		0.65609282 0.20969404 0.67519397 0.20969391 0.67519397 0.4762491 0.65609282 0.47624916 
		0.65609282 0.20969404 0.67519397 0.20969391 0.67519397 0.4762491 0.65609282 0.47624916 
		0.65609282 0.20969404 0.67519397 0.20969391 0.67519397 0.4762491 0.65609282 0.47624916 
		0.65609282 0.20969404 0.67519397 0.20969391 0.67519397 0.4762491 0.65609282 0.47624916 
		0.65609282 0.20969404 0.67519397 0.20969391 0.67519397 0.4762491 0.65609282 0.47624916 
		0.65609282 0.20969404 0.67519397 0.20969391 0.67519397 0.4762491 0.65609282 0.47624916 
		0.65609282 0.20969404 0.67519397 0.20969391 0.67519397 0.4762491 0.65609282 0.47624916 
		0.65609282 0.20969404 0.67519397 0.20969391 0.67519397 0.4762491 0.65609282 0.47624916 
		0.65609282 0.20969404 0.67519397 0.20969391 0.67519397 0.4762491 0.65609282 0.47624916 
		0.65609282 0.20969404 0.67519397 0.20969391 0.67519397 0.4762491 0.65609282 0.47624916 
		0.65609282 0.20969404 0.67519397 0.20969391 0.67519397 0.4762491 0.65609282 0.47624916 
		0.65609282 0.20969404 0.67519397 0.20969391 0.67519397 0.4762491 0.65609282 0.47624916 
		0.65609282 0.20969404 0.67519397 0.20969391 0.67519397 0.4762491 0.65609282 0.47624916 
		0.65609282 0.20969404 0.67519397 0.20969391 0.67519397 0.4762491 0.65609282 0.47624916 
		0.65609282 0.20969404 0.67519397 0.20969391 0.67519397 0.4762491 0.65609282 0.47624916 
		0.65609282 0.20969404 0.67519397 0.20969391 0.67519397 0.4762491 0.65609282 0.47624916 
		0.65609282 0.20969404 0.67519397 0.20969391 0.67519397 0.4762491 0.65609282 0.47624916 
		0.65609282 0.20969404 0.67519397 0.20969391 0.67519397 0.4762491 0.65609282 0.47624916 
		0.65609282 0.20969404 0.67519397 0.20969391 0.67519397 0.4762491 0.65609282 0.47624916 
		0.65609282 0.20969404 0.67519397 0.20969391 0.67519397 0.4762491 0.65609282 0.47624916 
		0.65609282 0.20969404 0.67519397 0.20969391 0.67519397 0.4762491 0.65609282 0.47624916 
		0.65609282 0.20969404 0.67519397 0.20969391 0.67519397 0.4762491 0.65609282 0.47624916 
		0.65609282 0.20969404 0.67519397 0.20969391 0.67519397 0.4762491;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr -s 33 ".pt";
	setAttr ".pt[0:12]" -type "float3" 1.122059 0 -1.0916867  0 0 -1.0916867  
		0.83284086 0 -1.0916867  -1.0924367 0 -1.0916867  1.122059 0 0.65032864  0 0 0.65032864  
		0.83284086 0 0.65032864  -1.0924367 0 0.65032864  1.122059 0 -0.70432204  0 0 -0.70432204  
		0.83284086 0 -0.70432204  -1.0924367 0 -0.70432204  1.122059 0 0 ;
	setAttr ".pt[14:15]" -type "float3" 0.83284086 0 0  -1.0924367 0 0 ;
	setAttr ".pt[18:19]" -type "float3" 0 0 0.65032864  0.83284086 0 0 ;
	setAttr ".pt[21:23]" -type "float3" 0 0 0.65032864  0 0 -0.51610708  0 0 
		-0.51610708 ;
	setAttr ".pt[27:39]" -type "float3" 0.83284086 0 0  0 -0.085287146 0  0 
		-0.085287146 0  0 -0.085287146 0.65032864  0.83284086 -0.085287146 0  0 -0.085287146 
		0  0 -0.085287146 0.65032864  0 -0.085287146 -0.51610708  0 -0.085287146 -0.51610708  
		0 -0.085287146 0  0 -0.085287146 0  0 -0.085287146 0  0.83284086 -0.085287146 0 ;
	setAttr -s 40 ".vt[0:39]"  -16.122059 -3.3306691e-015 16.091686 -5 
		-3.3306691e-015 16.091686 5.1805696 -3.3306691e-015 16.091686 16.092436 -3.3306691e-015 
		16.091686 -16.122059 -1.110223e-015 5.3600931 -5 -1.110223e-015 5.3600931 5.1805696 
		-1.110223e-015 5.3600931 16.092436 -1.110223e-015 5.3600931 -16.122059 1.1102232e-015 
		-5.3074641 -5 1.1102232e-015 -5.3074641 5.1805696 1.1102232e-015 -5.3074641 16.092436 
		1.1102232e-015 -5.3074641 -16.122059 3.3306693e-015 -16.12088 -5 3.3306693e-015 -16.12088 
		5.1805696 3.3306693e-015 -16.12088 16.092436 3.3306693e-015 -16.12088 -16.658968 
		-3.4416914e-015 16.628563 -5.1661725 -3.4416914e-015 16.628563 -16.658968 -1.1472304e-015 
		5.5392494 5.3537488 -3.4416914e-015 16.628563 16.629345 -3.4416914e-015 16.628563 
		16.629345 -1.1472304e-015 5.5392494 -16.658968 1.1472306e-015 -5.4838924 16.629345 
		1.1472306e-015 -5.4838924 -16.658968 3.4416916e-015 -16.657757 16.629345 3.4416916e-015 
		-16.657757 -5.1661725 3.4416916e-015 -16.657757 5.3537488 3.4416916e-015 -16.657757 
		-16.658968 -0.11880196 16.628563 -5.1661725 -0.11880196 16.628563 -16.658968 -0.11880196 
		5.5392494 5.3537488 -0.11880196 16.628563 16.629345 -0.11880196 16.628563 16.629345 
		-0.11880196 5.5392494 -16.658968 -0.11880196 -5.4838924 16.629345 -0.11880196 -5.4838924 
		-16.658968 -0.11880196 -16.657757 16.629345 -0.11880196 -16.657757 -5.1661725 -0.11880196 
		-16.657757 5.3537488 -0.11880196 -16.657757;
	setAttr -s 105 ".ed[0:104]"  0 1 0 0 4 0 
		1 2 0 1 5 1 2 3 0 2 6 1 
		3 7 0 4 5 1 4 8 0 5 6 1 
		5 9 1 6 7 1 6 10 1 7 11 0 
		8 9 1 8 12 0 9 10 1 9 13 1 
		10 11 1 10 14 1 11 15 0 12 13 0 
		13 14 0 14 15 0 1 4 1 2 5 1 
		3 6 1 5 8 1 6 9 1 7 10 1 
		9 12 1 10 13 1 11 14 1 0 16 0 
		1 17 0 16 17 0 4 18 0 16 18 0 
		2 19 0 17 19 0 3 20 0 19 20 0 
		7 21 0 20 21 0 8 22 0 18 22 0 
		11 23 0 21 23 0 12 24 0 22 24 0 
		15 25 0 23 25 0 13 26 0 24 26 0 
		14 27 0 26 27 0 27 25 0 16 28 0 
		17 29 0 28 29 0 18 30 0 28 30 0 
		19 31 0 29 31 0 20 32 0 31 32 0 
		21 33 0 32 33 0 22 34 0 30 34 0 
		23 35 0 33 35 0 24 36 0 34 36 0 
		25 37 0 35 37 0 26 38 0 36 38 0 
		27 39 0 38 39 0 39 37 0 17 0 1 
		0 18 1 19 1 1 3 19 1 21 3 1 
		4 22 1 23 7 1 22 12 1 15 23 1 
		12 26 1 26 14 1 27 15 1 16 29 1 
		18 28 1 17 31 1 19 32 1 20 33 1 
		22 30 1 21 35 1 24 34 1 23 37 1 
		26 36 1 27 38 1 25 39 1;
	setAttr -s 66 ".fc[0:65]" -type "polyFaces" 
		f 3 0 24 -2 
		mu 0 3 0 1 29 
		f 3 3 -8 -25 
		mu 0 3 1 28 29 
		f 3 2 25 -4 
		mu 0 3 22 4 24 
		f 3 5 -10 -26 
		mu 0 3 4 23 24 
		f 3 4 26 -6 
		mu 0 3 6 16 18 
		f 3 6 -12 -27 
		mu 0 3 16 17 18 
		f 3 7 27 -9 
		mu 0 3 3 2 31 
		f 3 10 -15 -28 
		mu 0 3 2 30 31 
		f 3 9 28 -11 
		mu 0 3 25 5 27 
		f 3 12 -17 -29 
		mu 0 3 5 26 27 
		f 3 11 29 -13 
		mu 0 3 7 19 21 
		f 3 13 -19 -30 
		mu 0 3 19 20 21 
		f 3 14 30 -16 
		mu 0 3 9 8 13 
		f 3 17 -22 -31 
		mu 0 3 8 12 13 
		f 3 16 31 -18 
		mu 0 3 34 10 35 
		f 3 19 -23 -32 
		mu 0 3 10 14 35 
		f 3 18 32 -20 
		mu 0 3 32 11 33 
		f 3 20 -24 -33 
		mu 0 3 11 15 33 
		f 3 35 81 33 
		mu 0 3 38 39 37 
		f 3 -1 -82 -35 
		mu 0 3 36 37 39 
		f 3 -34 82 -38 
		mu 0 3 43 40 42 
		f 3 1 36 -83 
		mu 0 3 40 41 42 
		f 3 39 83 34 
		mu 0 3 46 47 45 
		f 3 -3 -84 -39 
		mu 0 3 44 45 47 
		f 3 -41 84 41 
		mu 0 3 51 48 50 
		f 3 -5 38 -85 
		mu 0 3 48 49 50 
		f 3 43 85 40 
		mu 0 3 54 55 53 
		f 3 -7 -86 -43 
		mu 0 3 52 53 55 
		f 3 -37 86 -46 
		mu 0 3 59 56 58 
		f 3 8 44 -87 
		mu 0 3 56 57 58 
		f 3 47 87 42 
		mu 0 3 62 63 61 
		f 3 -14 -88 -47 
		mu 0 3 60 61 63 
		f 3 -50 88 48 
		mu 0 3 66 67 65 
		f 3 15 -89 -45 
		mu 0 3 64 65 67 
		f 3 -51 89 51 
		mu 0 3 71 68 70 
		f 3 -21 46 -90 
		mu 0 3 68 69 70 
		f 3 -49 90 -54 
		mu 0 3 75 72 74 
		f 3 21 52 -91 
		mu 0 3 72 73 74 
		f 3 -56 91 54 
		mu 0 3 78 79 77 
		f 3 22 -92 -53 
		mu 0 3 76 77 79 
		f 3 -57 92 50 
		mu 0 3 82 83 81 
		f 3 23 -93 -55 
		mu 0 3 80 81 83 
		f 3 -36 93 -59 
		mu 0 3 84 85 87 
		f 3 57 59 -94 
		mu 0 3 85 86 87 
		f 3 37 94 -58 
		mu 0 3 88 89 91 
		f 3 60 -62 -95 
		mu 0 3 89 90 91 
		f 3 -40 95 -63 
		mu 0 3 92 93 95 
		f 3 58 63 -96 
		mu 0 3 93 94 95 
		f 3 -42 96 -65 
		mu 0 3 96 97 99 
		f 3 62 65 -97 
		mu 0 3 97 98 99 
		f 3 -44 97 -67 
		mu 0 3 100 101 103 
		f 3 64 67 -98 
		mu 0 3 101 102 103 
		f 3 45 98 -61 
		mu 0 3 104 105 107 
		f 3 68 -70 -99 
		mu 0 3 105 106 107 
		f 3 -48 99 -71 
		mu 0 3 108 109 111 
		f 3 66 71 -100 
		mu 0 3 109 110 111 
		f 3 49 100 -69 
		mu 0 3 112 113 115 
		f 3 72 -74 -101 
		mu 0 3 113 114 115 
		f 3 -52 101 -75 
		mu 0 3 116 117 119 
		f 3 70 75 -102 
		mu 0 3 117 118 119 
		f 3 53 102 -73 
		mu 0 3 120 121 123 
		f 3 76 -78 -103 
		mu 0 3 121 122 123 
		f 3 55 103 -77 
		mu 0 3 124 125 127 
		f 3 78 -80 -104 
		mu 0 3 125 126 127 
		f 3 56 104 -79 
		mu 0 3 128 129 131 
		f 3 74 -81 -105 
		mu 0 3 129 130 131 ;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".dt" yes;
	setAttr ".bw" 1.9574;
	setAttr ".ns" 0.16;
	setAttr ".tgsp" 1;
createNode transform -n "dynBoard1:board7" -p "homeoffice1";
	setAttr ".rp" -type "double3" 6.0977596647981667 0.060147173794726477 2.161975596955954 ;
	setAttr ".sp" -type "double3" 6.0977596647981667 0.060147173794726477 2.161975596955954 ;
	setAttr ".it" no;
createNode mesh -n "dynBoard1:board7Shape" -p "dynBoard1:board7";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".dsr" 0;
	setAttr ".xsr" 1;
	setAttr ".nat" 4.4670000076293945;
	setAttr ".dt" yes;
	setAttr ".tgsp" 1;
createNode mesh -n "polySurfaceShape1" -p "dynBoard1:board7";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.0022261515 0.50949836 
		0.99004167 0.50949842 0.99004167 0.99625564 0.0022261143 0.99625641 0.96658182 0.93714541 
		0.96658182 0.53565937 0.98276901 0.53565937 0.98276901 0.93714541 0.96658182 0.93714541 
		0.96658182 0.53565937 0.98276901 0.53565937 0.98276901 0.93714541 0.96658182 0.93714541 
		0.96658182 0.53565937 0.98276901 0.53565937 0.98276901 0.93714541 0.96658182 0.93714541 
		0.96658182 0.53565937 0.98276901 0.53565937 0.98276901 0.93714541;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".dsr" 0;
	setAttr ".xsr" 1;
	setAttr ".nat" 4.4670000076293945;
	setAttr -s 8 ".pt[0:7]" -type "float3"  -7.8739257 -3.0271223 -36.857979 
		-7.8739257 -3.0271223 -36.857979 -7.8739257 -3.0271223 -36.857979 -7.8739257 -3.0271223 
		-36.857979 -7.335042 -3.0271223 -36.857979 -7.335042 -3.0271223 -36.857979 -7.335042 
		-3.0271223 -36.857979 -7.335042 -3.0271223 -36.857979;
	setAttr -s 8 ".vt[0:7]"  14.139751 3.137563 35.578003 14.139751 3.137563 
		40.895012 14.139751 5.9903522 35.578003 14.139751 5.9903522 40.895012 14.295727 5.9903522 
		35.578003 14.295727 5.9903522 40.895012 14.295727 3.137563 35.578003 14.295727 3.137563 
		40.895012;
	setAttr -s 17 ".ed[0:16]"  0 1 0 2 3 0 
		4 5 0 6 7 0 0 2 0 1 3 0 
		2 4 0 3 5 0 4 6 0 5 7 0 
		6 0 0 7 1 0 3 4 1 7 0 1 
		7 3 1 0 4 1 0 3 1;
	setAttr -s 10 ".fc[0:9]" -type "polyFaces" 
		f 3 1 12 -7 
		mu 0 3 4 5 7 
		f 3 7 -3 -13 
		mu 0 3 5 6 7 
		f 3 3 13 -11 
		mu 0 3 8 9 11 
		f 3 11 -1 -14 
		mu 0 3 9 10 11 
		f 3 -12 14 -6 
		mu 0 3 12 13 15 
		f 3 -10 -8 -15 
		mu 0 3 13 14 15 
		f 3 10 15 8 
		mu 0 3 16 17 19 
		f 3 4 6 -16 
		mu 0 3 17 18 19 
		f 3 -5 16 -2 
		mu 0 3 3 0 2 
		f 3 0 5 -17 
		mu 0 3 0 1 2 ;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".dt" yes;
	setAttr ".tgsp" 1;
createNode lightLinker -n "lightLinker1";
	setAttr -s 11 ".lnk";
	setAttr -s 13 ".slnk";
createNode displayLayerManager -n "layerManager";
	setAttr ".dli[1]"  2;
	setAttr -s 2 ".dli";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
	setAttr ".g" yes;
createNode script -n "uiConfigurationScriptNode";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"top\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n"
		+ "                -activeOnly 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 1\n                -displayTextures 1\n                -smoothWireframe 0\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 4096\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n"
		+ "                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n"
		+ "                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 1\n            -displayTextures 1\n            -smoothWireframe 0\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n"
		+ "            -textureDisplay \"modulate\" \n            -textureMaxSize 4096\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -colorResolution 4 4 \n            -bumpResolution 4 4 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 0\n            -occlusionCulling 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n"
		+ "            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"side\" \n"
		+ "                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 4096\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n"
		+ "                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n"
		+ "                -follicles 1\n                -nCloths 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n"
		+ "            -displayTextures 0\n            -smoothWireframe 0\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 4096\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -colorResolution 4 4 \n            -bumpResolution 4 4 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 0\n            -occlusionCulling 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n"
		+ "            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"front\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 4096\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n"
		+ "                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n"
		+ "                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n"
		+ "            -backfaceCulling 0\n            -xray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 4096\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -colorResolution 4 4 \n            -bumpResolution 4 4 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 0\n            -occlusionCulling 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n"
		+ "            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -displayTextures 1\n                -smoothWireframe 0\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 4096\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n"
		+ "                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n"
		+ "                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n"
		+ "            -activeOnly 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -displayTextures 1\n            -smoothWireframe 0\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 4096\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n"
		+ "            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n"
		+ "            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            outlinerEditor -e \n                -showShapes 0\n                -showAttributes 0\n                -showConnected 0\n                -showAnimCurvesOnly 0\n                -showMuteInfo 0\n                -autoExpand 0\n                -showDagOnly 1\n                -ignoreDagHierarchy 0\n                -expandConnections 0\n                -showUnitlessCurves 1\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 0\n                -highlightActive 1\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 0\n"
		+ "                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"defaultSetFilter\" \n                -showSetMembers 1\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAttributes 0\n            -showConnected 0\n"
		+ "            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -autoExpand 0\n            -showDagOnly 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n"
		+ "            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\tif ($useSceneConfig) {\n\t\toutlinerPanel -e -to $panelName;\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"graphEditor\" -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -autoExpand 1\n                -showDagOnly 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n"
		+ "                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n"
		+ "                -snapTime \"none\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -autoExpand 1\n                -showDagOnly 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n"
		+ "                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n"
		+ "                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dopeSheetPanel\" -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -autoExpand 0\n                -showDagOnly 0\n"
		+ "                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n"
		+ "                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n"
		+ "                -autoExpand 0\n                -showDagOnly 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -sortOrder \"none\" \n                -longNames 0\n"
		+ "                -niceNames 1\n                -showNamespace 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"clipEditorPanel\" -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l (localizedPanelLabel(\"Hypergraph\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -zoom 1\n                -animateTransition 0\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n"
		+ "                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -zoom 1\n                -animateTransition 0\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n"
		+ "                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperShadePanel\" -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"visorPanel\" -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Texture Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"polyTexturePlacementPanel\" -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"multiListerPanel\" (localizedPanelLabel(\"Multilister\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"multiListerPanel\" -l (localizedPanelLabel(\"Multilister\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Multilister\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"renderWindowPanel\" -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"blendShapePanel\" (localizedPanelLabel(\"Blend Shape\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\tblendShapePanel -unParent -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels ;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tblendShapePanel -edit -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynRelEdPanel\" -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"devicePanel\" (localizedPanelLabel(\"Devices\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\tdevicePanel -unParent -l (localizedPanelLabel(\"Devices\")) -mbv $menusOkayInPanels ;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tdevicePanel -edit -l (localizedPanelLabel(\"Devices\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"relationshipPanel\" -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"referenceEditorPanel\" -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"componentEditorPanel\" -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynPaintScriptedPanelType\" -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"webBrowserPanel\" (localizedPanelLabel(\"Web Browser\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"webBrowserPanel\" -l (localizedPanelLabel(\"Web Browser\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Web Browser\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"scriptEditorPanel\" -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-defaultImage \"\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 4096\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 4096\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 3 -size 12 -divisions 1 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 0 -max 219 -ast 0 -aet 219 ";
	setAttr ".st" 6;
createNode lambert -n "homeoffice1_mat";
	setAttr ".miic" -type "float3" 3.1415927 3.1415927 3.1415927 ;
createNode shadingEngine -n "lambert2SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
createNode file -n "file1";
	setAttr ".ftn" -type "string" "C:/cc_svn/art/MayaSourceArt/environment/homeoffice3/textures/homeoffice3.tga";
createNode place2dTexture -n "place2dTexture1";
createNode place2dTexture -n "place2dTexture2";
createNode brush -n "brush1";
	setAttr ".lcl[0]"  0 0.5 1;
	setAttr ".pcl[0]"  0 0.5 1;
	setAttr ".wsc[0]"  0 1 1;
	setAttr ".lws[0]"  0 1 1;
	setAttr ".pws[0]"  0 1 1;
	setAttr ".tls[0]"  0 1 1;
	setAttr -s 3 ".env";
	setAttr ".env[0].envp" 0.20000000298023224;
	setAttr ".env[0].envc" -type "float3" 0 0 0.15000001 ;
	setAttr ".env[0].envi" 2;
	setAttr ".env[1].envp" 0.5;
	setAttr ".env[1].envc" -type "float3" 0.47999999 0.55000001 0.69999999 ;
	setAttr ".env[1].envi" 2;
	setAttr ".env[2].envp" 1;
	setAttr ".env[2].envc" -type "float3" 0 0.1 0.44999999 ;
	setAttr ".env[2].envi" 2;
	setAttr ".rro[0]"  0 1 1;
createNode place2dTexture -n "place2dTexture3";
createNode place2dTexture -n "place2dTexture4";
createNode brush -n "dynBoard:brush1";
	setAttr ".lcl[0]"  0 0.5 1;
	setAttr ".pcl[0]"  0 0.5 1;
	setAttr ".wsc[0]"  0 1 1;
	setAttr ".lws[0]"  0 1 1;
	setAttr ".pws[0]"  0 1 1;
	setAttr ".tls[0]"  0 1 1;
	setAttr -s 3 ".env";
	setAttr ".env[0].envp" 0.20000000298023224;
	setAttr ".env[0].envc" -type "float3" 0 0 0.15000001 ;
	setAttr ".env[0].envi" 2;
	setAttr ".env[1].envp" 0.5;
	setAttr ".env[1].envc" -type "float3" 0.47999999 0.55000001 0.69999999 ;
	setAttr ".env[1].envi" 2;
	setAttr ".env[2].envp" 1;
	setAttr ".env[2].envc" -type "float3" 0 0.1 0.44999999 ;
	setAttr ".env[2].envi" 2;
	setAttr ".rro[0]"  0 1 1;
createNode brush -n "dynBoard:brush2";
	setAttr ".lcl[0]"  0 0.5 1;
	setAttr ".pcl[0]"  0 0.5 1;
	setAttr ".wsc[0]"  0 1 1;
	setAttr ".lws[0]"  0 1 1;
	setAttr ".pws[0]"  0 1 1;
	setAttr ".tls[0]"  0 1 1;
	setAttr -s 3 ".env";
	setAttr ".env[0].envp" 0.20000000298023224;
	setAttr ".env[0].envc" -type "float3" 0 0 0.15000001 ;
	setAttr ".env[0].envi" 2;
	setAttr ".env[1].envp" 0.5;
	setAttr ".env[1].envc" -type "float3" 0.47999999 0.55000001 0.69999999 ;
	setAttr ".env[1].envi" 2;
	setAttr ".env[2].envp" 1;
	setAttr ".env[2].envc" -type "float3" 0 0.1 0.44999999 ;
	setAttr ".env[2].envi" 2;
	setAttr ".rro[0]"  0 1 1;
createNode brush -n "dynBoard:brush3";
	setAttr ".lcl[0]"  0 0.5 1;
	setAttr ".pcl[0]"  0 0.5 1;
	setAttr ".wsc[0]"  0 1 1;
	setAttr ".lws[0]"  0 1 1;
	setAttr ".pws[0]"  0 1 1;
	setAttr ".tls[0]"  0 1 1;
	setAttr -s 3 ".env";
	setAttr ".env[0].envp" 0.20000000298023224;
	setAttr ".env[0].envc" -type "float3" 0 0 0.15000001 ;
	setAttr ".env[0].envi" 2;
	setAttr ".env[1].envp" 0.5;
	setAttr ".env[1].envc" -type "float3" 0.47999999 0.55000001 0.69999999 ;
	setAttr ".env[1].envi" 2;
	setAttr ".env[2].envp" 1;
	setAttr ".env[2].envc" -type "float3" 0 0.1 0.44999999 ;
	setAttr ".env[2].envi" 2;
	setAttr ".rro[0]"  0 1 1;
createNode brush -n "dynBoard:workstation_brush1";
	setAttr ".lcl[0]"  0 0.5 1;
	setAttr ".pcl[0]"  0 0.5 1;
	setAttr ".wsc[0]"  0 1 1;
	setAttr ".lws[0]"  0 1 1;
	setAttr ".pws[0]"  0 1 1;
	setAttr ".tls[0]"  0 1 1;
	setAttr -s 3 ".env";
	setAttr ".env[0].envp" 0.20000000298023224;
	setAttr ".env[0].envc" -type "float3" 0 0 0.15000001 ;
	setAttr ".env[0].envi" 2;
	setAttr ".env[1].envp" 0.5;
	setAttr ".env[1].envc" -type "float3" 0.47999999 0.55000001 0.69999999 ;
	setAttr ".env[1].envi" 2;
	setAttr ".env[2].envp" 1;
	setAttr ".env[2].envc" -type "float3" 0 0.1 0.44999999 ;
	setAttr ".env[2].envi" 2;
	setAttr ".rro[0]"  0 1 1;
createNode displayLayer -n "dynBoard:layer3";
	setAttr ".do" 1;
createNode brush -n "dynBoard:brush4";
	setAttr ".lcl[0]"  0 0.5 1;
	setAttr ".pcl[0]"  0 0.5 1;
	setAttr ".wsc[0]"  0 1 1;
	setAttr ".lws[0]"  0 1 1;
	setAttr ".pws[0]"  0 1 1;
	setAttr ".tls[0]"  0 1 1;
	setAttr -s 3 ".env";
	setAttr ".env[0].envp" 0.20000000298023224;
	setAttr ".env[0].envc" -type "float3" 0 0 0.15000001 ;
	setAttr ".env[0].envi" 2;
	setAttr ".env[1].envp" 0.5;
	setAttr ".env[1].envc" -type "float3" 0.47999999 0.55000001 0.69999999 ;
	setAttr ".env[1].envi" 2;
	setAttr ".env[2].envp" 1;
	setAttr ".env[2].envc" -type "float3" 0 0.1 0.44999999 ;
	setAttr ".env[2].envi" 2;
	setAttr ".rro[0]"  0 1 1;
createNode brush -n "dynBoard:brush5";
	setAttr ".lcl[0]"  0 0.5 1;
	setAttr ".pcl[0]"  0 0.5 1;
	setAttr ".wsc[0]"  0 1 1;
	setAttr ".lws[0]"  0 1 1;
	setAttr ".pws[0]"  0 1 1;
	setAttr ".tls[0]"  0 1 1;
	setAttr -s 3 ".env";
	setAttr ".env[0].envp" 0.20000000298023224;
	setAttr ".env[0].envc" -type "float3" 0 0 0.15000001 ;
	setAttr ".env[0].envi" 2;
	setAttr ".env[1].envp" 0.5;
	setAttr ".env[1].envc" -type "float3" 0.47999999 0.55000001 0.69999999 ;
	setAttr ".env[1].envi" 2;
	setAttr ".env[2].envp" 1;
	setAttr ".env[2].envc" -type "float3" 0 0.1 0.44999999 ;
	setAttr ".env[2].envi" 2;
	setAttr ".rro[0]"  0 1 1;
createNode brush -n "dynBoard:brush6";
	setAttr ".lcl[0]"  0 0.5 1;
	setAttr ".pcl[0]"  0 0.5 1;
	setAttr ".wsc[0]"  0 1 1;
	setAttr ".lws[0]"  0 1 1;
	setAttr ".pws[0]"  0 1 1;
	setAttr ".tls[0]"  0 1 1;
	setAttr -s 3 ".env";
	setAttr ".env[0].envp" 0.20000000298023224;
	setAttr ".env[0].envc" -type "float3" 0 0 0.15000001 ;
	setAttr ".env[0].envi" 2;
	setAttr ".env[1].envp" 0.5;
	setAttr ".env[1].envc" -type "float3" 0.47999999 0.55000001 0.69999999 ;
	setAttr ".env[1].envi" 2;
	setAttr ".env[2].envp" 1;
	setAttr ".env[2].envc" -type "float3" 0 0.1 0.44999999 ;
	setAttr ".env[2].envi" 2;
	setAttr ".rro[0]"  0 1 1;
createNode brush -n "dynBoard:brush7";
	setAttr ".lcl[0]"  0 0.5 1;
	setAttr ".pcl[0]"  0 0.5 1;
	setAttr ".wsc[0]"  0 1 1;
	setAttr ".lws[0]"  0 1 1;
	setAttr ".pws[0]"  0 1 1;
	setAttr ".tls[0]"  0 1 1;
	setAttr -s 3 ".env";
	setAttr ".env[0].envp" 0.20000000298023224;
	setAttr ".env[0].envc" -type "float3" 0 0 0.15000001 ;
	setAttr ".env[0].envi" 2;
	setAttr ".env[1].envp" 0.5;
	setAttr ".env[1].envc" -type "float3" 0.47999999 0.55000001 0.69999999 ;
	setAttr ".env[1].envi" 2;
	setAttr ".env[2].envp" 1;
	setAttr ".env[2].envc" -type "float3" 0 0.1 0.44999999 ;
	setAttr ".env[2].envi" 2;
	setAttr ".rro[0]"  0 1 1;
createNode brush -n "dynBoard:brush8";
	setAttr ".lcl[0]"  0 0.5 1;
	setAttr ".pcl[0]"  0 0.5 1;
	setAttr ".wsc[0]"  0 1 1;
	setAttr ".lws[0]"  0 1 1;
	setAttr ".pws[0]"  0 1 1;
	setAttr ".tls[0]"  0 1 1;
	setAttr -s 3 ".env";
	setAttr ".env[0].envp" 0.20000000298023224;
	setAttr ".env[0].envc" -type "float3" 0 0 0.15000001 ;
	setAttr ".env[0].envi" 2;
	setAttr ".env[1].envp" 0.5;
	setAttr ".env[1].envc" -type "float3" 0.47999999 0.55000001 0.69999999 ;
	setAttr ".env[1].envi" 2;
	setAttr ".env[2].envp" 1;
	setAttr ".env[2].envc" -type "float3" 0 0.1 0.44999999 ;
	setAttr ".env[2].envi" 2;
	setAttr ".rro[0]"  0 1 1;
createNode lambert -n "dynBoard:lambert4";
	setAttr ".miic" -type "float3" 3.1415927 3.1415927 3.1415927 ;
createNode shadingEngine -n "dynBoard:lambert4SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "dynBoard:materialInfo3";
createNode file -n "dynBoard:file3";
	setAttr ".ftn" -type "string" "C:/cc_svn/art/MayaSourceArt/environment/office6/wall.tga";
createNode place2dTexture -n "dynBoard:place2dTexture3";
createNode lambert -n "dynBoard:lambert5";
	setAttr ".miic" -type "float3" 3.1415927 3.1415927 3.1415927 ;
createNode shadingEngine -n "dynBoard:lambert5SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "dynBoard:materialInfo4";
createNode file -n "dynBoard:file4";
	setAttr ".ftn" -type "string" "C:/cc_svn/art/MayaSourceArt/environment/office6/floor.tga";
createNode place2dTexture -n "dynBoard:place2dTexture4";
createNode materialInfo -n "dynBoard:objects_materialInfo2";
createNode shadingEngine -n "dynBoard:objects_lambert3SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -s 4 ".gn";
createNode lambert -n "dynBoard:objects_lambert3";
	setAttr ".miic" -type "float3" 3.1415927 3.1415927 3.1415927 ;
createNode file -n "dynBoard:objects_file2";
	setAttr ".ftn" -type "string" "C:/cc_svn/art/MayaSourceArt/environment/office6/checkers.tga";
createNode place2dTexture -n "dynBoard:objects_place2dTexture2";
createNode brush -n "dynBoard:brush9";
	setAttr ".lcl[0]"  0 0.5 1;
	setAttr ".pcl[0]"  0 0.5 1;
	setAttr ".wsc[0]"  0 1 1;
	setAttr ".lws[0]"  0 1 1;
	setAttr ".pws[0]"  0 1 1;
	setAttr ".tls[0]"  0 1 1;
	setAttr -s 3 ".env";
	setAttr ".env[0].envp" 0.20000000298023224;
	setAttr ".env[0].envc" -type "float3" 0 0 0.15000001 ;
	setAttr ".env[0].envi" 2;
	setAttr ".env[1].envp" 0.5;
	setAttr ".env[1].envc" -type "float3" 0.47999999 0.55000001 0.69999999 ;
	setAttr ".env[1].envi" 2;
	setAttr ".env[2].envp" 1;
	setAttr ".env[2].envc" -type "float3" 0 0.1 0.44999999 ;
	setAttr ".env[2].envi" 2;
	setAttr ".rro[0]"  0 1 1;
createNode groupId -n "dynBoard:groupId76";
	setAttr ".ihi" 0;
createNode groupId -n "dynBoard:groupId77";
	setAttr ".ihi" 0;
createNode groupId -n "dynBoard:groupId74";
	setAttr ".ihi" 0;
createNode groupId -n "dynBoard:groupId75";
	setAttr ".ihi" 0;
createNode groupId -n "dynBoard:groupId92";
	setAttr ".ihi" 0;
createNode groupId -n "dynBoard:groupId112";
	setAttr ".ihi" 0;
createNode groupId -n "dynBoard:groupId115";
	setAttr ".ihi" 0;
createNode groupId -n "dynBoard:groupId118";
	setAttr ".ihi" 0;
createNode groupId -n "dynBoard:groupId134";
	setAttr ".ihi" 0;
createNode groupId -n "dynBoard:groupId136";
	setAttr ".ihi" 0;
createNode groupId -n "dynBoard:groupId138";
	setAttr ".ihi" 0;
createNode groupId -n "dynBoard:groupId140";
	setAttr ".ihi" 0;
createNode groupId -n "dynBoard:groupId142";
	setAttr ".ihi" 0;
createNode groupId -n "dynBoard:groupId144";
	setAttr ".ihi" 0;
createNode groupId -n "dynBoard:groupId146";
	setAttr ".ihi" 0;
createNode groupId -n "dynBoard:groupId158";
	setAttr ".ihi" 0;
createNode groupId -n "dynBoard:groupId178";
	setAttr ".ihi" 0;
createNode brush -n "dynBoard:brush10";
	setAttr ".lcl[0]"  0 0.5 1;
	setAttr ".pcl[0]"  0 0.5 1;
	setAttr ".wsc[0]"  0 1 1;
	setAttr ".lws[0]"  0 1 1;
	setAttr ".pws[0]"  0 1 1;
	setAttr ".tls[0]"  0 1 1;
	setAttr -s 3 ".env";
	setAttr ".env[0].envp" 0.20000000298023224;
	setAttr ".env[0].envc" -type "float3" 0 0 0.15000001 ;
	setAttr ".env[0].envi" 2;
	setAttr ".env[1].envp" 0.5;
	setAttr ".env[1].envc" -type "float3" 0.47999999 0.55000001 0.69999999 ;
	setAttr ".env[1].envi" 2;
	setAttr ".env[2].envp" 1;
	setAttr ".env[2].envc" -type "float3" 0 0.1 0.44999999 ;
	setAttr ".env[2].envi" 2;
	setAttr ".rro[0]"  0 1 1;
createNode brush -n "dynBoard:brush11";
	setAttr ".lcl[0]"  0 0.5 1;
	setAttr ".pcl[0]"  0 0.5 1;
	setAttr ".wsc[0]"  0 1 1;
	setAttr ".lws[0]"  0 1 1;
	setAttr ".pws[0]"  0 1 1;
	setAttr ".tls[0]"  0 1 1;
	setAttr -s 3 ".env";
	setAttr ".env[0].envp" 0.20000000298023224;
	setAttr ".env[0].envc" -type "float3" 0 0 0.15000001 ;
	setAttr ".env[0].envi" 2;
	setAttr ".env[1].envp" 0.5;
	setAttr ".env[1].envc" -type "float3" 0.47999999 0.55000001 0.69999999 ;
	setAttr ".env[1].envi" 2;
	setAttr ".env[2].envp" 1;
	setAttr ".env[2].envc" -type "float3" 0 0.1 0.44999999 ;
	setAttr ".env[2].envi" 2;
	setAttr ".rro[0]"  0 1 1;
createNode groupId -n "dynBoard:groupId181";
	setAttr ".ihi" 0;
createNode groupId -n "dynBoard:groupId185";
	setAttr ".ihi" 0;
createNode groupId -n "dynBoard:groupId189";
	setAttr ".ihi" 0;
createNode groupId -n "dynBoard:groupId193";
	setAttr ".ihi" 0;
createNode groupId -n "dynBoard:groupId197";
	setAttr ".ihi" 0;
createNode groupId -n "dynBoard:groupId201";
	setAttr ".ihi" 0;
createNode groupId -n "dynBoard:groupId205";
	setAttr ".ihi" 0;
createNode lambert -n "dynBoard:lambert6";
	setAttr ".miic" -type "float3" 3.1415927 3.1415927 3.1415927 ;
createNode shadingEngine -n "dynBoard:lambert6SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "dynBoard:materialInfo5";
createNode file -n "dynBoard:file5";
	setAttr ".ftn" -type "string" "C:/cc_svn/art/MayaSourceArt/environment/office6/doors.tga";
createNode place2dTexture -n "dynBoard:place2dTexture9";
createNode brush -n "dynBoard:brush12";
	setAttr ".lcl[0]"  0 0.5 1;
	setAttr ".pcl[0]"  0 0.5 1;
	setAttr ".wsc[0]"  0 1 1;
	setAttr ".lws[0]"  0 1 1;
	setAttr ".pws[0]"  0 1 1;
	setAttr ".tls[0]"  0 1 1;
	setAttr -s 3 ".env";
	setAttr ".env[0].envp" 0.20000000298023224;
	setAttr ".env[0].envc" -type "float3" 0 0 0.15000001 ;
	setAttr ".env[0].envi" 2;
	setAttr ".env[1].envp" 0.5;
	setAttr ".env[1].envc" -type "float3" 0.47999999 0.55000001 0.69999999 ;
	setAttr ".env[1].envi" 2;
	setAttr ".env[2].envp" 1;
	setAttr ".env[2].envc" -type "float3" 0 0.1 0.44999999 ;
	setAttr ".env[2].envi" 2;
	setAttr ".rro[0]"  0 1 1;
createNode lambert -n "dynBoard:lambert7";
	setAttr ".miic" -type "float3" 3.1415927 3.1415927 3.1415927 ;
createNode shadingEngine -n "dynBoard:lambert7SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "dynBoard:materialInfo6";
createNode file -n "dynBoard:file6";
	setAttr ".ftn" -type "string" "C:/cc_svn/art/MayaSourceArt/environment/office6/objects.tga";
createNode place2dTexture -n "dynBoard:place2dTexture10";
createNode lambert -n "dynBoard:lambert8";
	setAttr ".miic" -type "float3" 3.1415927 3.1415927 3.1415927 ;
createNode shadingEngine -n "dynBoard:lambert8SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "dynBoard:materialInfo7";
createNode file -n "dynBoard:file7";
	setAttr ".ftn" -type "string" "C:/cc_svn/art/MayaSourceArt/environment/homeoffice3/textures/homeoffice3.tga";
createNode place2dTexture -n "dynBoard:place2dTexture11";
createNode groupId -n "dynBoard:groupId277";
	setAttr ".ihi" 0;
createNode groupId -n "dynBoard:groupId283";
	setAttr ".ihi" 0;
createNode groupId -n "dynBoard:groupId286";
	setAttr ".ihi" 0;
createNode groupId -n "dynBoard:groupId292";
	setAttr ".ihi" 0;
createNode groupId -n "dynBoard:groupId295";
	setAttr ".ihi" 0;
createNode lambert -n "dynBoard:lambert9";
	setAttr ".miic" -type "float3" 3.1415927 3.1415927 3.1415927 ;
createNode shadingEngine -n "dynBoard:lambert9SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "dynBoard:materialInfo8";
createNode file -n "dynBoard:file8";
	setAttr ".ftn" -type "string" "C:/cc_svn/art/MayaSourceArt/environment/office6/screen1_animated.tga";
createNode place2dTexture -n "dynBoard:place2dTexture12";
createNode brush -n "dynBoard:brush13";
	setAttr ".lcl[0]"  0 0.5 1;
	setAttr ".pcl[0]"  0 0.5 1;
	setAttr ".wsc[0]"  0 1 1;
	setAttr ".lws[0]"  0 1 1;
	setAttr ".pws[0]"  0 1 1;
	setAttr ".tls[0]"  0 1 1;
	setAttr -s 3 ".env";
	setAttr ".env[0].envp" 0.20000000298023224;
	setAttr ".env[0].envc" -type "float3" 0 0 0.15000001 ;
	setAttr ".env[0].envi" 2;
	setAttr ".env[1].envp" 0.5;
	setAttr ".env[1].envc" -type "float3" 0.47999999 0.55000001 0.69999999 ;
	setAttr ".env[1].envi" 2;
	setAttr ".env[2].envp" 1;
	setAttr ".env[2].envc" -type "float3" 0 0.1 0.44999999 ;
	setAttr ".env[2].envi" 2;
	setAttr ".rro[0]"  0 1 1;
createNode brush -n "dynBoard:brush14";
	setAttr ".lcl[0]"  0 0.5 1;
	setAttr ".pcl[0]"  0 0.5 1;
	setAttr ".wsc[0]"  0 1 1;
	setAttr ".lws[0]"  0 1 1;
	setAttr ".pws[0]"  0 1 1;
	setAttr ".tls[0]"  0 1 1;
	setAttr -s 3 ".env";
	setAttr ".env[0].envp" 0.20000000298023224;
	setAttr ".env[0].envc" -type "float3" 0 0 0.15000001 ;
	setAttr ".env[0].envi" 2;
	setAttr ".env[1].envp" 0.5;
	setAttr ".env[1].envc" -type "float3" 0.47999999 0.55000001 0.69999999 ;
	setAttr ".env[1].envi" 2;
	setAttr ".env[2].envp" 1;
	setAttr ".env[2].envc" -type "float3" 0 0.1 0.44999999 ;
	setAttr ".env[2].envi" 2;
	setAttr ".rro[0]"  0 1 1;
createNode brush -n "dynBoard:brush15";
	setAttr ".lcl[0]"  0 0.5 1;
	setAttr ".pcl[0]"  0 0.5 1;
	setAttr ".wsc[0]"  0 1 1;
	setAttr ".lws[0]"  0 1 1;
	setAttr ".pws[0]"  0 1 1;
	setAttr ".tls[0]"  0 1 1;
	setAttr -s 3 ".env";
	setAttr ".env[0].envp" 0.20000000298023224;
	setAttr ".env[0].envc" -type "float3" 0 0 0.15000001 ;
	setAttr ".env[0].envi" 2;
	setAttr ".env[1].envp" 0.5;
	setAttr ".env[1].envc" -type "float3" 0.47999999 0.55000001 0.69999999 ;
	setAttr ".env[1].envi" 2;
	setAttr ".env[2].envp" 1;
	setAttr ".env[2].envc" -type "float3" 0 0.1 0.44999999 ;
	setAttr ".env[2].envi" 2;
	setAttr ".rro[0]"  0 1 1;
createNode brush -n "dynBoard:brush16";
	setAttr ".lcl[0]"  0 0.5 1;
	setAttr ".pcl[0]"  0 0.5 1;
	setAttr ".wsc[0]"  0 1 1;
	setAttr ".lws[0]"  0 1 1;
	setAttr ".pws[0]"  0 1 1;
	setAttr ".tls[0]"  0 1 1;
	setAttr -s 3 ".env";
	setAttr ".env[0].envp" 0.20000000298023224;
	setAttr ".env[0].envc" -type "float3" 0 0 0.15000001 ;
	setAttr ".env[0].envi" 2;
	setAttr ".env[1].envp" 0.5;
	setAttr ".env[1].envc" -type "float3" 0.47999999 0.55000001 0.69999999 ;
	setAttr ".env[1].envi" 2;
	setAttr ".env[2].envp" 1;
	setAttr ".env[2].envc" -type "float3" 0 0.1 0.44999999 ;
	setAttr ".env[2].envi" 2;
	setAttr ".rro[0]"  0 1 1;
createNode place2dTexture -n "dynBoard:place2dTexture13";
createNode place2dTexture -n "dynBoard:place2dTexture14";
createNode place2dTexture -n "dynBoard:place2dTexture15";
createNode place2dTexture -n "dynBoard:place2dTexture16";
createNode place2dTexture -n "dynBoard:place2dTexture17";
createNode place2dTexture -n "dynBoard:place2dTexture18";
createNode place2dTexture -n "dynBoard:place2dTexture19";
createNode materialInfo -n "dynBoard1:materialInfo7";
createNode shadingEngine -n "dynBoard1:lambert8SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode lambert -n "dynBoard1:lambert8";
	setAttr ".miic" -type "float3" 3.1415927 3.1415927 3.1415927 ;
createNode file -n "dynBoard1:file7";
	setAttr ".ftn" -type "string" "C:/cc_svn/art/MayaSourceArt/environment/homeoffice3/textures/homeoffice3.tga";
createNode place2dTexture -n "dynBoard1:place2dTexture11";
createNode polyTriangulate -n "polyTriangulate1";
	setAttr ".ics" -type "componentList" 1 "f[*]";
createNode transformGeometry -n "transformGeometry1";
	setAttr ".txf" -type "matrix" -0.99994969310030313 0 -0.010030516866531926 0 0 1 0 0
		 0.010030516866531926 0 -0.99994969310030313 0 371.04909800767678 0 133.65498631778496 1;
select -ne :time1;
	setAttr ".o" 0;
select -ne :renderPartition;
	setAttr -s 11 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 11 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -s 45 ".u";
select -ne :lightList1;
select -ne :defaultTextureList1;
	setAttr -s 9 ".tx";
select -ne :lambert1;
	setAttr ".miic" -type "float3" 3.1415927 3.1415927 3.1415927 ;
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultRenderGlobals;
	setAttr ".fs" 1;
	setAttr ".ef" 10;
select -ne :defaultResolution;
	setAttr ".w" 320;
	setAttr ".h" 240;
select -ne :hardwareRenderGlobals;
	setAttr ".enpt" no;
	setAttr ".hgcd" no;
	setAttr ".hgci" no;
select -ne :defaultHardwareRenderGlobals;
	setAttr ".fn" -type "string" "im";
	setAttr ".res" -type "string" "ntsc_4d 646 485 1.333";
select -ne :ikSystem;
	setAttr -s 4 ".sol";
connectAttr "transformGeometry1.og" "dynBoard1:board7Shape.i";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[0].llnk";
connectAttr ":initialShadingGroup.msg" "lightLinker1.lnk[0].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[1].llnk";
connectAttr ":initialParticleSE.msg" "lightLinker1.lnk[1].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[2].llnk";
connectAttr "lambert2SG.msg" "lightLinker1.lnk[2].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[3].llnk";
connectAttr "dynBoard:lambert6SG.msg" "lightLinker1.lnk[3].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[4].llnk";
connectAttr "dynBoard:lambert7SG.msg" "lightLinker1.lnk[4].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[5].llnk";
connectAttr "dynBoard:objects_lambert3SG.msg" "lightLinker1.lnk[5].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[6].llnk";
connectAttr "dynBoard:lambert8SG.msg" "lightLinker1.lnk[6].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[7].llnk";
connectAttr "dynBoard:lambert4SG.msg" "lightLinker1.lnk[7].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[8].llnk";
connectAttr "dynBoard:lambert5SG.msg" "lightLinker1.lnk[8].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[9].llnk";
connectAttr "dynBoard:lambert9SG.msg" "lightLinker1.lnk[9].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[10].llnk";
connectAttr "dynBoard1:lambert8SG.msg" "lightLinker1.lnk[10].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.slnk[0].sllk";
connectAttr "dynBoard:lambert4SG.msg" "lightLinker1.slnk[0].solk";
connectAttr ":defaultLightSet.msg" "lightLinker1.slnk[1].sllk";
connectAttr "lambert2SG.msg" "lightLinker1.slnk[1].solk";
connectAttr ":defaultLightSet.msg" "lightLinker1.slnk[2].sllk";
connectAttr ":initialShadingGroup.msg" "lightLinker1.slnk[2].solk";
connectAttr ":defaultLightSet.msg" "lightLinker1.slnk[3].sllk";
connectAttr ":initialParticleSE.msg" "lightLinker1.slnk[3].solk";
connectAttr ":defaultLightSet.msg" "lightLinker1.slnk[4].sllk";
connectAttr "dynBoard:lambert5SG.msg" "lightLinker1.slnk[4].solk";
connectAttr ":defaultLightSet.msg" "lightLinker1.slnk[5].sllk";
connectAttr "dynBoard:objects_lambert3SG.msg" "lightLinker1.slnk[5].solk";
connectAttr ":defaultLightSet.msg" "lightLinker1.slnk[6].sllk";
connectAttr "dynBoard:lambert6SG.msg" "lightLinker1.slnk[6].solk";
connectAttr ":defaultLightSet.msg" "lightLinker1.slnk[7].sllk";
connectAttr "dynBoard:lambert7SG.msg" "lightLinker1.slnk[7].solk";
connectAttr ":defaultLightSet.msg" "lightLinker1.slnk[8].sllk";
connectAttr "dynBoard:lambert8SG.msg" "lightLinker1.slnk[8].solk";
connectAttr ":defaultLightSet.msg" "lightLinker1.slnk[9].sllk";
connectAttr "dynBoard:lambert9SG.msg" "lightLinker1.slnk[9].solk";
connectAttr ":defaultLightSet.msg" "lightLinker1.slnk[12].sllk";
connectAttr "dynBoard1:lambert8SG.msg" "lightLinker1.slnk[12].solk";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "file1.oc" "homeoffice1_mat.c";
connectAttr "file1.ot" "homeoffice1_mat.it";
connectAttr "homeoffice1_mat.oc" "lambert2SG.ss";
connectAttr "floorShape.iog" "lambert2SG.dsm" -na;
connectAttr "lambert2SG.msg" "materialInfo1.sg";
connectAttr "homeoffice1_mat.msg" "materialInfo1.m";
connectAttr "file1.msg" "materialInfo1.t" -na;
connectAttr "layerManager.dli[1]" "dynBoard:layer3.id";
connectAttr "dynBoard:file3.oc" "dynBoard:lambert4.c";
connectAttr "dynBoard:lambert4.oc" "dynBoard:lambert4SG.ss";
connectAttr "dynBoard:lambert4SG.msg" "dynBoard:materialInfo3.sg";
connectAttr "dynBoard:lambert4.msg" "dynBoard:materialInfo3.m";
connectAttr "dynBoard:file3.msg" "dynBoard:materialInfo3.t" -na;
connectAttr "dynBoard:place2dTexture3.c" "dynBoard:file3.c";
connectAttr "dynBoard:place2dTexture3.tf" "dynBoard:file3.tf";
connectAttr "dynBoard:place2dTexture3.rf" "dynBoard:file3.rf";
connectAttr "dynBoard:place2dTexture3.mu" "dynBoard:file3.mu";
connectAttr "dynBoard:place2dTexture3.mv" "dynBoard:file3.mv";
connectAttr "dynBoard:place2dTexture3.s" "dynBoard:file3.s";
connectAttr "dynBoard:place2dTexture3.wu" "dynBoard:file3.wu";
connectAttr "dynBoard:place2dTexture3.wv" "dynBoard:file3.wv";
connectAttr "dynBoard:place2dTexture3.re" "dynBoard:file3.re";
connectAttr "dynBoard:place2dTexture3.of" "dynBoard:file3.of";
connectAttr "dynBoard:place2dTexture3.r" "dynBoard:file3.ro";
connectAttr "dynBoard:place2dTexture3.n" "dynBoard:file3.n";
connectAttr "dynBoard:place2dTexture3.vt1" "dynBoard:file3.vt1";
connectAttr "dynBoard:place2dTexture3.vt2" "dynBoard:file3.vt2";
connectAttr "dynBoard:place2dTexture3.vt3" "dynBoard:file3.vt3";
connectAttr "dynBoard:place2dTexture3.vc1" "dynBoard:file3.vc1";
connectAttr "dynBoard:place2dTexture3.o" "dynBoard:file3.uv";
connectAttr "dynBoard:place2dTexture3.ofs" "dynBoard:file3.fs";
connectAttr "dynBoard:file4.oc" "dynBoard:lambert5.c";
connectAttr "dynBoard:lambert5.oc" "dynBoard:lambert5SG.ss";
connectAttr "dynBoard:lambert5SG.msg" "dynBoard:materialInfo4.sg";
connectAttr "dynBoard:lambert5.msg" "dynBoard:materialInfo4.m";
connectAttr "dynBoard:file4.msg" "dynBoard:materialInfo4.t" -na;
connectAttr "dynBoard:place2dTexture4.c" "dynBoard:file4.c";
connectAttr "dynBoard:place2dTexture4.tf" "dynBoard:file4.tf";
connectAttr "dynBoard:place2dTexture4.rf" "dynBoard:file4.rf";
connectAttr "dynBoard:place2dTexture4.mu" "dynBoard:file4.mu";
connectAttr "dynBoard:place2dTexture4.mv" "dynBoard:file4.mv";
connectAttr "dynBoard:place2dTexture4.s" "dynBoard:file4.s";
connectAttr "dynBoard:place2dTexture4.wu" "dynBoard:file4.wu";
connectAttr "dynBoard:place2dTexture4.wv" "dynBoard:file4.wv";
connectAttr "dynBoard:place2dTexture4.re" "dynBoard:file4.re";
connectAttr "dynBoard:place2dTexture4.of" "dynBoard:file4.of";
connectAttr "dynBoard:place2dTexture4.r" "dynBoard:file4.ro";
connectAttr "dynBoard:place2dTexture4.n" "dynBoard:file4.n";
connectAttr "dynBoard:place2dTexture4.vt1" "dynBoard:file4.vt1";
connectAttr "dynBoard:place2dTexture4.vt2" "dynBoard:file4.vt2";
connectAttr "dynBoard:place2dTexture4.vt3" "dynBoard:file4.vt3";
connectAttr "dynBoard:place2dTexture4.vc1" "dynBoard:file4.vc1";
connectAttr "dynBoard:place2dTexture4.o" "dynBoard:file4.uv";
connectAttr "dynBoard:place2dTexture4.ofs" "dynBoard:file4.fs";
connectAttr "dynBoard:objects_lambert3SG.msg" "dynBoard:objects_materialInfo2.sg"
		;
connectAttr "dynBoard:objects_lambert3.msg" "dynBoard:objects_materialInfo2.m";
connectAttr "dynBoard:objects_file2.msg" "dynBoard:objects_materialInfo2.t" -na;
connectAttr "dynBoard:objects_lambert3.oc" "dynBoard:objects_lambert3SG.ss";
connectAttr "dynBoard:groupId74.msg" "dynBoard:objects_lambert3SG.gn" -na;
connectAttr "dynBoard:groupId75.msg" "dynBoard:objects_lambert3SG.gn" -na;
connectAttr "dynBoard:groupId76.msg" "dynBoard:objects_lambert3SG.gn" -na;
connectAttr "dynBoard:groupId77.msg" "dynBoard:objects_lambert3SG.gn" -na;
connectAttr "dynBoard:objects_file2.oc" "dynBoard:objects_lambert3.c";
connectAttr "dynBoard:objects_place2dTexture2.c" "dynBoard:objects_file2.c";
connectAttr "dynBoard:objects_place2dTexture2.tf" "dynBoard:objects_file2.tf";
connectAttr "dynBoard:objects_place2dTexture2.rf" "dynBoard:objects_file2.rf";
connectAttr "dynBoard:objects_place2dTexture2.mu" "dynBoard:objects_file2.mu";
connectAttr "dynBoard:objects_place2dTexture2.mv" "dynBoard:objects_file2.mv";
connectAttr "dynBoard:objects_place2dTexture2.s" "dynBoard:objects_file2.s";
connectAttr "dynBoard:objects_place2dTexture2.wu" "dynBoard:objects_file2.wu";
connectAttr "dynBoard:objects_place2dTexture2.wv" "dynBoard:objects_file2.wv";
connectAttr "dynBoard:objects_place2dTexture2.re" "dynBoard:objects_file2.re";
connectAttr "dynBoard:objects_place2dTexture2.of" "dynBoard:objects_file2.of";
connectAttr "dynBoard:objects_place2dTexture2.r" "dynBoard:objects_file2.ro";
connectAttr "dynBoard:objects_place2dTexture2.n" "dynBoard:objects_file2.n";
connectAttr "dynBoard:objects_place2dTexture2.vt1" "dynBoard:objects_file2.vt1";
connectAttr "dynBoard:objects_place2dTexture2.vt2" "dynBoard:objects_file2.vt2";
connectAttr "dynBoard:objects_place2dTexture2.vt3" "dynBoard:objects_file2.vt3";
connectAttr "dynBoard:objects_place2dTexture2.vc1" "dynBoard:objects_file2.vc1";
connectAttr "dynBoard:objects_place2dTexture2.o" "dynBoard:objects_file2.uv";
connectAttr "dynBoard:objects_place2dTexture2.ofs" "dynBoard:objects_file2.fs";
connectAttr "dynBoard:file5.oc" "dynBoard:lambert6.c";
connectAttr "dynBoard:lambert6.oc" "dynBoard:lambert6SG.ss";
connectAttr "dynBoard:lambert6SG.msg" "dynBoard:materialInfo5.sg";
connectAttr "dynBoard:lambert6.msg" "dynBoard:materialInfo5.m";
connectAttr "dynBoard:file5.msg" "dynBoard:materialInfo5.t" -na;
connectAttr "dynBoard:place2dTexture9.c" "dynBoard:file5.c";
connectAttr "dynBoard:place2dTexture9.tf" "dynBoard:file5.tf";
connectAttr "dynBoard:place2dTexture9.rf" "dynBoard:file5.rf";
connectAttr "dynBoard:place2dTexture9.mu" "dynBoard:file5.mu";
connectAttr "dynBoard:place2dTexture9.mv" "dynBoard:file5.mv";
connectAttr "dynBoard:place2dTexture9.s" "dynBoard:file5.s";
connectAttr "dynBoard:place2dTexture9.wu" "dynBoard:file5.wu";
connectAttr "dynBoard:place2dTexture9.wv" "dynBoard:file5.wv";
connectAttr "dynBoard:place2dTexture9.re" "dynBoard:file5.re";
connectAttr "dynBoard:place2dTexture9.of" "dynBoard:file5.of";
connectAttr "dynBoard:place2dTexture9.r" "dynBoard:file5.ro";
connectAttr "dynBoard:place2dTexture9.n" "dynBoard:file5.n";
connectAttr "dynBoard:place2dTexture9.vt1" "dynBoard:file5.vt1";
connectAttr "dynBoard:place2dTexture9.vt2" "dynBoard:file5.vt2";
connectAttr "dynBoard:place2dTexture9.vt3" "dynBoard:file5.vt3";
connectAttr "dynBoard:place2dTexture9.vc1" "dynBoard:file5.vc1";
connectAttr "dynBoard:place2dTexture9.o" "dynBoard:file5.uv";
connectAttr "dynBoard:place2dTexture9.ofs" "dynBoard:file5.fs";
connectAttr "dynBoard:file6.oc" "dynBoard:lambert7.c";
connectAttr "dynBoard:file6.ot" "dynBoard:lambert7.it";
connectAttr "dynBoard:lambert7.oc" "dynBoard:lambert7SG.ss";
connectAttr "dynBoard:lambert7SG.msg" "dynBoard:materialInfo6.sg";
connectAttr "dynBoard:lambert7.msg" "dynBoard:materialInfo6.m";
connectAttr "dynBoard:file6.msg" "dynBoard:materialInfo6.t" -na;
connectAttr "dynBoard:place2dTexture10.c" "dynBoard:file6.c";
connectAttr "dynBoard:place2dTexture10.tf" "dynBoard:file6.tf";
connectAttr "dynBoard:place2dTexture10.rf" "dynBoard:file6.rf";
connectAttr "dynBoard:place2dTexture10.mu" "dynBoard:file6.mu";
connectAttr "dynBoard:place2dTexture10.mv" "dynBoard:file6.mv";
connectAttr "dynBoard:place2dTexture10.s" "dynBoard:file6.s";
connectAttr "dynBoard:place2dTexture10.wu" "dynBoard:file6.wu";
connectAttr "dynBoard:place2dTexture10.wv" "dynBoard:file6.wv";
connectAttr "dynBoard:place2dTexture10.re" "dynBoard:file6.re";
connectAttr "dynBoard:place2dTexture10.of" "dynBoard:file6.of";
connectAttr "dynBoard:place2dTexture10.r" "dynBoard:file6.ro";
connectAttr "dynBoard:place2dTexture10.n" "dynBoard:file6.n";
connectAttr "dynBoard:place2dTexture10.vt1" "dynBoard:file6.vt1";
connectAttr "dynBoard:place2dTexture10.vt2" "dynBoard:file6.vt2";
connectAttr "dynBoard:place2dTexture10.vt3" "dynBoard:file6.vt3";
connectAttr "dynBoard:place2dTexture10.vc1" "dynBoard:file6.vc1";
connectAttr "dynBoard:place2dTexture10.o" "dynBoard:file6.uv";
connectAttr "dynBoard:place2dTexture10.ofs" "dynBoard:file6.fs";
connectAttr "dynBoard:file7.oc" "dynBoard:lambert8.c";
connectAttr "dynBoard:file7.ot" "dynBoard:lambert8.it";
connectAttr "dynBoard:lambert8.oc" "dynBoard:lambert8SG.ss";
connectAttr "dynBoard:lambert8SG.msg" "dynBoard:materialInfo7.sg";
connectAttr "dynBoard:lambert8.msg" "dynBoard:materialInfo7.m";
connectAttr "dynBoard:file7.msg" "dynBoard:materialInfo7.t" -na;
connectAttr "dynBoard:place2dTexture11.c" "dynBoard:file7.c";
connectAttr "dynBoard:place2dTexture11.tf" "dynBoard:file7.tf";
connectAttr "dynBoard:place2dTexture11.rf" "dynBoard:file7.rf";
connectAttr "dynBoard:place2dTexture11.mu" "dynBoard:file7.mu";
connectAttr "dynBoard:place2dTexture11.mv" "dynBoard:file7.mv";
connectAttr "dynBoard:place2dTexture11.s" "dynBoard:file7.s";
connectAttr "dynBoard:place2dTexture11.wu" "dynBoard:file7.wu";
connectAttr "dynBoard:place2dTexture11.wv" "dynBoard:file7.wv";
connectAttr "dynBoard:place2dTexture11.re" "dynBoard:file7.re";
connectAttr "dynBoard:place2dTexture11.of" "dynBoard:file7.of";
connectAttr "dynBoard:place2dTexture11.r" "dynBoard:file7.ro";
connectAttr "dynBoard:place2dTexture11.n" "dynBoard:file7.n";
connectAttr "dynBoard:place2dTexture11.vt1" "dynBoard:file7.vt1";
connectAttr "dynBoard:place2dTexture11.vt2" "dynBoard:file7.vt2";
connectAttr "dynBoard:place2dTexture11.vt3" "dynBoard:file7.vt3";
connectAttr "dynBoard:place2dTexture11.vc1" "dynBoard:file7.vc1";
connectAttr "dynBoard:place2dTexture11.o" "dynBoard:file7.uv";
connectAttr "dynBoard:place2dTexture11.ofs" "dynBoard:file7.fs";
connectAttr "dynBoard:file8.oc" "dynBoard:lambert9.c";
connectAttr "dynBoard:lambert9.oc" "dynBoard:lambert9SG.ss";
connectAttr "dynBoard:lambert9SG.msg" "dynBoard:materialInfo8.sg";
connectAttr "dynBoard:lambert9.msg" "dynBoard:materialInfo8.m";
connectAttr "dynBoard:file8.msg" "dynBoard:materialInfo8.t" -na;
connectAttr "dynBoard:place2dTexture12.c" "dynBoard:file8.c";
connectAttr "dynBoard:place2dTexture12.tf" "dynBoard:file8.tf";
connectAttr "dynBoard:place2dTexture12.rf" "dynBoard:file8.rf";
connectAttr "dynBoard:place2dTexture12.mu" "dynBoard:file8.mu";
connectAttr "dynBoard:place2dTexture12.mv" "dynBoard:file8.mv";
connectAttr "dynBoard:place2dTexture12.s" "dynBoard:file8.s";
connectAttr "dynBoard:place2dTexture12.wu" "dynBoard:file8.wu";
connectAttr "dynBoard:place2dTexture12.wv" "dynBoard:file8.wv";
connectAttr "dynBoard:place2dTexture12.re" "dynBoard:file8.re";
connectAttr "dynBoard:place2dTexture12.of" "dynBoard:file8.of";
connectAttr "dynBoard:place2dTexture12.r" "dynBoard:file8.ro";
connectAttr "dynBoard:place2dTexture12.n" "dynBoard:file8.n";
connectAttr "dynBoard:place2dTexture12.vt1" "dynBoard:file8.vt1";
connectAttr "dynBoard:place2dTexture12.vt2" "dynBoard:file8.vt2";
connectAttr "dynBoard:place2dTexture12.vt3" "dynBoard:file8.vt3";
connectAttr "dynBoard:place2dTexture12.vc1" "dynBoard:file8.vc1";
connectAttr "dynBoard:place2dTexture12.o" "dynBoard:file8.uv";
connectAttr "dynBoard:place2dTexture12.ofs" "dynBoard:file8.fs";
connectAttr "dynBoard1:lambert8SG.msg" "dynBoard1:materialInfo7.sg";
connectAttr "dynBoard1:lambert8.msg" "dynBoard1:materialInfo7.m";
connectAttr "dynBoard1:file7.msg" "dynBoard1:materialInfo7.t" -na;
connectAttr "dynBoard1:lambert8.oc" "dynBoard1:lambert8SG.ss";
connectAttr "dynBoard1:board7Shape.iog" "dynBoard1:lambert8SG.dsm" -na;
connectAttr "dynBoard1:file7.oc" "dynBoard1:lambert8.c";
connectAttr "dynBoard1:file7.ot" "dynBoard1:lambert8.it";
connectAttr "dynBoard1:place2dTexture11.c" "dynBoard1:file7.c";
connectAttr "dynBoard1:place2dTexture11.tf" "dynBoard1:file7.tf";
connectAttr "dynBoard1:place2dTexture11.rf" "dynBoard1:file7.rf";
connectAttr "dynBoard1:place2dTexture11.mu" "dynBoard1:file7.mu";
connectAttr "dynBoard1:place2dTexture11.mv" "dynBoard1:file7.mv";
connectAttr "dynBoard1:place2dTexture11.s" "dynBoard1:file7.s";
connectAttr "dynBoard1:place2dTexture11.wu" "dynBoard1:file7.wu";
connectAttr "dynBoard1:place2dTexture11.wv" "dynBoard1:file7.wv";
connectAttr "dynBoard1:place2dTexture11.re" "dynBoard1:file7.re";
connectAttr "dynBoard1:place2dTexture11.of" "dynBoard1:file7.of";
connectAttr "dynBoard1:place2dTexture11.r" "dynBoard1:file7.ro";
connectAttr "dynBoard1:place2dTexture11.n" "dynBoard1:file7.n";
connectAttr "dynBoard1:place2dTexture11.vt1" "dynBoard1:file7.vt1";
connectAttr "dynBoard1:place2dTexture11.vt2" "dynBoard1:file7.vt2";
connectAttr "dynBoard1:place2dTexture11.vt3" "dynBoard1:file7.vt3";
connectAttr "dynBoard1:place2dTexture11.vc1" "dynBoard1:file7.vc1";
connectAttr "dynBoard1:place2dTexture11.o" "dynBoard1:file7.uv";
connectAttr "dynBoard1:place2dTexture11.ofs" "dynBoard1:file7.fs";
connectAttr "polySurfaceShape1.o" "polyTriangulate1.ip";
connectAttr "polyTriangulate1.out" "transformGeometry1.ig";
connectAttr "lambert2SG.pa" ":renderPartition.st" -na;
connectAttr "dynBoard:lambert4SG.pa" ":renderPartition.st" -na;
connectAttr "dynBoard:lambert5SG.pa" ":renderPartition.st" -na;
connectAttr "dynBoard:objects_lambert3SG.pa" ":renderPartition.st" -na;
connectAttr "dynBoard:lambert6SG.pa" ":renderPartition.st" -na;
connectAttr "dynBoard:lambert7SG.pa" ":renderPartition.st" -na;
connectAttr "dynBoard:lambert8SG.pa" ":renderPartition.st" -na;
connectAttr "dynBoard:lambert9SG.pa" ":renderPartition.st" -na;
connectAttr "dynBoard1:lambert8SG.pa" ":renderPartition.st" -na;
connectAttr "homeoffice1_mat.msg" ":defaultShaderList1.s" -na;
connectAttr "dynBoard:lambert4.msg" ":defaultShaderList1.s" -na;
connectAttr "dynBoard:lambert5.msg" ":defaultShaderList1.s" -na;
connectAttr "dynBoard:objects_lambert3.msg" ":defaultShaderList1.s" -na;
connectAttr "dynBoard:lambert6.msg" ":defaultShaderList1.s" -na;
connectAttr "dynBoard:lambert7.msg" ":defaultShaderList1.s" -na;
connectAttr "dynBoard:lambert8.msg" ":defaultShaderList1.s" -na;
connectAttr "dynBoard:lambert9.msg" ":defaultShaderList1.s" -na;
connectAttr "dynBoard1:lambert8.msg" ":defaultShaderList1.s" -na;
connectAttr "place2dTexture1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "dynBoard:place2dTexture3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "dynBoard:place2dTexture4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "dynBoard:objects_place2dTexture2.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "dynBoard:place2dTexture9.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "dynBoard:place2dTexture10.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "dynBoard:place2dTexture11.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "dynBoard:place2dTexture12.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "dynBoard:place2dTexture13.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "dynBoard:place2dTexture14.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "dynBoard:place2dTexture15.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "dynBoard:place2dTexture16.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "dynBoard:place2dTexture17.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "dynBoard:place2dTexture18.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "dynBoard:place2dTexture19.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "dynBoard1:place2dTexture11.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "lightLinker1.msg" ":lightList1.ln" -na;
connectAttr "file1.msg" ":defaultTextureList1.tx" -na;
connectAttr "dynBoard:file3.msg" ":defaultTextureList1.tx" -na;
connectAttr "dynBoard:file4.msg" ":defaultTextureList1.tx" -na;
connectAttr "dynBoard:objects_file2.msg" ":defaultTextureList1.tx" -na;
connectAttr "dynBoard:file5.msg" ":defaultTextureList1.tx" -na;
connectAttr "dynBoard:file6.msg" ":defaultTextureList1.tx" -na;
connectAttr "dynBoard:file7.msg" ":defaultTextureList1.tx" -na;
connectAttr "dynBoard:file8.msg" ":defaultTextureList1.tx" -na;
connectAttr "dynBoard1:file7.msg" ":defaultTextureList1.tx" -na;
// End of homeoffice3.ma
