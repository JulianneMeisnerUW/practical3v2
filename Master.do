/*========================================================
 * PART 1 - DEFINE GLOBALS
	-User 1: 
	-User 2: 
	-User 3: 
==========================================================*/
* Set this value to the user currently using this file*** 
    global user 1 
	
* Root folder globals
	if $user == 1 {
		cd ../../../
		global projectFolder	"/Users/juliannemeisner/Dropbox/ILRI/presentations/practicals/session2" 
		cd "$projectFolder"
	}

*Project folder globals
	global projectData			"$projectFolder/data"
	global projectDoc			"$projectFolder/documentation"
	global projectDo			"$projectFolder/do_files"
	global projectSurv			"$projectFolder/questionnaires"
	
	macro list
	

/*========================================================
 * PART 2 - CHECK THE ODK SURVEY FOR STATA OPTIMIZATION
==========================================================*/	
    ietestform using "$projectSurv/survey.xlsx", reportsave ("$projectDoc/ODK_report.csv") 
	clear
	
/*========================================================
 * PART 3 - CHECK FOR DUPLICATES
==========================================================*/
	import excel "$projectData/data.xlsx", sheet("survey") firstrow 
	ieduplicates O using "$projectDoc/duplicates_report.xlsx", uniquevars(_index) duplistid(_duplistid) force
	clear
	
/*==============================================================================================================================
 * PART 4 - CLEANING AND LABELING
===============================================================================================================================*/
	*Step 1
	do "$projectDo/template_1.do" 
	
	*Step 2
	//Go into the codebook template (codebook_templatev1 in projectDoc) and edit columns A and B. Any variables with an empty entry in column A ("name") will be dropped when the codebook is applied in the next .do file
	
	*Step 3
	do "$projectDo/labeling_1.do" 
	
	*Step 4
	do "$projectDo/template_2.do" 
	
	*Step 5
	//Go into the codebook template (codebook_templatev2 in projectDoc). Copy and paste column E (from row 3 and down) to column A, and copy and paste column E (rows 3 and down) to column B, and complete column D and the choices worksheet

	*Step 6
	do "$projectDo/labeling_2.do" 
	
	
	