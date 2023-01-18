/* Purpose: This is a small project examining sickness absences in occupations 
with a focus on healthcare occupations in BC in the year 2018-2019 (Pre-pandemic). 
This work is closely related to my master's thesis. */

/* Data: This project utilizes the Canadian Labour Force Survey Data in 2018 and 2019. 
More details here: https://www.statcan.gc.ca/en/survey/household/3701  */


/* import all monthly datasets from 2018 to 2019; create macro for directory */
%let lfs_dir= /home/u61475683/LFS_3/;

%macro import_lfs (dat_sav);
	proc import datafile="&lfs_dir.&dat_sav..sav"
	out=lfsall dbms=SAV replace;
run;
/* combines all dataset together */
	proc append base=combined_sav data=lfsall force; quit;

/* using macro created above;uploads and combine all monthly datasets */
%mend;
%import_lfs(LFS_Jan_2018);
%import_lfs(LFS_Feb_2018);
%import_lfs(LFS_Mar_2018);
%import_lfs(LFS_April_2018);
%import_lfs(LFS_May_2018);
%import_lfs(LFS_June_2018);
%import_lfs(LFS_July_2018);
%import_lfs(LFS_August_2018);
%import_lfs(LFS_September_2018);
%import_lfs(LFS_October_2018);
%import_lfs(LFS_November_2018);
%import_lfs(LFS_December_2018);
%import_lfs(LFS_January_2019);
%import_lfs(LFS_February_2019);
%import_lfs(LFS_March_2019);
%import_lfs(LFS_April_2019);
%import_lfs(LFS_May_2019);
%import_lfs(LFS_June_2019);
%import_lfs(LFS_July_2019);
%import_lfs(LFS_August_2019);
%import_lfs(LFS_September_2019);
%import_lfs(LFS_October_2019);
%import_lfs(LFS_November_2019);
%import_lfs(LFS_December_2019);


proc contents data=work.combined_sav; run;

/* export combined dataset to CSV so that I have a saved file of the combined dataset */
proc export data=work.combined_sav
	outfile="/home/u61475683/LFS_3/LFS_combined_2.csv"
	dbms= CSV
	replace;
run;
	

/*importing lfs data  */
data WORK.TEST1    ;
          %let _EFIERR_ = 0; /* set the ERROR detection macro variable */
             infile '/home/u61475683/LFS_3/LFS_combined_2.csv' delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;
                informat REC_NUM best32. ;
               informat SURVYEAR best32. ;
                informat SURVMNTH $7. ;
              informat LFSSTAT $28. ;
               informat PROV $25. ;
                 informat CMA $20. ;
              informat AGE_12 $14. ;
              informat AGE_6 $14. ;
              informat SEX $6. ;
               informat MARSTAT $23. ;
                informat EDUC $36. ;
               informat MJH $42. ;
                informat EVERWORK $27. ;
                informat FTPTLAST $1. ;
               informat COWMAIN $44. ;
               informat IMMIG $46. ;
              informat NAICS_21 $49. ;
                informat NOC_10 $77. ;
               informat NOC_40 $83. ;
              informat YABSENT $20. ;
              informat WKSAWAY best32. ;
              informat PAYAWAY $1. ;
              informat UHRSMAIN best32. ;
              informat AHRSMAIN best32. ;
               informat FTPTMAIN $9. ;
               informat UTOTHRS best32. ;
              informat ATOTHRS best32. ;
               informat HRSAWAY best32. ;
              informat YAWAY $35. ;
              informat PAIDOT best32. ;
               informat UNPAIDOT best32. ;
               informat XTRAHRS best32. ;
              informat WHYPT $101. ;
              informat TENURE best32. ;
              informat PREVTEN $1. ;
                informat HRLYEARN best32. ;
                informat UNION $68. ;
               informat PERMTEMP $9. ;
               informat ESTSIZE $22. ;
               informat FIRMSIZE $23. ;
               informat DURUNEMP $1. ;
               informat FLOWUNEM $1. ;
             informat UNEMFTPT $1. ;
               informat WHYLEFTO $1. ;
              informat WHYLEFTN $1. ;
              informat DURJLESS best32. ;
               informat AVAILABL $1. ;
              informat LKPUBAG $1. ;
              informat LKEMPLOY $1. ;
            informat LKRELS $1. ;
               informat LKATADS $1. ;
             informat LKANSADS $1. ;
            informat LKOTHERN $1. ;
             informat PRIORACT $1. ;
             informat YNOLOOK $43. ;
              informat TLOLOOK $1. ;
               informat SCHOOLN $17. ;
               informat EFAMTYPE $84. ;
             informat AGYOWNK $32. ;
              informat FINALWT best32. ;
             format REC_NUM best12. ;
             format SURVYEAR best12. ;
              format SURVMNTH $7. ;
              format LFSSTAT $28. ;
              format PROV $25. ;
              format CMA $20. ;
             format AGE_12 $14. ;
              format AGE_6 $14. ;
             format SEX $6. ;
              format MARSTAT $23. ;
             format EDUC $36. ;
               format MJH $42. ;
               format EVERWORK $27. ;
             format FTPTLAST $1. ;
              format COWMAIN $44. ;
              format IMMIG $46. ;
               format NAICS_21 $49. ;
               format NOC_10 $77. ;
              format NOC_40 $83. ;
                format YABSENT $20. ;
              format WKSAWAY best12. ;
               format PAYAWAY $1. ;
               format UHRSMAIN best12. ;
               format AHRSMAIN best12. ;
               format FTPTMAIN $9. ;
                format UTOTHRS best12. ;
              format ATOTHRS best12. ;
              format HRSAWAY best12. ;
               format YAWAY $35. ;
               format PAIDOT best12. ;
             format UNPAIDOT best12. ;
               format XTRAHRS best12. ;
                format WHYPT $101. ;
              format TENURE best12. ;
               format PREVTEN $1. ;
               format HRLYEARN best12. ;
                format UNION $68. ;
               format PERMTEMP $9. ;
               format ESTSIZE $22. ;
              format FIRMSIZE $23. ;
              format DURUNEMP $1. ;
               format FLOWUNEM $1. ;
               format UNEMFTPT $1. ;
              format WHYLEFTO $1. ;
              format WHYLEFTN $1. ;
              format DURJLESS best12. ;
               format AVAILABL $1. ;
              format LKPUBAG $1. ;
             format LKEMPLOY $1. ;
             format LKRELS $1. ;
              format LKATADS $1. ;
             format LKANSADS $1. ;
               format LKOTHERN $1. ;
             format PRIORACT $1. ;
              format YNOLOOK $43. ;
              format TLOLOOK $1. ;
              format SCHOOLN $17. ;
             format EFAMTYPE $84. ;
               format AGYOWNK $32. ;
               format FINALWT best12. ;
           input
                        REC_NUM
                       SURVYEAR
                        SURVMNTH  $
                         LFSSTAT  $
                        PROV  $
                        CMA  $
                       AGE_12  $
                       AGE_6  $
                       SEX  $
                        MARSTAT  $
                      EDUC  $
                       MJH  $
                        EVERWORK  $
                        FTPTLAST  $
                       COWMAIN  $
                        IMMIG  $
                       NAICS_21  $
                        NOC_10  $
                         NOC_40  $
                       YABSENT  $
                        WKSAWAY
                        PAYAWAY  $
                         UHRSMAIN
                       AHRSMAIN
                         FTPTMAIN  $
                        UTOTHRS
                        ATOTHRS
                        HRSAWAY
                       YAWAY  $
                         PAIDOT
                      UNPAIDOT
                        XTRAHRS
                        WHYPT  $
                       TENURE
                       PREVTEN  $
                       HRLYEARN
                        UNION  $
                        PERMTEMP  $
                       ESTSIZE  $
                       FIRMSIZE  $
                         DURUNEMP  $
                         FLOWUNEM  $
                         UNEMFTPT  $
                         WHYLEFTO  $
                         WHYLEFTN  $
                         DURJLESS
                         AVAILABL  $
                         LKPUBAG  $
                         LKEMPLOY  $
                         LKRELS  $
                         LKATADS  $
                         LKANSADS  $
                         LKOTHERN  $
                        PRIORACT  $
                         YNOLOOK  $
                         TLOLOOK  $
                        SCHOOLN  $
                        EFAMTYPE  $
                        AGYOWNK  $
                         FINALWT
             ;
             if _ERROR_ then call symputx('_EFIERR_',1);  /* set ERROR detection macro variable */
            run;
/***Note: I originally used proc import but SAS was guessing the wrong attributes for some variables. Therefore, I had to do it manually.  */



/*libname for easy access to data  */
libname a "/home/u61475683/sasdat";

/*saving appended LFS data in library  */
data a.lfs; set work.test1; run;

/* confirm attributes of lfs data */
ods rtf file = "/home/u61475683/RTF/lfs_attributes.rtf";
proc contents data=a.lfs; run;
ods rtf close;

/*look at how many in each province  */
proc freq data=a.lfs;
	table PROV;
	run;

/* sort by those only living in BC */
data bc_only;
	set a.lfs;
	where PROV="British Columbia";
	RUN;
	
/*save bc_only in sasdat folder  */
data a.bc_only; set bc_only;run;
	
/*LOOK AT NOC_10  */
proc freq data=a.bc_only;
	table NOC_10;
	run;

/*LOOK AT NOC_40  */
proc freq data=a.bc_only;
	table NOC_40;
	run;

/* Look at NAICS_21 */
proc freq data=a.bc_only;
	table NAICS_21;
	run;
	
/* look at how many absences are spread out across occupations 
then we are saving to excel's first sheet*/
ods excel file = "/home/u61475683/excel/occ_abs.xlsx" options(sheet_name="freq_abs");
proc freq data=a.bc_only;
	table NAICS_21*YABSENT;
	run;



/* look at frequency of those absent full week and away part of the week */
proc freq data=a.bc_only;
	table YABSENT;
	run;

proc freq data=a.bc_only;
	table YAWAY;
	RUN;

/*bar chart of absences across all occupations 	 */
proc sql;
create table bar_abs_occ as
select YABSENT, NAICS_21, SEX
FROM A.BC_ONLY
WHERE YABSENT = "Own illness or disab";
run;

/*and then save to excel second sheet */
ods excel options(sheet_name="bar_chart");	
proc sgplot data =work.bar_abs_occ;
vbar NAICS_21;
title 'frequency of absences in different occupations';
yaxis label = "frequency of absences";
run;	
ods excel close;

/*As we can see from the bar chart, healthcare occupations' absences are still the highest  */

/* create dataset of those absent fully in the week or part week in BC */
data abs_BC;
	set a.bc_only;
	where YABSENT = "Own illness or disab" OR YAWAY = "Own illness or disability";
	run;

data a.abs_BC; set abs_BC; run;

/* look at frequency of those absent */
proc freq data=a.abs_BC;
	table NAICS_21*YABSENT/list;
	run;
	
proc freq data=a.abs_BC;
	table NAICS_21*YAWAY/list;
	run;
	
/* Compared to other occupations, health care and social occupations show the highest absences 
both for full absence and part-time absence in a week.  */
	
/* further subset data to just healthcare occupations */
data hcw_absBC; 
	set a.abs_bc;
	where NAICS_21="Health care and social assistance";
	run;

data a.hcw_absBC; set hcw_absBC; run;


/* look at how many HCW absent or part-absent for the week  */
proc freq data=a.hcw_absbc;
	table YABSENT YAWAY;
	run;
	
/* do absences differ between males and females?*/
/* then saving bar chart to rtf(word doc) */
ods rtf file="/home/u61475683/RTF/absent_gender.rtf";
proc sgplot data =work.bar_abs_occ;
vbar sex;
title 'absences by sex';
run;
ods rtf close;
/*yes, there are more females absent  */

/*END OF DOCUMENT  */












