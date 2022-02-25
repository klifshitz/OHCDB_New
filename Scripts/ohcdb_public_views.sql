/*
Created: 2/11/2022
Modified: 2/24/2022
Project: OHCDB
Model: OHCDB_RE
Company: Steampunk
Author: Kobi Lifshitz
Version: 2.0
Database: PostgreSQL 12
*/

set role :role;
set search_path to :schema;

-- Create views section -------------------------------------------------

CREATE VIEW "public"."cxo_enhancement" AS
   SELECT a."Occ Series",
      a."EMPLOYEE_WORK_EMAIL",
      a."POSITION_OFFICIAL_TITLE",
      a."LEO_IND",
      a."SEX_CODE",
      a.filename,
      a.cxo_pp1,
      a."DIR",
      a."OFFICE",
      a."BUD",
      a."ORG",
      a."ORG TEXT",
      a."POSN NR",
      a."FILLED/VACANT",
      a."INCMB/VICE NAME",
      a."SERIES",
      a."STEP",
      a."TITLE",
      a."ENHANCE/SUPP YR",
      a."FUND IND",
      a."LAW ENF",
      a."EOD DT",
      a."REL POS IND",
      a."REL POS NBR",
      a."NTE DT",
      a."SF52",
      a."Selectee Name",
      a."FPL",
      a."DUTY CITY",
      a."DUTY STATE",
      a."TITLE GROUP",
      a."DAYS VACANT",
      a."DUTY LOC",
      a."CODE",
      a."SUFFIX",
      a."OFF/SUPRT",
      a."RETIRE",
      a."INCMB PP",
      a."INCMB BASE",
      a."INCMB ADJ",
      a."DHS DT",
      a."FED START DT",
      a."INCMB GRADE DT",
      a."NOAC1",
      a."NOAC2",
      a."INCMB CAT CD",
      a."VAC DT",
      a."DAYS OCCUP",
      a."MAX NTE DT",
      a."INCMB NTE DT",
      a."AGENCY",
      a."TOD HRS",
      a."HIRING ACTION",
      a."HIRING STATUS",
      a."CAS/PPA",
      a."CAS PPA DESCRIPTION",
      a."HQ/FIELD",
      a."PML on board",
      a."OE-Status",
      a."CXO_ENHANCE/SUPP YR",
      a.cxo_fy,
      a.ingested_at,
          CASE
              WHEN ((a."SERIES" = '0018'::text) AND (a."TITLE" ~~ '%SAFETY & OCCUPTL HLTH MGR%'::text)) THEN 'OTHRSPT'::text
              WHEN ((a."SERIES" = '0072'::text) AND (a."TITLE" ~~ '%FNGRPRNT SPECLST%'::text)) THEN 'LESUPT'::text
              WHEN ((a."SERIES" = '0101'::text) AND (a."TITLE" ~~ '%EMP ASSTNC PROG MGR%'::text)) THEN 'MSNSUPT'::text
              WHEN ((a."SERIES" = '0132'::text) AND (a."TITLE" ~~ '%DEP ASST DIR INTEL%'::text)) THEN 'IRS'::text
              WHEN ((a."SERIES" = '0180'::text) AND (a."TITLE" ~~ '%CLNCL PSYCH%'::text)) THEN 'MED'::text
              WHEN ((a."SERIES" = '0188'::text) AND (a."TITLE" ~~ '%RECR SPECLST%'::text)) THEN 'LEOTHR'::text
              WHEN ((a."SERIES" = '0305'::text) AND (a."TITLE" ~~ '%MAIL & FILE CLK OA%'::text)) THEN 'LGLSUPT'::text
              WHEN ((a."SERIES" = '0905'::text) AND (a."TITLE" ~~ '%ATTY ADVSR%'::text)) THEN 'ATTY'::text
              WHEN ((a."SERIES" = '1102'::text) AND (a."TITLE" ~~ '%ASST DIR OFF OF ACQ%'::text)) THEN 'CONT'::text
              WHEN ((a."SERIES" = '1801'::text) AND (a."TITLE" ~~ '%ASST DIR ENFCMNT & REMOVAL OPS%'::text)) THEN 'DO'::text
              WHEN ((a."SERIES" = '1801'::text) AND (a."TITLE" ~~ '%INSPS & COMPLNC SPECLST%'::text)) THEN 'INSPS & COMP'::text
              WHEN ((a."SERIES" = '1811'::text) AND (a."TITLE" ~~ '%ASSOC DIR OPR%'::text)) THEN 'CI'::text
              WHEN ((a."SERIES" = '2210'::text) AND (a."TITLE" ~~ '%CHIEF INFORMATION OFFICER%'::text)) THEN 'ITSPEC'::text
              WHEN ((a."SERIES" = '4742'::text) AND (a."TITLE" ~~ '%UTIL SYS RPRER OPERTR%'::text)) THEN 'WGSUPT'::text
              ELSE a."TITLE GROUP"
          END AS tableau_title_group
     FROM public.cxo_enhancement_archive a;
;

CREATE VIEW "public"."cxo_eoy_604" AS
  SELECT a.dir,
      a.office,
      a.bud,
      a.org,
      a."org text",
      a."posn nr",
      a.filled_vacant,
      a."incmb_vice name",
      a.ft,
      a.prog,
      a.prge,
      a.proj,
      a."fund prog ",
      a."cat cd",
      a.ftep,
      a.pp,
      a.series,
      a."incb grd",
      a.step,
      a.prfx,
      a.title,
      a.mrn,
      a.priority,
      a."enhance_supp yr",
      a.fund_ind,
      a.law_enf,
      a.sens_ind,
      a.bus_cd,
      a.grp,
      a.hrs,
      a.dtl_org_code,
      a.eod_dt,
      a.rel_pos_ind,
      a.rel_pos_nbr,
      a.nte_dt,
      a.sf52,
      a.selectee_name,
      a.entry,
      a.fpl,
      a."DUTY CITY",
      a."DUTY STATE",
      a.nfc_stored_acct,
      a."tops_payroll_acct ",
      a.tops_ipaguse,
      a.create_id,
      a.create_dt,
      a.upd_id,
      a.upd_dt,
      a.scd_dt,
      a.title_group,
      a.days_vacant,
      a.mci,
      a.proj_type,
      a.bws,
      a.conus,
      a.flsa,
      a.hco,
      a.supvy,
      a.duty_loc,
      a.code,
      a.suffix,
      a.off_suprt,
      a.working_title,
      a.classf,
      a.classf_dt,
      a.lang,
      a.retire,
      a.incmb_pp,
      a.incmb_base,
      a.incmb_adj,
      a.dhs_dt,
      a.fed_start_dt,
      a.incmb_grade_dt,
      a.noac1,
      a.noac2,
      a.incmb_cat_cd,
      a.vac_rsn,
      a.vac_dt,
      a.days_occup,
      a.max_nte_dt,
      a.incmb_nte_dt,
      a.agency,
      a.son,
      a.tod_hrs,
      a.furlough_status,
      a.hiring_action,
      a.hiring_status,
      a.cas_ppa,
      a.cas_ppa_description,
      a.hq_field,
      a.pml_on_board,
      a.fiscal_year,
      a.fy_pp,
      a.cy_pp,
      a."Org Structure",
      a."POI",
      a."Pay Plan",
      a."Occ Series",
      a."Grade/Step",
      a."Employee Name",
      a."Type of Appointment",
      a."Duty Station",
      a."Base Contract Salary",
      a."Age",
      a."EMPLOYEE_WORK_EMAIL",
      a."ANNUITANT_INDICATOR",
      a."DATE_AGENCY_EOD",
      a."DATE_ENTERED_POI",
      a."DATE_OF_BIRTH",
      a."DATE_SCD_WGI",
      a."FAIR_LABOR_STANDARDS_CODE",
      a."GRADE",
      a."MASTER_RECORD_NUMBER",
      a."POSITION_NUMBER",
      a."POSITION_OFFICIAL_TITLE",
      a."POSITION_SUPERVISORY_CODE",
      a."SPEC_EMPLOYMENT_PGMS_CODE",
      a."SPECIAL_EMPLOYEE_CODE",
      a."TENURE_GROUP",
      a."WORK_SCHEDULE",
      a."DATE_ENTERED_PRES_GRADE",
      a."DATE_NON_PAY_NTE",
      a."PMSO_IP_AGY_USE",
      a."POSITION_TARGET_GRADE",
      a."DATE_6C_RETIREMENT",
      a."DATE_CBPO_RET_SCD",
      a."DATE_SCD_CSR",
      a."DATE_SCD_LEAVE",
      a."RT_PLAN_CODE",
      a."DATE_CAREER_PERM_TEN_START",
      a."DATE_PROB_PERIOD_START",
      a."LEO_IND",
      a."UNIFORM_SERVICE_STATUS",
      a."BARGAINING_UNIT_STATUS_CD",
      a."DATE_DETL_EXPIR",
      a."DATE_PROMOTION_NTE",
      a."SCHEDULED_SALARY",
      a."SEX_CODE",
      a."PREVIOUS_AGENCY_CODE",
      a."POSITION_STATUS_CODE",
      a.filename,
      a.ingested_at,
          CASE
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEP DIR ICE'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CHIEF OF STAFF'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MGMT & PROG ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEP CH OF STAFF'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SPECIAL ADVISOR (PROTOCOL & SPEC EVTS)'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PROG MGR'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MSN SUPT SPECL'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASSISTANT EXEC SEC'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'WRI EDIT'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASST DIR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CONGRSNL LIASN SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY CONGRSNL LIASN OFCR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SPEC ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY PUBLIC AFF SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PUBLIC AFF SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MISSION SUPPORT SPECIALIST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY MGMT & PROG ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'VIS INF SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'AUDIO VIS PRODN SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY AUDIO VIS PRODN SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASST DIR DIVERSITY & CIVIL RIGHTS'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'EQ EMPLMT SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CLK'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'EQ EMPLMT MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY POLICY ADVISOR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PLCY ADVSR'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY EQ EMPLMT SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY EQ OPP SPEC'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'POLICY ADVSR'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY CRIM INVSTGR'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CRIM INVSTGR'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'EQUIP SPECLST ORDNC'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPP TECHNCN OA'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY GEN ENGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ENGRG TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LAW ENFORCEMENT PROG. MGR.'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEPRTN OFFCR (COURSE DEVLP/INSTR)'::text) THEN 'DO'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'TRAINING SPEC (FIREARMS)'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FIREARMS PGRM SPCLST'::text) THEN 'LEOTHR'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'TRNG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CRIMINAL INVESTIGATOR (INSTRUCTOR)'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DETNTN & DEPORTATN OFFCR'::text) THEN 'DO'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY DETNTN & DEPORTATN OFFCR'::text) THEN 'DO'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FACIL OPERS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY COMMUNITY RELATIONS OFFCR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'COMMUNITY RELATIONS OFFCR'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SENIOR ADVSR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEP CHIEF OF STAFF'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'STAFF ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'BUDG ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'REGULATORY AND POLICY ANALYST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ECONMST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PLCY ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY REGULATORY ANALYST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY PLCY ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ECONOMIST (CHIEF)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CH OF STAFF'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY MSN SUPT SPECL'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INSTRUCTNL SYS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INSTRUCTNL SYS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PROG MGR (LRNG MGMT)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'TRNG INSTRU'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INSTRUCTIONAL SPECIALIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MISSION SUPRT ASST OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY TRNG INSTRU'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEPUTY CHIEF HUMAN CAPITAL OFFICER'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CHIEF HUMAN CAPITAL OFFICER'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'HUMAN RESOURCES SPECLST (COMPEN)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SENIOR HUMAN RESOURCES ADVISOR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY STRATEGIC ADVSR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY HUMAN RESOURCES SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'HUMAN RESOURCES SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'HUMAN RESOURCES ASST OA'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY HUMAN RESOURCES SPECLST (EMPL BE'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'HUMAN RESOURCES SPECLST (RECRUIT&PLAC)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY HUMAN RESOURCES SPECLST (RECRUIT'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY HUMAN RESOURCES SPECLST (CLASSIF'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'HUMAN RESOURCES SPECLST (CLASSIFN)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PRE-EMPLOYMENT SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PRE EMPLOYMENT ASST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'STUD TR (HUMAN RESOURCES)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY HR SPECLST (EMPL & LABOR REL)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'HUMAN RESOURCES SPECLST (LABOR REL)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY HUMAN RESOURCES SPECLST (LABOR R'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LEAD HUMAN RESOURCES SPECLST (EMPL REL'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY HUMAN RESOURCES SPECLST (EMPL RE'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'HR SPECLST (CLASSIFN RECRUIT & PLAC)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY PHYSICIAN'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PHYSICIAN'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'OCCUPTL HLTH NURSE'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DRUG PROG COORD'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'HUMAN RESOURCES SPECLST (EMPL BENES)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'BEHAVIORAL HLTH SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'EMP ASSTNC PROG MGR'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY PSYCH'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CHAPLAIN DIR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PERS RES PSYCH'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY PERS RESEARCH PSYCH'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MGMT INF ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY HUMAN RESOURCES SPECLST (INFO SY'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ADMV OFFCR'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY ADMV OFFCR'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CIVILIAN PAY TECHNCN OA'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY HUMAN RESOURCES SPECLST (COMPEN)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASST DIR INF GOVERNANCE'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'RECS AND INFO MGMT SPEC'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'OPER RES ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PRIVACY OFFICER'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MGMT & PRO ANAL (PRIVACY COMPLIANCE)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SR INFO GOV ANALYST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'GOVNMNT INFO SPEC (PRIVACY COMPLIANCE)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MGMT & PROG ANAL (BUDG & COR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY RECORDS & INFORMATION MGMT SPECI'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PARALEGAL SPECLST (FOIA/PA)'::text) THEN 'LGLSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PARALEGAL SPECLST'::text) THEN 'LGLSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FOIA/PA ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY PARALEGAL SPECLST'::text) THEN 'LGLSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY PARALEGAL SPECLST (FOIA/PA)'::text) THEN 'LGLSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PARALEGAL SPECLST (FOIA)'::text) THEN 'LGLSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FREEDOM OF INFORMATION ACT DIRECTOR'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEPUTY DIRECTOR FOIA'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'GEN ENGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ITSPEC (INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'OPERATIONS RESEARCH ANALYST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEP PRINC LEG ADVSR'::text) THEN 'ATTY'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEP PRIN LEGAL ADVSR MANAGEMENT'::text) THEN 'ATTY'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PRINCIPAL LEGAL ADVISOR FOR ICE'::text) THEN 'ATTY'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY GEN ATTY'::text) THEN 'ATTY'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'GEN ATTY'::text) THEN 'ATTY'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ATTY ADVSR'::text) THEN 'ATTY'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASSOC DEP PRINC LEG ADVSR'::text) THEN 'ATTY'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PARALEGAL SPECIALIST (OPLA)'::text) THEN 'LGLSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEP PRINC LEGAL ADVSR HEADQUARTES'::text) THEN 'ATTY'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'HISTRN'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LIBRN LAW'::text) THEN 'LGLSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LEG ASST OA'::text) THEN 'LGLSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY GEN ATTY (ETHICS)'::text) THEN 'ATTY'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'GEN ATTY (ETHCIS)'::text) THEN 'ATTY'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MAIL & FILE CLK OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LEAD LEG ASST'::text) THEN 'LGLSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CHIEF COUNSEL'::text) THEN 'ATTY'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LAW CLK'::text) THEN 'LGLSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY LEG ASST OA'::text) THEN 'LGLSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'TRIAL ATTY'::text) THEN 'ATTY'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'STUD TR (LEG ASST) OA'::text) THEN 'LGLSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ENFORCEMENT PROGRAMS MGR'::text) THEN 'LEOTHR'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASST DIR ENFCMNT & REMOVAL OPS'::text) THEN 'DO'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEP ASST DIR FLD OPERS'::text) THEN 'DO'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INTEL RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'EMERGENCY MANAGEMENT SPECIALIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY EMERGENCY MANAGEMENT SPECIALIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'STATCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEPUTY ASSISTANT DIRECTOR ERO'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MGMT & PROG ANAL (DET SVCS MGR)'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEPRTN OFFCR (COMP STDS OFFCR)'::text) THEN 'DO'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASST DIR SECURE COMMUNITIES'::text) THEN 'DO'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CRIM TARGETING SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY CRIM TARGETING SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEPRTN OFFCR'::text) THEN 'DO'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LAW ENFCMNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY LAW ENFCMNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASST DIR ICE SRVCS HLTH CORPS'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'HEALTH SYSTEMS SPECIALIST'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY PHYSCN (PSYCHTRC)'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PHYSICIAN (CLINICAL DIRECTOR)'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PHYSICIAN (PSYCHIATRY)'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MEDCL OFFCR'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PHYSCN (GEN PRACTICE)'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PHYSICIAN (REG CLINICAL DIR)'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PHYSICIAN (CONSULTANT)'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PHYSICIAN (DAD/MED DIRECTOR)'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CLNCL NURSE'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY HEALTH SYSTEM SPECIALIST'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PRACTICAL NURSE'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'NURSE PRACTITIONER'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MEDCL REC TECHNCN'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DNTL HYGIENIST'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY WRI EDIT'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SECY OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ADV PRAC NURSE (NURSE PRACTITIONER)'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DIAGNSTC RADIOLOGIC TECHNCN'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DNTL ASST'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PHYSCN ASST'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CLNCL PSYCH'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SOC WRKR'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ADVANCE NURSE PRAC'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MATHCL STATCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY ENFCMNT & RMVL ASST OA'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'STUD TR'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'TRAFF MGMT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'TRNG TECHNCN OA'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPP TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPP TECHNCN (INVENT)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'BOND CNTL SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY BOND SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LAW ENFCMNT TECHNCN'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ADMV ASST OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'RECR SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MGMT ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'IMMGRTN ENF AGT'::text) THEN 'DO'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FOOD SRVS SPEC'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'AUTMTV MECH'::text) THEN 'WGSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LAW ENFCMNT COMMUN ASST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY MSN SUPT SPECL (COTR)'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MTRLS HNDLR'::text) THEN 'WGSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'OFF AUTOMATION ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INVENT MGMT SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ELCTRON TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'OFF AUTOMATION CLK'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MGMT PROG TECHNCN OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASST DIR OFF OF ACQ'::text) THEN 'CONT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PROCUR ANAL'::text) THEN 'CONT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEBARMENT ANAL (SENIOR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEBARMENT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CONTR SPECLST'::text) THEN 'CONT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY CONTR SPECLST'::text) THEN 'CONT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY DEBARMENT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'EXEC ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PROCUR & BUS RESOURCES MGMT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY PROCUR & BUS RESOURCES MGT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SR PROCUR & BUS RESOURCES MGMT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'BUS OPERS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEP ASSOC DIRECTOR OPR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASSOC DIR OPR'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MGMT & PROG ANAL (SR PROG ADVSR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASST DIR INVST OPR'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'OVERSIGHT ADM (PREA)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INVESTIGATIVE ANALYST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'OPERTNL ANALS SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INSIDER THREAT OPERTNL ANAL'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INTELL RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'OPERATIONAL ANALYSIS SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INTEL RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'TECHNCL ENFCMNT OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY TECHNCL ENFCMNT OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INTELL & INFO SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INSIDER THREAT SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MGMT & PROG ANALYST (PROG ADVSR)'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INVESTIGATIVE PROGRAM OFFICER'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DIV DIRINSPR & DETENTION OVERSIGHT'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INSPS & COMPLNC MGR'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INSPS & COMPLNC SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INSPS & COMPLC SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY SUPV ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INSPS & COMPLNC SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY SECUR SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PERS SECUR SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY PERS SECUR SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SECUR SPECLST (POLYGRAPH EXAMNR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY SECUR SPECLST (POLYGRAPH EXMNR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PHYS SECUR SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SECUR SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SECUR INSPR'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CHIEF INFORMATION OFFICER'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEP CHIEF INFORMATION OFFICER'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY IT SPEC (ENTACH/INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'COMMUNICATIONS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ITSPEC (PLCYPLN)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY ITSPEC (SYSANALYSIS)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'IT PROJ MGR'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ITSPEC (SYSADMIN)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY ITSPEC (INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ITSPEC'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY ITSPEC (APPSW/INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LEAD ITSPEC (INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ITSPEC (DATAMGT)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ITSPEC (SYSANALYSIS)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY ITSPEC (PLCYPLN)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ITSPEC (CUSTSPT)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ITSPEC (NETWORK)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY ITSPEC (CUSTSPT)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LEAD ITSPEC (NETWORK)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LEAD ITSPEC (CUSTSPT)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY ITSPEC (NETWORK)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY BUS OPERS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEPUTY CHIEF FINANCIAL OFFICER'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CHIEF FINANCIAL OFCR (ICE)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPV ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LEAD MGMT & PROG ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LEAD FNANCL PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FNANCL PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FIN PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DIR BUDGET & PROGRAM PERFORMANCE'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY BUDG ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PROGRAM MANAGEMENT SPECIALIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SAFETY & OCCUPTL HLTH SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INDL HYGIENIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SAFETY & OCCUPTL HLTH MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'NURSE CONSULTANT'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MAIL & FILE ASST (OA)'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SPACE MGMT SUPRT SPECL'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ARCH'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LEASE ADMIN PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SPACE MGMT SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PROG MGR (FACILITIES)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'BLDG MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FACIL PROG MGR'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'UTIL SYS RPRER OPERTR'::text) THEN 'WGSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DIR OF FNANCL MGMT'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY FNANCL PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY SYS ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MISSION SUPRT SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LEAD ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SYS ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY FNANCL SYS MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FINANCIAL SYSTEMS MANAGER'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FINANCIL MGMT SYSTEMS ANAL (TEAM LEAD)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY FNANCL BUS INTEG MANAGER'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ACCTG TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY MGMT INF ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY FNANCL ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LEAD ACCTG TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FNANCL MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ACCNT (TAX)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEPUTY DIRECTOR INVESTIGATIONS'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASST DIR OFFICE OF INVESTIGATIONS'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'AUDR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEP ASST DIR INVEST'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INTELL OPERS SPECLST'::text) THEN 'IRS'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CRIM RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PAROLE PROG SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASSET FORFEIT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY SOC SCI PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SOC SCI PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INTELL OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INTELL OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY FORENSIC DOCMT EXAMN'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FORENSIC DOCMT EXAMNR'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FNGRPRNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PHOTOGR (FORENSIC)'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SR. DIG MULTIMEDIA FORENSIC ANALYST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SEIZED PROPERTY SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY FNGRPRNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY FORENSIC DOCMT EXAMNR'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PHYS SCNTST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'EMER PREPAREDNESS SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SEVP APPEALS ADJUDR'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'COUNTERTERRORISM INTELL SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SEVP FLD REPR'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY SEVP FLD REPR'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SEVP ADJUDR'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY SEVP ADJUDR'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'EXECUTIVE DIRECTOR LEIS'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CYBER OPERS OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'COMPR FORENSIC ANAL'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CRIM INVSTGR (NATL PROG MGR)'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'TACTICAL COMMUN OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'TELECOMMUN SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SOC SCI PROG SPEC (VICTIM WIT ASST)'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INVESTIGATIVE ASST OA'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SPEC AGT IN CHG'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INTELL RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SEIZED PROP SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INVESTIGATIVE CLK OA'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FILE ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'TECHNCL OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PROG ASST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INTELL ASST'::text) THEN 'IRS'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ICE TACTICAL OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY ICE TACTICAL OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PROG SUPRT SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INF RECPTNST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ENFCMNT OPERS SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SECTOR ENFCMNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LEAD SECTOR ENFCMNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'TECHNICAL EQUIPMENT SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY TACTICAL COMMUN OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DIR FEDL EXPORT ENFCMNT COORDNTN CENTR'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY PROG SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY PROG ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INVESTIGATIVE ANALYST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY FOIA/PRIVACY ACT SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DIR INTELL'::text) THEN 'IRS'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEP ASST DIR INTEL'::text) THEN 'IRS'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INTELL OPERS SPECLST'::text) THEN 'IRS'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEP DIR, INTERNATIONAL AFFAIRS'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DIR INTERPOL WASH'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY CRIM INVSTGR (OPERS CH)'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEPRTN LIASN OFFCR'::text) THEN 'DO'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'IMMIGRATN OFFCR'::text) THEN 'LEOTHR'::text
              ELSE a.title_group
          END AS tableau_title_group,
          CASE
              WHEN ((a."DUTY CITY" = 'LORDS VALLEY'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'ATLANTA'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'CHICAGO'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'PASCO'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'STOCKTON'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'HOUMA'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'BLUE ASH'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'NEW YORK -QUEENS'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'GREAT FALLS'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'SAN ANGELO'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'KAILUA KONA'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'IDAHO FALLS'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'SALISBURY'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'CHARLESTON NAVAL CX'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'SALT LAKE CITY'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'FARMVILLE'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'LOUISVILLE'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'BOSTON'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'FT MYERS'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'CHEYENNE'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'GRAND ISLAND'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'ROSWELL'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'HOULTON'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'LITTLE ROCK'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'WINSTON SALEM'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'ATLANTIC CITY'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'KANSAS CITY'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'ANCHORAGE'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'FARGO'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'MESA'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'WASHINGTON'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'SAINT ALBANS'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'DURANGO'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'CHATTANOOGA'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'DETROIT'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'GADSDEN'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'OKMULGEE'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'DULUTH'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'HARTFORD'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'MEDFORD'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'GULFPORT'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'PORTSMOUTH'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'MADISON'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'FORT WAYNE'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'SIOUX FALLS'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'RENO'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'CHARLESTON'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'WICHITA'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'DOVER'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'WARWICK'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'SIOUX CITY'::text) AND (a.conus = 'Y'::text)) THEN a."DUTY STATE"
              ELSE a."DUTY STATE"
          END AS cxo_state,
          CASE
              WHEN ((a."DUTY CITY" = 'FRANKFURT'::text) AND (a.conus = 'N'::text)) THEN 'GERMANY'::text
              WHEN ((a."DUTY CITY" = 'MANAMA'::text) AND (a.conus = 'N'::text)) THEN 'BAHRAIN'::text
              WHEN ((a."DUTY CITY" = 'KINGSTON'::text) AND (a.conus = 'N'::text)) THEN 'JAMAICA'::text
              WHEN ((a."DUTY CITY" = 'AGUADILLA'::text) AND (a.conus = 'N'::text)) THEN 'PUERTO RICO'::text
              WHEN ((a."DUTY CITY" = 'SAN JUAN'::text) AND (a.conus = 'N'::text)) THEN 'PUERTO RICO'::text
              WHEN ((a."DUTY CITY" = 'CASABLANCA'::text) AND (a.conus = 'N'::text)) THEN 'MOROCCO'::text
              WHEN ((a."DUTY CITY" = 'STUTTGART'::text) AND (a.conus = 'N'::text)) THEN 'GERMANY'::text
              WHEN ((a."DUTY CITY" = 'LONDON'::text) AND (a.conus = 'N'::text)) THEN 'UNITED KINGDOM'::text
              WHEN ((a."DUTY CITY" = 'JERUSALEM'::text) AND (a.conus = 'N'::text)) THEN 'ISRAEL'::text
              WHEN ((a."DUTY CITY" = 'BRASILIA'::text) AND (a.conus = 'N'::text)) THEN 'BRAZIL'::text
              WHEN ((a."DUTY CITY" = 'NEW DELHI'::text) AND (a.conus = 'N'::text)) THEN 'INDIA'::text
              WHEN ((a."DUTY CITY" = 'WARSAW'::text) AND (a.conus = 'N'::text)) THEN 'POLAND'::text
              WHEN ((a."DUTY CITY" = 'GUANGZHOU'::text) AND (a.conus = 'N'::text)) THEN 'CHINA'::text
              WHEN ((a."DUTY CITY" = 'PORT-AU-PRINCE'::text) AND (a.conus = 'N'::text)) THEN 'HAITI'::text
              WHEN ((a."DUTY CITY" = 'MANILA'::text) AND (a.conus = 'N'::text)) THEN 'PHILIPPINES'::text
              WHEN ((a."DUTY CITY" = 'DUBAI'::text) AND (a.conus = 'N'::text)) THEN 'UNITED ARAB EMIRATES'::text
              WHEN ((a."DUTY CITY" = 'MUSCAT'::text) AND (a.conus = 'N'::text)) THEN 'OMAN'::text
              WHEN ((a."DUTY CITY" = 'MAYAGUEZ'::text) AND (a.conus = 'N'::text)) THEN 'PUERTO RICO'::text
              WHEN ((a."DUTY CITY" = 'ISLAMABAD'::text) AND (a.conus = 'N'::text)) THEN 'PAKISTAN'::text
              WHEN ((a."DUTY CITY" = 'HERMOSILLO'::text) AND (a.conus = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."DUTY CITY" = 'SANTO DOMINGO'::text) AND (a.conus = 'N'::text)) THEN 'DOMINICAN REPUBLIC'::text
              WHEN ((a."DUTY CITY" = 'GUATEMALA'::text) AND (a.conus = 'N'::text)) THEN 'GUATEMALA'::text
              WHEN ((a."DUTY CITY" = 'BOGOTA'::text) AND (a.conus = 'N'::text)) THEN 'COLOMBIA'::text
              WHEN ((a."DUTY CITY" = 'BRIDGETOWN'::text) AND (a.conus = 'N'::text)) THEN 'BARBADOS'::text
              WHEN ((a."DUTY CITY" = 'ANTWERP'::text) AND (a.conus = 'N'::text)) THEN 'BELGIUM'::text
              WHEN ((a."DUTY CITY" = 'PARIS'::text) AND (a.conus = 'N'::text)) THEN 'FRANCE'::text
              WHEN ((a."DUTY CITY" = 'MATAMOROS'::text) AND (a.conus = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."DUTY CITY" = 'BANGKOK'::text) AND (a.conus = 'N'::text)) THEN 'THAILAND'::text
              WHEN ((a."DUTY CITY" = 'SAN SALVADOR'::text) AND (a.conus = 'N'::text)) THEN 'EL SALVADOR'::text
              WHEN ((a."DUTY CITY" = 'MONTREAL, QUEBEC'::text) AND (a.conus = 'N'::text)) THEN 'CANADA'::text
              WHEN ((a."DUTY CITY" = 'PHNOM PENH'::text) AND (a.conus = 'N'::text)) THEN 'KAMPUCHEA'::text
              WHEN ((a."DUTY CITY" = 'JIDDA'::text) AND (a.conus = 'N'::text)) THEN 'SAUDI ARABIA'::text
              WHEN ((a."DUTY CITY" = 'CANBERRA'::text) AND (a.conus = 'N'::text)) THEN 'AUSTRALIA'::text
              WHEN ((a."DUTY CITY" = 'NAIROBI'::text) AND (a.conus = 'N'::text)) THEN 'KENYA'::text
              WHEN ((a."DUTY CITY" = 'VANCOUVER, B.C.'::text) AND (a.conus = 'N'::text)) THEN 'CANADA'::text
              WHEN ((a."DUTY CITY" = 'ROME'::text) AND (a.conus = 'N'::text)) THEN 'ITALY'::text
              WHEN ((a."DUTY CITY" = 'AGANA'::text) AND (a.conus = 'N'::text)) THEN 'GUAM'::text
              WHEN ((a."DUTY CITY" = 'OTTAWA, ONTARIO'::text) AND (a.conus = 'N'::text)) THEN 'CANADA'::text
              WHEN ((a."DUTY CITY" = 'CIUDAD JUAREZ'::text) AND (a.conus = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."DUTY CITY" = 'CARTEGENA'::text) AND (a.conus = 'N'::text)) THEN 'COLOMBIA'::text
              WHEN ((a."DUTY CITY" = 'VIENNA'::text) AND (a.conus = 'N'::text)) THEN 'AUSTRIA'::text
              WHEN ((a."DUTY CITY" = 'TORONTO, ONTARIO'::text) AND (a.conus = 'N'::text)) THEN 'CANADA'::text
              WHEN ((a."DUTY CITY" = 'MEXICO CITY'::text) AND (a.conus = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."DUTY CITY" = 'MAITE'::text) AND (a.conus = 'N'::text)) THEN 'GUAM'::text
              WHEN ((a."DUTY CITY" = 'TEGUCIGALPA'::text) AND (a.conus = 'N'::text)) THEN 'HONDURAS'::text
              WHEN ((a."DUTY CITY" = 'ATHENS'::text) AND (a.conus = 'N'::text)) THEN 'GREECE'::text
              WHEN ((a."DUTY CITY" = 'SINGAPORE'::text) AND (a.conus = 'N'::text)) THEN 'SINGAPORE'::text
              WHEN ((a."DUTY CITY" = 'HANOI'::text) AND (a.conus = 'N'::text)) THEN 'VIETNAM'::text
              WHEN ((a."DUTY CITY" = 'DOHA'::text) AND (a.conus = 'N'::text)) THEN 'QATAR'::text
              WHEN ((a."DUTY CITY" = 'DHAHRAN'::text) AND (a.conus = 'N'::text)) THEN 'SAUDI ARABIA'::text
              WHEN ((a."DUTY CITY" = 'ABU DHABI'::text) AND (a.conus = 'N'::text)) THEN 'UNITED ARAB EMIRATES'::text
              WHEN ((a."DUTY CITY" = 'FAJARDO'::text) AND (a.conus = 'N'::text)) THEN 'PUERTO RICO'::text
              WHEN ((a."DUTY CITY" = 'TAMUNING'::text) AND (a.conus = 'N'::text)) THEN 'GUAM'::text
              WHEN ((a."DUTY CITY" = 'MONTERREY'::text) AND (a.conus = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."DUTY CITY" = 'ANKARA'::text) AND (a.conus = 'N'::text)) THEN 'TURKEY'::text
              WHEN ((a."DUTY CITY" = 'BRUSSELS'::text) AND (a.conus = 'N'::text)) THEN 'BELGIUM'::text
              WHEN ((a."DUTY CITY" = 'TIJUANA'::text) AND (a.conus = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."DUTY CITY" = 'PONCE'::text) AND (a.conus = 'N'::text)) THEN 'PUERTO RICO'::text
              WHEN ((a."DUTY CITY" = 'MANAGUA'::text) AND (a.conus = 'N'::text)) THEN 'NICARAGUA'::text
              WHEN ((a."DUTY CITY" = 'CAIRO'::text) AND (a.conus = 'N'::text)) THEN 'EGYPT'::text
              WHEN ((a."DUTY CITY" = 'KUALA LUMPUR'::text) AND (a.conus = 'N'::text)) THEN 'MALAYSIA'::text
              WHEN ((a."DUTY CITY" = 'LYON'::text) AND (a.conus = 'N'::text)) THEN 'FRANCE'::text
              WHEN ((a."DUTY CITY" = 'TEL AVIV'::text) AND (a.conus = 'N'::text)) THEN 'ISRAEL'::text
              WHEN ((a."DUTY CITY" = 'PRETORIA'::text) AND (a.conus = 'N'::text)) THEN 'SOUTH AFRICA'::text
              WHEN ((a."DUTY CITY" = 'QUITO'::text) AND (a.conus = 'N'::text)) THEN 'ECUADOR'::text
              WHEN ((a."DUTY CITY" = 'BUENOS AIRES'::text) AND (a.conus = 'N'::text)) THEN 'ARGENTINA'::text
              WHEN ((a."DUTY CITY" = 'NASSAU'::text) AND (a.conus = 'N'::text)) THEN 'THE BAHAMAS'::text
              WHEN ((a."DUTY CITY" = 'GUADALAJARA'::text) AND (a.conus = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."DUTY CITY" = 'SEOUL'::text) AND (a.conus = 'N'::text)) THEN 'KOREA, REPUBLIC OF'::text
              WHEN ((a."DUTY CITY" = 'RIYADH'::text) AND (a.conus = 'N'::text)) THEN 'SAUDI ARABIA'::text
              WHEN ((a."DUTY CITY" = 'SAIPAN'::text) AND (a.conus = 'N'::text)) THEN 'NORTHERN MARIANA ISL'::text
              WHEN ((a."DUTY CITY" = 'ST THOMAS'::text) AND (a.conus = 'N'::text)) THEN 'VIRGIN ISLANDS, U.S.'::text
              WHEN ((a."DUTY CITY" = 'AMMAN'::text) AND (a.conus = 'N'::text)) THEN 'JORDAN'::text
              WHEN ((a."DUTY CITY" = 'HO CH MINH CITY'::text) AND (a.conus = 'N'::text)) THEN 'VIETNAM'::text
              WHEN ((a."DUTY CITY" = 'ST CROIX'::text) AND (a.conus = 'N'::text)) THEN 'VIRGIN ISLANDS, U.S.'::text
              WHEN ((a."DUTY CITY" = 'HAVANA'::text) AND (a.conus = 'N'::text)) THEN 'CUBA'::text
              WHEN ((a."DUTY CITY" = 'LIMA'::text) AND (a.conus = 'N'::text)) THEN 'PERU'::text
              WHEN ((a."DUTY CITY" = 'CHARLOTTE AMALIE'::text) AND (a.conus = 'N'::text)) THEN 'VIRGIN ISLANDS, U.S.'::text
              WHEN ((a."DUTY CITY" = 'JAKARTA, JAVA'::text) AND (a.conus = 'N'::text)) THEN 'INDONESIA'::text
              WHEN ((a."DUTY CITY" = 'CALGARY, ALBERTA'::text) AND (a.conus = 'N'::text)) THEN 'CANADA'::text
              WHEN ((a."DUTY CITY" = 'THE HAGUE'::text) AND (a.conus = 'N'::text)) THEN 'NETHERLANDS'::text
              WHEN ((a."DUTY CITY" = 'PANAMA'::text) AND (a.conus = 'N'::text)) THEN 'PANAMA'::text
              WHEN ((a."DUTY CITY" = 'HONG KONG'::text) AND (a.conus = 'N'::text)) THEN 'HONG KONG'::text
              WHEN ((a."DUTY CITY" = 'BEIJING'::text) AND (a.conus = 'N'::text)) THEN 'CHINA'::text
              WHEN ((a."DUTY CITY" = 'MADRID'::text) AND (a.conus = 'N'::text)) THEN 'SPAIN'::text
              WHEN ((a."DUTY CITY" = 'DAKAR'::text) AND (a.conus = 'N'::text)) THEN 'SENEGAL'::text
              ELSE 'United States'::text
          END AS cxo_country
     FROM public.cxo_eoy_archive a;
;

CREATE VIEW "public"."cxo_onboard" AS
  SELECT a."SEX_CODE",
      a."Performance Evaluation Cd",
      a."CONUS",
      a."MRN",
      a."1st Eligibility Date Optional",
      a."WGI DATE",
      a."Age",
      a."Retirement Eligibility Current",
      a."Occ Series",
      a."FILLED/VACANT",
      a."DATE_SCD_LEAVE",
      a."DATE_AGENCY_EOD",
      a."DATE_ENTERED_PRES_GRADE",
      a."TITLE GROUP",
      a.filename,
      a."POSITION_OFFICIAL_TITLE",
      a."DUTY CITY",
      a."DUTY STATE",
      a."LAW ENF",
      a."PML on board",
      a."BARGAINING_UNIT_STATUS_CD",
      a."DIR",
      a."OFFICE",
      a."BUD",
      a."ORG",
      a."ORG TEXT",
      a."CY_PP",
      a.cxo_pp1,
      a.ingested_at,
      a.pp_dt_end,
      a.next_pp_dt,
      a."GRADE",
      a."DATE_SCD_WGI",
      a."POSITION_TARGET_GRADE",
      a."TITLE",
      a."SERIES",
      a."LEO_IND",
      a."POSITION_SUPERVISORY_CODE",
      a."Employee Name",
      a."EMPLOYEE_WORK_EMAIL",
      a."Veterans Preference",
      c.numeric_grouping,
      c.performance_evaluation_cd_tableau,
          CASE
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEP DIR ICE'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CHIEF OF STAFF'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MGMT & PROG ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEP CH OF STAFF'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SPECIAL ADVISOR (PROTOCOL & SPEC EVTS)'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PROG MGR'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MSN SUPT SPECL'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASSISTANT EXEC SEC'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'WRI EDIT'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASST DIR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CONGRSNL LIASN SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY CONGRSNL LIASN OFCR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SPEC ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY PUBLIC AFF SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PUBLIC AFF SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MISSION SUPPORT SPECIALIST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY MGMT & PROG ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'VIS INF SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'AUDIO VIS PRODN SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY AUDIO VIS PRODN SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASST DIR DIVERSITY & CIVIL RIGHTS'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'EQ EMPLMT SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CLK'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'EQ EMPLMT MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY POLICY ADVISOR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PLCY ADVSR'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY EQ EMPLMT SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY EQ OPP SPEC'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'POLICY ADVSR'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY CRIM INVSTGR'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CRIM INVSTGR'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'EQUIP SPECLST ORDNC'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPP TECHNCN OA'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY GEN ENGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ENGRG TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LAW ENFORCEMENT PROG. MGR.'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEPRTN OFFCR (COURSE DEVLP/INSTR)'::text) THEN 'DO'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'TRAINING SPEC (FIREARMS)'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FIREARMS PGRM SPCLST'::text) THEN 'LEOTHR'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'TRNG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CRIMINAL INVESTIGATOR (INSTRUCTOR)'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DETNTN & DEPORTATN OFFCR'::text) THEN 'DO'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY DETNTN & DEPORTATN OFFCR'::text) THEN 'DO'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FACIL OPERS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY COMMUNITY RELATIONS OFFCR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'COMMUNITY RELATIONS OFFCR'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SENIOR ADVSR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEP CHIEF OF STAFF'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'STAFF ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'BUDG ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'REGULATORY AND POLICY ANALYST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ECONMST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PLCY ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY REGULATORY ANALYST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY PLCY ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ECONOMIST (CHIEF)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CH OF STAFF'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY MSN SUPT SPECL'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INSTRUCTNL SYS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INSTRUCTNL SYS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PROG MGR (LRNG MGMT)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'TRNG INSTRU'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INSTRUCTIONAL SPECIALIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MISSION SUPRT ASST OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY TRNG INSTRU'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEPUTY CHIEF HUMAN CAPITAL OFFICER'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CHIEF HUMAN CAPITAL OFFICER'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'HUMAN RESOURCES SPECLST (COMPEN)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SENIOR HUMAN RESOURCES ADVISOR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY STRATEGIC ADVSR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY HUMAN RESOURCES SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'HUMAN RESOURCES SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'HUMAN RESOURCES ASST OA'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY HUMAN RESOURCES SPECLST (EMPL BE'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'HUMAN RESOURCES SPECLST (RECRUIT&PLAC)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY HUMAN RESOURCES SPECLST (RECRUIT'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY HUMAN RESOURCES SPECLST (CLASSIF'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'HUMAN RESOURCES SPECLST (CLASSIFN)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PRE-EMPLOYMENT SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PRE EMPLOYMENT ASST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'STUD TR (HUMAN RESOURCES)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY HR SPECLST (EMPL & LABOR REL)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'HUMAN RESOURCES SPECLST (LABOR REL)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY HUMAN RESOURCES SPECLST (LABOR R'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LEAD HUMAN RESOURCES SPECLST (EMPL REL'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY HUMAN RESOURCES SPECLST (EMPL RE'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'HR SPECLST (CLASSIFN RECRUIT & PLAC)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY PHYSICIAN'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PHYSICIAN'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'OCCUPTL HLTH NURSE'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DRUG PROG COORD'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'HUMAN RESOURCES SPECLST (EMPL BENES)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'BEHAVIORAL HLTH SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'EMP ASSTNC PROG MGR'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY PSYCH'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CHAPLAIN DIR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PERS RES PSYCH'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY PERS RESEARCH PSYCH'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MGMT INF ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY HUMAN RESOURCES SPECLST (INFO SY'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ADMV OFFCR'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY ADMV OFFCR'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CIVILIAN PAY TECHNCN OA'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY HUMAN RESOURCES SPECLST (COMPEN)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASST DIR INF GOVERNANCE'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'RECS AND INFO MGMT SPEC'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'OPER RES ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PRIVACY OFFICER'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MGMT & PRO ANAL (PRIVACY COMPLIANCE)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SR INFO GOV ANALYST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'GOVNMNT INFO SPEC (PRIVACY COMPLIANCE)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MGMT & PROG ANAL (BUDG & COR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY RECORDS & INFORMATION MGMT SPECI'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PARALEGAL SPECLST (FOIA/PA)'::text) THEN 'LGLSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PARALEGAL SPECLST'::text) THEN 'LGLSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FOIA/PA ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY PARALEGAL SPECLST'::text) THEN 'LGLSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY PARALEGAL SPECLST (FOIA/PA)'::text) THEN 'LGLSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PARALEGAL SPECLST (FOIA)'::text) THEN 'LGLSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FREEDOM OF INFORMATION ACT DIRECTOR'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEPUTY DIRECTOR FOIA'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'GEN ENGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ITSPEC (INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'OPERATIONS RESEARCH ANALYST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEP PRINC LEG ADVSR'::text) THEN 'ATTY'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEP PRIN LEGAL ADVSR MANAGEMENT'::text) THEN 'ATTY'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PRINCIPAL LEGAL ADVISOR FOR ICE'::text) THEN 'ATTY'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY GEN ATTY'::text) THEN 'ATTY'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'GEN ATTY'::text) THEN 'ATTY'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ATTY ADVSR'::text) THEN 'ATTY'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASSOC DEP PRINC LEG ADVSR'::text) THEN 'ATTY'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PARALEGAL SPECIALIST (OPLA)'::text) THEN 'LGLSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEP PRINC LEGAL ADVSR HEADQUARTES'::text) THEN 'ATTY'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'HISTRN'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LIBRN LAW'::text) THEN 'LGLSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LEG ASST OA'::text) THEN 'LGLSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY GEN ATTY (ETHICS)'::text) THEN 'ATTY'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'GEN ATTY (ETHCIS)'::text) THEN 'ATTY'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MAIL & FILE CLK OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LEAD LEG ASST'::text) THEN 'LGLSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CHIEF COUNSEL'::text) THEN 'ATTY'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LAW CLK'::text) THEN 'LGLSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY LEG ASST OA'::text) THEN 'LGLSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'TRIAL ATTY'::text) THEN 'ATTY'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'STUD TR (LEG ASST) OA'::text) THEN 'LGLSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ENFORCEMENT PROGRAMS MGR'::text) THEN 'LEOTHR'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASST DIR ENFCMNT & REMOVAL OPS'::text) THEN 'DO'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEP ASST DIR FLD OPERS'::text) THEN 'DO'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INTEL RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'EMERGENCY MANAGEMENT SPECIALIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY EMERGENCY MANAGEMENT SPECIALIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'STATCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEPUTY ASSISTANT DIRECTOR ERO'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MGMT & PROG ANAL (DET SVCS MGR)'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEPRTN OFFCR (COMP STDS OFFCR)'::text) THEN 'DO'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASST DIR SECURE COMMUNITIES'::text) THEN 'DO'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CRIM TARGETING SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY CRIM TARGETING SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEPRTN OFFCR'::text) THEN 'DO'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LAW ENFCMNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY LAW ENFCMNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASST DIR ICE SRVCS HLTH CORPS'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'HEALTH SYSTEMS SPECIALIST'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY PHYSCN (PSYCHTRC)'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PHYSICIAN (CLINICAL DIRECTOR)'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PHYSICIAN (PSYCHIATRY)'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MEDCL OFFCR'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PHYSCN (GEN PRACTICE)'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PHYSICIAN (REG CLINICAL DIR)'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PHYSICIAN (CONSULTANT)'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PHYSICIAN (DAD/MED DIRECTOR)'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CLNCL NURSE'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY HEALTH SYSTEM SPECIALIST'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PRACTICAL NURSE'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'NURSE PRACTITIONER'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MEDCL REC TECHNCN'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DNTL HYGIENIST'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY WRI EDIT'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SECY OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ADV PRAC NURSE (NURSE PRACTITIONER)'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DIAGNSTC RADIOLOGIC TECHNCN'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DNTL ASST'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PHYSCN ASST'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CLNCL PSYCH'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SOC WRKR'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ADVANCE NURSE PRAC'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MATHCL STATCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY ENFCMNT & RMVL ASST OA'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'STUD TR'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'TRAFF MGMT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'TRNG TECHNCN OA'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPP TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPP TECHNCN (INVENT)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'BOND CNTL SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY BOND SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LAW ENFCMNT TECHNCN'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ADMV ASST OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'RECR SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MGMT ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'IMMGRTN ENF AGT'::text) THEN 'DO'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FOOD SRVS SPEC'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'AUTMTV MECH'::text) THEN 'WGSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LAW ENFCMNT COMMUN ASST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY MSN SUPT SPECL (COTR)'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MTRLS HNDLR'::text) THEN 'WGSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'OFF AUTOMATION ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INVENT MGMT SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ELCTRON TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'OFF AUTOMATION CLK'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MGMT PROG TECHNCN OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASST DIR OFF OF ACQ'::text) THEN 'CONT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PROCUR ANAL'::text) THEN 'CONT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEBARMENT ANAL (SENIOR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEBARMENT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CONTR SPECLST'::text) THEN 'CONT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY CONTR SPECLST'::text) THEN 'CONT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY DEBARMENT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'EXEC ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PROCUR & BUS RESOURCES MGMT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY PROCUR & BUS RESOURCES MGT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SR PROCUR & BUS RESOURCES MGMT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'BUS OPERS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEP ASSOC DIRECTOR OPR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASSOC DIR OPR'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MGMT & PROG ANAL (SR PROG ADVSR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASST DIR INVST OPR'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'OVERSIGHT ADM (PREA)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INVESTIGATIVE ANALYST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'OPERTNL ANALS SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INSIDER THREAT OPERTNL ANAL'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INTELL RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'OPERATIONAL ANALYSIS SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INTEL RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'TECHNCL ENFCMNT OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY TECHNCL ENFCMNT OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INTELL & INFO SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INSIDER THREAT SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MGMT & PROG ANALYST (PROG ADVSR)'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INVESTIGATIVE PROGRAM OFFICER'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DIV DIRINSPR & DETENTION OVERSIGHT'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INSPS & COMPLNC MGR'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INSPS & COMPLNC SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INSPS & COMPLC SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY SUPV ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INSPS & COMPLNC SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY SECUR SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PERS SECUR SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY PERS SECUR SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SECUR SPECLST (POLYGRAPH EXAMNR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY SECUR SPECLST (POLYGRAPH EXMNR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PHYS SECUR SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SECUR SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SECUR INSPR'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CHIEF INFORMATION OFFICER'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEP CHIEF INFORMATION OFFICER'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY IT SPEC (ENTACH/INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'COMMUNICATIONS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ITSPEC (PLCYPLN)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY ITSPEC (SYSANALYSIS)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'IT PROJ MGR'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ITSPEC (SYSADMIN)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY ITSPEC (INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ITSPEC'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY ITSPEC (APPSW/INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LEAD ITSPEC (INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ITSPEC (DATAMGT)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ITSPEC (SYSANALYSIS)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY ITSPEC (PLCYPLN)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ITSPEC (CUSTSPT)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ITSPEC (NETWORK)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY ITSPEC (CUSTSPT)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LEAD ITSPEC (NETWORK)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LEAD ITSPEC (CUSTSPT)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY ITSPEC (NETWORK)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY BUS OPERS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEPUTY CHIEF FINANCIAL OFFICER'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CHIEF FINANCIAL OFCR (ICE)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPV ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LEAD MGMT & PROG ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LEAD FNANCL PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FNANCL PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FIN PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DIR BUDGET & PROGRAM PERFORMANCE'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY BUDG ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PROGRAM MANAGEMENT SPECIALIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SAFETY & OCCUPTL HLTH SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INDL HYGIENIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SAFETY & OCCUPTL HLTH MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'NURSE CONSULTANT'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MAIL & FILE ASST (OA)'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SPACE MGMT SUPRT SPECL'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ARCH'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LEASE ADMIN PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SPACE MGMT SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PROG MGR (FACILITIES)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'BLDG MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FACIL PROG MGR'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'UTIL SYS RPRER OPERTR'::text) THEN 'WGSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DIR OF FNANCL MGMT'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY FNANCL PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY SYS ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MISSION SUPRT SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LEAD ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SYS ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY FNANCL SYS MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FINANCIAL SYSTEMS MANAGER'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FINANCIL MGMT SYSTEMS ANAL (TEAM LEAD)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY FNANCL BUS INTEG MANAGER'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ACCTG TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY MGMT INF ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY FNANCL ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LEAD ACCTG TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FNANCL MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ACCNT (TAX)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEPUTY DIRECTOR INVESTIGATIONS'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASST DIR OFFICE OF INVESTIGATIONS'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'AUDR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEP ASST DIR INVEST'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INTELL OPERS SPECLST'::text) THEN 'IRS'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CRIM RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PAROLE PROG SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASSET FORFEIT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY SOC SCI PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SOC SCI PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INTELL OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INTELL OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY FORENSIC DOCMT EXAMN'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FORENSIC DOCMT EXAMNR'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FNGRPRNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PHOTOGR (FORENSIC)'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SR. DIG MULTIMEDIA FORENSIC ANALYST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SEIZED PROPERTY SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY FNGRPRNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY FORENSIC DOCMT EXAMNR'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PHYS SCNTST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'EMER PREPAREDNESS SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SEVP APPEALS ADJUDR'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'COUNTERTERRORISM INTELL SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SEVP FLD REPR'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY SEVP FLD REPR'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SEVP ADJUDR'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY SEVP ADJUDR'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'EXECUTIVE DIRECTOR LEIS'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CYBER OPERS OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'COMPR FORENSIC ANAL'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CRIM INVSTGR (NATL PROG MGR)'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'TACTICAL COMMUN OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'TELECOMMUN SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SOC SCI PROG SPEC (VICTIM WIT ASST)'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INVESTIGATIVE ASST OA'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SPEC AGT IN CHG'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INTELL RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SEIZED PROP SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INVESTIGATIVE CLK OA'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FILE ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'TECHNCL OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PROG ASST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INTELL ASST'::text) THEN 'IRS'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ICE TACTICAL OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY ICE TACTICAL OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PROG SUPRT SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INF RECPTNST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ENFCMNT OPERS SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SECTOR ENFCMNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LEAD SECTOR ENFCMNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'TECHNICAL EQUIPMENT SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY TACTICAL COMMUN OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DIR FEDL EXPORT ENFCMNT COORDNTN CENTR'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY PROG SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY PROG ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INVESTIGATIVE ANALYST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY FOIA/PRIVACY ACT SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DIR INTELL'::text) THEN 'IRS'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEP ASST DIR INTEL'::text) THEN 'IRS'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INTELL OPERS SPECLST'::text) THEN 'IRS'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEP DIR, INTERNATIONAL AFFAIRS'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DIR INTERPOL WASH'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY CRIM INVSTGR (OPERS CH)'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEPRTN LIASN OFFCR'::text) THEN 'DO'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'IMMIGRATN OFFCR'::text) THEN 'LEOTHR'::text
              ELSE a."TITLE GROUP"
          END AS "tableau_TG",
          CASE
              WHEN (a."POSITION_SUPERVISORY_CODE" = '2.0'::text) THEN '2'::text
              WHEN (a."POSITION_SUPERVISORY_CODE" = '7.0'::text) THEN '7'::text
              WHEN (a."POSITION_SUPERVISORY_CODE" = '8.0'::text) THEN '8'::text
              WHEN (a."POSITION_SUPERVISORY_CODE" = '3.0'::text) THEN '3'::text
              WHEN (a."POSITION_SUPERVISORY_CODE" = '5.0'::text) THEN '5'::text
              WHEN (a."POSITION_SUPERVISORY_CODE" = '6.0'::text) THEN '6'::text
              ELSE a."POSITION_SUPERVISORY_CODE"
          END AS tableau_position_supervisory_code,
          CASE
              WHEN (a."GRADE" = '0.0'::text) THEN '0'::text
              WHEN (a."GRADE" = '11.0'::text) THEN '11'::text
              WHEN (a."GRADE" = '15.0'::text) THEN '15'::text
              WHEN (a."GRADE" = '8.0'::text) THEN '8'::text
              WHEN (a."GRADE" = '3.0'::text) THEN '3'::text
              WHEN (a."GRADE" = '4.0'::text) THEN '4'::text
              WHEN (a."GRADE" = '2.0'::text) THEN '2'::text
              WHEN (a."GRADE" = '7.0'::text) THEN '7'::text
              WHEN (a."GRADE" = '14.0'::text) THEN '14'::text
              WHEN (a."GRADE" = '9.0'::text) THEN '9'::text
              WHEN (a."GRADE" = '12.0'::text) THEN '12'::text
              WHEN (a."GRADE" = '10.0'::text) THEN '10'::text
              WHEN (a."GRADE" = '5.0'::text) THEN '5'::text
              WHEN (a."GRADE" = '13.0'::text) THEN '13'::text
              WHEN (a."GRADE" = '6.0'::text) THEN '6'::text
              ELSE a."GRADE"
          END AS tableau_grade,
          CASE
              WHEN ((a."DUTY CITY" = 'LORDS VALLEY'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'ATLANTA'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'CHICAGO'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'PASCO'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'STOCKTON'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'HOUMA'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'BLUE ASH'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'NEW YORK -QUEENS'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'GREAT FALLS'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'SAN ANGELO'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'KAILUA KONA'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'IDAHO FALLS'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'SALISBURY'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'CHARLESTON NAVAL CX'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'SALT LAKE CITY'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'FARMVILLE'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'LOUISVILLE'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'BOSTON'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'FT MYERS'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'CHEYENNE'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'GRAND ISLAND'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'ROSWELL'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'HOULTON'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'LITTLE ROCK'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'WINSTON SALEM'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'ATLANTIC CITY'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'KANSAS CITY'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'ANCHORAGE'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'FARGO'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'MESA'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'WASHINGTON'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'SAINT ALBANS'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'DURANGO'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'CHATTANOOGA'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'DETROIT'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'GADSDEN'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'OKMULGEE'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'DULUTH'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'HARTFORD'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'MEDFORD'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'GULFPORT'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'PORTSMOUTH'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'MADISON'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'FORT WAYNE'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'SIOUX FALLS'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'RENO'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'CHARLESTON'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'WICHITA'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'DOVER'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'WARWICK'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'SIOUX CITY'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              ELSE a."DUTY STATE"
          END AS cxo_state,
          CASE
              WHEN ((a."DUTY CITY" = 'FRANKFURT'::text) AND (a."CONUS" = 'N'::text)) THEN 'GERMANY'::text
              WHEN ((a."DUTY CITY" = 'MANAMA'::text) AND (a."CONUS" = 'N'::text)) THEN 'BAHRAIN'::text
              WHEN ((a."DUTY CITY" = 'KINGSTON'::text) AND (a."CONUS" = 'N'::text)) THEN 'JAMAICA'::text
              WHEN ((a."DUTY CITY" = 'AGUADILLA'::text) AND (a."CONUS" = 'N'::text)) THEN 'PUERTO RICO'::text
              WHEN ((a."DUTY CITY" = 'SAN JUAN'::text) AND (a."CONUS" = 'N'::text)) THEN 'PUERTO RICO'::text
              WHEN ((a."DUTY CITY" = 'CASABLANCA'::text) AND (a."CONUS" = 'N'::text)) THEN 'MOROCCO'::text
              WHEN ((a."DUTY CITY" = 'STUTTGART'::text) AND (a."CONUS" = 'N'::text)) THEN 'GERMANY'::text
              WHEN ((a."DUTY CITY" = 'LONDON'::text) AND (a."CONUS" = 'N'::text)) THEN 'UNITED KINGDOM'::text
              WHEN ((a."DUTY CITY" = 'JERUSALEM'::text) AND (a."CONUS" = 'N'::text)) THEN 'ISRAEL'::text
              WHEN ((a."DUTY CITY" = 'BRASILIA'::text) AND (a."CONUS" = 'N'::text)) THEN 'BRAZIL'::text
              WHEN ((a."DUTY CITY" = 'NEW DELHI'::text) AND (a."CONUS" = 'N'::text)) THEN 'INDIA'::text
              WHEN ((a."DUTY CITY" = 'WARSAW'::text) AND (a."CONUS" = 'N'::text)) THEN 'POLAND'::text
              WHEN ((a."DUTY CITY" = 'GUANGZHOU'::text) AND (a."CONUS" = 'N'::text)) THEN 'CHINA'::text
              WHEN ((a."DUTY CITY" = 'PORT-AU-PRINCE'::text) AND (a."CONUS" = 'N'::text)) THEN 'HAITI'::text
              WHEN ((a."DUTY CITY" = 'MANILA'::text) AND (a."CONUS" = 'N'::text)) THEN 'PHILIPPINES'::text
              WHEN ((a."DUTY CITY" = 'DUBAI'::text) AND (a."CONUS" = 'N'::text)) THEN 'UNITED ARAB EMIRATES'::text
              WHEN ((a."DUTY CITY" = 'MUSCAT'::text) AND (a."CONUS" = 'N'::text)) THEN 'OMAN'::text
              WHEN ((a."DUTY CITY" = 'MAYAGUEZ'::text) AND (a."CONUS" = 'N'::text)) THEN 'PUERTO RICO'::text
              WHEN ((a."DUTY CITY" = 'ISLAMABAD'::text) AND (a."CONUS" = 'N'::text)) THEN 'PAKISTAN'::text
              WHEN ((a."DUTY CITY" = 'HERMOSILLO'::text) AND (a."CONUS" = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."DUTY CITY" = 'SANTO DOMINGO'::text) AND (a."CONUS" = 'N'::text)) THEN 'DOMINICAN REPUBLIC'::text
              WHEN ((a."DUTY CITY" = 'GUATEMALA'::text) AND (a."CONUS" = 'N'::text)) THEN 'GUATEMALA'::text
              WHEN ((a."DUTY CITY" = 'BOGOTA'::text) AND (a."CONUS" = 'N'::text)) THEN 'COLOMBIA'::text
              WHEN ((a."DUTY CITY" = 'BRIDGETOWN'::text) AND (a."CONUS" = 'N'::text)) THEN 'BARBADOS'::text
              WHEN ((a."DUTY CITY" = 'ANTWERP'::text) AND (a."CONUS" = 'N'::text)) THEN 'BELGIUM'::text
              WHEN ((a."DUTY CITY" = 'PARIS'::text) AND (a."CONUS" = 'N'::text)) THEN 'FRANCE'::text
              WHEN ((a."DUTY CITY" = 'MATAMOROS'::text) AND (a."CONUS" = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."DUTY CITY" = 'BANGKOK'::text) AND (a."CONUS" = 'N'::text)) THEN 'THAILAND'::text
              WHEN ((a."DUTY CITY" = 'SAN SALVADOR'::text) AND (a."CONUS" = 'N'::text)) THEN 'EL SALVADOR'::text
              WHEN ((a."DUTY CITY" = 'MONTREAL, QUEBEC'::text) AND (a."CONUS" = 'N'::text)) THEN 'CANADA'::text
              WHEN ((a."DUTY CITY" = 'PHNOM PENH'::text) AND (a."CONUS" = 'N'::text)) THEN 'KAMPUCHEA'::text
              WHEN ((a."DUTY CITY" = 'JIDDA'::text) AND (a."CONUS" = 'N'::text)) THEN 'SAUDI ARABIA'::text
              WHEN ((a."DUTY CITY" = 'CANBERRA'::text) AND (a."CONUS" = 'N'::text)) THEN 'AUSTRALIA'::text
              WHEN ((a."DUTY CITY" = 'NAIROBI'::text) AND (a."CONUS" = 'N'::text)) THEN 'KENYA'::text
              WHEN ((a."DUTY CITY" = 'VANCOUVER, B.C.'::text) AND (a."CONUS" = 'N'::text)) THEN 'CANADA'::text
              WHEN ((a."DUTY CITY" = 'ROME'::text) AND (a."CONUS" = 'N'::text)) THEN 'ITALY'::text
              WHEN ((a."DUTY CITY" = 'AGANA'::text) AND (a."CONUS" = 'N'::text)) THEN 'GUAM'::text
              WHEN ((a."DUTY CITY" = 'OTTAWA, ONTARIO'::text) AND (a."CONUS" = 'N'::text)) THEN 'CANADA'::text
              WHEN ((a."DUTY CITY" = 'CIUDAD JUAREZ'::text) AND (a."CONUS" = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."DUTY CITY" = 'CARTEGENA'::text) AND (a."CONUS" = 'N'::text)) THEN 'COLOMBIA'::text
              WHEN ((a."DUTY CITY" = 'VIENNA'::text) AND (a."CONUS" = 'N'::text)) THEN 'AUSTRIA'::text
              WHEN ((a."DUTY CITY" = 'TORONTO, ONTARIO'::text) AND (a."CONUS" = 'N'::text)) THEN 'CANADA'::text
              WHEN ((a."DUTY CITY" = 'MEXICO CITY'::text) AND (a."CONUS" = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."DUTY CITY" = 'MAITE'::text) AND (a."CONUS" = 'N'::text)) THEN 'GUAM'::text
              WHEN ((a."DUTY CITY" = 'TEGUCIGALPA'::text) AND (a."CONUS" = 'N'::text)) THEN 'HONDURAS'::text
              WHEN ((a."DUTY CITY" = 'ATHENS'::text) AND (a."CONUS" = 'N'::text)) THEN 'GREECE'::text
              WHEN ((a."DUTY CITY" = 'SINGAPORE'::text) AND (a."CONUS" = 'N'::text)) THEN 'SINGAPORE'::text
              WHEN ((a."DUTY CITY" = 'HANOI'::text) AND (a."CONUS" = 'N'::text)) THEN 'VIETNAM'::text
              WHEN ((a."DUTY CITY" = 'DOHA'::text) AND (a."CONUS" = 'N'::text)) THEN 'QATAR'::text
              WHEN ((a."DUTY CITY" = 'DHAHRAN'::text) AND (a."CONUS" = 'N'::text)) THEN 'SAUDI ARABIA'::text
              WHEN ((a."DUTY CITY" = 'ABU DHABI'::text) AND (a."CONUS" = 'N'::text)) THEN 'UNITED ARAB EMIRATES'::text
              WHEN ((a."DUTY CITY" = 'FAJARDO'::text) AND (a."CONUS" = 'N'::text)) THEN 'PUERTO RICO'::text
              WHEN ((a."DUTY CITY" = 'TAMUNING'::text) AND (a."CONUS" = 'N'::text)) THEN 'GUAM'::text
              WHEN ((a."DUTY CITY" = 'MONTERREY'::text) AND (a."CONUS" = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."DUTY CITY" = 'ANKARA'::text) AND (a."CONUS" = 'N'::text)) THEN 'TURKEY'::text
              WHEN ((a."DUTY CITY" = 'BRUSSELS'::text) AND (a."CONUS" = 'N'::text)) THEN 'BELGIUM'::text
              WHEN ((a."DUTY CITY" = 'TIJUANA'::text) AND (a."CONUS" = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."DUTY CITY" = 'PONCE'::text) AND (a."CONUS" = 'N'::text)) THEN 'PUERTO RICO'::text
              WHEN ((a."DUTY CITY" = 'MANAGUA'::text) AND (a."CONUS" = 'N'::text)) THEN 'NICARAGUA'::text
              WHEN ((a."DUTY CITY" = 'CAIRO'::text) AND (a."CONUS" = 'N'::text)) THEN 'EGYPT'::text
              WHEN ((a."DUTY CITY" = 'KUALA LUMPUR'::text) AND (a."CONUS" = 'N'::text)) THEN 'MALAYSIA'::text
              WHEN ((a."DUTY CITY" = 'LYON'::text) AND (a."CONUS" = 'N'::text)) THEN 'FRANCE'::text
              WHEN ((a."DUTY CITY" = 'TEL AVIV'::text) AND (a."CONUS" = 'N'::text)) THEN 'ISRAEL'::text
              WHEN ((a."DUTY CITY" = 'PRETORIA'::text) AND (a."CONUS" = 'N'::text)) THEN 'SOUTH AFRICA'::text
              WHEN ((a."DUTY CITY" = 'QUITO'::text) AND (a."CONUS" = 'N'::text)) THEN 'ECUADOR'::text
              WHEN ((a."DUTY CITY" = 'BUENOS AIRES'::text) AND (a."CONUS" = 'N'::text)) THEN 'ARGENTINA'::text
              WHEN ((a."DUTY CITY" = 'NASSAU'::text) AND (a."CONUS" = 'N'::text)) THEN 'THE BAHAMAS'::text
              WHEN ((a."DUTY CITY" = 'GUADALAJARA'::text) AND (a."CONUS" = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."DUTY CITY" = 'SEOUL'::text) AND (a."CONUS" = 'N'::text)) THEN 'KOREA, REPUBLIC OF'::text
              WHEN ((a."DUTY CITY" = 'RIYADH'::text) AND (a."CONUS" = 'N'::text)) THEN 'SAUDI ARABIA'::text
              WHEN ((a."DUTY CITY" = 'SAIPAN'::text) AND (a."CONUS" = 'N'::text)) THEN 'NORTHERN MARIANA ISL'::text
              WHEN ((a."DUTY CITY" = 'ST THOMAS'::text) AND (a."CONUS" = 'N'::text)) THEN 'VIRGIN ISLANDS, U.S.'::text
              WHEN ((a."DUTY CITY" = 'AMMAN'::text) AND (a."CONUS" = 'N'::text)) THEN 'JORDAN'::text
              WHEN ((a."DUTY CITY" = 'HO CH MINH CITY'::text) AND (a."CONUS" = 'N'::text)) THEN 'VIETNAM'::text
              WHEN ((a."DUTY CITY" = 'ST CROIX'::text) AND (a."CONUS" = 'N'::text)) THEN 'VIRGIN ISLANDS, U.S.'::text
              WHEN ((a."DUTY CITY" = 'HAVANA'::text) AND (a."CONUS" = 'N'::text)) THEN 'CUBA'::text
              WHEN ((a."DUTY CITY" = 'LIMA'::text) AND (a."CONUS" = 'N'::text)) THEN 'PERU'::text
              WHEN ((a."DUTY CITY" = 'CHARLOTTE AMALIE'::text) AND (a."CONUS" = 'N'::text)) THEN 'VIRGIN ISLANDS, U.S.'::text
              WHEN ((a."DUTY CITY" = 'JAKARTA, JAVA'::text) AND (a."CONUS" = 'N'::text)) THEN 'INDONESIA'::text
              WHEN ((a."DUTY CITY" = 'CALGARY, ALBERTA'::text) AND (a."CONUS" = 'N'::text)) THEN 'CANADA'::text
              WHEN ((a."DUTY CITY" = 'THE HAGUE'::text) AND (a."CONUS" = 'N'::text)) THEN 'NETHERLANDS'::text
              WHEN ((a."DUTY CITY" = 'PANAMA'::text) AND (a."CONUS" = 'N'::text)) THEN 'PANAMA'::text
              WHEN ((a."DUTY CITY" = 'HONG KONG'::text) AND (a."CONUS" = 'N'::text)) THEN 'HONG KONG'::text
              WHEN ((a."DUTY CITY" = 'BEIJING'::text) AND (a."CONUS" = 'N'::text)) THEN 'CHINA'::text
              WHEN ((a."DUTY CITY" = 'MADRID'::text) AND (a."CONUS" = 'N'::text)) THEN 'SPAIN'::text
              WHEN ((a."DUTY CITY" = 'DAKAR'::text) AND (a."CONUS" = 'N'::text)) THEN 'SENEGAL'::text
              ELSE 'United States'::text
          END AS cxo_country
     FROM (public.cxo_nfc_tops_archive_v4 a
       LEFT JOIN public.performance_crosswalk c ON ((a."Performance Evaluation Cd" = c."Performance Evaluation Cd")))
    WHERE (a."PML on board" = 'Y'::text)
    ORDER BY a.cxo_pp1
;

CREATE VIEW "public"."vcxo_attrition_wf" AS
  SELECT a."PAY PERIOD",
      a."FY PP",
      a."TYPE",
      a."GAIN/LOSS",
      a."POSN NR",
      a."OFC",
      a."BUD",
      a."ORG",
      a."ORG TEXT",
      a."NAME",
      a."GRADE",
      a."STEP",
      a."PROG",
      a."FUND CODE",
      a."CAT CD",
      a."PROG ELEM",
      a."PROJ",
      a."PROJ TYPE",
      a."SERIES",
      a."TITLE",
      a."TITLE GROUP",
      a."PRIORITY",
      a."INCMB EOD DT",
      a."VACATE DT",
      a."NOAC",
      a."ENHANCE/SUPP YR",
      a."LEO",
      a."BWS",
      a."DIR",
      a.pp1,
      a."PAY PERIOD YEAR",
      a."ORG1",
      a."OFFICE",
      a.filename,
      a.cxo_pp1,
      a.cxo_fy,
      a."Annualization Factor",
      a.ingested_at,
          CASE
              WHEN ("left"(a."ORG", 4) = 'BB06'::text) THEN 'DIR'::text
              WHEN ("left"(a."ORG", 4) = 'BB05'::text) THEN 'DIR'::text
              WHEN ("left"(a."ORG", 4) = 'BB22'::text) THEN 'DIR'::text
              WHEN ("left"(a."ORG", 4) = 'BB07'::text) THEN 'DIR'::text
              WHEN ("left"(a."ORG", 4) = 'BB18'::text) THEN 'ERO'::text
              WHEN ("left"(a."ORG", 4) = 'BB70'::text) THEN 'HSI'::text
              WHEN ("left"(a."ORG", 4) = 'BB24'::text) THEN 'MGT'::text
              WHEN ("left"(a."ORG", 4) = 'BB23'::text) THEN 'MGT'::text
              WHEN ("left"(a."ORG", 4) = 'BB21'::text) THEN 'MGT'::text
              ELSE NULL::text
          END AS cxo_dir,
          CASE
              WHEN (("left"(a."ORG", 4) = 'BB06'::text) OR ("left"(a."ORG", 6) = 'BB0622'::text)) THEN 'OAS'::text
              WHEN (("left"(a."ORG", 4) = 'BB05'::text) OR ("left"(a."ORG", 6) = 'BB0504'::text)) THEN 'OOD'::text
              WHEN (("left"(a."ORG", 4) = 'BB05'::text) OR ("left"(a."ORG", 6) = 'BB0508'::text)) THEN 'OOD'::text
              WHEN (("left"(a."ORG", 4) = 'BB05'::text) OR ("left"(a."ORG", 6) = 'BB0502'::text)) THEN 'OOD'::text
              WHEN (("left"(a."ORG", 4) = 'BB05'::text) OR ("left"(a."ORG", 6) = 'BB0505'::text)) THEN 'OOD'::text
              WHEN (("left"(a."ORG", 4) = 'BB05'::text) OR ("left"(a."ORG", 6) = 'BB0500'::text)) THEN 'OOD'::text
              WHEN (("left"(a."ORG", 4) = 'BB05'::text) OR ("left"(a."ORG", 6) = 'BB0501'::text)) THEN 'OOD'::text
              WHEN (("left"(a."ORG", 4) = 'BB05'::text) OR ("left"(a."ORG", 6) = 'BB0503'::text)) THEN 'OOD'::text
              WHEN (("left"(a."ORG", 4) = 'BB05'::text) OR ("left"(a."ORG", 6) = 'BB0506'::text)) THEN 'OOD'::text
              WHEN (("left"(a."ORG", 4) = 'BB22'::text) OR ("left"(a."ORG", 6) = 'BB2200'::text)) THEN 'OPR'::text
              WHEN (("left"(a."ORG", 4) = 'BB22'::text) OR ("left"(a."ORG", 6) = 'BB2210'::text)) THEN 'OPR'::text
              WHEN (("left"(a."ORG", 4) = 'BB22'::text) OR ("left"(a."ORG", 6) = 'BB2211'::text)) THEN 'OPR'::text
              WHEN (("left"(a."ORG", 4) = 'BB22'::text) OR ("left"(a."ORG", 6) = 'BB2212'::text)) THEN 'OPR'::text
              WHEN (("left"(a."ORG", 4) = 'BB22'::text) OR ("left"(a."ORG", 6) = 'BB2214'::text)) THEN 'OPR'::text
              WHEN (("left"(a."ORG", 4) = 'BB07'::text) OR ("left"(a."ORG", 6) = 'BB0710'::text)) THEN 'PLA'::text
              WHEN (("left"(a."ORG", 4) = 'BB18'::text) OR ("left"(a."ORG", 6) = 'BB1862'::text)) THEN 'DRO'::text
              WHEN (("left"(a."ORG", 4) = 'BB18'::text) OR ("left"(a."ORG", 6) = 'BB1861'::text)) THEN 'DRO'::text
              WHEN (("left"(a."ORG", 4) = 'BB18'::text) OR ("left"(a."ORG", 6) = 'BB1850'::text)) THEN 'DRO'::text
              WHEN (("left"(a."ORG", 4) = 'BB18'::text) OR ("left"(a."ORG", 6) = 'BB1863'::text)) THEN 'DRO'::text
              WHEN (("left"(a."ORG", 4) = 'BB18'::text) OR ("left"(a."ORG", 6) = 'BB1800'::text)) THEN 'DRO'::text
              WHEN (("left"(a."ORG", 4) = 'BB18'::text) OR ("left"(a."ORG", 6) = 'BB1806'::text)) THEN 'DRO'::text
              WHEN (("left"(a."ORG", 4) = 'BB70'::text) OR ("left"(a."ORG", 6) = 'BB7009'::text)) THEN 'IAF'::text
              WHEN (("left"(a."ORG", 4) = 'BB70'::text) OR ("left"(a."ORG", 6) = 'BB7004'::text)) THEN 'INV'::text
              WHEN (("left"(a."ORG", 4) = 'BB70'::text) OR ("left"(a."ORG", 6) = 'BB7000'::text)) THEN 'INV'::text
              WHEN (("left"(a."ORG", 4) = 'BB70'::text) OR ("left"(a."ORG", 6) = 'BB7001'::text)) THEN 'INV'::text
              WHEN (("left"(a."ORG", 4) = 'BB70'::text) OR ("left"(a."ORG", 6) = 'BB7002'::text)) THEN 'INV'::text
              WHEN (("left"(a."ORG", 4) = 'BB70'::text) OR ("left"(a."ORG", 6) = 'BB7003'::text)) THEN 'INV'::text
              WHEN (("left"(a."ORG", 4) = 'BB70'::text) OR ("left"(a."ORG", 6) = 'BB7005'::text)) THEN 'INV'::text
              WHEN (("left"(a."ORG", 4) = 'BB70'::text) OR ("left"(a."ORG", 6) = 'BB7006'::text)) THEN 'INV'::text
              WHEN (("left"(a."ORG", 4) = 'BB70'::text) OR ("left"(a."ORG", 6) = 'BB7007'::text)) THEN 'INV'::text
              WHEN (("left"(a."ORG", 4) = 'BB70'::text) OR ("left"(a."ORG", 6) = 'BB7010'::text)) THEN 'INV'::text
              WHEN (("left"(a."ORG", 4) = 'BB70'::text) OR ("left"(a."ORG", 6) = 'BB7008'::text)) THEN 'ITL'::text
              WHEN (("left"(a."ORG", 4) = 'BB24'::text) OR ("left"(a."ORG", 6) = 'BB2410'::text)) THEN 'CFO'::text
              WHEN (("left"(a."ORG", 4) = 'BB24'::text) OR ("left"(a."ORG", 6) = 'BB2440'::text)) THEN 'CFO'::text
              WHEN (("left"(a."ORG", 4) = 'BB24'::text) OR ("left"(a."ORG", 6) = 'BB2400'::text)) THEN 'CFO'::text
              WHEN (("left"(a."ORG", 4) = 'BB24'::text) OR ("left"(a."ORG", 6) = 'BB2420'::text)) THEN 'CFO'::text
              WHEN (("left"(a."ORG", 4) = 'BB24'::text) OR ("left"(a."ORG", 6) = 'BB2430'::text)) THEN 'CFO'::text
              WHEN (("left"(a."ORG", 4) = 'BB23'::text) OR ("left"(a."ORG", 6) = 'BB2300'::text)) THEN 'CIO'::text
              WHEN (("left"(a."ORG", 4) = 'BB23'::text) OR ("left"(a."ORG", 6) = 'BB2301'::text)) THEN 'CIO'::text
              WHEN (("left"(a."ORG", 4) = 'BB23'::text) OR ("left"(a."ORG", 6) = 'BB2302'::text)) THEN 'CIO'::text
              WHEN (("left"(a."ORG", 4) = 'BB23'::text) OR ("left"(a."ORG", 6) = 'BB2303'::text)) THEN 'CIO'::text
              WHEN (("left"(a."ORG", 4) = 'BB23'::text) OR ("left"(a."ORG", 6) = 'BB2304'::text)) THEN 'CIO'::text
              WHEN (("left"(a."ORG", 4) = 'BB23'::text) OR ("left"(a."ORG", 6) = 'BB2305'::text)) THEN 'CIO'::text
              WHEN (("left"(a."ORG", 4) = 'BB06'::text) OR ("left"(a."ORG", 6) = 'BB0600'::text)) THEN 'MAA'::text
              WHEN (("left"(a."ORG", 4) = 'BB06'::text) OR ("left"(a."ORG", 6) = 'BB0602'::text)) THEN 'MAA'::text
              WHEN (("left"(a."ORG", 4) = 'BB21'::text) OR ("left"(a."ORG", 6) = 'BB2100'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB21'::text) OR ("left"(a."ORG", 6) = 'BB2110'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB21'::text) OR ("left"(a."ORG", 6) = 'BB2120'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB21'::text) OR ("left"(a."ORG", 6) = 'BB2131'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB21'::text) OR ("left"(a."ORG", 6) = 'BB2132'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB21'::text) OR ("left"(a."ORG", 6) = 'BB2140'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB21'::text) OR ("left"(a."ORG", 6) = 'BB2150'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB21'::text) OR ("left"(a."ORG", 6) = 'BB2160'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB21'::text) OR ("left"(a."ORG", 6) = 'BB2180'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB21'::text) OR ("left"(a."ORG", 6) = 'BB2190'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB06'::text) OR ("left"(a."ORG", 6) = 'BB0609'::text)) THEN 'OAS'::text
              WHEN (("left"(a."ORG", 4) = 'BB06'::text) OR ("left"(a."ORG", 6) = 'BB0617'::text)) THEN 'OAS'::text
              WHEN (("left"(a."ORG", 4) = 'BB06'::text) OR ("left"(a."ORG", 6) = 'BB0605'::text)) THEN 'OAS'::text
              WHEN (("left"(a."ORG", 4) = 'BB06'::text) OR ("left"(a."ORG", 6) = 'BB0603'::text)) THEN 'OAS'::text
              ELSE NULL::text
          END AS cxo_office,
          CASE
              WHEN ("left"(a."ORG", 8) = 'BB050000'::text) THEN 'OFFICE OF THE DIRECTOR'::text
              WHEN ("left"(a."ORG", 8) = 'BB050100'::text) THEN 'OD EXECUTIVE SECRETARIAT'::text
              WHEN ("left"(a."ORG", 8) = 'BB050200'::text) THEN 'OFC OF CONGRESSIONAL RELATIONS'::text
              WHEN ("left"(a."ORG", 8) = 'BB050300'::text) THEN 'OFFICE OF PUBLIC AFFAIRS'::text
              WHEN ("left"(a."ORG", 8) = 'BB050302'::text) THEN 'MISSION SUPPORT DIV'::text
              WHEN ("left"(a."ORG", 8) = 'BB050304'::text) THEN 'DIGITAL MARKETING & OUTREACH'::text
              WHEN ("left"(a."ORG", 8) = 'BB050402'::text) THEN 'HQ MEDIA OPERATIONS DIV'::text
              WHEN ("left"(a."ORG", 8) = 'BB050500'::text) THEN 'FIELD MEDIA OPERATIONS UNIT'::text
              WHEN ("left"(a."ORG", 8) = 'BB050501'::text) THEN 'NORTHEAST REGION'::text
              WHEN ("left"(a."ORG", 8) = 'BB060000'::text) THEN 'SOUTHERN REGION'::text
              WHEN ("left"(a."ORG", 8) = 'BB060200'::text) THEN 'WESTERN REGION'::text
              WHEN ("left"(a."ORG", 8) = 'BB060300'::text) THEN 'CENTRAL REGION'::text
              WHEN ("left"(a."ORG", 8) = 'BB060501'::text) THEN 'OFC OF DIVERSTY & CIVIL RIGHTS'::text
              WHEN ("left"(a."ORG", 8) = 'BB060510'::text) THEN 'DIVERSITY MANAGEMENT DIVISION'::text
              WHEN ("left"(a."ORG", 8) = 'BB060520'::text) THEN 'COMPLAINTS & RESOLUTION DIV'::text
              WHEN ("left"(a."ORG", 8) = 'BB060800'::text) THEN 'OFC OF FIREARMS & TACTICAL PRG'::text
              WHEN ("left"(a."ORG", 8) = 'BB060801'::text) THEN 'OFTP POLICY & PROGRAMS BRANCH'::text
              WHEN ("left"(a."ORG", 8) = 'BB060900'::text) THEN 'ARMORY OPERATIONS, ALTOONA, PA'::text
              WHEN ("left"(a."ORG", 8) = 'BB060901'::text) THEN 'OFTP TACTICAL OPS FT BENNING'::text
              WHEN ("left"(a."ORG", 8) = 'BB060902'::text) THEN 'OAS OFFICE OF POLICY'::text
              WHEN ("left"(a."ORG", 8) = 'BB060910'::text) THEN 'OLCD MISSION SUPPORT'::text
              WHEN ("left"(a."ORG", 8) = 'BB060920'::text) THEN 'OLCD LEADERSHIP DEV (DALLAS)'::text
              WHEN ("left"(a."ORG", 8) = 'BB060930'::text) THEN 'OHC CHIEF HUMAN CAPITAL OFFCR'::text
              WHEN ("left"(a."ORG", 8) = 'BB060960'::text) THEN 'HUMAN RESOURCES OPRTNS CNTR'::text
              WHEN ("left"(a."ORG", 8) = 'BB060970'::text) THEN 'HROC STRATEGIC OPERATIONS'::text
              WHEN ("left"(a."ORG", 8) = 'BB060980'::text) THEN 'PREEMPLOYMNT CLEARANCE SECTION'::text
              WHEN ("left"(a."ORG", 8) = 'BB060981'::text) THEN 'HROC CLASSIFICATION UNIT'::text
              WHEN ("left"(a."ORG", 8) = 'BB060983'::text) THEN 'CLASSIFICATION SECTION A'::text
              WHEN ("left"(a."ORG", 8) = 'BB061530'::text) THEN 'CLASSIFICATION SECTION B'::text
              WHEN ("left"(a."ORG", 8) = 'BB061700'::text) THEN 'HROC RETIREMNT & BENEFITS UNIT'::text
              WHEN ("left"(a."ORG", 8) = 'BB061710'::text) THEN 'RETIRMNT & BENEFTS UNIT SECT A'::text
              WHEN ("left"(a."ORG", 8) = 'BB062200'::text) THEN 'RETIRMNT & BENEFTS UNIT SECT B'::text
              WHEN ("left"(a."ORG", 8) = 'BB071000'::text) THEN 'RETIRMNT & BENEFTS UNIT PROC'::text
              WHEN ("left"(a."ORG", 8) = 'BB071001'::text) THEN 'STAFFNG OD-MA-OPLA UNIT SECT B'::text
              WHEN ("left"(a."ORG", 8) = 'BB071002'::text) THEN 'STAFFNG OD-MA-OPLA UNIT PROC'::text
              WHEN ("left"(a."ORG", 8) = 'BB071003'::text) THEN 'OHC LABOR RELATIONS BRANCH'::text
              WHEN ("left"(a."ORG", 8) = 'BB071004'::text) THEN 'OHC POLICY UNIT'::text
              WHEN ("left"(a."ORG", 8) = 'BB071005'::text) THEN 'OHC EXECUTIVE SERVICES UNIT'::text
              WHEN ("left"(a."ORG", 8) = 'BB071006'::text) THEN 'OHC EMPL RESILIENCE UNIT'::text
              WHEN ("left"(a."ORG", 8) = 'BB071007'::text) THEN 'OHC STRATEGIC INITIATIVES'::text
              WHEN ("left"(a."ORG", 8) = 'BB071009'::text) THEN 'OHC STRATGIC REC & RETN UNIT'::text
              WHEN ("left"(a."ORG", 8) = 'BB071010'::text) THEN 'OHC BUSINESS MGMT UNIT'::text
              WHEN ("left"(a."ORG", 8) = 'BB071011'::text) THEN 'OHC PAYROLL UNIT'::text
              WHEN ("left"(a."ORG", 8) = 'BB071012'::text) THEN 'FREEDOM OF INFORMATION BRANCH'::text
              WHEN ("left"(a."ORG", 8) = 'BB071013'::text) THEN 'OFC OF INVEST & PRG ACCNTABLTY'::text
              WHEN ("left"(a."ORG", 8) = 'BB071014'::text) THEN 'OPLA EXECUTIVE OFFICE'::text
              WHEN ("left"(a."ORG", 8) = 'BB071016'::text) THEN 'OPLA FIELD LEGAL OPS'::text
              WHEN ("left"(a."ORG", 8) = 'BB071017'::text) THEN 'OPLA HOMELAND SEC INV LAW UNIT'::text
              WHEN ("left"(a."ORG", 8) = 'BB071019'::text) THEN 'OPLA ENFRCMNT & REMVL OPS UNIT'::text
              WHEN ("left"(a."ORG", 8) = 'BB071020'::text) THEN 'OPLA DISTRICT CT LITGATN UNIT'::text
              WHEN ("left"(a."ORG", 8) = 'BB071021'::text) THEN 'OPLA IMMIGRTN LAW PRACT UNIT'::text
              WHEN ("left"(a."ORG", 8) = 'BB071023'::text) THEN 'OPLA KNOWLEDGE MGMT UNIT'::text
              WHEN ("left"(a."ORG", 8) = 'BB071024'::text) THEN 'OPLA STRATEGIC MGMT UNIT'::text
              WHEN ("left"(a."ORG", 8) = 'BB071025'::text) THEN 'OPLA COMMERCL & ADMIN LAW UNIT'::text
              WHEN ("left"(a."ORG", 8) = 'BB071026'::text) THEN 'OPLA LABOR & EMP LAW UNIT'::text
              WHEN ("left"(a."ORG", 8) = 'BB180000'::text) THEN 'OPLA MISSION SUPPORT UNIT'::text
              WHEN ("left"(a."ORG", 8) = 'BB180001'::text) THEN 'OPLA MS BUDGET'::text
              WHEN ("left"(a."ORG", 8) = 'BB180600'::text) THEN 'OPLA MS FACILITIES'::text
              WHEN ("left"(a."ORG", 8) = 'BB180601'::text) THEN 'OPLA MS WORKFORCE MGMT'::text
              WHEN ("left"(a."ORG", 8) = 'BB180602'::text) THEN 'OPLA ATLANTA'::text
              WHEN ("left"(a."ORG", 8) = 'BB180603'::text) THEN 'OPLA ORLANDO'::text
              WHEN ("left"(a."ORG", 8) = 'BB180604'::text) THEN 'OPLA HONOLULU'::text
              WHEN ("left"(a."ORG", 8) = 'BB180606'::text) THEN 'OPLA SAN ANTONIO (HARLINGEN)'::text
              WHEN ("left"(a."ORG", 8) = 'BB180607'::text) THEN 'OPLA SAN ANTONIO (PEARSALL)'::text
              WHEN ("left"(a."ORG", 8) = 'BB180608'::text) THEN 'OPLA NEW ORLEANS (JENA)'::text
              WHEN ("left"(a."ORG", 8) = 'BB185003'::text) THEN 'OPLA SEATTLE'::text
              WHEN ("left"(a."ORG", 8) = 'BB186101'::text) THEN 'OPLA SEATTLE (TACOMA)'::text
              WHEN ("left"(a."ORG", 8) = 'BB186102'::text) THEN 'OPLA NEWARK (ELIZABETH)'::text
              WHEN ("left"(a."ORG", 8) = 'BB186103'::text) THEN 'DRO STRATEGIC INITIATIVES UNIT'::text
              WHEN ("left"(a."ORG", 8) = 'BB186104'::text) THEN 'DRO DAD LAW ENF SYSTEMS'::text
              WHEN ("left"(a."ORG", 8) = 'BB186105'::text) THEN 'DRO AD OPERATIONS SUPPORT'::text
              WHEN ("left"(a."ORG", 8) = 'BB186106'::text) THEN 'DRO DAD DETNTN MGT DIVISION'::text
              WHEN ("left"(a."ORG", 8) = 'BB186107'::text) THEN 'DRO ALT TO DETN UNIT'::text
              WHEN ("left"(a."ORG", 8) = 'BB186108'::text) THEN 'DRO PROG EVAL ANLYS PLCY UNIT'::text
              WHEN ("left"(a."ORG", 8) = 'BB186109'::text) THEN 'DRO FIELD TRAINING UNIT'::text
              WHEN ("left"(a."ORG", 8) = 'BB186201'::text) THEN 'DRO REMOVAL MGMT'::text
              WHEN ("left"(a."ORG", 8) = 'BB186202'::text) THEN 'DRO ATL INSTITUT REMOVAL PROG'::text
              WHEN ("left"(a."ORG", 8) = 'BB186203'::text) THEN 'DRO ATL RALEIGH DET MGT BR'::text
              WHEN ("left"(a."ORG", 8) = 'BB186204'::text) THEN 'DRO ATL HENDERSONVILLE NC'::text
              WHEN ("left"(a."ORG", 8) = 'BB186205'::text) THEN 'DRO BAL FUGITIVE OPS'::text
              WHEN ("left"(a."ORG", 8) = 'BB186206'::text) THEN 'DRO BOS PROVIDENCE RI'::text
              WHEN ("left"(a."ORG", 8) = 'BB186207'::text) THEN 'DRO BUF BATAVIA NY SPC'::text
              WHEN ("left"(a."ORG", 8) = 'BB186208'::text) THEN 'DRO MIA TAMPA FUGITIVE OPS'::text
              WHEN ("left"(a."ORG", 8) = 'BB186301'::text) THEN 'DRO MIA TALLAHASSEE FL'::text
              WHEN ("left"(a."ORG", 8) = 'BB186302'::text) THEN 'DRO NEW INSTITUT REMOVAL PROG'::text
              WHEN ("left"(a."ORG", 8) = 'BB186303'::text) THEN 'DRO WAS DETENTN MGT BR'::text
              WHEN ("left"(a."ORG", 8) = 'BB186304'::text) THEN 'DRO FIELD OFC PHILADELPHIA'::text
              WHEN ("left"(a."ORG", 8) = 'BB186305'::text) THEN 'DRO CHI DETENTN MGT BR'::text
              WHEN ("left"(a."ORG", 8) = 'BB186306'::text) THEN 'DRO CHI SPRINGFIELD MO DP'::text
              WHEN ("left"(a."ORG", 8) = 'BB186307'::text) THEN 'DRO DAL OKLAHOMA CITY OK'::text
              WHEN ("left"(a."ORG", 8) = 'BB210000'::text) THEN 'DRO DET FUGITIVE OPS'::text
              WHEN ("left"(a."ORG", 8) = 'BB211000'::text) THEN 'DRO DET DET AND REM ADMIN'::text
              WHEN ("left"(a."ORG", 8) = 'BB212000'::text) THEN 'DRO DET INSTITUT REMOVAL PROG'::text
              WHEN ("left"(a."ORG", 8) = 'BB213100'::text) THEN 'DRO DET CLEVELAND SUBOFFICE'::text
              WHEN ("left"(a."ORG", 8) = 'BB214000'::text) THEN 'DRO DET CLEVELAND DET MGT BR'::text
              WHEN ("left"(a."ORG", 8) = 'BB215000'::text) THEN 'DRO DET CLEVELAND REM MGT BR'::text
              WHEN ("left"(a."ORG", 8) = 'BB216000'::text) THEN 'DRO DET FUGITIVE OPS'::text
              WHEN ("left"(a."ORG", 8) = 'BB220000'::text) THEN 'DRO DET COLUMBUS OH'::text
              WHEN ("left"(a."ORG", 8) = 'BB221000'::text) THEN 'DRO DET BPS GRAND RAPIDS'::text
              WHEN ("left"(a."ORG", 8) = 'BB221100'::text) THEN 'DRO NOL MEMPHIS DET MGT BR'::text
              WHEN ("left"(a."ORG", 8) = 'BB221200'::text) THEN 'DRO NOL ETOWAH'::text
              WHEN ("left"(a."ORG", 8) = 'BB221400'::text) THEN 'DRO NOL FAYETTEVILLE AR QRT'::text
              WHEN ("left"(a."ORG", 8) = 'BB230000'::text) THEN 'DRO NOL CHATTANOOGA TN QRT'::text
              WHEN ("left"(a."ORG", 8) = 'BB230201'::text) THEN 'DRO NOL KNOXVILLE TN QRT'::text
              WHEN ("left"(a."ORG", 8) = 'BB230202'::text) THEN 'DRO NOL NASHVILLE TN QRT'::text
              WHEN ("left"(a."ORG", 8) = 'BB230204'::text) THEN 'DRO NOL BPS BATON ROUGE'::text
              WHEN ("left"(a."ORG", 8) = 'BB230205'::text) THEN 'DRO NOL BPS MOBILE'::text
              WHEN ("left"(a."ORG", 8) = 'BB230206'::text) THEN 'DRO NOL BPS GULFPORT'::text
              WHEN ("left"(a."ORG", 8) = 'BB230207'::text) THEN 'DRO NOL BPS LITTLE ROCK'::text
              WHEN ("left"(a."ORG", 8) = 'BB230301'::text) THEN 'DRO NOL JENA LA FACILITY'::text
              WHEN ("left"(a."ORG", 8) = 'BB230302'::text) THEN 'DRO FIELD OFC SAN ANTONIO'::text
              WHEN ("left"(a."ORG", 8) = 'BB230303'::text) THEN 'DRO SNA DETENTN MGT BR'::text
              WHEN ("left"(a."ORG", 8) = 'BB230304'::text) THEN 'DRO SNA REMOVAL MGT BR'::text
              WHEN ("left"(a."ORG", 8) = 'BB230306'::text) THEN 'DRO SNA FUGITIVE OPS'::text
              WHEN ("left"(a."ORG", 8) = 'BB230402'::text) THEN 'DRO SNA DET AND REM ADMIN'::text
              WHEN ("left"(a."ORG", 8) = 'BB230500'::text) THEN 'DRO SNA CONTRACT DETNT FAC'::text
              WHEN ("left"(a."ORG", 8) = 'BB230501'::text) THEN 'DRO SNA INSTITUT REMOVAL PROG'::text
              WHEN ("left"(a."ORG", 8) = 'BB230502'::text) THEN 'DRO SNA LAREDO TX CDF'::text
              WHEN ("left"(a."ORG", 8) = 'BB230503'::text) THEN 'DRO SNA HARLINGEN SUBOFC'::text
              WHEN ("left"(a."ORG", 8) = 'BB240000'::text) THEN 'DRO SNA HARLINGEN FUGITIVE OPS'::text
              WHEN ("left"(a."ORG", 8) = 'BB241000'::text) THEN 'DRO SNA DEL RIO BPS'::text
              WHEN ("left"(a."ORG", 8) = 'BB242000'::text) THEN 'DRO SNA PORT ISABEL SPC'::text
              WHEN ("left"(a."ORG", 8) = 'BB242010'::text) THEN 'DRO SNA WACO FUGITIVE OPERATNS'::text
              WHEN ("left"(a."ORG", 8) = 'BB242020'::text) THEN 'DRO SNA AUSTIN TX'::text
              WHEN ("left"(a."ORG", 8) = 'BB242030'::text) THEN 'KARNES COUNTY CIVIL DETN CNTR'::text
              WHEN ("left"(a."ORG", 8) = 'BB243010'::text) THEN 'DRO SO TX FAM RESDNTIAL CTR'::text
              WHEN ("left"(a."ORG", 8) = 'BB243020'::text) THEN 'DRO SPM DETENTN MGT BR'::text
              WHEN ("left"(a."ORG", 8) = 'BB244000'::text) THEN 'DRO SPM FUGITIVE OPS'::text
              WHEN ("left"(a."ORG", 8) = 'BB244010'::text) THEN 'DRO SPM INSTITUT REMOVAL PROG'::text
              WHEN ("left"(a."ORG", 8) = 'BB244020'::text) THEN 'DRO SPM SIOUX FALLS DUTY POST'::text
              WHEN ("left"(a."ORG", 8) = 'BB244030'::text) THEN 'DRO SPM RAPID CITY SD DP'::text
              WHEN ("left"(a."ORG", 8) = 'BB700000'::text) THEN 'DRO SPM OMAHA DES MOINES QRT'::text
              WHEN ("left"(a."ORG", 8) = 'BB700100'::text) THEN 'DRO SPM OMAHA SIOUX CITY QRT'::text
              WHEN ("left"(a."ORG", 8) = 'BB700200'::text) THEN 'DRO DEN FREDERICK, CO'::text
              WHEN ("left"(a."ORG", 8) = 'BB700300'::text) THEN 'DRO LOS SANTA MARIA CAP'::text
              WHEN ("left"(a."ORG", 8) = 'BB700400'::text) THEN 'DRO FIELD OFC PHOENIX AZ'::text
              WHEN ("left"(a."ORG", 8) = 'BB700500'::text) THEN 'RAC HOUSTON'::text
              WHEN ("left"(a."ORG", 8) = 'BB700600'::text) THEN 'RAC SAN ANTONIO 2'::text
              WHEN ("left"(a."ORG", 8) = 'BB700700'::text) THEN 'RAC PHOENIX'::text
              WHEN ("left"(a."ORG", 8) = 'BB700800'::text) THEN 'RAC SAN FRANCISCO'::text
              WHEN ("left"(a."ORG", 8) = 'BB700900'::text) THEN 'OPR, IDO, ERAU'::text
              ELSE a."ORG TEXT"
          END AS tableau_org_text,
          CASE
              WHEN ("left"(a."ORG", 8) = 'BB050000'::text) THEN 'BB0500000000000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB050100'::text) THEN 'BB0501000000000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB050200'::text) THEN 'BB0502000000000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB050300'::text) THEN 'BB0503000000000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB050302'::text) THEN 'BB0503010000000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB050304'::text) THEN 'BB0503020010000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB050402'::text) THEN 'BB0503040000000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB050500'::text) THEN 'BB0503040010000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB050501'::text) THEN 'BB0503040010100000'::text
              WHEN ("left"(a."ORG", 8) = 'BB060000'::text) THEN 'BB0503040010200000'::text
              WHEN ("left"(a."ORG", 8) = 'BB060200'::text) THEN 'BB0503040010300000'::text
              WHEN ("left"(a."ORG", 8) = 'BB060300'::text) THEN 'BB0503040010400000'::text
              WHEN ("left"(a."ORG", 8) = 'BB060501'::text) THEN 'BB0504000000000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB060510'::text) THEN 'BB0504010000000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB060520'::text) THEN 'BB0504020000000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB060800'::text) THEN 'BB0505000000000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB060801'::text) THEN 'BB0505010000000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB060900'::text) THEN 'BB0505020000000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB060901'::text) THEN 'BB0505030000000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB060902'::text) THEN 'BB0603000000000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB060910'::text) THEN 'BB0605010000000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB060920'::text) THEN 'BB0605200000000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB060930'::text) THEN 'BB0609000000000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB060960'::text) THEN 'BB0609010000000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB060970'::text) THEN 'BB0609010010000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB060980'::text) THEN 'BB0609010010100000'::text
              WHEN ("left"(a."ORG", 8) = 'BB060981'::text) THEN 'BB0609010020000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB060983'::text) THEN 'BB0609010020100000'::text
              WHEN ("left"(a."ORG", 8) = 'BB061530'::text) THEN 'BB0609010020200000'::text
              WHEN ("left"(a."ORG", 8) = 'BB061700'::text) THEN 'BB0609010030000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB061710'::text) THEN 'BB0609010030100000'::text
              WHEN ("left"(a."ORG", 8) = 'BB062200'::text) THEN 'BB0609010030200000'::text
              WHEN ("left"(a."ORG", 8) = 'BB071000'::text) THEN 'BB0609010030300000'::text
              WHEN ("left"(a."ORG", 8) = 'BB071001'::text) THEN 'BB0609010060200000'::text
              WHEN ("left"(a."ORG", 8) = 'BB071002'::text) THEN 'BB0609010060300000'::text
              WHEN ("left"(a."ORG", 8) = 'BB071003'::text) THEN 'BB0609100020000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB071004'::text) THEN 'BB0609200000000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB071005'::text) THEN 'BB0609400000000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB071006'::text) THEN 'BB0609500000000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB071007'::text) THEN 'BB0609600000000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB071009'::text) THEN 'BB0609800000000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB071010'::text) THEN 'BB0609810000000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB071011'::text) THEN 'BB0609830000000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB071012'::text) THEN 'BB0617100000000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB071013'::text) THEN 'BB0622000000000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB071014'::text) THEN 'BB0710000100000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB071016'::text) THEN 'BB0710004000000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB071017'::text) THEN 'BB0710005010000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB071019'::text) THEN 'BB0710005020000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB071020'::text) THEN 'BB0710005030000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB071021'::text) THEN 'BB0710005040000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB071023'::text) THEN 'BB0710006020000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB071024'::text) THEN 'BB0710006050000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB071025'::text) THEN 'BB0710007010000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB071026'::text) THEN 'BB0710007030000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB180000'::text) THEN 'BB0710007050000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB180001'::text) THEN 'BB0710007050100000'::text
              WHEN ("left"(a."ORG", 8) = 'BB180600'::text) THEN 'BB0710007050200000'::text
              WHEN ("left"(a."ORG", 8) = 'BB180601'::text) THEN 'BB0710007050300000'::text
              WHEN ("left"(a."ORG", 8) = 'BB180602'::text) THEN 'BB0710040000000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB180603'::text) THEN 'BB0710080000000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB180604'::text) THEN 'BB0710120000000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB180606'::text) THEN 'BB0710160010000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB180607'::text) THEN 'BB0710160020000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB180608'::text) THEN 'BB0710180030000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB185003'::text) THEN 'BB0710190000000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB186101'::text) THEN 'BB0710190030000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB186102'::text) THEN 'BB0710250010000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB186103'::text) THEN 'BB1800030000000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB186104'::text) THEN 'BB1806010050000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB186105'::text) THEN 'BB1806020000000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB186106'::text) THEN 'BB1806030030000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB186107'::text) THEN 'BB1806030040100000'::text
              WHEN ("left"(a."ORG", 8) = 'BB186108'::text) THEN 'BB1806030060200000'::text
              WHEN ("left"(a."ORG", 8) = 'BB186109'::text) THEN 'BB1806040040020000'::text
              WHEN ("left"(a."ORG", 8) = 'BB186201'::text) THEN 'BB1806070010000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB186202'::text) THEN 'BB1861010025000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB186203'::text) THEN 'BB1861010055100000'::text
              WHEN ("left"(a."ORG", 8) = 'BB186204'::text) THEN 'BB1861010093000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB186205'::text) THEN 'BB1861020015000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB186206'::text) THEN 'BB1861030030000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB186207'::text) THEN 'BB1861040030000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB186208'::text) THEN 'BB1861050030300000'::text
              WHEN ("left"(a."ORG", 8) = 'BB186301'::text) THEN 'BB1861050065000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB186302'::text) THEN 'BB1861060025000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB186303'::text) THEN 'BB1861080005000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB186304'::text) THEN 'BB1861090000000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB186305'::text) THEN 'BB1862010005000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB186306'::text) THEN 'BB1862010055500000'::text
              WHEN ("left"(a."ORG", 8) = 'BB186307'::text) THEN 'BB1862020040000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB210000'::text) THEN 'BB1862030015000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB211000'::text) THEN 'BB1862030020000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB212000'::text) THEN 'BB1862030025000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB213100'::text) THEN 'BB1862030030000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB214000'::text) THEN 'BB1862030030100000'::text
              WHEN ("left"(a."ORG", 8) = 'BB215000'::text) THEN 'BB1862030030200000'::text
              WHEN ("left"(a."ORG", 8) = 'BB216000'::text) THEN 'BB1862030030300000'::text
              WHEN ("left"(a."ORG", 8) = 'BB220000'::text) THEN 'BB1862030030400000'::text
              WHEN ("left"(a."ORG", 8) = 'BB221000'::text) THEN 'BB1862030035100000'::text
              WHEN ("left"(a."ORG", 8) = 'BB221100'::text) THEN 'BB1862060035100000'::text
              WHEN ("left"(a."ORG", 8) = 'BB221200'::text) THEN 'BB1862060041000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB221400'::text) THEN 'BB1862060060000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB230000'::text) THEN 'BB1862060075000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB230201'::text) THEN 'BB1862060080000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB230202'::text) THEN 'BB1862060085000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB230204'::text) THEN 'BB1862060090100000'::text
              WHEN ("left"(a."ORG", 8) = 'BB230205'::text) THEN 'BB1862060090200000'::text
              WHEN ("left"(a."ORG", 8) = 'BB230206'::text) THEN 'BB1862060090400000'::text
              WHEN ("left"(a."ORG", 8) = 'BB230207'::text) THEN 'BB1862060090600000'::text
              WHEN ("left"(a."ORG", 8) = 'BB230301'::text) THEN 'BB1862060095050000'::text
              WHEN ("left"(a."ORG", 8) = 'BB230302'::text) THEN 'BB1862070000000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB230303'::text) THEN 'BB1862070005000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB230304'::text) THEN 'BB1862070010000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB230306'::text) THEN 'BB1862070015000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB230402'::text) THEN 'BB1862070020000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB230500'::text) THEN 'BB1862070022000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB230501'::text) THEN 'BB1862070025000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB230502'::text) THEN 'BB1862070035000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB230503'::text) THEN 'BB1862070040000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB240000'::text) THEN 'BB1862070040300000'::text
              WHEN ("left"(a."ORG", 8) = 'BB241000'::text) THEN 'BB1862070050000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB242000'::text) THEN 'BB1862070090000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB242010'::text) THEN 'BB1862070095000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB242020'::text) THEN 'BB1862070096000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB242030'::text) THEN 'BB1862070097000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB243010'::text) THEN 'BB1862070098000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB243020'::text) THEN 'BB1862080005000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB244000'::text) THEN 'BB1862080015000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB244010'::text) THEN 'BB1862080025000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB244020'::text) THEN 'BB1862080030000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB244030'::text) THEN 'BB1862080035000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB700000'::text) THEN 'BB1862080040500000'::text
              WHEN ("left"(a."ORG", 8) = 'BB700100'::text) THEN 'BB1862080040600000'::text
              WHEN ("left"(a."ORG", 8) = 'BB700200'::text) THEN 'BB1863010065000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB700300'::text) THEN 'BB1863020035000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB700400'::text) THEN 'BB1863030000000000'::text
              WHEN ("left"(a."ORG", 8) = 'BB700500'::text) THEN 'BB2210002101020000'::text
              WHEN ("left"(a."ORG", 8) = 'BB700600'::text) THEN 'BB2210002102010000'::text
              WHEN ("left"(a."ORG", 8) = 'BB700700'::text) THEN 'BB2210002201020000'::text
              WHEN ("left"(a."ORG", 8) = 'BB700800'::text) THEN 'BB2210002201040000'::text
              WHEN ("left"(a."ORG", 8) = 'BB700900'::text) THEN 'BB2211001300000000'::text
              ELSE a."ORG"
          END AS tableau_org,
          CASE
              WHEN (a."ORG" = 'BB0622000000000000'::text) THEN 'PROG MGR'::text
              WHEN (a."ORG" = 'BB0504000000000000'::text) THEN 'EQ EMPLMT SPECLST'::text
              WHEN (a."ORG" = 'BB0504010000000000'::text) THEN 'PLCY ADVSR'::text
              WHEN (a."ORG" = 'BB0504020000000000'::text) THEN 'MISSION SUPRT SPECLST'::text
              WHEN (a."ORG" = 'BB0508000000000000'::text) THEN 'PROG MGR'::text
              WHEN (a."ORG" = 'BB0502000000000000'::text) THEN 'CONGRSNL LIASN SPECLST'::text
              WHEN (a."ORG" = 'BB0505000000000000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB0505010000000000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB0505020000000000'::text) THEN 'LAW ENFORCEMENT PROG. MGR.'::text
              WHEN (a."ORG" = 'BB0505030000000000'::text) THEN 'TRAINING SPEC (FIREARMS)'::text
              WHEN (a."ORG" = 'BB0500000000000000'::text) THEN 'DIR'::text
              WHEN (a."ORG" = 'BB0501000000000000'::text) THEN 'PROG MGR'::text
              WHEN (a."ORG" = 'BB0503000000000000'::text) THEN 'SUPVY PUBLIC AFF SPECLST'::text
              WHEN (a."ORG" = 'BB0503010000000000'::text) THEN 'SUPVY MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB0503020000000000'::text) THEN 'WRI EDIT'::text
              WHEN (a."ORG" = 'BB0503020010000000'::text) THEN 'PUBLIC AFF SPECLST'::text
              WHEN (a."ORG" = 'BB0503020020000000'::text) THEN 'AUDIO VIS PRODN SPECLST'::text
              WHEN (a."ORG" = 'BB0503030000000000'::text) THEN 'WRI EDIT'::text
              WHEN (a."ORG" = 'BB0503040000000000'::text) THEN 'PUBLIC AFF SPECLST'::text
              WHEN (a."ORG" = 'BB0503040010000000'::text) THEN 'PUBLIC AFF SPECLST'::text
              WHEN (a."ORG" = 'BB0503040010100000'::text) THEN 'PUBLIC AFF SPECLST'::text
              WHEN (a."ORG" = 'BB0503040010200000'::text) THEN 'PUBLIC AFF SPECLST'::text
              WHEN (a."ORG" = 'BB0503040010300000'::text) THEN 'PUBLIC AFF SPECLST'::text
              WHEN (a."ORG" = 'BB0503040010400000'::text) THEN 'PUBLIC AFF SPECLST'::text
              WHEN (a."ORG" = 'BB0506000000000000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB2200000000000000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210000000000000'::text) THEN 'ASST DIR INVST OPR'::text
              WHEN (a."ORG" = 'BB2210001500000000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210001600000000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210001601000000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210001602000000'::text) THEN 'OVERSIGHT ADM (PREA)'::text
              WHEN (a."ORG" = 'BB2210001603000000'::text) THEN 'OPERTNL ANALS SPECLST'::text
              WHEN (a."ORG" = 'BB2210001700000000'::text) THEN 'SUPVY INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB2210001702000000'::text) THEN 'TECHNCL ENFCMNT OFFCR'::text
              WHEN (a."ORG" = 'BB2210001703000000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210001900000000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210001901000000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB2210001902000000'::text) THEN 'SUPVY MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB2210002000000000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB2210002001000000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210002001010000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210002001020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210002001030000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210002002000000'::text) THEN 'TECHNCL ENFCMNT OFFCR'::text
              WHEN (a."ORG" = 'BB2210002002010000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210002002020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210002002030000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210002002040000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210002003000000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210002003010000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210002003020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210002003030000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210002003040000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210002100000000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB2210002101000000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB2210002101010000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210002101020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210002101030000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210002101040000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210002102000000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210002102010000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210002102020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210002102030000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210002103000000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210002103010000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210002103020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210002103030000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210002103040000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210002103050000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210002200000000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB2210002201000000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210002201010000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210002201020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210002201030000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210002201040000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210002202000000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210002202010000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210002202020000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2210002202030000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB2211000000000000'::text) THEN 'AD INSP AND DETNTN OVERSIGHT'::text
              WHEN (a."ORG" = 'BB2211001000000000'::text) THEN 'SUPVY ADMV OFFCR'::text
              WHEN (a."ORG" = 'BB2211001001000000'::text) THEN 'INSPS & COMPLNC SPECLST'::text
              WHEN (a."ORG" = 'BB2211001100000000'::text) THEN 'SUPVY INSPS & COMPLNC MGR'::text
              WHEN (a."ORG" = 'BB2211001101000000'::text) THEN 'INSPS & COMPLNC SPECLST'::text
              WHEN (a."ORG" = 'BB2211001104000000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB2211001200000000'::text) THEN 'INSPS & COMPLNC SPECLST'::text
              WHEN (a."ORG" = 'BB2211001300000000'::text) THEN 'INSPS & COMPLNC SPECLST'::text
              WHEN (a."ORG" = 'BB2212000000000000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB2212001000000000'::text) THEN 'SUPVY SECUR SPECLST'::text
              WHEN (a."ORG" = 'BB2212001001000000'::text) THEN 'SUPVY SECUR SPECLST'::text
              WHEN (a."ORG" = 'BB2212001002000000'::text) THEN 'PERS SECUR SPECLST'::text
              WHEN (a."ORG" = 'BB2212001004000000'::text) THEN 'PERS SECUR SPECLST'::text
              WHEN (a."ORG" = 'BB2212001005000000'::text) THEN 'SUPVY PERS SECUR SPECLST'::text
              WHEN (a."ORG" = 'BB2212001007000000'::text) THEN 'SUPVY SECUR SPECLST'::text
              WHEN (a."ORG" = 'BB2212001007010000'::text) THEN 'PERS SECUR SPECLST'::text
              WHEN (a."ORG" = 'BB2212001007020000'::text) THEN 'PERS SECUR SPECLST'::text
              WHEN (a."ORG" = 'BB2212001008000000'::text) THEN 'SUPVY PERS SECUR SPECLST'::text
              WHEN (a."ORG" = 'BB2212001009000000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB2212001010000000'::text) THEN 'SECUR SPECLST (POLYGRAPH EXAMNR)'::text
              WHEN (a."ORG" = 'BB2212001200000000'::text) THEN 'SUPVY SECUR SPECLST'::text
              WHEN (a."ORG" = 'BB2212001201000000'::text) THEN 'PHYS SECUR SPECLST'::text
              WHEN (a."ORG" = 'BB2212001203000000'::text) THEN 'SECUR SPECLST'::text
              WHEN (a."ORG" = 'BB2212001204000000'::text) THEN 'PHYS SECUR SPECLST'::text
              WHEN (a."ORG" = 'BB2212001205000000'::text) THEN 'SUPVY SECUR SPECLST'::text
              WHEN (a."ORG" = 'BB2212001300000000'::text) THEN 'SUPVY SECUR SPECLST'::text
              WHEN (a."ORG" = 'BB2212001301000000'::text) THEN 'SECUR SPECLST'::text
              WHEN (a."ORG" = 'BB2212001302000000'::text) THEN 'SECUR SPECLST'::text
              WHEN (a."ORG" = 'BB2214001000000000'::text) THEN 'SUPVY MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB0710000100000000'::text) THEN 'SUPVY GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710004000000000'::text) THEN 'GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710005000000000'::text) THEN 'DEP PRINC LEGAL ADVSR HEADQUARTES'::text
              WHEN (a."ORG" = 'BB0710005010000000'::text) THEN 'GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710005020000000'::text) THEN 'GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710005030000000'::text) THEN 'PARALEGAL SPECIALIST (OPLA)'::text
              WHEN (a."ORG" = 'BB0710005040000000'::text) THEN 'GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710005050000000'::text) THEN 'GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710005060000000'::text) THEN 'GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710006020000000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB0710006040000000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB0710006050000000'::text) THEN 'GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710006070000000'::text) THEN 'GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710007010000000'::text) THEN 'SUPVY GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710007020000000'::text) THEN 'GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710007030000000'::text) THEN 'GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710007040000000'::text) THEN 'SUPVY GEN ATTY (ETHICS)'::text
              WHEN (a."ORG" = 'BB0710007050000000'::text) THEN 'SUPVY MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB0710007050100000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB0710007050200000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB0710007050300000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB0710010000000000'::text) THEN 'GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710020000000000'::text) THEN 'LEG ASST OA'::text
              WHEN (a."ORG" = 'BB0710020010000000'::text) THEN 'GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710020020000000'::text) THEN 'SUPVY GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710030000000000'::text) THEN 'GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710030010000000'::text) THEN 'GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710040000000000'::text) THEN 'LEG ASST OA'::text
              WHEN (a."ORG" = 'BB0710040010000000'::text) THEN 'GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710040020000000'::text) THEN 'GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710050000000000'::text) THEN 'SUPVY GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710050010000000'::text) THEN 'GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710060000000000'::text) THEN 'SUPVY GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710070000000000'::text) THEN 'LEG ASST OA'::text
              WHEN (a."ORG" = 'BB0710070010000000'::text) THEN 'GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710080000000000'::text) THEN 'LEG ASST OA'::text
              WHEN (a."ORG" = 'BB0710090000000000'::text) THEN 'SUPVY GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710090010000000'::text) THEN 'LEG ASST OA'::text
              WHEN (a."ORG" = 'BB0710100000000000'::text) THEN 'SUPVY GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710100020000000'::text) THEN 'GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710110000000000'::text) THEN 'GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710110010000000'::text) THEN 'GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710120000000000'::text) THEN 'LEG ASST OA'::text
              WHEN (a."ORG" = 'BB0710130000000000'::text) THEN 'GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710140000000000'::text) THEN 'GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710140010000000'::text) THEN 'GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710140020000000'::text) THEN 'GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710140030000000'::text) THEN 'GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710160000000000'::text) THEN 'MAIL & FILE CLK OA'::text
              WHEN (a."ORG" = 'BB0710160010000000'::text) THEN 'LEG ASST OA'::text
              WHEN (a."ORG" = 'BB0710160020000000'::text) THEN 'GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710160030000000'::text) THEN 'SUPVY GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710160040000000'::text) THEN 'GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710170000000000'::text) THEN 'SUPVY GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710170010000000'::text) THEN 'GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710180000000000'::text) THEN 'CHIEF COUNSEL'::text
              WHEN (a."ORG" = 'BB0710180010000000'::text) THEN 'SUPVY GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710180020000000'::text) THEN 'LEG ASST OA'::text
              WHEN (a."ORG" = 'BB0710180030000000'::text) THEN 'GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710190000000000'::text) THEN 'SUPVY GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710190020000000'::text) THEN 'GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710190030000000'::text) THEN 'LEG ASST OA'::text
              WHEN (a."ORG" = 'BB0710200000000000'::text) THEN 'SUPVY GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710210000000000'::text) THEN 'CHIEF COUNSEL'::text
              WHEN (a."ORG" = 'BB0710210010000000'::text) THEN 'GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710210020000000'::text) THEN 'GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710210030000000'::text) THEN 'LEAD LEG ASST'::text
              WHEN (a."ORG" = 'BB0710220000000000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB0710220010000000'::text) THEN 'LEG ASST OA'::text
              WHEN (a."ORG" = 'BB0710220020000000'::text) THEN 'SUPVY GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710230000000000'::text) THEN 'PARALEGAL SPECLST'::text
              WHEN (a."ORG" = 'BB0710230010000000'::text) THEN 'GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710230020000000'::text) THEN 'GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710230030000000'::text) THEN 'SUPVY GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710240000000000'::text) THEN 'SUPVY GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710240010000000'::text) THEN 'GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710250000000000'::text) THEN 'SUPVY GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710250010000000'::text) THEN 'SUPVY GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710260000000000'::text) THEN 'GEN ATTY'::text
              WHEN (a."ORG" = 'BB0710260010000000'::text) THEN 'GEN ATTY (EMPL)'::text
              WHEN (a."ORG" = 'BB1862070000000000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB1862070005000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862070010000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1862070015000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862070020000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1862070022000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862070025000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862070035000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862070040000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1862070040300000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862070050000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1862070090000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1862070095000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862070096000000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB1862070097000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1862070098000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861010000000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1861010005000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861010010000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861010015000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1861010020000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1861010025000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861010035000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1861010040000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1861010040100000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861010040200000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861010040300000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1861010045000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861010045100000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1861010050000000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB1861010050100000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861010050200000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861010050300000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861010055000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1861010055100000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861010055200000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1861010055300000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1861010060000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861010086000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1861010090000000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB1861010091000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1861010092000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861010093000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1861010094000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861010095000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861020000000000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB1861020005000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1861020010000000'::text) THEN 'BOND CNTL SPECLST'::text
              WHEN (a."ORG" = 'BB1861020015000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1861020025000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1861020030000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1861030000000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1861030005000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1861030010000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1861030015000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861030020000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861030025000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1861030030000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1861030030200000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1861030035000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861030040000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1861030045200000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1861030045400000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1861030045401000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861030045402000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1861040000000000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB1861040005000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1861040010000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1861040015000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1861040020000000'::text) THEN 'DEPRTN OFFCR (COURSE DEVLP/INSTR)'::text
              WHEN (a."ORG" = 'BB1861040025000000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB1861040030000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861040035000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861040040000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861040040100000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861040040200000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1861040045000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1862010000000000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB1862010005000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1862010010000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1862010015000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862010015050000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1862010020000000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB1862010025000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1862010035000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1862010040000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1862010045000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862010050000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1862010055000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1862010055050000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1862010055100000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1862010055200000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862010055400000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862010055500000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1862010060000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862010060100000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1862010060200000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862010060300000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1862010070000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1850030005050000'::text) THEN 'DEPRTN OFFCR (COURSE DEVLP/INSTR)'::text
              WHEN (a."ORG" = 'BB1862020000000000'::text) THEN 'SPEC ASST'::text
              WHEN (a."ORG" = 'BB1862020005000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1862020010000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862020015000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862020020000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1862020025000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1862020030000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862020035000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862020035050000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB1862020040000000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB1862020040100000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1862020040200000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1862020040300000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1862020040400000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862020055000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862020060000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1862020070000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1862020080000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862020090000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1861080000000000'::text) THEN 'BOND CNTL SPECLST'::text
              WHEN (a."ORG" = 'BB1861080005000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861080010000000'::text) THEN 'SUPVY MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB1861080015000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861080025000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861080030000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861080035000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1861080040000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861080045000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863010000000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1863010003000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1863010006000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1863010009000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863010021000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863010024000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863010027000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863010030000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1863010036000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863010039000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863010042000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1863010045000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863010065000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1862030000000000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB1862030005000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862030010000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862030015000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862030020000000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB1862030025000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862030030000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1862030030100000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1862030030200000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862030030300000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1862030030400000'::text) THEN 'STAFF ASST'::text
              WHEN (a."ORG" = 'BB1862030035100000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862040000000000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB1862040010000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862040025000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1862040030000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1862040035000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862040040000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1862040042000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1862040043000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862040050300000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862050000000000'::text) THEN 'BOND CNTL SPECLST'::text
              WHEN (a."ORG" = 'BB1862050005000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1862050010000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1862050015000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1862050020000000'::text) THEN 'SUPVY MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB1862050022000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1862050025000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1862050030000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862050035000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1862050040000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1800000000000000'::text) THEN 'SPEC ASST'::text
              WHEN (a."ORG" = 'BB1800010000000000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB1800020000000000'::text) THEN 'DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1800030000000000'::text) THEN 'DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1806000000000000'::text) THEN 'SPEC ASST'::text
              WHEN (a."ORG" = 'BB1806010000000000'::text) THEN 'SPEC ASST'::text
              WHEN (a."ORG" = 'BB1806010010000000'::text) THEN 'DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1806010020000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1806010030000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1806010030100000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB1806010030200000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1806010030300000'::text) THEN 'DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1806010050000000'::text) THEN 'SUPVY MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB1806010050100000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB1806010050200000'::text) THEN 'DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1806010050300000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB1806010050400000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB1806010050500000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB1806020000000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1806020010000000'::text) THEN 'DEPUTY ASSISTANT DIRECTOR ERO'::text
              WHEN (a."ORG" = 'BB1806020010100000'::text) THEN 'SUPVY MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB1806020010200000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB1806020010300000'::text) THEN 'SUPVY MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB1806020010400000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB1806020010600000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB1806020020000000'::text) THEN 'DEPUTY ASSISTANT DIRECTOR ERO'::text
              WHEN (a."ORG" = 'BB1806020020100000'::text) THEN 'DEPUTY ASSISTANT DIRECTOR ERO'::text
              WHEN (a."ORG" = 'BB1806020020200000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB1806020020400000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB1806020020600000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB1806030000000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1806030030000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1806030030100000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB1806030030200000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB1806030030300000'::text) THEN 'DEPRTN OFFCR (COMP STDS OFFCR)'::text
              WHEN (a."ORG" = 'BB1806030040000000'::text) THEN 'SUPVY MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB1806030040100000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB1806030040200000'::text) THEN 'DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1806030040300000'::text) THEN 'DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1806030050000000'::text) THEN 'SUPVY MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB1806030060000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1806030060100000'::text) THEN 'PROG MGR'::text
              WHEN (a."ORG" = 'BB1806030060200000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB1806040000000000'::text) THEN 'ASST DIR SECURE COMMUNITIES'::text
              WHEN (a."ORG" = 'BB1806040030000000'::text) THEN 'ENFORCEMENT PROGRAMS MGR'::text
              WHEN (a."ORG" = 'BB1806040030100000'::text) THEN 'DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1806040030300000'::text) THEN 'DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1806040040000000'::text) THEN 'SPEC ASST'::text
              WHEN (a."ORG" = 'BB1806040040010000'::text) THEN 'DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1806040040020000'::text) THEN 'DEPRTN OFFCR (COURSE DEVLP/INSTR)'::text
              WHEN (a."ORG" = 'BB1806040040100000'::text) THEN 'DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1806040040400000'::text) THEN 'DEP ASST DIR CRIMINAL ALIEN'::text
              WHEN (a."ORG" = 'BB1806040040500000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB1806040040600000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1806040040700000'::text) THEN 'LAW ENFCMNT SPECLST'::text
              WHEN (a."ORG" = 'BB1806060000000000'::text) THEN 'ASST DIR ICE SRVCS HLTH CORPS'::text
              WHEN (a."ORG" = 'BB1806060010000000'::text) THEN 'SUPVY MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB1806070000000000'::text) THEN 'ASST DIR ENFCMNT & REMOVAL OPS'::text
              WHEN (a."ORG" = 'BB1806070010000000'::text) THEN 'WRI EDIT'::text
              WHEN (a."ORG" = 'BB1806070010100000'::text) THEN 'DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1806070010400000'::text) THEN 'DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1806070010600000'::text) THEN 'DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1806070020100000'::text) THEN 'DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1806070020300000'::text) THEN 'DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1806070030000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1806070040010000'::text) THEN 'DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1806080000000000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB1850030005000000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB1863020000000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1863020005000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863020010000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863020015000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1863020020000000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB1863020025000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1863020030000000'::text) THEN 'SUPVY MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB1863020035000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863020045000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1863020046000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863020050000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1863020055000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863020056000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1863020065000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861050000000000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB1861050005000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861050015000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1861050021000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861050024000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1861050025000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861050030000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861050030100000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1861050030300000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1861050035000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1861050040000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1861050040100000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861050045000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861050050000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861050060100000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861050065000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861050070000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1861050070100000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1861050070200000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861050075000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861060000000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861060005000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861060010000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861060015000000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB1861060025000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1861060035000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1862060000000000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB1862060005000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862060010000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862060015000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862060020000000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB1862060030000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1862060030100000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862060030200000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862060030300000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862060031000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1862060035000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862060035100000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862060035200000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1862060041000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1862060045000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1862060046000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1862060047000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1862060050000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1862060052000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1862060053000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862060055000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862060060000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1862060075000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1862060080000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862060085000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1862060090100000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1862060090200000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862060090400000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1862060090600000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862060095050000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1861070000000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1861070005000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861070010000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1861070015000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1861070025000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1861070030000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1861070040000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861070060000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1861090000000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1861090010000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861090020000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1861090030000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1861090040000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1861090050000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1861090060000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1861090085000000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB1863030000000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1863030005000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863030010000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863030015000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1863030020000000'::text) THEN 'SUPVY MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB1863030025000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1863030026000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863030030000000'::text) THEN 'OFF AUTOMATION ASST'::text
              WHEN (a."ORG" = 'BB1863030035000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863030040000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1863030040100000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1863030040200000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863030065000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863040000000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863040005000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863040010000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1863040015000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863040020000000'::text) THEN 'MISSION SUPRT ASST OA'::text
              WHEN (a."ORG" = 'BB1863040025000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863040030000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863040033000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1863040035000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1863040040000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1863040045000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863040050000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863060000000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1863060005000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1863060010000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1863060015000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1863060020000000'::text) THEN 'SUPVY MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB1863060025000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1863060030000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863060035000000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB1863060040000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1863060045000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1863060045100000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863060045200000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863060050000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863060050100000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863060050200000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863060050300000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1863060051000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1863060070000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863060070050000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863060070100000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1863050000000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1863050001000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1863050005000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863050010000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863050015000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1863050020000000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB1863050030000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1863050030100000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863050030200000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1863050030300000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1863050035000000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB1863050035100000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863050035200000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1863050035300000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1863050040000000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB1863050040100000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1863050040200000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1863050040300000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863050055000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863050060000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1863050060100000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1863050060200000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863050065100000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863050065200000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1863050066000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1863050070100000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1863050070200000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863070000000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1863070001000000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB1863070001050000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863070001100000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863070001150000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863070001250000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1863070005000000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB1863070005100000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1863070015000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863070025000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863070025050000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1863070025100000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863070025150000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863070030000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863070030050000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863070030100000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1863070035000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1863070040000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1863070045000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1863070050000000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB1863070050050000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1863070050100000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1862080000000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862080005000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862080010000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862080015000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1862080025000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1862080030000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862080035000000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1862080040000000'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN (a."ORG" = 'BB1862080040300000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1862080040400000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862080040500000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB1862080040600000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862080040700000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB1862080040800000'::text) THEN 'SUPVY MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB1862080045000000'::text) THEN 'DEPRTN OFFCR'::text
              WHEN (a."ORG" = 'BB1862080045050000'::text) THEN 'SUPVY DETNTN & DEPORTATN OFFCR'::text
              WHEN (a."ORG" = 'BB7009000101010100'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000101022300'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000101011700'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000102021200'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000101010200'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000101020400'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000102021500'::text) THEN 'DEPRTN LIASN OFFCR'::text
              WHEN (a."ORG" = 'BB7009000101020100'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000101012200'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000102021100'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000102020900'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7009000102021000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000101021300'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000102010100'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000101020300'::text) THEN 'DEPRTN LIASN OFFCR'::text
              WHEN (a."ORG" = 'BB7009000102011300'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000101022200'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000101020800'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000101011600'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000101021600'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000102020400'::text) THEN 'DEPRTN LIASN OFFCR'::text
              WHEN (a."ORG" = 'BB7009000101021500'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000101011800'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000101010300'::text) THEN 'DEPRTN LIASN OFFCR'::text
              WHEN (a."ORG" = 'BB7009000102011400'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000101020500'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000102021300'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000101022500'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000102011200'::text) THEN 'DEPRTN LIASN OFFCR'::text
              WHEN (a."ORG" = 'BB7009000101020600'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000102010800'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000101010400'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000000000000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB7009000100000000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB7009000101000000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000101010000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000101020000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000102000000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB7009000102010000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000102020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000103000000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000103010000'::text) THEN 'IMMIGRATN OFFCR'::text
              WHEN (a."ORG" = 'BB7009000103020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000103030000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000101020200'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000101021200'::text) THEN 'DEPRTN LIASN OFFCR'::text
              WHEN (a."ORG" = 'BB7009000101012400'::text) THEN 'DEPRTN LIASN OFFCR'::text
              WHEN (a."ORG" = 'BB7009000101012300'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000101011400'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000102010700'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000101021800'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000102020500'::text) THEN 'DEPRTN LIASN OFFCR'::text
              WHEN (a."ORG" = 'BB7009000101021900'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000101012000'::text) THEN 'DEPRTN LIASN OFFCR'::text
              WHEN (a."ORG" = 'BB7009000101010500'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB7009000102021400'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000101022400'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000102010600'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000101021400'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000102010900'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000101020700'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000101010600'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000102010300'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000101011900'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000102011000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000102020600'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000102020200'::text) THEN 'DEPRTN LIASN OFFCR'::text
              WHEN (a."ORG" = 'BB7009000101010700'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000102010200'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000102020100'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB7009000101010800'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB7009000101010900'::text) THEN 'DEPRTN LIASN OFFCR'::text
              WHEN (a."ORG" = 'BB7009000101011200'::text) THEN 'DEPRTN LIASN OFFCR'::text
              WHEN (a."ORG" = 'BB7009000102021600'::text) THEN 'DEPRTN LIASN OFFCR'::text
              WHEN (a."ORG" = 'BB7009000102020800'::text) THEN 'DEPRTN LIASN OFFCR'::text
              WHEN (a."ORG" = 'BB7009000101011100'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000101011000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000101020900'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000102020300'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000101021000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB7009000101011500'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000102010400'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000102020700'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000102011100'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000101022600'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000101011300'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000102010500'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000101021700'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000101022100'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7009000101022000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000401000000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000401010000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7004000401020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000401040000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000401050000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000401050100'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000401060000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000401070000'::text) THEN 'COMPR FORENSIC ANAL'::text
              WHEN (a."ORG" = 'BB7004000402000000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000402010000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7004000402020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000402030000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000201000000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000201010000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000201020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000201030000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000201040000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000201050000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000201060000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7004000201070000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000201080000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000201090000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000201100000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000201110000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000202000000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000202010000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7004000202020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000202030000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000202030100'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000202040000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000202050000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000203000000'::text) THEN 'INVESTIGATIVE ASST OA'::text
              WHEN (a."ORG" = 'BB7004000203010000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7004000203020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000203020200'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000203030000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000203040000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000203050000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000203050100'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000301000000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000301010000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7004000301020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000301030000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000301040000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000301050000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000301060000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB7004000301060100'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000301070000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000208000000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000208010000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7004000208020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000208020100'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000208030000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000208040000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000208040100'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000208050000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000208060000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000208070000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000208080000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000208090000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000208100000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000208120000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000208130000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB7004000208140000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000208150000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000204000000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000204010000'::text) THEN 'SUPVY INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7004000204020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000204030000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000204040000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000204050000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000204060000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000204070000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB7004000302000000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000302010000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7004000302020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000302030000'::text) THEN 'INVESTIGATIVE ASST OA'::text
              WHEN (a."ORG" = 'BB7004000302040000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000302040100'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000302050000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000302060000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000302070000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000406000000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000406010000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000406020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000406030000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000303000000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000303010000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7004000303020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000303030000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000303040000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7000000000000000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7001000000000000'::text) THEN 'ASST DIR OFFICE OF INVESTIGATIONS'::text
              WHEN (a."ORG" = 'BB7001000100000000'::text) THEN 'DEP ASST DIR INVEST'::text
              WHEN (a."ORG" = 'BB7001000101000000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7001000101010000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7001000101020000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7001000101030000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7001000101040000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7001000101050000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7001000101060000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7001000200000000'::text) THEN 'DEP ASST DIR INVEST'::text
              WHEN (a."ORG" = 'BB7001000201000000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7001000201010000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7001000201020000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7001000201030000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7001000201040000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7001000201050000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB7001000201060000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7001000300000000'::text) THEN 'DEP ASST DIR INVEST'::text
              WHEN (a."ORG" = 'BB7001000301010000'::text) THEN 'PAROLE PROG SPECLST'::text
              WHEN (a."ORG" = 'BB7001000301020000'::text) THEN 'ASSET FORFEIT SPECLST'::text
              WHEN (a."ORG" = 'BB7001000301030000'::text) THEN 'SUPVY VICTIM ASST PROG SPECLST'::text
              WHEN (a."ORG" = 'BB7001000301040000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7001000301050000'::text) THEN 'SUPVY FORENSIC DOCMT EXAMNR'::text
              WHEN (a."ORG" = 'BB7001000301060000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7001000302000000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7001000302010000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7001000302020000'::text) THEN 'MISSION SUPRT ASST OA'::text
              WHEN (a."ORG" = 'BB7002000000000000'::text) THEN 'ASST DIR OFFICE OF INVESTIGATIONS'::text
              WHEN (a."ORG" = 'BB7002000100000000'::text) THEN 'SEVP APPEALS ADJUDR'::text
              WHEN (a."ORG" = 'BB7002000101000000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7002000101010000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7002000101020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7002000101030000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB7002000200000000'::text) THEN 'PROG MGR'::text
              WHEN (a."ORG" = 'BB7002000201000000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB7002000201010000'::text) THEN 'SUPVY MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB7002000201020000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB7002000202000000'::text) THEN 'SUPVY MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB7002000202010000'::text) THEN 'SUPVY MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB7002000202020000'::text) THEN 'SUPVY MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB7003000000000000'::text) THEN 'EXECUTIVE DIRECTOR LEIS'::text
              WHEN (a."ORG" = 'BB7003000100000000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB7003000101000000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB7003000101010000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7003000101020000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7003000101030000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7003000101040000'::text) THEN 'COMPR FORENSIC ANAL'::text
              WHEN (a."ORG" = 'BB7003000201000000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7003000201010000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7003000201020000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB7003000201030000'::text) THEN 'SUPVY MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB7003000300000000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7003000301010000'::text) THEN 'TECHNCL ENFCMNT OFFCR'::text
              WHEN (a."ORG" = 'BB7003000301020000'::text) THEN 'TECHNCL ENFCMNT OFFCR'::text
              WHEN (a."ORG" = 'BB7003000301030000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB7004000000000000'::text) THEN 'ASST DIR OFFICE OF INVESTIGATIONS'::text
              WHEN (a."ORG" = 'BB7004000100000000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB7004000101000000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000101010000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000101020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000101030000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000101040000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7005000000000000'::text) THEN 'DEPUTY DIRECTOR INVESTIGATIONS'::text
              WHEN (a."ORG" = 'BB7005000100000000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7005000101000000'::text) THEN 'SUPVY MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB7005000101010000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7005000101020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7005000200000000'::text) THEN 'DIR FEDL EXPORT ENFCMNT COORDNTN CENTR'::text
              WHEN (a."ORG" = 'BB7005000201000000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7005000201010000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB7005000201020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7006000000000000'::text) THEN 'ASST DIR OFFICE OF INVESTIGATIONS'::text
              WHEN (a."ORG" = 'BB7006000100000000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB7006000101000000'::text) THEN 'SUPVY MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB7006000101010000'::text) THEN 'BUS OPERS SPECLST'::text
              WHEN (a."ORG" = 'BB7006000101020000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB7006000101030000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB7006000101040000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB7006000102000000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB7006000102010000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB7006000102020000'::text) THEN 'SUPVY MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB7006000200000000'::text) THEN 'PROG MGR'::text
              WHEN (a."ORG" = 'BB7006000200010000'::text) THEN 'SUPVY PROG SPECLST'::text
              WHEN (a."ORG" = 'BB7006000201000000'::text) THEN 'SUPVY MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB7006000201010000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB7006000201020000'::text) THEN 'SUPVY PROG SPECLST'::text
              WHEN (a."ORG" = 'BB7006000201030000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB7006000201040000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB7006000202000000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB7006000202010000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB7006000202020000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB7007000000000000'::text) THEN 'ASST DIR OFFICE OF INVESTIGATIONS'::text
              WHEN (a."ORG" = 'BB7007000100000000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB7007000101000000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7007000101020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7010000000000000'::text) THEN 'STUD VOL'::text
              WHEN (a."ORG" = 'BB7004000211000000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000211010000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7004000211020000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000211030000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000211040000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000211040100'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000211050000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000211060000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000211070000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000211080000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000211090000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000211100000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000304000000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000304010000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7004000304020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000304030000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000304040000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000304050000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000304050100'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000304060000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000410000000'::text) THEN 'COMPR FORENSIC ANAL'::text
              WHEN (a."ORG" = 'BB7004000410010000'::text) THEN 'SUPVY INTEL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7004000410020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000410020100'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000410030000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000410040000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000410050000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000410060000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000410070000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000410080000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000309000000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000309010000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7004000309020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000403000000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000403010000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7004000403020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000403030000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000403040000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000403050000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB7004000403060000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000205000000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000205010000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7004000205020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000205030000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000407000000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000407010000'::text) THEN 'SUPVY INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7004000407020000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000407030000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000407040000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000407050000'::text) THEN 'STUD TR (INVESTIGATIVE ASST)'::text
              WHEN (a."ORG" = 'BB7004000407060000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000407070000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000407080000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000407090000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB7004000407100000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000407110000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000407120000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000409000000'::text) THEN 'SUPVY CRIM INVSTGR (SAC)'::text
              WHEN (a."ORG" = 'BB7004000409010000'::text) THEN 'SUPVY INTEL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7004000409020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000409030000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000409040000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000409050000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000409050100'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000409070000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000409080000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000206000000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000206010000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000206020000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000206030000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000206040000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000305000000'::text) THEN 'TELECOMMUN SPECLST'::text
              WHEN (a."ORG" = 'BB7004000305010000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7004000305020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000305030000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000305040000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000305050000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000305060000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000305070000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000305080000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000207000000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7004000207010000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7004000207030000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000207030100'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000207040000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000207040100'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000207050000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000207050100'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000408000000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000408010000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7004000408020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000408030000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000408040000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000408050000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000408060000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000408070000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000307000000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000307010000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000307020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000307030000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000307040000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000209000000'::text) THEN 'INVESTIGATIVE ASST OA'::text
              WHEN (a."ORG" = 'BB7004000209010000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7004000209020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000209030000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000209040000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000209050000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000209060000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000209070000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000209080000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000209090000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000209090100'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000209100000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000209110000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000308000000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000308010000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7004000308020000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000308030000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000308040000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000308050000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000308060000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000308070000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000308070100'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000308080000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000308090000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000308100000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000308110000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000306000000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000306010000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7004000306020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000306030000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000306040000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000306050000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000306060000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000306070000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000306080000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000306090000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000210000000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000210010000'::text) THEN 'SUPVY INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7004000210020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000210030000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000210040000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000210050000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000210050100'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000210060000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000210070000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000404000000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000404010000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000404020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000404030000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000404030100'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000404040000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000404050000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000404060000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000404070000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000404080000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000404090000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000405000000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000405010000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7004000405020000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000405030000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000405060000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000405070000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7004000405080000'::text) THEN 'CRIM INVSTGR'::text
              WHEN (a."ORG" = 'BB7008000000000000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7008000100000000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7008000101000000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7008000101010000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7008000101020000'::text) THEN 'SUPVY INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7008000101030000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7008000101040000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7008000102000000'::text) THEN 'SUPVY INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7008000102010000'::text) THEN 'SUPVY INTELL OPERS SPECLST'::text
              WHEN (a."ORG" = 'BB7008000102020000'::text) THEN 'SUPVY INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7008000102030000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7008000200000000'::text) THEN 'SUPVY INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7008000201000000'::text) THEN 'EMERGENCY MANAGEMENT SPECIALIST'::text
              WHEN (a."ORG" = 'BB7008000201010000'::text) THEN 'SUPVY EMERGENCY MANAGEMENT SPECIALIST'::text
              WHEN (a."ORG" = 'BB7008000201020000'::text) THEN 'SUPVY INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7008000201030000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7008000202000000'::text) THEN 'SUPVY INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7008000202010000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN (a."ORG" = 'BB7008000202020000'::text) THEN 'SUPVY MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB7008000202030000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB2410000000000000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB2440300000000000'::text) THEN 'SUPVY FNANCL PROG SPECLST'::text
              WHEN (a."ORG" = 'BB2440300010000000'::text) THEN 'ACCTG TECHNCN'::text
              WHEN (a."ORG" = 'BB2440300020000000'::text) THEN 'SUPVY ACCTNT'::text
              WHEN (a."ORG" = 'BB2440300030000000'::text) THEN 'SUPVY FNANCL PROG SPECLST'::text
              WHEN (a."ORG" = 'BB2400000000000000'::text) THEN 'FNANCL PROG SPECLST'::text
              WHEN (a."ORG" = 'BB2440300100000000'::text) THEN 'SUPVY FNANCL PROG SPECLST'::text
              WHEN (a."ORG" = 'BB2440300110000000'::text) THEN 'ACCTG TECHNCN'::text
              WHEN (a."ORG" = 'BB2440300120000000'::text) THEN 'ACCTG TECHNCN'::text
              WHEN (a."ORG" = 'BB2440300130000000'::text) THEN 'SUPVY MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB2420000000000000'::text) THEN 'BUDG ANAL'::text
              WHEN (a."ORG" = 'BB2420100000000000'::text) THEN 'BUDG ANAL'::text
              WHEN (a."ORG" = 'BB2420200000000000'::text) THEN 'BUDG ANAL'::text
              WHEN (a."ORG" = 'BB2420300000000000'::text) THEN 'BUDG ANAL'::text
              WHEN (a."ORG" = 'BB2420400000000000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB2420500000000000'::text) THEN 'BUDG ANAL'::text
              WHEN (a."ORG" = 'BB2430000000000000'::text) THEN 'STAFF ASST'::text
              WHEN (a."ORG" = 'BB2430100000000000'::text) THEN 'PROGRAM MANAGEMENT SPECIALIST'::text
              WHEN (a."ORG" = 'BB2430100010000000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB2430100020000000'::text) THEN 'PROG MGR'::text
              WHEN (a."ORG" = 'BB2430100030000000'::text) THEN 'MAIL & FILE ASST (OA)'::text
              WHEN (a."ORG" = 'BB2430200000000000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB2430200010000000'::text) THEN 'SUPVY GEN ENGR'::text
              WHEN (a."ORG" = 'BB2430200020000000'::text) THEN 'SPACE MGMT SPECLST'::text
              WHEN (a."ORG" = 'BB2430200030000000'::text) THEN 'PROG MGR'::text
              WHEN (a."ORG" = 'BB2440000000000000'::text) THEN 'MISSION SUPRT SPECLST'::text
              WHEN (a."ORG" = 'BB2440100000000000'::text) THEN 'ACCTNT'::text
              WHEN (a."ORG" = 'BB2440200000000000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB2300000000000000'::text) THEN 'CHIEF OF STAFF'::text
              WHEN (a."ORG" = 'BB2301000000000000'::text) THEN 'ITSPEC'::text
              WHEN (a."ORG" = 'BB2302000000000000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB2302010000000000'::text) THEN 'IT PROJ MGR'::text
              WHEN (a."ORG" = 'BB2302020000000000'::text) THEN 'ITSPEC'::text
              WHEN (a."ORG" = 'BB2302030000000000'::text) THEN 'SUPVY ITSPEC (INFOSEC)'::text
              WHEN (a."ORG" = 'BB2302040000000000'::text) THEN 'SUPVY ITSPEC (INFOSEC)'::text
              WHEN (a."ORG" = 'BB2302050000000000'::text) THEN 'ITSPEC (INFOSEC)'::text
              WHEN (a."ORG" = 'BB2302060000000000'::text) THEN 'ITSPEC (INFOSEC)'::text
              WHEN (a."ORG" = 'BB2302070000000000'::text) THEN 'IT PROJ MGR'::text
              WHEN (a."ORG" = 'BB2303000000000000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB2303010000000000'::text) THEN 'PROG MGR'::text
              WHEN (a."ORG" = 'BB2303020000000000'::text) THEN 'ITSPEC (CUSTSPT)'::text
              WHEN (a."ORG" = 'BB2303030000000000'::text) THEN 'SUPVY ITSPEC (INFOSEC)'::text
              WHEN (a."ORG" = 'BB2303040000000000'::text) THEN 'ITSPEC (SYSADMIN)'::text
              WHEN (a."ORG" = 'BB2303050000000000'::text) THEN 'SUPVY ITSPEC (PLCYPLN)'::text
              WHEN (a."ORG" = 'BB2303060000000000'::text) THEN 'ITSPEC (INFOSEC)'::text
              WHEN (a."ORG" = 'BB2304000000000000'::text) THEN 'SUPVY ITSPEC (INFOSEC)'::text
              WHEN (a."ORG" = 'BB2304010000000000'::text) THEN 'SUPVY ITSPEC (INFOSEC)'::text
              WHEN (a."ORG" = 'BB2304020000000000'::text) THEN 'ITSPEC (INFOSEC)'::text
              WHEN (a."ORG" = 'BB2304030000000000'::text) THEN 'ITSPEC (INFOSEC)'::text
              WHEN (a."ORG" = 'BB2305000000000000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB2305010000000000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB2305020000000000'::text) THEN 'SUPVY MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB2305030000000000'::text) THEN 'ITSPEC (SYSANALYSIS)'::text
              WHEN (a."ORG" = 'BB0600000000000000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB0602000000000000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB2100000000000000'::text) THEN 'SUPVY CONTR SPECLST'::text
              WHEN (a."ORG" = 'BB2110000000000000'::text) THEN 'PROCUR ANAL'::text
              WHEN (a."ORG" = 'BB2120000000000000'::text) THEN 'CONTR SPECLST'::text
              WHEN (a."ORG" = 'BB2131000000000000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB2132000000000000'::text) THEN 'CONTR SPECLST'::text
              WHEN (a."ORG" = 'BB2140000000000000'::text) THEN 'SUPVY CONTR SPECLST'::text
              WHEN (a."ORG" = 'BB2150000000000000'::text) THEN 'CONTR SPECLST'::text
              WHEN (a."ORG" = 'BB2150100000000000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB2160000000000000'::text) THEN 'CONTR SPECLST'::text
              WHEN (a."ORG" = 'BB2160100000000000'::text) THEN 'CONTR SPECLST'::text
              WHEN (a."ORG" = 'BB2160200000000000'::text) THEN 'CONTR SPECLST'::text
              WHEN (a."ORG" = 'BB2180000000000000'::text) THEN 'MGMT INF ANAL'::text
              WHEN (a."ORG" = 'BB2190000000000000'::text) THEN 'CONTR SPECLST'::text
              WHEN (a."ORG" = 'BB0609010000000000'::text) THEN 'SUPVY HUMAN RESOURCES SPECLST'::text
              WHEN (a."ORG" = 'BB0609010010000000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB0609010010100000'::text) THEN 'HUMAN RESOURCES ASST OA'::text
              WHEN (a."ORG" = 'BB0609010020000000'::text) THEN 'SUPVY HUMAN RESOURCES SPECLST (CLASSIF'::text
              WHEN (a."ORG" = 'BB0609010020100000'::text) THEN 'HUMAN RESOURCES ASST OA'::text
              WHEN (a."ORG" = 'BB0609010020200000'::text) THEN 'HUMAN RESOURCES SPECLST (CLASSIFN)'::text
              WHEN (a."ORG" = 'BB0609010030000000'::text) THEN 'SUPVY HUMAN RESOURCES SPECLST (EMPL BE'::text
              WHEN (a."ORG" = 'BB0609010030100000'::text) THEN 'HUMAN RESOURCES ASST OA'::text
              WHEN (a."ORG" = 'BB0609010030200000'::text) THEN 'HUMAN RESOURCES ASST OA'::text
              WHEN (a."ORG" = 'BB0609010030300000'::text) THEN 'HUMAN RESOURCES ASST OA'::text
              WHEN (a."ORG" = 'BB0609010040000000'::text) THEN 'SUPVY HUMAN RESOURCES SPECLST'::text
              WHEN (a."ORG" = 'BB0609010040100000'::text) THEN 'HUMAN RESOURCES SPECLST'::text
              WHEN (a."ORG" = 'BB0609010040200000'::text) THEN 'HUMAN RESOURCES SPECLST'::text
              WHEN (a."ORG" = 'BB0609010040300000'::text) THEN 'HUMAN RESOURCES ASST OA'::text
              WHEN (a."ORG" = 'BB0609010040400000'::text) THEN 'HUMAN RESOURCES ASST OA'::text
              WHEN (a."ORG" = 'BB0609010050000000'::text) THEN 'SUPVY HUMAN RESOURCES SPECLST'::text
              WHEN (a."ORG" = 'BB0609010050100000'::text) THEN 'HUMAN RESOURCES ASST OA'::text
              WHEN (a."ORG" = 'BB0609010050200000'::text) THEN 'HUMAN RESOURCES SPECLST'::text
              WHEN (a."ORG" = 'BB0609010050300000'::text) THEN 'HUMAN RESOURCES ASST OA'::text
              WHEN (a."ORG" = 'BB0609010050400000'::text) THEN 'HUMAN RESOURCES SPECLST'::text
              WHEN (a."ORG" = 'BB0609010060000000'::text) THEN 'HUMAN RESOURCES SPECLST (RECRUIT&PLAC)'::text
              WHEN (a."ORG" = 'BB0609010060100000'::text) THEN 'HUMAN RESOURCES SPECLST'::text
              WHEN (a."ORG" = 'BB0609010060200000'::text) THEN 'HUMAN RESOURCES ASST OA'::text
              WHEN (a."ORG" = 'BB0609010060300000'::text) THEN 'HUMAN RESOURCES SPECLST'::text
              WHEN (a."ORG" = 'BB0609000000000000'::text) THEN 'CHIEF HUMAN CAPITAL OFFICER'::text
              WHEN (a."ORG" = 'BB0609100000000000'::text) THEN 'LEAD HUMAN RESOURCES SPECLST (EMPL REL'::text
              WHEN (a."ORG" = 'BB0609100020000000'::text) THEN 'HUMAN RESOURCES SPECLST'::text
              WHEN (a."ORG" = 'BB0609200000000000'::text) THEN 'HUMAN RESOURCES SPECLST'::text
              WHEN (a."ORG" = 'BB0609300000000000'::text) THEN 'SUPVY HUMAN RESOURCES SPECLST'::text
              WHEN (a."ORG" = 'BB0609400000000000'::text) THEN 'HUMAN RESOURCES SPECLST'::text
              WHEN (a."ORG" = 'BB0609500000000000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB0609600000000000'::text) THEN 'SUPVY PERS RESEARCH PSYCH'::text
              WHEN (a."ORG" = 'BB0609700000000000'::text) THEN 'HUMAN RESOURCES SPECLST (INFO SYS)'::text
              WHEN (a."ORG" = 'BB0609800000000000'::text) THEN 'SUPVY HUMAN RESOURCES SPECLST'::text
              WHEN (a."ORG" = 'BB0609810000000000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB0609820000000000'::text) THEN 'HUMAN RESOURCES SPECLST'::text
              WHEN (a."ORG" = 'BB0609830000000000'::text) THEN 'SUPVY HR SPECLST (COMPEN)'::text
              WHEN (a."ORG" = 'BB0617000000000000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN (a."ORG" = 'BB0617100000000000'::text) THEN 'FOIA/PA ASST OA'::text
              WHEN (a."ORG" = 'BB0605200000000000'::text) THEN 'SUPVY TRNG INSTRU'::text
              WHEN (a."ORG" = 'BB0603000000000000'::text) THEN 'PLCY ANAL'::text
              WHEN (a."ORG" = 'BB0605000000000000'::text) THEN 'PROG MGR'::text
              WHEN (a."ORG" = 'BB0605010000000000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN (a."ORG" = 'BB0605100000000000'::text) THEN 'SUPVY INSTRUCTNL SYS SPECLST'::text
              ELSE a."TITLE"
          END AS tableau_title,
          CASE
              WHEN (a."ORG" = 'BB0622000000000000'::text) THEN '0340'::text
              WHEN (a."ORG" = 'BB0504000000000000'::text) THEN '0260'::text
              WHEN (a."ORG" = 'BB0504010000000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB0504020000000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB0508000000000000'::text) THEN '0340'::text
              WHEN (a."ORG" = 'BB0502000000000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB0505000000000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB0505010000000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB0505020000000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB0505030000000000'::text) THEN '1712'::text
              WHEN (a."ORG" = 'BB0500000000000000'::text) THEN '0340'::text
              WHEN (a."ORG" = 'BB0501000000000000'::text) THEN '0340'::text
              WHEN (a."ORG" = 'BB0503000000000000'::text) THEN '1035'::text
              WHEN (a."ORG" = 'BB0503010000000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB0503020000000000'::text) THEN '1082'::text
              WHEN (a."ORG" = 'BB0503020010000000'::text) THEN '1035'::text
              WHEN (a."ORG" = 'BB0503020020000000'::text) THEN '1071'::text
              WHEN (a."ORG" = 'BB0503030000000000'::text) THEN '1082'::text
              WHEN (a."ORG" = 'BB0503040000000000'::text) THEN '1035'::text
              WHEN (a."ORG" = 'BB0503040010000000'::text) THEN '1035'::text
              WHEN (a."ORG" = 'BB0503040010100000'::text) THEN '1035'::text
              WHEN (a."ORG" = 'BB0503040010200000'::text) THEN '1035'::text
              WHEN (a."ORG" = 'BB0503040010300000'::text) THEN '1035'::text
              WHEN (a."ORG" = 'BB0503040010400000'::text) THEN '1035'::text
              WHEN (a."ORG" = 'BB0506000000000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB2200000000000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210000000000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210001500000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210001600000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210001601000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210001602000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB2210001603000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB2210001700000000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB2210001702000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB2210001703000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210001900000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210001901000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB2210001902000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB2210002000000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB2210002001000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210002001010000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210002001020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210002001030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210002002000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB2210002002010000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210002002020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210002002030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210002002040000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210002003000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210002003010000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210002003020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210002003030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210002003040000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210002100000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB2210002101000000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB2210002101010000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210002101020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210002101030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210002101040000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210002102000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210002102010000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210002102020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210002102030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210002103000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210002103010000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210002103020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210002103030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210002103040000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210002103050000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210002200000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB2210002201000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210002201010000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210002201020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210002201030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210002201040000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210002202000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210002202010000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210002202020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2210002202030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB2211000000000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB2211001000000000'::text) THEN '0341'::text
              WHEN (a."ORG" = 'BB2211001001000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB2211001100000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB2211001101000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB2211001104000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB2211001200000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB2211001300000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB2212000000000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB2212001000000000'::text) THEN '0080'::text
              WHEN (a."ORG" = 'BB2212001001000000'::text) THEN '0080'::text
              WHEN (a."ORG" = 'BB2212001002000000'::text) THEN '0080'::text
              WHEN (a."ORG" = 'BB2212001004000000'::text) THEN '0080'::text
              WHEN (a."ORG" = 'BB2212001005000000'::text) THEN '0080'::text
              WHEN (a."ORG" = 'BB2212001007000000'::text) THEN '0080'::text
              WHEN (a."ORG" = 'BB2212001007010000'::text) THEN '0080'::text
              WHEN (a."ORG" = 'BB2212001007020000'::text) THEN '0080'::text
              WHEN (a."ORG" = 'BB2212001008000000'::text) THEN '0080'::text
              WHEN (a."ORG" = 'BB2212001009000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB2212001010000000'::text) THEN '0080'::text
              WHEN (a."ORG" = 'BB2212001200000000'::text) THEN '0080'::text
              WHEN (a."ORG" = 'BB2212001201000000'::text) THEN '0080'::text
              WHEN (a."ORG" = 'BB2212001203000000'::text) THEN '0080'::text
              WHEN (a."ORG" = 'BB2212001204000000'::text) THEN '0080'::text
              WHEN (a."ORG" = 'BB2212001205000000'::text) THEN '0080'::text
              WHEN (a."ORG" = 'BB2212001300000000'::text) THEN '0080'::text
              WHEN (a."ORG" = 'BB2212001301000000'::text) THEN '0080'::text
              WHEN (a."ORG" = 'BB2212001302000000'::text) THEN '0080'::text
              WHEN (a."ORG" = 'BB2214001000000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB0710000100000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710004000000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710005000000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710005010000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710005020000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710005030000000'::text) THEN '0950'::text
              WHEN (a."ORG" = 'BB0710005040000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710005050000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710005060000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710006020000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB0710006040000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB0710006050000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710006070000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710007010000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710007020000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710007030000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710007040000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710007050000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB0710007050100000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB0710007050200000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB0710007050300000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB0710010000000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710020000000000'::text) THEN '0986'::text
              WHEN (a."ORG" = 'BB0710020010000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710020020000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710030000000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710030010000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710040000000000'::text) THEN '0986'::text
              WHEN (a."ORG" = 'BB0710040010000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710040020000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710050000000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710050010000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710060000000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710070000000000'::text) THEN '0986'::text
              WHEN (a."ORG" = 'BB0710070010000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710080000000000'::text) THEN '0986'::text
              WHEN (a."ORG" = 'BB0710090000000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710090010000000'::text) THEN '0986'::text
              WHEN (a."ORG" = 'BB0710100000000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710100020000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710110000000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710110010000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710120000000000'::text) THEN '0986'::text
              WHEN (a."ORG" = 'BB0710130000000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710140000000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710140010000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710140020000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710140030000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710160000000000'::text) THEN '0305'::text
              WHEN (a."ORG" = 'BB0710160010000000'::text) THEN '0986'::text
              WHEN (a."ORG" = 'BB0710160020000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710160030000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710160040000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710170000000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710170010000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710180000000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710180010000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710180020000000'::text) THEN '0986'::text
              WHEN (a."ORG" = 'BB0710180030000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710190000000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710190020000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710190030000000'::text) THEN '0986'::text
              WHEN (a."ORG" = 'BB0710200000000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710210000000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710210010000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710210020000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710210030000000'::text) THEN '0986'::text
              WHEN (a."ORG" = 'BB0710220000000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB0710220010000000'::text) THEN '0986'::text
              WHEN (a."ORG" = 'BB0710220020000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710230000000000'::text) THEN '0950'::text
              WHEN (a."ORG" = 'BB0710230010000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710230020000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710230030000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710240000000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710240010000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710250000000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710250010000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710260000000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB0710260010000000'::text) THEN '0905'::text
              WHEN (a."ORG" = 'BB1862070000000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1862070005000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862070010000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862070015000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862070020000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1862070022000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862070025000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862070035000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862070040000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1862070040300000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862070050000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1862070090000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1862070095000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862070096000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1862070097000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862070098000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861010000000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861010005000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861010010000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861010015000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1861010020000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1861010025000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861010035000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861010040000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861010040100000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861010040200000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861010040300000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861010045000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861010045100000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861010050000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1861010050100000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861010050200000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861010050300000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861010055000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1861010055100000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861010055200000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861010055300000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861010060000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861010086000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1861010090000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB1861010091000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861010092000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861010093000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861010094000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861010095000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861020000000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1861020005000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861020010000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861020015000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861020025000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861020030000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861030000000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861030005000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861030010000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1861030015000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861030020000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861030025000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1861030030000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861030030200000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1861030035000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861030040000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1861030045200000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861030045400000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861030045401000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861030045402000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1861040000000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1861040005000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1861040010000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1861040015000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1861040020000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861040025000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1861040030000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861040035000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861040040000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861040040100000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861040040200000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861040045000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1862010000000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1862010005000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862010010000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1862010015000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862010015050000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862010020000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1862010025000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862010035000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862010040000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862010045000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862010050000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862010055000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862010055050000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1862010055100000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1862010055200000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862010055400000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862010055500000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862010060000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862010060100000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1862010060200000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862010060300000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1862010070000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1850030005050000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862020000000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1862020005000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862020010000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862020015000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862020020000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1862020025000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862020030000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862020035000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862020035050000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1862020040000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1862020040100000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1862020040200000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1862020040300000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1862020040400000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862020055000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862020060000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1862020070000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862020080000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862020090000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861080000000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861080005000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861080010000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1861080015000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861080025000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861080030000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861080035000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861080040000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861080045000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863010000000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1863010003000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863010006000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1863010009000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863010021000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863010024000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863010027000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863010030000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863010036000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863010039000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863010042000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1863010045000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863010065000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862030000000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1862030005000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862030010000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862030015000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862030020000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1862030025000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862030030000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862030030100000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1862030030200000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862030030300000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862030030400000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1862030035100000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862040000000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB1862040010000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862040025000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862040030000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1862040035000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862040040000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1862040042000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1862040043000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862040050300000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862050000000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862050005000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1862050010000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1862050015000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1862050020000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1862050022000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1862050025000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862050030000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862050035000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1862050040000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1800000000000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1800010000000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB1800020000000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1800030000000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1806000000000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1806010000000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1806010010000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1806010020000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1806010030000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1806010030100000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB1806010030200000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1806010030300000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1806010050000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB1806010050100000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB1806010050200000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1806010050300000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB1806010050400000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB1806010050500000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB1806020000000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1806020010000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1806020010100000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB1806020010200000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB1806020010300000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB1806020010400000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB1806020010600000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB1806020020000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1806020020100000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1806020020200000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1806020020400000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB1806020020600000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1806030000000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1806030030000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1806030030100000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB1806030030200000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB1806030030300000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1806030040000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB1806030040100000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB1806030040200000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1806030040300000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1806030050000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB1806030060000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1806030060100000'::text) THEN '0340'::text
              WHEN (a."ORG" = 'BB1806030060200000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1806040000000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1806040030000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1806040030100000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1806040030300000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1806040040000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1806040040010000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1806040040020000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1806040040100000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1806040040400000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1806040040500000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1806040040600000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1806040040700000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1806060000000000'::text) THEN '0670'::text
              WHEN (a."ORG" = 'BB1806060010000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB1806070000000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1806070010000000'::text) THEN '1082'::text
              WHEN (a."ORG" = 'BB1806070010100000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1806070010400000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1806070010600000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1806070020100000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1806070020300000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1806070030000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1806070040010000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1806080000000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB1850030005000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1863020000000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863020005000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863020010000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863020015000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1863020020000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1863020025000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1863020030000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1863020035000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863020045000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863020046000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863020050000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863020055000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863020056000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863020065000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861050000000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1861050005000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861050015000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861050021000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861050024000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1861050025000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861050030000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861050030100000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861050030300000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1861050035000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1861050040000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1861050040100000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861050045000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861050050000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861050060100000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861050065000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861050070000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1861050070100000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861050070200000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861050075000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861060000000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861060005000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861060010000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861060015000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1861060025000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861060035000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1862060000000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1862060005000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862060010000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862060015000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862060020000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1862060030000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1862060030100000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862060030200000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862060030300000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862060031000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862060035000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862060035100000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862060035200000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862060041000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1862060045000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1862060046000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862060047000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862060050000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1862060052000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862060053000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862060055000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862060060000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862060075000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862060080000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862060085000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862060090100000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862060090200000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862060090400000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862060090600000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862060095050000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861070000000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861070005000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861070010000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1861070015000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1861070025000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861070030000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1861070040000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861070060000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861090000000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861090010000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861090020000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861090030000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861090040000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1861090050000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1861090060000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1861090085000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1863030000000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863030005000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863030010000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863030015000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863030020000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1863030025000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863030026000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863030030000000'::text) THEN '0326'::text
              WHEN (a."ORG" = 'BB1863030035000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863030040000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863030040100000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863030040200000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863030065000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863040000000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863040005000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863040010000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863040015000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863040020000000'::text) THEN '0303'::text
              WHEN (a."ORG" = 'BB1863040025000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863040030000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863040033000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1863040035000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1863040040000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863040045000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863040050000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863060000000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863060005000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1863060010000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863060015000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863060020000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1863060025000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1863060030000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863060035000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1863060040000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863060045000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863060045100000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863060045200000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863060050000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863060050100000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863060050200000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863060050300000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863060051000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863060070000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863060070050000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863060070100000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1863050000000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863050001000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863050005000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863050010000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863050015000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1863050020000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1863050030000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863050030100000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863050030200000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863050030300000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1863050035000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1863050035100000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863050035200000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1863050035300000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1863050040000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1863050040100000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863050040200000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863050040300000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863050055000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863050060000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1863050060100000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863050060200000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863050065100000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863050065200000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1863050066000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863050070100000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863050070200000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863070000000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863070001000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1863070001050000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863070001100000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863070001150000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863070001250000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863070005000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1863070005100000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863070015000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863070025000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863070025050000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1863070025100000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863070025150000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863070030000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863070030050000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863070030100000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1863070035000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863070040000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863070045000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863070050000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1863070050050000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1863070050100000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862080000000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862080005000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862080010000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862080015000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862080025000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1862080030000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862080035000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862080040000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB1862080040300000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862080040400000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862080040500000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1862080040600000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862080040700000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862080040800000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB1862080045000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB1862080045050000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB7009000101010100'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000101022300'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000101011700'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000102021200'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000101010200'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000101020400'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000102021500'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB7009000101020100'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000101012200'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000102021100'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000102020900'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7009000102021000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000101021300'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000102010100'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000101020300'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB7009000102011300'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000101022200'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000101020800'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000101011600'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000101021600'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000102020400'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB7009000101021500'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000101011800'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000101010300'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB7009000102011400'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000101020500'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000102021300'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000101022500'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000102011200'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB7009000101020600'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000102010800'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000101010400'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000000000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB7009000100000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB7009000101000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000101010000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000101020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000102000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB7009000102010000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000102020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000103000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000103010000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB7009000103020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000103030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000101020200'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000101021200'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB7009000101012400'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB7009000101012300'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000101011400'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000102010700'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000101021800'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000102020500'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB7009000101021900'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000101012000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB7009000101010500'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB7009000102021400'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000101022400'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000102010600'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000101021400'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000102010900'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000101020700'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000101010600'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000102010300'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000101011900'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000102011000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000102020600'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000102020200'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB7009000101010700'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000102010200'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000102020100'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB7009000101010800'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB7009000101010900'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB7009000101011200'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB7009000102021600'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB7009000102020800'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB7009000101011100'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000101011000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000101020900'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000102020300'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000101021000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB7009000101011500'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000102010400'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000102020700'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000102011100'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000101022600'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000101011300'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000102010500'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000101021700'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000101022100'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7009000101022000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000401000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000401010000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7004000401020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000401040000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000401050000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000401050100'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000401060000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000401070000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB7004000402000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000402010000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7004000402020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000402030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000201000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000201010000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000201020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000201030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000201040000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000201050000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000201060000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7004000201070000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000201080000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000201090000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000201100000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000201110000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000202000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000202010000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7004000202020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000202030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000202030100'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000202040000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000202050000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000203000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB7004000203010000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7004000203020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000203020200'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000203030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000203040000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000203050000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000203050100'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000301000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000301010000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7004000301020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000301030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000301040000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000301050000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000301060000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB7004000301060100'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000301070000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000208000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000208010000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7004000208020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000208020100'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000208030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000208040000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000208040100'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000208050000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000208060000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000208070000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000208080000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000208090000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000208100000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000208120000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000208130000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB7004000208140000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000208150000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000204000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000204010000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7004000204020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000204030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000204040000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000204050000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000204060000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000204070000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB7004000302000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000302010000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7004000302020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000302030000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB7004000302040000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000302040100'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000302050000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000302060000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000302070000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000406000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000406010000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000406020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000406030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000303000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000303010000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7004000303020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000303030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000303040000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7000000000000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7001000000000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7001000100000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7001000101000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7001000101010000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7001000101020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7001000101030000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7001000101040000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7001000101050000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7001000101060000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7001000200000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7001000201000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7001000201010000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7001000201020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7001000201030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7001000201040000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7001000201050000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB7001000201060000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7001000300000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7001000301010000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB7001000301020000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB7001000301030000'::text) THEN '0101'::text
              WHEN (a."ORG" = 'BB7001000301040000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7001000301050000'::text) THEN '1397'::text
              WHEN (a."ORG" = 'BB7001000301060000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7001000302000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7001000302010000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7001000302020000'::text) THEN '0303'::text
              WHEN (a."ORG" = 'BB7002000000000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7002000100000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB7002000101000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7002000101010000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7002000101020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7002000101030000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB7002000200000000'::text) THEN '0340'::text
              WHEN (a."ORG" = 'BB7002000201000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB7002000201010000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB7002000201020000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB7002000202000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB7002000202010000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB7002000202020000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB7003000000000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7003000100000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB7003000101000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB7003000101010000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7003000101020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7003000101030000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7003000101040000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB7003000201000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7003000201010000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7003000201020000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB7003000201030000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB7003000300000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7003000301010000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB7003000301020000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB7003000301030000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB7004000000000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000100000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB7004000101000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000101010000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000101020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000101030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000101040000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7005000000000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7005000100000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7005000101000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB7005000101010000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7005000101020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7005000200000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7005000201000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7005000201010000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB7005000201020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7006000000000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7006000100000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB7006000101000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB7006000101010000'::text) THEN '1101'::text
              WHEN (a."ORG" = 'BB7006000101020000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB7006000101030000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB7006000101040000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB7006000102000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB7006000102010000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB7006000102020000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB7006000200000000'::text) THEN '0340'::text
              WHEN (a."ORG" = 'BB7006000200010000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB7006000201000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB7006000201010000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB7006000201020000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB7006000201030000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB7006000201040000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB7006000202000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB7006000202010000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB7006000202020000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB7007000000000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7007000100000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB7007000101000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7007000101020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7010000000000000'::text) THEN '0303'::text
              WHEN (a."ORG" = 'BB7004000211000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000211010000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7004000211020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000211030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000211040000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000211040100'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000211050000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000211060000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000211070000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000211080000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000211090000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000211100000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000304000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000304010000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7004000304020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000304030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000304040000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000304050000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000304050100'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000304060000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000410000000'::text) THEN '1801'::text
              WHEN (a."ORG" = 'BB7004000410010000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7004000410020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000410020100'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000410030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000410040000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000410050000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000410060000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000410070000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000410080000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000309000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000309010000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7004000309020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000403000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000403010000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7004000403020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000403030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000403040000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000403050000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB7004000403060000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000205000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000205010000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7004000205020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000205030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000407000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000407010000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7004000407020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000407030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000407040000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000407050000'::text) THEN '1899'::text
              WHEN (a."ORG" = 'BB7004000407060000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000407070000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000407080000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000407090000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB7004000407100000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000407110000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000407120000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000409000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000409010000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7004000409020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000409030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000409040000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000409050000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000409050100'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000409070000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000409080000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000206000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000206010000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000206020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000206030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000206040000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000305000000'::text) THEN '0391'::text
              WHEN (a."ORG" = 'BB7004000305010000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7004000305020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000305030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000305040000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000305050000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000305060000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000305070000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000305080000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000207000000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7004000207010000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7004000207030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000207030100'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000207040000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000207040100'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000207050000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000207050100'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000408000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000408010000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7004000408020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000408030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000408040000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000408050000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000408060000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000408070000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000307000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000307010000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000307020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000307030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000307040000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000209000000'::text) THEN '1802'::text
              WHEN (a."ORG" = 'BB7004000209010000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7004000209020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000209030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000209040000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000209050000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000209060000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000209070000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000209080000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000209090000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000209090100'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000209100000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000209110000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000308000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000308010000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7004000308020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000308030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000308040000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000308050000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000308060000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000308070000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000308070100'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000308080000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000308090000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000308100000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000308110000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000306000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000306010000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7004000306020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000306030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000306040000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000306050000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000306060000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000306070000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000306080000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000306090000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000210000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000210010000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7004000210020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000210030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000210040000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000210050000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000210050100'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000210060000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000210070000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000404000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000404010000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000404020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000404030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000404030100'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000404040000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000404050000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000404060000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000404070000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000404080000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000404090000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000405000000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000405010000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7004000405020000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000405030000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000405060000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000405070000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7004000405080000'::text) THEN '1811'::text
              WHEN (a."ORG" = 'BB7008000000000000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7008000100000000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7008000101000000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7008000101010000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7008000101020000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7008000101030000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7008000101040000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7008000102000000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7008000102010000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7008000102020000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7008000102030000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7008000200000000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7008000201000000'::text) THEN '0089'::text
              WHEN (a."ORG" = 'BB7008000201010000'::text) THEN '0089'::text
              WHEN (a."ORG" = 'BB7008000201020000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7008000201030000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7008000202000000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7008000202010000'::text) THEN '0132'::text
              WHEN (a."ORG" = 'BB7008000202020000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB7008000202030000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB2410000000000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB2440300000000000'::text) THEN '0501'::text
              WHEN (a."ORG" = 'BB2440300010000000'::text) THEN '0525'::text
              WHEN (a."ORG" = 'BB2440300020000000'::text) THEN '0510'::text
              WHEN (a."ORG" = 'BB2440300030000000'::text) THEN '0501'::text
              WHEN (a."ORG" = 'BB2400000000000000'::text) THEN '0501'::text
              WHEN (a."ORG" = 'BB2440300100000000'::text) THEN '0501'::text
              WHEN (a."ORG" = 'BB2440300110000000'::text) THEN '0525'::text
              WHEN (a."ORG" = 'BB2440300120000000'::text) THEN '0525'::text
              WHEN (a."ORG" = 'BB2440300130000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB2420000000000000'::text) THEN '0560'::text
              WHEN (a."ORG" = 'BB2420100000000000'::text) THEN '0560'::text
              WHEN (a."ORG" = 'BB2420200000000000'::text) THEN '0560'::text
              WHEN (a."ORG" = 'BB2420300000000000'::text) THEN '0560'::text
              WHEN (a."ORG" = 'BB2420400000000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB2420500000000000'::text) THEN '0560'::text
              WHEN (a."ORG" = 'BB2430000000000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB2430100000000000'::text) THEN '0340'::text
              WHEN (a."ORG" = 'BB2430100010000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB2430100020000000'::text) THEN '0340'::text
              WHEN (a."ORG" = 'BB2430100030000000'::text) THEN '0305'::text
              WHEN (a."ORG" = 'BB2430200000000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB2430200010000000'::text) THEN '0801'::text
              WHEN (a."ORG" = 'BB2430200020000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB2430200030000000'::text) THEN '0340'::text
              WHEN (a."ORG" = 'BB2440000000000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB2440100000000000'::text) THEN '0510'::text
              WHEN (a."ORG" = 'BB2440200000000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB2300000000000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB2301000000000000'::text) THEN '2210'::text
              WHEN (a."ORG" = 'BB2302000000000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB2302010000000000'::text) THEN '2210'::text
              WHEN (a."ORG" = 'BB2302020000000000'::text) THEN '2210'::text
              WHEN (a."ORG" = 'BB2302030000000000'::text) THEN '2210'::text
              WHEN (a."ORG" = 'BB2302040000000000'::text) THEN '2210'::text
              WHEN (a."ORG" = 'BB2302050000000000'::text) THEN '2210'::text
              WHEN (a."ORG" = 'BB2302060000000000'::text) THEN '2210'::text
              WHEN (a."ORG" = 'BB2302070000000000'::text) THEN '2210'::text
              WHEN (a."ORG" = 'BB2303000000000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB2303010000000000'::text) THEN '0340'::text
              WHEN (a."ORG" = 'BB2303020000000000'::text) THEN '2210'::text
              WHEN (a."ORG" = 'BB2303030000000000'::text) THEN '2210'::text
              WHEN (a."ORG" = 'BB2303040000000000'::text) THEN '2210'::text
              WHEN (a."ORG" = 'BB2303050000000000'::text) THEN '2210'::text
              WHEN (a."ORG" = 'BB2303060000000000'::text) THEN '2210'::text
              WHEN (a."ORG" = 'BB2304000000000000'::text) THEN '2210'::text
              WHEN (a."ORG" = 'BB2304010000000000'::text) THEN '2210'::text
              WHEN (a."ORG" = 'BB2304020000000000'::text) THEN '2210'::text
              WHEN (a."ORG" = 'BB2304030000000000'::text) THEN '2210'::text
              WHEN (a."ORG" = 'BB2305000000000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB2305010000000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB2305020000000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB2305030000000000'::text) THEN '2210'::text
              WHEN (a."ORG" = 'BB0600000000000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB0602000000000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB2100000000000000'::text) THEN '1102'::text
              WHEN (a."ORG" = 'BB2110000000000000'::text) THEN '1102'::text
              WHEN (a."ORG" = 'BB2120000000000000'::text) THEN '1102'::text
              WHEN (a."ORG" = 'BB2131000000000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB2132000000000000'::text) THEN '1102'::text
              WHEN (a."ORG" = 'BB2140000000000000'::text) THEN '1102'::text
              WHEN (a."ORG" = 'BB2150000000000000'::text) THEN '1102'::text
              WHEN (a."ORG" = 'BB2150100000000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB2160000000000000'::text) THEN '1102'::text
              WHEN (a."ORG" = 'BB2160100000000000'::text) THEN '1102'::text
              WHEN (a."ORG" = 'BB2160200000000000'::text) THEN '1102'::text
              WHEN (a."ORG" = 'BB2180000000000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB2190000000000000'::text) THEN '1102'::text
              WHEN (a."ORG" = 'BB0609010000000000'::text) THEN '0201'::text
              WHEN (a."ORG" = 'BB0609010010000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB0609010010100000'::text) THEN '0203'::text
              WHEN (a."ORG" = 'BB0609010020000000'::text) THEN '0201'::text
              WHEN (a."ORG" = 'BB0609010020100000'::text) THEN '0203'::text
              WHEN (a."ORG" = 'BB0609010020200000'::text) THEN '0201'::text
              WHEN (a."ORG" = 'BB0609010030000000'::text) THEN '0201'::text
              WHEN (a."ORG" = 'BB0609010030100000'::text) THEN '0203'::text
              WHEN (a."ORG" = 'BB0609010030200000'::text) THEN '0203'::text
              WHEN (a."ORG" = 'BB0609010030300000'::text) THEN '0203'::text
              WHEN (a."ORG" = 'BB0609010040000000'::text) THEN '0201'::text
              WHEN (a."ORG" = 'BB0609010040100000'::text) THEN '0201'::text
              WHEN (a."ORG" = 'BB0609010040200000'::text) THEN '0201'::text
              WHEN (a."ORG" = 'BB0609010040300000'::text) THEN '0203'::text
              WHEN (a."ORG" = 'BB0609010040400000'::text) THEN '0203'::text
              WHEN (a."ORG" = 'BB0609010050000000'::text) THEN '0201'::text
              WHEN (a."ORG" = 'BB0609010050100000'::text) THEN '0203'::text
              WHEN (a."ORG" = 'BB0609010050200000'::text) THEN '0201'::text
              WHEN (a."ORG" = 'BB0609010050300000'::text) THEN '0203'::text
              WHEN (a."ORG" = 'BB0609010050400000'::text) THEN '0201'::text
              WHEN (a."ORG" = 'BB0609010060000000'::text) THEN '0201'::text
              WHEN (a."ORG" = 'BB0609010060100000'::text) THEN '0201'::text
              WHEN (a."ORG" = 'BB0609010060200000'::text) THEN '0203'::text
              WHEN (a."ORG" = 'BB0609010060300000'::text) THEN '0201'::text
              WHEN (a."ORG" = 'BB0609000000000000'::text) THEN '0201'::text
              WHEN (a."ORG" = 'BB0609100000000000'::text) THEN '0201'::text
              WHEN (a."ORG" = 'BB0609100020000000'::text) THEN '0201'::text
              WHEN (a."ORG" = 'BB0609200000000000'::text) THEN '0201'::text
              WHEN (a."ORG" = 'BB0609300000000000'::text) THEN '0201'::text
              WHEN (a."ORG" = 'BB0609400000000000'::text) THEN '0201'::text
              WHEN (a."ORG" = 'BB0609500000000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB0609600000000000'::text) THEN '0180'::text
              WHEN (a."ORG" = 'BB0609700000000000'::text) THEN '0201'::text
              WHEN (a."ORG" = 'BB0609800000000000'::text) THEN '0201'::text
              WHEN (a."ORG" = 'BB0609810000000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB0609820000000000'::text) THEN '0201'::text
              WHEN (a."ORG" = 'BB0609830000000000'::text) THEN '0201'::text
              WHEN (a."ORG" = 'BB0617000000000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB0617100000000000'::text) THEN '0303'::text
              WHEN (a."ORG" = 'BB0605200000000000'::text) THEN '1712'::text
              WHEN (a."ORG" = 'BB0603000000000000'::text) THEN '0301'::text
              WHEN (a."ORG" = 'BB0605000000000000'::text) THEN '0340'::text
              WHEN (a."ORG" = 'BB0605010000000000'::text) THEN '0343'::text
              WHEN (a."ORG" = 'BB0605100000000000'::text) THEN '1750'::text
              ELSE a."SERIES"
          END AS cxo_series,
          CASE
              WHEN (a."GRADE" = '0'::text) THEN '0'::text
              WHEN (a."GRADE" = '11'::text) THEN '11'::text
              WHEN (a."GRADE" = '15'::text) THEN '15'::text
              WHEN (a."GRADE" = '8'::text) THEN '8'::text
              WHEN (a."GRADE" = '3'::text) THEN '3'::text
              WHEN (a."GRADE" = '4'::text) THEN '4'::text
              WHEN (a."GRADE" = '2'::text) THEN '2'::text
              WHEN (a."GRADE" = '7'::text) THEN '7'::text
              WHEN (a."GRADE" = '14'::text) THEN '14'::text
              WHEN (a."GRADE" = '9'::text) THEN '9'::text
              WHEN (a."GRADE" = '12'::text) THEN '12'::text
              WHEN (a."GRADE" = '10'::text) THEN '10'::text
              WHEN (a."GRADE" = '5'::text) THEN '5'::text
              WHEN (a."GRADE" = '13'::text) THEN '13'::text
              WHEN (a."GRADE" = '6'::text) THEN '6'::text
              ELSE a."GRADE"
          END AS tableau_grade,
          CASE
              WHEN (a."TITLE" = 'DEP DIR ICE'::text) THEN 'CI'::text
              WHEN (a."TITLE" = 'CHIEF OF STAFF'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'MGMT & PROG ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'DEP CH OF STAFF'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SPECIAL ADVISOR (PROTOCOL & SPEC EVTS)'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'SPECIAL ADVISOR (PROTOCOL& SPEC EVTS)'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'PROG MGR'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'MSN SUPT SPECL'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'ASSISTANT EXEC SEC'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'WRI EDIT'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'ASST DIR'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'CONGRSNL LIASN SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'SUPVY CONGRSNL LIASN OFCR'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SPEC ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'SUPVY PUBLIC AFF SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'PUBLIC AFF SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'MISSION SUPPORT SPECIALIST'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'SUPVY MGMT & PROG ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'VIS INF SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'AUDIO VIS PRODN SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPVY AUDIO VIS PRODN SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'ASST DIR DIVERSITY & CIVIL RIGHTS'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'EQ EMPLMT SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'CLK'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'EQ EMPLMT MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPVY POLICY ADVISOR'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'PLCY ADVSR'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'SUPVY EQ EMPLMT SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPVY EQ OPP SPEC'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'POLICY ADVSR'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'SUPVY CRIM INVSTGR'::text) THEN 'CI'::text
              WHEN (a."TITLE" = 'CRIM INVSTGR'::text) THEN 'CI'::text
              WHEN (a."TITLE" = 'EQUIP SPECLST ORDNC'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPP TECHNCN OA'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPVY GEN ENGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'ENGRG TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'LAW ENFORCEMENT PROG. MGR.'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'DEPRTN OFFCR (COURSE DEVLP/INSTR)'::text) THEN 'DO'::text
              WHEN (a."TITLE" = 'TRAINING SPEC (FIREARMS)'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'FIREARMS PGRM SPCLST'::text) THEN 'LEOTHR'::text
              WHEN (a."TITLE" = 'TRNG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'CRIMINAL INVESTIGATOR (INSTRUCTOR)'::text) THEN 'CI'::text
              WHEN (a."TITLE" = 'DETNTN & DEPORTATN OFFCR'::text) THEN 'DO'::text
              WHEN (a."TITLE" = 'SUPVY DETNTN & DEPORTATN OFFCR'::text) THEN 'DO'::text
              WHEN (a."TITLE" = 'FACIL OPERS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPVY COMMUNITY RELATIONS OFFCR'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'COMMUNITY RELATIONS OFFCR'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'SENIOR ADVSR'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'DEP CHIEF OF STAFF'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'STAFF ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'BUDG ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'REGULATORY AND POLICY ANALYST'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'ECONMST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'PLCY ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'SUPVY REGULATORY ANALYST'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'SUPVY PLCY ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'ECONOMIST (CHIEF)'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'CH OF STAFF'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPVY MSN SUPT SPECL'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'INSTRUCTNL SYS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPVY INSTRUCTNL SYS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'PROG MGR (LRNG MGMT)'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'TRNG INSTRU'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPVY INSTRUCTIONAL SPECIALIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'MISSION SUPRT ASST OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'SUPVY TRNG INSTRU'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'DEPUTY CHIEF HUMAN CAPITAL OFFICER'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'CHIEF HUMAN CAPITAL OFFICER'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'HUMAN RESOURCES SPECLST (COMPEN)'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SENIOR HUMAN RESOURCES ADVISOR'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPVY STRATEGIC ADVSR'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPVY HUMAN RESOURCES SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'HUMAN RESOURCES SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'HUMAN RESOURCES ASST OA'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPVY HUMAN RESOURCES SPECLST (EMPL BE'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'HUMAN RESOURCES SPECLST (RECRUIT&PLAC)'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPVY HUMAN RESOURCES SPECLST (RECRUIT'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPVY HUMAN RESOURCES SPECLST (CLASSIF'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'HUMAN RESOURCES SPECLST (CLASSIFN)'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'PRE-EMPLOYMENT SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'PRE EMPLOYMENT ASST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'STUD TR (HUMAN RESOURCES)'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPVY HR SPECLST (EMPL & LABOR REL)'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPVY HR SPECLST (EMPL &LABOR REL)'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'HUMAN RESOURCES SPECLST (LABOR REL)'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPVY HUMAN RESOURCES SPECLST (LABOR R'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'LEAD HUMAN RESOURCES SPECLST (EMPL REL'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPVY HUMAN RESOURCES SPECLST (EMPL RE'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'HR SPECLST (CLASSIFN RECRUIT & PLAC)'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPVY PHYSICIAN'::text) THEN 'MED'::text
              WHEN (a."TITLE" = 'PHYSICIAN'::text) THEN 'MED'::text
              WHEN (a."TITLE" = 'OCCUPTL HLTH NURSE'::text) THEN 'MED'::text
              WHEN (a."TITLE" = 'DRUG PROG COORD'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'HUMAN RESOURCES SPECLST (EMPL BENES)'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'BEHAVIORAL HLTH SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'EMP ASSTNC PROG MGR'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'SUPVY PSYCH'::text) THEN 'MED'::text
              WHEN (a."TITLE" = 'CHAPLAIN DIR'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'PERS RES PSYCH'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPVY PERS RESEARCH PSYCH'::text) THEN 'MED'::text
              WHEN (a."TITLE" = 'MGMT INF ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'SUPVY HUMAN RESOURCES SPECLST (INFO SY'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'ADMV OFFCR'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'SUPVY ADMV OFFCR'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'CIVILIAN PAY TECHNCN OA'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPVY HUMAN RESOURCES SPECLST (COMPEN)'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'ASST DIR INF GOVERNANCE'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'RECS AND INFO MGMT SPEC'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'OPER RES ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'PRIVACY OFFICER'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'MGMT & PRO ANAL (PRIVACY COMPLIANCE)'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SR INFO GOV ANALYST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'GOVNMNT INFO SPEC (PRIVACY COMPLIANCE)'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'MGMT & PROG ANAL (BUDG & COR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'MGMT & PROG ANAL (BUDG &COR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPVY RECORDS & INFORMATION MGMT SPECI'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'PARALEGAL SPECLST (FOIA/PA)'::text) THEN 'LGLSUPT'::text
              WHEN (a."TITLE" = 'PARALEGAL SPECLST'::text) THEN 'LGLSUPT'::text
              WHEN (a."TITLE" = 'FOIA/PA ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'SUPVY PARALEGAL SPECLST'::text) THEN 'LGLSUPT'::text
              WHEN (a."TITLE" = 'SUPVY PARALEGAL SPECLST (FOIA/PA)'::text) THEN 'LGLSUPT'::text
              WHEN (a."TITLE" = 'PARALEGAL SPECLST (FOIA)'::text) THEN 'LGLSUPT'::text
              WHEN (a."TITLE" = 'FREEDOM OF INFORMATION ACT DIRECTOR'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'DEPUTY DIRECTOR FOIA'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'GEN ENGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'ITSPEC (INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."TITLE" = 'OPERATIONS RESEARCH ANALYST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'DEP PRINC LEG ADVSR'::text) THEN 'ATTY'::text
              WHEN (a."TITLE" = 'DEP PRIN LEGAL ADVSR MANAGEMENT'::text) THEN 'ATTY'::text
              WHEN (a."TITLE" = 'PRINCIPAL LEGAL ADVISOR FOR ICE'::text) THEN 'ATTY'::text
              WHEN (a."TITLE" = 'SUPVY GEN ATTY'::text) THEN 'ATTY'::text
              WHEN (a."TITLE" = 'GEN ATTY'::text) THEN 'ATTY'::text
              WHEN (a."TITLE" = 'ATTY ADVSR'::text) THEN 'ATTY'::text
              WHEN (a."TITLE" = 'ASSOC DEP PRINC LEG ADVSR'::text) THEN 'ATTY'::text
              WHEN (a."TITLE" = 'PARALEGAL SPECIALIST (OPLA)'::text) THEN 'LGLSUPT'::text
              WHEN (a."TITLE" = 'DEP PRINC LEGAL ADVSR HEADQUARTES'::text) THEN 'ATTY'::text
              WHEN (a."TITLE" = 'HISTRN'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'LIBRN LAW'::text) THEN 'LGLSUPT'::text
              WHEN (a."TITLE" = 'LEG ASST OA'::text) THEN 'LGLSUPT'::text
              WHEN (a."TITLE" = 'SUPVY GEN ATTY (ETHICS)'::text) THEN 'ATTY'::text
              WHEN (a."TITLE" = 'GEN ATTY (ETHCIS)'::text) THEN 'ATTY'::text
              WHEN (a."TITLE" = 'MAIL & FILE CLK OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'LEAD LEG ASST'::text) THEN 'LGLSUPT'::text
              WHEN (a."TITLE" = 'CHIEF COUNSEL'::text) THEN 'ATTY'::text
              WHEN (a."TITLE" = 'LAW CLK'::text) THEN 'LGLSUPT'::text
              WHEN (a."TITLE" = 'SUPVY LEG ASST OA'::text) THEN 'LGLSUPT'::text
              WHEN (a."TITLE" = 'TRIAL ATTY'::text) THEN 'ATTY'::text
              WHEN (a."TITLE" = 'STUD TR (LEG ASST) OA'::text) THEN 'LGLSUPT'::text
              WHEN (a."TITLE" = 'ENFORCEMENT PROGRAMS MGR'::text) THEN 'LEOTHR'::text
              WHEN (a."TITLE" = 'ASST DIR ENFCMNT & REMOVAL OPS'::text) THEN 'DO'::text
              WHEN (a."TITLE" = 'DEP ASST DIR FLD OPERS'::text) THEN 'DO'::text
              WHEN (a."TITLE" = 'INTEL RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."TITLE" = 'EMERGENCY MANAGEMENT SPECIALIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPVY EMERGENCY MANAGEMENT SPECIALIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'STATCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'DEPUTY ASSISTANT DIRECTOR ERO'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'MGMT & PROG ANAL (DET SVCS MGR)'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'DEPRTN OFFCR (COMP STDS OFFCR)'::text) THEN 'DO'::text
              WHEN (a."TITLE" = 'ASST DIR SECURE COMMUNITIES'::text) THEN 'DO'::text
              WHEN (a."TITLE" = 'CRIM TARGETING SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'SUPVY CRIM TARGETING SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'DEPRTN OFFCR'::text) THEN 'DO'::text
              WHEN (a."TITLE" = 'LAW ENFCMNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'SUPVY LAW ENFCMNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'ASST DIR ICE SRVCS HLTH CORPS'::text) THEN 'MED'::text
              WHEN (a."TITLE" = 'HEALTH SYSTEMS SPECIALIST'::text) THEN 'MED'::text
              WHEN (a."TITLE" = 'SUPVY PHYSCN (PSYCHTRC)'::text) THEN 'MED'::text
              WHEN (a."TITLE" = 'PHYSICIAN (CLINICAL DIRECTOR)'::text) THEN 'MED'::text
              WHEN (a."TITLE" = 'PHYSICIAN (PSYCHIATRY)'::text) THEN 'MED'::text
              WHEN (a."TITLE" = 'MEDCL OFFCR'::text) THEN 'MED'::text
              WHEN (a."TITLE" = 'PHYSCN (GEN PRACTICE)'::text) THEN 'MED'::text
              WHEN (a."TITLE" = 'PHYSICIAN (REG CLINICAL DIR)'::text) THEN 'MED'::text
              WHEN (a."TITLE" = 'PHYSICIAN (CONSULTANT)'::text) THEN 'MED'::text
              WHEN (a."TITLE" = 'PHYSICIAN (DAD/MED DIRECTOR)'::text) THEN 'MED'::text
              WHEN (a."TITLE" = 'CLNCL NURSE'::text) THEN 'MED'::text
              WHEN (a."TITLE" = 'SUPVY HEALTH SYSTEM SPECIALIST'::text) THEN 'MED'::text
              WHEN (a."TITLE" = 'PRACTICAL NURSE'::text) THEN 'MED'::text
              WHEN (a."TITLE" = 'NURSE PRACTITIONER'::text) THEN 'MED'::text
              WHEN (a."TITLE" = 'MEDCL REC TECHNCN'::text) THEN 'MED'::text
              WHEN (a."TITLE" = 'DNTL HYGIENIST'::text) THEN 'MED'::text
              WHEN (a."TITLE" = 'SUPVY WRI EDIT'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SECY OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'ADV PRAC NURSE (NURSE PRACTITIONER)'::text) THEN 'MED'::text
              WHEN (a."TITLE" = 'DIAGNSTC RADIOLOGIC TECHNCN'::text) THEN 'MED'::text
              WHEN (a."TITLE" = 'DNTL ASST'::text) THEN 'MED'::text
              WHEN (a."TITLE" = 'PHYSCN ASST'::text) THEN 'MED'::text
              WHEN (a."TITLE" = 'CLNCL PSYCH'::text) THEN 'MED'::text
              WHEN (a."TITLE" = 'SOC WRKR'::text) THEN 'MED'::text
              WHEN (a."TITLE" = 'ADVANCE NURSE PRAC'::text) THEN 'MED'::text
              WHEN (a."TITLE" = 'MATHCL STATCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'SUPVY ENFCMNT & RMVL ASST OA'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'STUD TR'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'TRAFF MGMT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'TRNG TECHNCN OA'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPP TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPP TECHNCN (INVENT)'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'BOND CNTL SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'SUPVY BOND SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'LAW ENFCMNT TECHNCN'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'ADMV ASST OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'RECR SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'MGMT ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'IMMGRTN ENF AGT'::text) THEN 'DO'::text
              WHEN (a."TITLE" = 'FOOD SRVS SPEC'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'AUTMTV MECH'::text) THEN 'WGSUPT'::text
              WHEN (a."TITLE" = 'LAW ENFCMNT COMMUN ASST'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'SUPVY MSN SUPT SPECL (COTR)'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'MTRLS HNDLR'::text) THEN 'WGSUPT'::text
              WHEN (a."TITLE" = 'OFF AUTOMATION ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'INVENT MGMT SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'ELCTRON TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'OFF AUTOMATION CLK'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'MGMT PROG TECHNCN OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'ASST DIR OFF OF ACQ'::text) THEN 'CONT'::text
              WHEN (a."TITLE" = 'PROCUR ANAL'::text) THEN 'CONT'::text
              WHEN (a."TITLE" = 'DEBARMENT ANAL (SENIOR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'DEBARMENT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'CONTR SPECLST'::text) THEN 'CONT'::text
              WHEN (a."TITLE" = 'SUPVY CONTR SPECLST'::text) THEN 'CONT'::text
              WHEN (a."TITLE" = 'SUPVY DEBARMENT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'EXEC ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'PROCUR & BUS RESOURCES MGMT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPVY PROCUR & BUS RESOURCES MGT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SR PROCUR & BUS RESOURCES MGMT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SR PROCUR & BUS RESOURCESMGMT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'BUS OPERS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'DEP ASSOC DIRECTOR OPR'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'ASSOC DIR OPR'::text) THEN 'CI'::text
              WHEN (a."TITLE" = 'MGMT & PROG ANAL (SR PROG ADVSR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'MGMT & PROG ANAL (SR PROGADVSR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'ASST DIR INVST OPR'::text) THEN 'CI'::text
              WHEN (a."TITLE" = 'OVERSIGHT ADM (PREA)'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'INVESTIGATIVE ANALYST'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'OPERTNL ANALS SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'SUPVY INSIDER THREAT OPERTNL ANAL'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'INTELL RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."TITLE" = 'OPERATIONAL ANALYSIS SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'SUPVY INTEL RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."TITLE" = 'TECHNCL ENFCMNT OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."TITLE" = 'SUPVY TECHNCL ENFCMNT OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."TITLE" = 'SUPVY INTELL & INFO SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'INSIDER THREAT SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'MGMT & PROG ANALYST (PROG ADVSR)'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'INVESTIGATIVE PROGRAM OFFICER'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'DIV DIRINSPR & DETENTION OVERSIGHT'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPVY INSPS & COMPLNC MGR'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'INSPS & COMPLNC SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'SUPVY INSPS & COMPLC SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'SUPVY SUPV ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPVY INSPS & COMPLNC SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPVY SECUR SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'PERS SECUR SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPVY PERS SECUR SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'SECUR SPECLST (POLYGRAPH EXAMNR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPVY SECUR SPECLST (POLYGRAPH EXMNR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'PHYS SECUR SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'SECUR SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SECUR INSPR'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'CHIEF INFORMATION OFFICER'::text) THEN 'ITSPEC'::text
              WHEN (a."TITLE" = 'DEP CHIEF INFORMATION OFFICER'::text) THEN 'ITSPEC'::text
              WHEN (a."TITLE" = 'SUPVY IT SPEC (ENTACH/INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."TITLE" = 'COMMUNICATIONS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'ITSPEC (PLCYPLN)'::text) THEN 'ITSPEC'::text
              WHEN (a."TITLE" = 'SUPVY ITSPEC (SYSANALYSIS)'::text) THEN 'ITSPEC'::text
              WHEN (a."TITLE" = 'IT PROJ MGR'::text) THEN 'ITSPEC'::text
              WHEN (a."TITLE" = 'ITSPEC (SYSADMIN)'::text) THEN 'ITSPEC'::text
              WHEN (a."TITLE" = 'SUPVY ITSPEC (INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."TITLE" = 'ITSPEC'::text) THEN 'ITSPEC'::text
              WHEN (a."TITLE" = 'SUPVY ITSPEC (APPSW/INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."TITLE" = 'LEAD ITSPEC (INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."TITLE" = 'ITSPEC (DATAMGT)'::text) THEN 'ITSPEC'::text
              WHEN (a."TITLE" = 'ITSPEC (SYSANALYSIS)'::text) THEN 'ITSPEC'::text
              WHEN (a."TITLE" = 'SUPVY ITSPEC (PLCYPLN)'::text) THEN 'ITSPEC'::text
              WHEN (a."TITLE" = 'ITSPEC (CUSTSPT)'::text) THEN 'ITSPEC'::text
              WHEN (a."TITLE" = 'ITSPEC (NETWORK)'::text) THEN 'ITSPEC'::text
              WHEN (a."TITLE" = 'SUPVY ITSPEC (CUSTSPT)'::text) THEN 'ITSPEC'::text
              WHEN (a."TITLE" = 'LEAD ITSPEC (NETWORK)'::text) THEN 'ITSPEC'::text
              WHEN (a."TITLE" = 'LEAD ITSPEC (CUSTSPT)'::text) THEN 'ITSPEC'::text
              WHEN (a."TITLE" = 'SUPVY ITSPEC (NETWORK)'::text) THEN 'ITSPEC'::text
              WHEN (a."TITLE" = 'SUPVY BUS OPERS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'DEPUTY CHIEF FINANCIAL OFFICER'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'CHIEF FINANCIAL OFCR (ICE)'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPV ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'LEAD MGMT & PROG ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'LEAD FNANCL PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'FNANCL PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPVY ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'FIN PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'DIR BUDGET & PROGRAM PERFORMANCE'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPVY BUDG ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'PROGRAM MANAGEMENT SPECIALIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SAFETY & OCCUPTL HLTH SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPVY INDL HYGIENIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SAFETY & OCCUPTL HLTH MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'NURSE CONSULTANT'::text) THEN 'MED'::text
              WHEN (a."TITLE" = 'MAIL & FILE ASST (OA)'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'SPACE MGMT SUPRT SPECL'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'ARCH'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'LEASE ADMIN PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SPACE MGMT SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'PROG MGR (FACILITIES)'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'BLDG MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'FACIL PROG MGR'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'UTIL SYS RPRER OPERTR'::text) THEN 'WGSUPT'::text
              WHEN (a."TITLE" = 'DIR OF FNANCL MGMT'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPVY FNANCL PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPVY SYS ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'MISSION SUPRT SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'LEAD ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SYS ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPVY FNANCL SYS MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'FINANCIAL SYSTEMS MANAGER'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'FINANCIL MGMT SYSTEMS ANAL (TEAM LEAD)'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPVY FNANCL BUS INTEG MANAGER'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'ACCTG TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SUPVY MGMT INF ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'SUPVY FNANCL ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'LEAD ACCTG TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'FNANCL MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'ACCNT (TAX)'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'DEPUTY DIRECTOR INVESTIGATIONS'::text) THEN 'CI'::text
              WHEN (a."TITLE" = 'ASST DIR OFFICE OF INVESTIGATIONS'::text) THEN 'CI'::text
              WHEN (a."TITLE" = 'AUDR'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'DEP ASST DIR INVEST'::text) THEN 'CI'::text
              WHEN (a."TITLE" = 'INTELL OPERS SPECLST'::text) THEN 'IRS'::text
              WHEN (a."TITLE" = 'CRIM RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."TITLE" = 'PAROLE PROG SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'ASSET FORFEIT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'SUPVY SOC SCI PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'SOC SCI PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'INTELL OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'SUPVY INTELL OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'SUPVY FORENSIC DOCMT EXAMN'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'FORENSIC DOCMT EXAMNR'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'FNGRPRNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'PHOTOGR (FORENSIC)'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'SR. DIG MULTIMEDIA FORENSIC ANALYST'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'SEIZED PROPERTY SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'SUPVY FNGRPRNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'SUPVY FORENSIC DOCMT EXAMNR'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'PHYS SCNTST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'EMER PREPAREDNESS SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'SEVP APPEALS ADJUDR'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'COUNTERTERRORISM INTELL SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'SEVP FLD REPR'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'SUPVY SEVP FLD REPR'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'SEVP ADJUDR'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'SUPVY SEVP ADJUDR'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'EXECUTIVE DIRECTOR LEIS'::text) THEN 'CI'::text
              WHEN (a."TITLE" = 'CYBER OPERS OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'COMPR FORENSIC ANAL'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'CRIM INVSTGR (NATL PROG MGR)'::text) THEN 'CI'::text
              WHEN (a."TITLE" = 'TACTICAL COMMUN OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."TITLE" = 'TELECOMMUN SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'SOC SCI PROG SPEC (VICTIM WIT ASST)'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'INVESTIGATIVE ASST OA'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'SPEC AGT IN CHG'::text) THEN 'CI'::text
              WHEN (a."TITLE" = 'SUPVY INTELL RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."TITLE" = 'SEIZED PROP SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'INVESTIGATIVE CLK OA'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'FILE ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'TECHNCL OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'PROG ASST'::text) THEN 'OTHRSPT'::text
              WHEN (a."TITLE" = 'INTELL ASST'::text) THEN 'IRS'::text
              WHEN (a."TITLE" = 'ICE TACTICAL OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."TITLE" = 'SUPVY ICE TACTICAL OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."TITLE" = 'PROG SUPRT SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'INF RECPTNST'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'ENFCMNT OPERS SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'SECTOR ENFCMNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'LEAD SECTOR ENFCMNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'TECHNICAL EQUIPMENT SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'SUPVY TACTICAL COMMUN OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'DIR FEDL EXPORT ENFCMNT COORDNTN CENTR'::text) THEN 'CI'::text
              WHEN (a."TITLE" = 'SUPVY PROG SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'SUPVY PROG ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'SUPVY INVESTIGATIVE ANALYST'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'SUPVY FOIA/PRIVACY ACT SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."TITLE" = 'DIR INTELL'::text) THEN 'IRS'::text
              WHEN (a."TITLE" = 'DEP ASST DIR INTEL'::text) THEN 'IRS'::text
              WHEN (a."TITLE" = 'SUPVY INTELL OPERS SPECLST'::text) THEN 'IRS'::text
              WHEN (a."TITLE" = 'DEP DIR, INTERNATIONAL AFFAIRS'::text) THEN 'CI'::text
              WHEN (a."TITLE" = 'DIR INTERPOL WASH'::text) THEN 'CI'::text
              WHEN (a."TITLE" = 'SUPVY CRIM INVSTGR (OPERS CH)'::text) THEN 'CI'::text
              WHEN (a."TITLE" = 'DEPRTN LIASN OFFCR'::text) THEN 'DO'::text
              WHEN (a."TITLE" = 'IMMIGRATN OFFCR'::text) THEN 'LEOTHR'::text
              ELSE NULL::text
          END AS tableau_title_group
     FROM (public.cxo_attrition_archive a
       LEFT JOIN public.quarter_mapping_tb b ON ((a.cxo_pp1 = b.cxo_pp1_group)))
    ORDER BY a.cxo_pp1
;

CREATE VIEW "public"."vcxo_esp_actions" AS
  SELECT cxo_esp_actions_archive."DIR",
      cxo_esp_actions_archive."PROGRAM_OFFICE",
      cxo_esp_actions_archive."BUD_LOC",
      cxo_esp_actions_archive."IPN",
      cxo_esp_actions_archive."ENHANCEMENT",
      cxo_esp_actions_archive."PRIORITY",
      cxo_esp_actions_archive."PROJECT_CODE",
      cxo_esp_actions_archive."FIRST_NAME",
      cxo_esp_actions_archive."LAST_NAME",
      cxo_esp_actions_archive."MRN",
      cxo_esp_actions_archive."TITLE",
      cxo_esp_actions_archive."GRADE",
      cxo_esp_actions_archive."SERIES",
      cxo_esp_actions_archive."REQUEST_NUMBER",
      cxo_esp_actions_archive."REQUEST_CODE",
      cxo_esp_actions_archive."DESCRIPTION",
      cxo_esp_actions_archive."GRP_NAME",
      cxo_esp_actions_archive."GROUP_TYPE",
      cxo_esp_actions_archive."ORG_CODE",
      cxo_esp_actions_archive."LINE1",
      cxo_esp_actions_archive."LINE2",
      cxo_esp_actions_archive."LINE3",
      cxo_esp_actions_archive."LINE4",
      cxo_esp_actions_archive."LINE5",
      cxo_esp_actions_archive."LINE6",
      cxo_esp_actions_archive."BOX_TYPE",
      cxo_esp_actions_archive."EFFECTIVE_DATE",
      cxo_esp_actions_archive."INTERNAL_SELECTION",
      cxo_esp_actions_archive."POI",
      cxo_esp_actions_archive."DATE_CREATED",
      cxo_esp_actions_archive."LAST_ACTIVITY",
      cxo_esp_actions_archive."ANNOUNCEMENT_CODE",
      cxo_esp_actions_archive."CERTIFICATE_NAME",
      cxo_esp_actions_archive."ANNOUNCEMENT_OWNER",
      cxo_esp_actions_archive."CATEGORY_CODE",
      cxo_esp_actions_archive.filename,
      cxo_esp_actions_archive.cxo_pp1,
      cxo_esp_actions_archive.fy,
      cxo_esp_actions_archive.ingested_at
     FROM public.cxo_esp_actions_archive
;

CREATE VIEW "public"."vcxo_esp_awards" AS
  SELECT a."REQUEST NUMBER",
      a."NOA",
      a."DESCRIPTION",
      a."TIME OFF HOURS",
      a."AWARD AMOUNT",
      a."USE STORED ACCT",
      a."ACCTG_DIST_CODE",
      a."CREATOR GROUP",
      a."CURRENT GROUP",
      a."PEFF DATE",
      a."EFFECTIVE DATE",
      a."FULL NAME",
      a."POS TITLE",
      a."SERIES",
      a."GRADE",
      a."STEP",
      a."ORG",
      a."LINE1",
      a."LINE2",
      a."LINE3",
      a."LINE4",
      a."LINE5",
      a."ORGANIZATION",
      a."DEPT",
      a."STATUS",
      a."OPEN DATE",
      a."CLOSE DATE",
      a."GROUP AWARD",
      a."GROUP COUNT",
      a."TIME OFF",
      a."PERS ACTN DATE",
      a."PERIOD COVERED START DATE",
      a."PERIOD COVERED END DATE",
      a."ACCESS CODE",
      a.filename,
      a.pp_end,
      a.cxo_pp1,
      a.cxo_fy,
      a.ingested_at,
          CASE
              WHEN ("left"(a."ORG", 4) = 'BB06'::text) THEN 'DIR'::text
              WHEN ("left"(a."ORG", 4) = 'BB05'::text) THEN 'DIR'::text
              WHEN ("left"(a."ORG", 4) = 'BB22'::text) THEN 'DIR'::text
              WHEN ("left"(a."ORG", 4) = 'BB07'::text) THEN 'DIR'::text
              WHEN ("left"(a."ORG", 4) = 'BB18'::text) THEN 'ERO'::text
              WHEN ("left"(a."ORG", 4) = 'BB70'::text) THEN 'HSI'::text
              WHEN ("left"(a."ORG", 4) = 'BB24'::text) THEN 'MGT'::text
              WHEN ("left"(a."ORG", 4) = 'BB23'::text) THEN 'MGT'::text
              WHEN ("left"(a."ORG", 4) = 'BB21'::text) THEN 'MGT'::text
              ELSE NULL::text
          END AS dir,
          CASE
              WHEN (("left"(a."ORG", 4) = 'BB06'::text) OR ("left"(a."ORG", 6) = 'BB0622'::text)) THEN 'OAS'::text
              WHEN (("left"(a."ORG", 4) = 'BB05'::text) OR ("left"(a."ORG", 6) = 'BB0504'::text)) THEN 'OOD'::text
              WHEN (("left"(a."ORG", 4) = 'BB05'::text) OR ("left"(a."ORG", 6) = 'BB0508'::text)) THEN 'OOD'::text
              WHEN (("left"(a."ORG", 4) = 'BB05'::text) OR ("left"(a."ORG", 6) = 'BB0502'::text)) THEN 'OOD'::text
              WHEN (("left"(a."ORG", 4) = 'BB05'::text) OR ("left"(a."ORG", 6) = 'BB0505'::text)) THEN 'OOD'::text
              WHEN (("left"(a."ORG", 4) = 'BB05'::text) OR ("left"(a."ORG", 6) = 'BB0500'::text)) THEN 'OOD'::text
              WHEN (("left"(a."ORG", 4) = 'BB05'::text) OR ("left"(a."ORG", 6) = 'BB0501'::text)) THEN 'OOD'::text
              WHEN (("left"(a."ORG", 4) = 'BB05'::text) OR ("left"(a."ORG", 6) = 'BB0503'::text)) THEN 'OOD'::text
              WHEN (("left"(a."ORG", 4) = 'BB05'::text) OR ("left"(a."ORG", 6) = 'BB0506'::text)) THEN 'OOD'::text
              WHEN (("left"(a."ORG", 4) = 'BB22'::text) OR ("left"(a."ORG", 6) = 'BB2200'::text)) THEN 'OPR'::text
              WHEN (("left"(a."ORG", 4) = 'BB22'::text) OR ("left"(a."ORG", 6) = 'BB2210'::text)) THEN 'OPR'::text
              WHEN (("left"(a."ORG", 4) = 'BB22'::text) OR ("left"(a."ORG", 6) = 'BB2211'::text)) THEN 'OPR'::text
              WHEN (("left"(a."ORG", 4) = 'BB22'::text) OR ("left"(a."ORG", 6) = 'BB2212'::text)) THEN 'OPR'::text
              WHEN (("left"(a."ORG", 4) = 'BB22'::text) OR ("left"(a."ORG", 6) = 'BB2214'::text)) THEN 'OPR'::text
              WHEN (("left"(a."ORG", 4) = 'BB07'::text) OR ("left"(a."ORG", 6) = 'BB0710'::text)) THEN 'PLA'::text
              WHEN (("left"(a."ORG", 4) = 'BB18'::text) OR ("left"(a."ORG", 6) = 'BB1862'::text)) THEN 'DRO'::text
              WHEN (("left"(a."ORG", 4) = 'BB18'::text) OR ("left"(a."ORG", 6) = 'BB1861'::text)) THEN 'DRO'::text
              WHEN (("left"(a."ORG", 4) = 'BB18'::text) OR ("left"(a."ORG", 6) = 'BB1850'::text)) THEN 'DRO'::text
              WHEN (("left"(a."ORG", 4) = 'BB18'::text) OR ("left"(a."ORG", 6) = 'BB1863'::text)) THEN 'DRO'::text
              WHEN (("left"(a."ORG", 4) = 'BB18'::text) OR ("left"(a."ORG", 6) = 'BB1800'::text)) THEN 'DRO'::text
              WHEN (("left"(a."ORG", 4) = 'BB18'::text) OR ("left"(a."ORG", 6) = 'BB1806'::text)) THEN 'DRO'::text
              WHEN (("left"(a."ORG", 4) = 'BB70'::text) OR ("left"(a."ORG", 6) = 'BB7009'::text)) THEN 'IAF'::text
              WHEN (("left"(a."ORG", 4) = 'BB70'::text) OR ("left"(a."ORG", 6) = 'BB7004'::text)) THEN 'INV'::text
              WHEN (("left"(a."ORG", 4) = 'BB70'::text) OR ("left"(a."ORG", 6) = 'BB7000'::text)) THEN 'INV'::text
              WHEN (("left"(a."ORG", 4) = 'BB70'::text) OR ("left"(a."ORG", 6) = 'BB7001'::text)) THEN 'INV'::text
              WHEN (("left"(a."ORG", 4) = 'BB70'::text) OR ("left"(a."ORG", 6) = 'BB7002'::text)) THEN 'INV'::text
              WHEN (("left"(a."ORG", 4) = 'BB70'::text) OR ("left"(a."ORG", 6) = 'BB7003'::text)) THEN 'INV'::text
              WHEN (("left"(a."ORG", 4) = 'BB70'::text) OR ("left"(a."ORG", 6) = 'BB7005'::text)) THEN 'INV'::text
              WHEN (("left"(a."ORG", 4) = 'BB70'::text) OR ("left"(a."ORG", 6) = 'BB7006'::text)) THEN 'INV'::text
              WHEN (("left"(a."ORG", 4) = 'BB70'::text) OR ("left"(a."ORG", 6) = 'BB7007'::text)) THEN 'INV'::text
              WHEN (("left"(a."ORG", 4) = 'BB70'::text) OR ("left"(a."ORG", 6) = 'BB7010'::text)) THEN 'INV'::text
              WHEN (("left"(a."ORG", 4) = 'BB70'::text) OR ("left"(a."ORG", 6) = 'BB7008'::text)) THEN 'ITL'::text
              WHEN (("left"(a."ORG", 4) = 'BB24'::text) OR ("left"(a."ORG", 6) = 'BB2410'::text)) THEN 'CFO'::text
              WHEN (("left"(a."ORG", 4) = 'BB24'::text) OR ("left"(a."ORG", 6) = 'BB2440'::text)) THEN 'CFO'::text
              WHEN (("left"(a."ORG", 4) = 'BB24'::text) OR ("left"(a."ORG", 6) = 'BB2400'::text)) THEN 'CFO'::text
              WHEN (("left"(a."ORG", 4) = 'BB24'::text) OR ("left"(a."ORG", 6) = 'BB2420'::text)) THEN 'CFO'::text
              WHEN (("left"(a."ORG", 4) = 'BB24'::text) OR ("left"(a."ORG", 6) = 'BB2430'::text)) THEN 'CFO'::text
              WHEN (("left"(a."ORG", 4) = 'BB23'::text) OR ("left"(a."ORG", 6) = 'BB2300'::text)) THEN 'CIO'::text
              WHEN (("left"(a."ORG", 4) = 'BB23'::text) OR ("left"(a."ORG", 6) = 'BB2301'::text)) THEN 'CIO'::text
              WHEN (("left"(a."ORG", 4) = 'BB23'::text) OR ("left"(a."ORG", 6) = 'BB2302'::text)) THEN 'CIO'::text
              WHEN (("left"(a."ORG", 4) = 'BB23'::text) OR ("left"(a."ORG", 6) = 'BB2303'::text)) THEN 'CIO'::text
              WHEN (("left"(a."ORG", 4) = 'BB23'::text) OR ("left"(a."ORG", 6) = 'BB2304'::text)) THEN 'CIO'::text
              WHEN (("left"(a."ORG", 4) = 'BB23'::text) OR ("left"(a."ORG", 6) = 'BB2305'::text)) THEN 'CIO'::text
              WHEN (("left"(a."ORG", 4) = 'BB06'::text) OR ("left"(a."ORG", 6) = 'BB0600'::text)) THEN 'MAA'::text
              WHEN (("left"(a."ORG", 4) = 'BB06'::text) OR ("left"(a."ORG", 6) = 'BB0602'::text)) THEN 'MAA'::text
              WHEN (("left"(a."ORG", 4) = 'BB21'::text) OR ("left"(a."ORG", 6) = 'BB2100'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB21'::text) OR ("left"(a."ORG", 6) = 'BB2110'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB21'::text) OR ("left"(a."ORG", 6) = 'BB2120'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB21'::text) OR ("left"(a."ORG", 6) = 'BB2131'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB21'::text) OR ("left"(a."ORG", 6) = 'BB2132'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB21'::text) OR ("left"(a."ORG", 6) = 'BB2140'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB21'::text) OR ("left"(a."ORG", 6) = 'BB2150'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB21'::text) OR ("left"(a."ORG", 6) = 'BB2160'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB21'::text) OR ("left"(a."ORG", 6) = 'BB2180'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB21'::text) OR ("left"(a."ORG", 6) = 'BB2190'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB06'::text) OR ("left"(a."ORG", 6) = 'BB0609'::text)) THEN 'OAS'::text
              WHEN (("left"(a."ORG", 4) = 'BB06'::text) OR ("left"(a."ORG", 6) = 'BB0617'::text)) THEN 'OAS'::text
              WHEN (("left"(a."ORG", 4) = 'BB06'::text) OR ("left"(a."ORG", 6) = 'BB0605'::text)) THEN 'OAS'::text
              WHEN (("left"(a."ORG", 4) = 'BB06'::text) OR ("left"(a."ORG", 6) = 'BB0603'::text)) THEN 'OAS'::text
              ELSE NULL::text
          END AS office,
          CASE
              WHEN (("left"(a."ORG", 4) = 'BB06'::text) OR ("left"(a."ORG", 6) = 'BB0622'::text)) THEN 'IPA'::text
              WHEN (("left"(a."ORG", 4) = 'BB05'::text) OR ("left"(a."ORG", 6) = 'BB0504'::text)) THEN 'DCR'::text
              WHEN (("left"(a."ORG", 4) = 'BB05'::text) OR ("left"(a."ORG", 6) = 'BB0508'::text)) THEN 'IPE'::text
              WHEN (("left"(a."ORG", 4) = 'BB05'::text) OR ("left"(a."ORG", 6) = 'BB0502'::text)) THEN 'OCR'::text
              WHEN (("left"(a."ORG", 4) = 'BB05'::text) OR ("left"(a."ORG", 6) = 'BB0505'::text)) THEN 'OFT'::text
              WHEN (("left"(a."ORG", 4) = 'BB05'::text) OR ("left"(a."ORG", 6) = 'BB0500'::text)) THEN 'OOD'::text
              WHEN (("left"(a."ORG", 4) = 'BB05'::text) OR ("left"(a."ORG", 6) = 'BB0501'::text)) THEN 'OOD'::text
              WHEN (("left"(a."ORG", 4) = 'BB05'::text) OR ("left"(a."ORG", 6) = 'BB0503'::text)) THEN 'OPA'::text
              WHEN (("left"(a."ORG", 4) = 'BB05'::text) OR ("left"(a."ORG", 6) = 'BB0506'::text)) THEN 'OPE'::text
              WHEN (("left"(a."ORG", 4) = 'BB22'::text) OR ("left"(a."ORG", 6) = 'BB2200'::text)) THEN 'OPR'::text
              WHEN (("left"(a."ORG", 4) = 'BB22'::text) OR ("left"(a."ORG", 6) = 'BB2210'::text)) THEN 'OPR'::text
              WHEN (("left"(a."ORG", 4) = 'BB22'::text) OR ("left"(a."ORG", 6) = 'BB2211'::text)) THEN 'OPR'::text
              WHEN (("left"(a."ORG", 4) = 'BB22'::text) OR ("left"(a."ORG", 6) = 'BB2212'::text)) THEN 'OPR'::text
              WHEN (("left"(a."ORG", 4) = 'BB22'::text) OR ("left"(a."ORG", 6) = 'BB2214'::text)) THEN 'OPR'::text
              WHEN (("left"(a."ORG", 4) = 'BB07'::text) OR ("left"(a."ORG", 6) = 'BB0710'::text)) THEN 'CCO'::text
              WHEN (("left"(a."ORG", 4) = 'BB18'::text) OR ("left"(a."ORG", 6) = 'BB1862'::text)) THEN 'FAO'::text
              WHEN (("left"(a."ORG", 4) = 'BB18'::text) OR ("left"(a."ORG", 6) = 'BB1861'::text)) THEN 'FAT'::text
              WHEN (("left"(a."ORG", 4) = 'BB18'::text) OR ("left"(a."ORG", 6) = 'BB1850'::text)) THEN 'FCT'::text
              WHEN (("left"(a."ORG", 4) = 'BB18'::text) OR ("left"(a."ORG", 6) = 'BB1863'::text)) THEN 'FDN'::text
              WHEN (("left"(a."ORG", 4) = 'BB18'::text) OR ("left"(a."ORG", 6) = 'BB1800'::text)) THEN 'FHQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB18'::text) OR ("left"(a."ORG", 6) = 'BB1806'::text)) THEN 'FHQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB70'::text) OR ("left"(a."ORG", 6) = 'BB7009'::text)) THEN 'OAG'::text
              WHEN (("left"(a."ORG", 4) = 'BB70'::text) OR ("left"(a."ORG", 6) = 'BB7004'::text)) THEN 'VAT'::text
              WHEN (("left"(a."ORG", 4) = 'BB70'::text) OR ("left"(a."ORG", 6) = 'BB7000'::text)) THEN 'VHQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB70'::text) OR ("left"(a."ORG", 6) = 'BB7001'::text)) THEN 'VHQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB70'::text) OR ("left"(a."ORG", 6) = 'BB7002'::text)) THEN 'VHQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB70'::text) OR ("left"(a."ORG", 6) = 'BB7003'::text)) THEN 'VHQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB70'::text) OR ("left"(a."ORG", 6) = 'BB7005'::text)) THEN 'VHQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB70'::text) OR ("left"(a."ORG", 6) = 'BB7006'::text)) THEN 'VHQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB70'::text) OR ("left"(a."ORG", 6) = 'BB7007'::text)) THEN 'VHQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB70'::text) OR ("left"(a."ORG", 6) = 'BB7010'::text)) THEN 'VHQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB70'::text) OR ("left"(a."ORG", 6) = 'BB7008'::text)) THEN 'IHQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB24'::text) OR ("left"(a."ORG", 6) = 'BB2410'::text)) THEN 'ACO'::text
              WHEN (("left"(a."ORG", 4) = 'BB24'::text) OR ("left"(a."ORG", 6) = 'BB2440'::text)) THEN 'BFC'::text
              WHEN (("left"(a."ORG", 4) = 'BB24'::text) OR ("left"(a."ORG", 6) = 'BB2400'::text)) THEN 'CFO'::text
              WHEN (("left"(a."ORG", 4) = 'BB24'::text) OR ("left"(a."ORG", 6) = 'BB2420'::text)) THEN 'OBD'::text
              WHEN (("left"(a."ORG", 4) = 'BB24'::text) OR ("left"(a."ORG", 6) = 'BB2430'::text)) THEN 'OFA'::text
              WHEN (("left"(a."ORG", 4) = 'BB23'::text) OR ("left"(a."ORG", 6) = 'BB2300'::text)) THEN 'CIO'::text
              WHEN (("left"(a."ORG", 4) = 'BB23'::text) OR ("left"(a."ORG", 6) = 'BB2301'::text)) THEN 'CIO'::text
              WHEN (("left"(a."ORG", 4) = 'BB23'::text) OR ("left"(a."ORG", 6) = 'BB2302'::text)) THEN 'CIO'::text
              WHEN (("left"(a."ORG", 4) = 'BB23'::text) OR ("left"(a."ORG", 6) = 'BB2303'::text)) THEN 'CIO'::text
              WHEN (("left"(a."ORG", 4) = 'BB23'::text) OR ("left"(a."ORG", 6) = 'BB2304'::text)) THEN 'CIO'::text
              WHEN (("left"(a."ORG", 4) = 'BB23'::text) OR ("left"(a."ORG", 6) = 'BB2305'::text)) THEN 'CIO'::text
              WHEN (("left"(a."ORG", 4) = 'BB06'::text) OR ("left"(a."ORG", 6) = 'BB0600'::text)) THEN 'MAA'::text
              WHEN (("left"(a."ORG", 4) = 'BB06'::text) OR ("left"(a."ORG", 6) = 'BB0602'::text)) THEN 'SRD'::text
              WHEN (("left"(a."ORG", 4) = 'BB21'::text) OR ("left"(a."ORG", 6) = 'BB2100'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB21'::text) OR ("left"(a."ORG", 6) = 'BB2110'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB21'::text) OR ("left"(a."ORG", 6) = 'BB2120'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB21'::text) OR ("left"(a."ORG", 6) = 'BB2131'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB21'::text) OR ("left"(a."ORG", 6) = 'BB2132'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB21'::text) OR ("left"(a."ORG", 6) = 'BB2140'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB21'::text) OR ("left"(a."ORG", 6) = 'BB2150'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB21'::text) OR ("left"(a."ORG", 6) = 'BB2160'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB21'::text) OR ("left"(a."ORG", 6) = 'BB2180'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB21'::text) OR ("left"(a."ORG", 6) = 'BB2190'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."ORG", 4) = 'BB06'::text) OR ("left"(a."ORG", 6) = 'BB0609'::text)) THEN 'HCD'::text
              WHEN (("left"(a."ORG", 4) = 'BB06'::text) OR ("left"(a."ORG", 6) = 'BB0617'::text)) THEN 'IGP'::text
              WHEN (("left"(a."ORG", 4) = 'BB06'::text) OR ("left"(a."ORG", 6) = 'BB0605'::text)) THEN 'LDC'::text
              WHEN (("left"(a."ORG", 4) = 'BB06'::text) OR ("left"(a."ORG", 6) = 'BB0603'::text)) THEN 'POL'::text
              ELSE NULL::text
          END AS bud,
          CASE
              WHEN (a."GRADE" = '0.0'::text) THEN '0'::text
              WHEN (a."GRADE" = '11.0'::text) THEN '11'::text
              WHEN (a."GRADE" = '15.0'::text) THEN '15'::text
              WHEN (a."GRADE" = '8.0'::text) THEN '8'::text
              WHEN (a."GRADE" = '3.0'::text) THEN '3'::text
              WHEN (a."GRADE" = '4.0'::text) THEN '4'::text
              WHEN (a."GRADE" = '2.0'::text) THEN '2'::text
              WHEN (a."GRADE" = '7.0'::text) THEN '7'::text
              WHEN (a."GRADE" = '14.0'::text) THEN '14'::text
              WHEN (a."GRADE" = '9.0'::text) THEN '9'::text
              WHEN (a."GRADE" = '12.0'::text) THEN '12'::text
              WHEN (a."GRADE" = '10.0'::text) THEN '10'::text
              WHEN (a."GRADE" = '5.0'::text) THEN '5'::text
              WHEN (a."GRADE" = '13.0'::text) THEN '13'::text
              WHEN (a."GRADE" = '6.0'::text) THEN '6'::text
              ELSE a."GRADE"
          END AS tableau_grade
     FROM public.cxo_esp_awards_archive a
    ORDER BY a.cxo_pp1
;

CREATE VIEW "public"."vcxo_esp" AS
   SELECT cxo_esp_actions_archive."DIR",
      cxo_esp_actions_archive."PROGRAM_OFFICE",
      cxo_esp_actions_archive."BUD_LOC",
      cxo_esp_actions_archive."IPN",
      cxo_esp_actions_archive."ENHANCEMENT",
      cxo_esp_actions_archive."PRIORITY",
      cxo_esp_actions_archive."PROJECT_CODE",
      cxo_esp_actions_archive."FIRST_NAME",
      cxo_esp_actions_archive."LAST_NAME",
      cxo_esp_actions_archive."MRN",
      cxo_esp_actions_archive."TITLE",
      cxo_esp_actions_archive."GRADE",
      cxo_esp_actions_archive."SERIES",
      cxo_esp_actions_archive."REQUEST_NUMBER",
      cxo_esp_actions_archive."REQUEST_CODE",
      cxo_esp_actions_archive."DESCRIPTION",
      cxo_esp_actions_archive."GRP_NAME",
      cxo_esp_actions_archive."GROUP_TYPE",
      cxo_esp_actions_archive."ORG_CODE",
      cxo_esp_actions_archive."LINE1",
      cxo_esp_actions_archive."LINE2",
      cxo_esp_actions_archive."LINE3",
      cxo_esp_actions_archive."LINE4",
      cxo_esp_actions_archive."LINE5",
      cxo_esp_actions_archive."LINE6",
      cxo_esp_actions_archive."BOX_TYPE",
      cxo_esp_actions_archive."EFFECTIVE_DATE",
      cxo_esp_actions_archive."INTERNAL_SELECTION",
      cxo_esp_actions_archive."POI",
      cxo_esp_actions_archive."DATE_CREATED",
      cxo_esp_actions_archive."LAST_ACTIVITY",
      cxo_esp_actions_archive."ANNOUNCEMENT_CODE",
      cxo_esp_actions_archive."CERTIFICATE_NAME",
      cxo_esp_actions_archive."ANNOUNCEMENT_OWNER",
      cxo_esp_actions_archive."CATEGORY_CODE",
      cxo_esp_actions_archive.filename,
      cxo_esp_actions_archive.cxo_pp1,
      cxo_esp_actions_archive.fy,
      cxo_esp_actions_archive.ingested_at
     FROM public.cxo_esp_actions_archive;
;

CREATE VIEW "public"."vcxo_map2" AS
   SELECT a."SEX_CODE",
      a."Occ Series",
      a."DATE_SCD_LEAVE",
      a."DATE_AGENCY_EOD",
      a."DATE_ENTERED_PRES_GRADE",
      a."TITLE GROUP",
      a.filename,
      a."POSITION_OFFICIAL_TITLE",
      a."DUTY CITY",
      a."DUTY STATE",
      a."LAW ENF",
      a."PML on board",
      a."BARGAINING_UNIT_STATUS_CD",
      a."DIR",
      a."OFFICE",
      a."BUD",
      a."ORG",
      a."ORG TEXT",
      a."CONUS",
      a."CY_PP",
      a.cxo_pp1,
      a.ingested_at,
      a.pp_dt_end,
      a.next_pp_dt,
      a."GRADE",
      a."DATE_SCD_WGI",
      a."POSITION_TARGET_GRADE",
      a."TITLE",
      a."SERIES",
      a."LEO_IND",
      a."POSITION_SUPERVISORY_CODE",
      a."Employee Name",
      a."EMPLOYEE_WORK_EMAIL",
      a."Veterans Preference",
          CASE
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEP DIR ICE'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CHIEF OF STAFF'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MGMT & PROG ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEP CH OF STAFF'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SPECIAL ADVISOR (PROTOCOL & SPEC EVTS)'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PROG MGR'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MSN SUPT SPECL'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASSISTANT EXEC SEC'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'WRI EDIT'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASST DIR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CONGRSNL LIASN SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY CONGRSNL LIASN OFCR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SPEC ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY PUBLIC AFF SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PUBLIC AFF SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MISSION SUPPORT SPECIALIST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY MGMT & PROG ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'VIS INF SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'AUDIO VIS PRODN SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY AUDIO VIS PRODN SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASST DIR DIVERSITY & CIVIL RIGHTS'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'EQ EMPLMT SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CLK'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'EQ EMPLMT MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY POLICY ADVISOR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PLCY ADVSR'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY EQ EMPLMT SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY EQ OPP SPEC'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'POLICY ADVSR'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY CRIM INVSTGR'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CRIM INVSTGR'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'EQUIP SPECLST ORDNC'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPP TECHNCN OA'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY GEN ENGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ENGRG TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LAW ENFORCEMENT PROG. MGR.'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEPRTN OFFCR (COURSE DEVLP/INSTR)'::text) THEN 'DO'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'TRAINING SPEC (FIREARMS)'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FIREARMS PGRM SPCLST'::text) THEN 'LEOTHR'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'TRNG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CRIMINAL INVESTIGATOR (INSTRUCTOR)'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DETNTN & DEPORTATN OFFCR'::text) THEN 'DO'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY DETNTN & DEPORTATN OFFCR'::text) THEN 'DO'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FACIL OPERS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY COMMUNITY RELATIONS OFFCR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'COMMUNITY RELATIONS OFFCR'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SENIOR ADVSR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEP CHIEF OF STAFF'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'STAFF ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'BUDG ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'REGULATORY AND POLICY ANALYST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ECONMST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PLCY ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY REGULATORY ANALYST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY PLCY ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ECONOMIST (CHIEF)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CH OF STAFF'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY MSN SUPT SPECL'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INSTRUCTNL SYS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INSTRUCTNL SYS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PROG MGR (LRNG MGMT)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'TRNG INSTRU'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INSTRUCTIONAL SPECIALIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MISSION SUPRT ASST OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY TRNG INSTRU'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEPUTY CHIEF HUMAN CAPITAL OFFICER'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CHIEF HUMAN CAPITAL OFFICER'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'HUMAN RESOURCES SPECLST (COMPEN)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SENIOR HUMAN RESOURCES ADVISOR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY STRATEGIC ADVSR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY HUMAN RESOURCES SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'HUMAN RESOURCES SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'HUMAN RESOURCES ASST OA'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY HUMAN RESOURCES SPECLST (EMPL BE'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'HUMAN RESOURCES SPECLST (RECRUIT&PLAC)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY HUMAN RESOURCES SPECLST (RECRUIT'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY HUMAN RESOURCES SPECLST (CLASSIF'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'HUMAN RESOURCES SPECLST (CLASSIFN)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PRE-EMPLOYMENT SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PRE EMPLOYMENT ASST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'STUD TR (HUMAN RESOURCES)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY HR SPECLST (EMPL & LABOR REL)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'HUMAN RESOURCES SPECLST (LABOR REL)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY HUMAN RESOURCES SPECLST (LABOR R'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LEAD HUMAN RESOURCES SPECLST (EMPL REL'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY HUMAN RESOURCES SPECLST (EMPL RE'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'HR SPECLST (CLASSIFN RECRUIT & PLAC)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY PHYSICIAN'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PHYSICIAN'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'OCCUPTL HLTH NURSE'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DRUG PROG COORD'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'HUMAN RESOURCES SPECLST (EMPL BENES)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'BEHAVIORAL HLTH SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'EMP ASSTNC PROG MGR'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY PSYCH'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CHAPLAIN DIR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PERS RES PSYCH'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY PERS RESEARCH PSYCH'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MGMT INF ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY HUMAN RESOURCES SPECLST (INFO SY'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ADMV OFFCR'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY ADMV OFFCR'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CIVILIAN PAY TECHNCN OA'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY HUMAN RESOURCES SPECLST (COMPEN)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASST DIR INF GOVERNANCE'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'RECS AND INFO MGMT SPEC'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'OPER RES ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PRIVACY OFFICER'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MGMT & PRO ANAL (PRIVACY COMPLIANCE)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SR INFO GOV ANALYST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'GOVNMNT INFO SPEC (PRIVACY COMPLIANCE)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MGMT & PROG ANAL (BUDG & COR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY RECORDS & INFORMATION MGMT SPECI'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PARALEGAL SPECLST (FOIA/PA)'::text) THEN 'LGLSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PARALEGAL SPECLST'::text) THEN 'LGLSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FOIA/PA ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY PARALEGAL SPECLST'::text) THEN 'LGLSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY PARALEGAL SPECLST (FOIA/PA)'::text) THEN 'LGLSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PARALEGAL SPECLST (FOIA)'::text) THEN 'LGLSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FREEDOM OF INFORMATION ACT DIRECTOR'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEPUTY DIRECTOR FOIA'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'GEN ENGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ITSPEC (INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'OPERATIONS RESEARCH ANALYST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEP PRINC LEG ADVSR'::text) THEN 'ATTY'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEP PRIN LEGAL ADVSR MANAGEMENT'::text) THEN 'ATTY'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PRINCIPAL LEGAL ADVISOR FOR ICE'::text) THEN 'ATTY'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY GEN ATTY'::text) THEN 'ATTY'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'GEN ATTY'::text) THEN 'ATTY'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ATTY ADVSR'::text) THEN 'ATTY'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASSOC DEP PRINC LEG ADVSR'::text) THEN 'ATTY'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PARALEGAL SPECIALIST (OPLA)'::text) THEN 'LGLSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEP PRINC LEGAL ADVSR HEADQUARTES'::text) THEN 'ATTY'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'HISTRN'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LIBRN LAW'::text) THEN 'LGLSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LEG ASST OA'::text) THEN 'LGLSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY GEN ATTY (ETHICS)'::text) THEN 'ATTY'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'GEN ATTY (ETHCIS)'::text) THEN 'ATTY'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MAIL & FILE CLK OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LEAD LEG ASST'::text) THEN 'LGLSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CHIEF COUNSEL'::text) THEN 'ATTY'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LAW CLK'::text) THEN 'LGLSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY LEG ASST OA'::text) THEN 'LGLSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'TRIAL ATTY'::text) THEN 'ATTY'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'STUD TR (LEG ASST) OA'::text) THEN 'LGLSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ENFORCEMENT PROGRAMS MGR'::text) THEN 'LEOTHR'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASST DIR ENFCMNT & REMOVAL OPS'::text) THEN 'DO'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEP ASST DIR FLD OPERS'::text) THEN 'DO'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INTEL RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'EMERGENCY MANAGEMENT SPECIALIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY EMERGENCY MANAGEMENT SPECIALIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'STATCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEPUTY ASSISTANT DIRECTOR ERO'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MGMT & PROG ANAL (DET SVCS MGR)'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEPRTN OFFCR (COMP STDS OFFCR)'::text) THEN 'DO'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASST DIR SECURE COMMUNITIES'::text) THEN 'DO'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CRIM TARGETING SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY CRIM TARGETING SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEPRTN OFFCR'::text) THEN 'DO'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LAW ENFCMNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY LAW ENFCMNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASST DIR ICE SRVCS HLTH CORPS'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'HEALTH SYSTEMS SPECIALIST'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY PHYSCN (PSYCHTRC)'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PHYSICIAN (CLINICAL DIRECTOR)'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PHYSICIAN (PSYCHIATRY)'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MEDCL OFFCR'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PHYSCN (GEN PRACTICE)'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PHYSICIAN (REG CLINICAL DIR)'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PHYSICIAN (CONSULTANT)'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PHYSICIAN (DAD/MED DIRECTOR)'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CLNCL NURSE'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY HEALTH SYSTEM SPECIALIST'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PRACTICAL NURSE'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'NURSE PRACTITIONER'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MEDCL REC TECHNCN'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DNTL HYGIENIST'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY WRI EDIT'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SECY OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ADV PRAC NURSE (NURSE PRACTITIONER)'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DIAGNSTC RADIOLOGIC TECHNCN'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DNTL ASST'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PHYSCN ASST'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CLNCL PSYCH'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SOC WRKR'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ADVANCE NURSE PRAC'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MATHCL STATCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY ENFCMNT & RMVL ASST OA'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'STUD TR'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'TRAFF MGMT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'TRNG TECHNCN OA'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPP TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPP TECHNCN (INVENT)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'BOND CNTL SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY BOND SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LAW ENFCMNT TECHNCN'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ADMV ASST OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'RECR SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MGMT ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'IMMGRTN ENF AGT'::text) THEN 'DO'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FOOD SRVS SPEC'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'AUTMTV MECH'::text) THEN 'WGSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LAW ENFCMNT COMMUN ASST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY MSN SUPT SPECL (COTR)'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MTRLS HNDLR'::text) THEN 'WGSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'OFF AUTOMATION ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INVENT MGMT SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ELCTRON TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'OFF AUTOMATION CLK'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MGMT PROG TECHNCN OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASST DIR OFF OF ACQ'::text) THEN 'CONT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PROCUR ANAL'::text) THEN 'CONT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEBARMENT ANAL (SENIOR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEBARMENT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CONTR SPECLST'::text) THEN 'CONT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY CONTR SPECLST'::text) THEN 'CONT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY DEBARMENT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'EXEC ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PROCUR & BUS RESOURCES MGMT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY PROCUR & BUS RESOURCES MGT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SR PROCUR & BUS RESOURCES MGMT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'BUS OPERS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEP ASSOC DIRECTOR OPR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASSOC DIR OPR'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MGMT & PROG ANAL (SR PROG ADVSR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASST DIR INVST OPR'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'OVERSIGHT ADM (PREA)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INVESTIGATIVE ANALYST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'OPERTNL ANALS SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INSIDER THREAT OPERTNL ANAL'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INTELL RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'OPERATIONAL ANALYSIS SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INTEL RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'TECHNCL ENFCMNT OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY TECHNCL ENFCMNT OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INTELL & INFO SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INSIDER THREAT SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MGMT & PROG ANALYST (PROG ADVSR)'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INVESTIGATIVE PROGRAM OFFICER'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DIV DIRINSPR & DETENTION OVERSIGHT'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INSPS & COMPLNC MGR'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INSPS & COMPLNC SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INSPS & COMPLC SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY SUPV ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INSPS & COMPLNC SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY SECUR SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PERS SECUR SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY PERS SECUR SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SECUR SPECLST (POLYGRAPH EXAMNR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY SECUR SPECLST (POLYGRAPH EXMNR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PHYS SECUR SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SECUR SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SECUR INSPR'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CHIEF INFORMATION OFFICER'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEP CHIEF INFORMATION OFFICER'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY IT SPEC (ENTACH/INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'COMMUNICATIONS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ITSPEC (PLCYPLN)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY ITSPEC (SYSANALYSIS)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'IT PROJ MGR'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ITSPEC (SYSADMIN)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY ITSPEC (INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ITSPEC'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY ITSPEC (APPSW/INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LEAD ITSPEC (INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ITSPEC (DATAMGT)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ITSPEC (SYSANALYSIS)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY ITSPEC (PLCYPLN)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ITSPEC (CUSTSPT)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ITSPEC (NETWORK)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY ITSPEC (CUSTSPT)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LEAD ITSPEC (NETWORK)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LEAD ITSPEC (CUSTSPT)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY ITSPEC (NETWORK)'::text) THEN 'ITSPEC'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY BUS OPERS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEPUTY CHIEF FINANCIAL OFFICER'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CHIEF FINANCIAL OFCR (ICE)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPV ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LEAD MGMT & PROG ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LEAD FNANCL PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FNANCL PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FIN PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DIR BUDGET & PROGRAM PERFORMANCE'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY BUDG ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PROGRAM MANAGEMENT SPECIALIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SAFETY & OCCUPTL HLTH SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INDL HYGIENIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SAFETY & OCCUPTL HLTH MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'NURSE CONSULTANT'::text) THEN 'MED'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MAIL & FILE ASST (OA)'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SPACE MGMT SUPRT SPECL'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ARCH'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LEASE ADMIN PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SPACE MGMT SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PROG MGR (FACILITIES)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'BLDG MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FACIL PROG MGR'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'UTIL SYS RPRER OPERTR'::text) THEN 'WGSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DIR OF FNANCL MGMT'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY FNANCL PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY SYS ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'MISSION SUPRT SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LEAD ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SYS ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY FNANCL SYS MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FINANCIAL SYSTEMS MANAGER'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FINANCIL MGMT SYSTEMS ANAL (TEAM LEAD)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY FNANCL BUS INTEG MANAGER'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ACCTG TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY MGMT INF ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY FNANCL ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LEAD ACCTG TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FNANCL MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ACCNT (TAX)'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEPUTY DIRECTOR INVESTIGATIONS'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASST DIR OFFICE OF INVESTIGATIONS'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'AUDR'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEP ASST DIR INVEST'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INTELL OPERS SPECLST'::text) THEN 'IRS'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CRIM RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PAROLE PROG SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ASSET FORFEIT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY SOC SCI PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SOC SCI PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INTELL OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INTELL OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY FORENSIC DOCMT EXAMN'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FORENSIC DOCMT EXAMNR'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FNGRPRNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PHOTOGR (FORENSIC)'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SR. DIG MULTIMEDIA FORENSIC ANALYST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SEIZED PROPERTY SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY FNGRPRNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY FORENSIC DOCMT EXAMNR'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PHYS SCNTST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'EMER PREPAREDNESS SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SEVP APPEALS ADJUDR'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'COUNTERTERRORISM INTELL SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SEVP FLD REPR'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY SEVP FLD REPR'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SEVP ADJUDR'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY SEVP ADJUDR'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'EXECUTIVE DIRECTOR LEIS'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CYBER OPERS OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'COMPR FORENSIC ANAL'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'CRIM INVSTGR (NATL PROG MGR)'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'TACTICAL COMMUN OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'TELECOMMUN SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SOC SCI PROG SPEC (VICTIM WIT ASST)'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INVESTIGATIVE ASST OA'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SPEC AGT IN CHG'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INTELL RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SEIZED PROP SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INVESTIGATIVE CLK OA'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'FILE ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'TECHNCL OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PROG ASST'::text) THEN 'OTHRSPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INTELL ASST'::text) THEN 'IRS'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ICE TACTICAL OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY ICE TACTICAL OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'PROG SUPRT SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'INF RECPTNST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'ENFCMNT OPERS SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SECTOR ENFCMNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'LEAD SECTOR ENFCMNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'TECHNICAL EQUIPMENT SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY TACTICAL COMMUN OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DIR FEDL EXPORT ENFCMNT COORDNTN CENTR'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY PROG SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY PROG ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INVESTIGATIVE ANALYST'::text) THEN 'LESUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY FOIA/PRIVACY ACT SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DIR INTELL'::text) THEN 'IRS'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEP ASST DIR INTEL'::text) THEN 'IRS'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY INTELL OPERS SPECLST'::text) THEN 'IRS'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEP DIR, INTERNATIONAL AFFAIRS'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DIR INTERPOL WASH'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'SUPVY CRIM INVSTGR (OPERS CH)'::text) THEN 'CI'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'DEPRTN LIASN OFFCR'::text) THEN 'DO'::text
              WHEN (a."POSITION_OFFICIAL_TITLE" = 'IMMIGRATN OFFCR'::text) THEN 'LEOTHR'::text
              ELSE a."TITLE GROUP"
          END AS "tableau_TG",
          CASE
              WHEN (a."POSITION_SUPERVISORY_CODE" = '2.0'::text) THEN '2'::text
              WHEN (a."POSITION_SUPERVISORY_CODE" = '7.0'::text) THEN '7'::text
              WHEN (a."POSITION_SUPERVISORY_CODE" = '8.0'::text) THEN '8'::text
              WHEN (a."POSITION_SUPERVISORY_CODE" = '3.0'::text) THEN '3'::text
              WHEN (a."POSITION_SUPERVISORY_CODE" = '5.0'::text) THEN '5'::text
              WHEN (a."POSITION_SUPERVISORY_CODE" = '6.0'::text) THEN '6'::text
              ELSE a."POSITION_SUPERVISORY_CODE"
          END AS tableau_position_supervisory_code,
          CASE
              WHEN (a."GRADE" = '0.0'::text) THEN '0'::text
              WHEN (a."GRADE" = '11.0'::text) THEN '11'::text
              WHEN (a."GRADE" = '15.0'::text) THEN '15'::text
              WHEN (a."GRADE" = '8.0'::text) THEN '8'::text
              WHEN (a."GRADE" = '3.0'::text) THEN '3'::text
              WHEN (a."GRADE" = '4.0'::text) THEN '4'::text
              WHEN (a."GRADE" = '2.0'::text) THEN '2'::text
              WHEN (a."GRADE" = '7.0'::text) THEN '7'::text
              WHEN (a."GRADE" = '14.0'::text) THEN '14'::text
              WHEN (a."GRADE" = '9.0'::text) THEN '9'::text
              WHEN (a."GRADE" = '12.0'::text) THEN '12'::text
              WHEN (a."GRADE" = '10.0'::text) THEN '10'::text
              WHEN (a."GRADE" = '5.0'::text) THEN '5'::text
              WHEN (a."GRADE" = '13.0'::text) THEN '13'::text
              WHEN (a."GRADE" = '6.0'::text) THEN '6'::text
              ELSE a."GRADE"
          END AS tableau_grade,
          CASE
              WHEN ((a."DUTY CITY" = 'LORDS VALLEY'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'ATLANTA'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'CHICAGO'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'PASCO'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'STOCKTON'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'HOUMA'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'BLUE ASH'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'NEW YORK -QUEENS'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'GREAT FALLS'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'SAN ANGELO'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'KAILUA KONA'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'IDAHO FALLS'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'SALISBURY'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'CHARLESTON NAVAL CX'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'SALT LAKE CITY'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'FARMVILLE'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'LOUISVILLE'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'BOSTON'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'FT MYERS'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'CHEYENNE'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'GRAND ISLAND'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'ROSWELL'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'HOULTON'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'LITTLE ROCK'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'WINSTON SALEM'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'ATLANTIC CITY'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'KANSAS CITY'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'ANCHORAGE'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'FARGO'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'MESA'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'WASHINGTON'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'SAINT ALBANS'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'DURANGO'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'CHATTANOOGA'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'DETROIT'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'GADSDEN'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'OKMULGEE'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'DULUTH'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'HARTFORD'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'MEDFORD'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'GULFPORT'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'PORTSMOUTH'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'MADISON'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'FORT WAYNE'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'SIOUX FALLS'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'RENO'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'CHARLESTON'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'WICHITA'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'DOVER'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'WARWICK'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'SIOUX CITY'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              ELSE a."DUTY STATE"
          END AS cxo_state,
          CASE
              WHEN ((a."DUTY CITY" = 'FRANKFURT'::text) AND (a."CONUS" = 'N'::text)) THEN 'GERMANY'::text
              WHEN ((a."DUTY CITY" = 'MANAMA'::text) AND (a."CONUS" = 'N'::text)) THEN 'BAHRAIN'::text
              WHEN ((a."DUTY CITY" = 'KINGSTON'::text) AND (a."CONUS" = 'N'::text)) THEN 'JAMAICA'::text
              WHEN ((a."DUTY CITY" = 'AGUADILLA'::text) AND (a."CONUS" = 'N'::text)) THEN 'PUERTO RICO'::text
              WHEN ((a."DUTY CITY" = 'SAN JUAN'::text) AND (a."CONUS" = 'N'::text)) THEN 'PUERTO RICO'::text
              WHEN ((a."DUTY CITY" = 'CASABLANCA'::text) AND (a."CONUS" = 'N'::text)) THEN 'MOROCCO'::text
              WHEN ((a."DUTY CITY" = 'STUTTGART'::text) AND (a."CONUS" = 'N'::text)) THEN 'GERMANY'::text
              WHEN ((a."DUTY CITY" = 'LONDON'::text) AND (a."CONUS" = 'N'::text)) THEN 'UNITED KINGDOM'::text
              WHEN ((a."DUTY CITY" = 'JERUSALEM'::text) AND (a."CONUS" = 'N'::text)) THEN 'ISRAEL'::text
              WHEN ((a."DUTY CITY" = 'BRASILIA'::text) AND (a."CONUS" = 'N'::text)) THEN 'BRAZIL'::text
              WHEN ((a."DUTY CITY" = 'NEW DELHI'::text) AND (a."CONUS" = 'N'::text)) THEN 'INDIA'::text
              WHEN ((a."DUTY CITY" = 'WARSAW'::text) AND (a."CONUS" = 'N'::text)) THEN 'POLAND'::text
              WHEN ((a."DUTY CITY" = 'GUANGZHOU'::text) AND (a."CONUS" = 'N'::text)) THEN 'CHINA'::text
              WHEN ((a."DUTY CITY" = 'PORT-AU-PRINCE'::text) AND (a."CONUS" = 'N'::text)) THEN 'HAITI'::text
              WHEN ((a."DUTY CITY" = 'MANILA'::text) AND (a."CONUS" = 'N'::text)) THEN 'PHILIPPINES'::text
              WHEN ((a."DUTY CITY" = 'DUBAI'::text) AND (a."CONUS" = 'N'::text)) THEN 'UNITED ARAB EMIRATES'::text
              WHEN ((a."DUTY CITY" = 'MUSCAT'::text) AND (a."CONUS" = 'N'::text)) THEN 'OMAN'::text
              WHEN ((a."DUTY CITY" = 'MAYAGUEZ'::text) AND (a."CONUS" = 'N'::text)) THEN 'PUERTO RICO'::text
              WHEN ((a."DUTY CITY" = 'ISLAMABAD'::text) AND (a."CONUS" = 'N'::text)) THEN 'PAKISTAN'::text
              WHEN ((a."DUTY CITY" = 'HERMOSILLO'::text) AND (a."CONUS" = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."DUTY CITY" = 'SANTO DOMINGO'::text) AND (a."CONUS" = 'N'::text)) THEN 'DOMINICAN REPUBLIC'::text
              WHEN ((a."DUTY CITY" = 'GUATEMALA'::text) AND (a."CONUS" = 'N'::text)) THEN 'GUATEMALA'::text
              WHEN ((a."DUTY CITY" = 'BOGOTA'::text) AND (a."CONUS" = 'N'::text)) THEN 'COLOMBIA'::text
              WHEN ((a."DUTY CITY" = 'BRIDGETOWN'::text) AND (a."CONUS" = 'N'::text)) THEN 'BARBADOS'::text
              WHEN ((a."DUTY CITY" = 'ANTWERP'::text) AND (a."CONUS" = 'N'::text)) THEN 'BELGIUM'::text
              WHEN ((a."DUTY CITY" = 'PARIS'::text) AND (a."CONUS" = 'N'::text)) THEN 'FRANCE'::text
              WHEN ((a."DUTY CITY" = 'MATAMOROS'::text) AND (a."CONUS" = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."DUTY CITY" = 'BANGKOK'::text) AND (a."CONUS" = 'N'::text)) THEN 'THAILAND'::text
              WHEN ((a."DUTY CITY" = 'SAN SALVADOR'::text) AND (a."CONUS" = 'N'::text)) THEN 'EL SALVADOR'::text
              WHEN ((a."DUTY CITY" = 'MONTREAL, QUEBEC'::text) AND (a."CONUS" = 'N'::text)) THEN 'CANADA'::text
              WHEN ((a."DUTY CITY" = 'PHNOM PENH'::text) AND (a."CONUS" = 'N'::text)) THEN 'KAMPUCHEA'::text
              WHEN ((a."DUTY CITY" = 'JIDDA'::text) AND (a."CONUS" = 'N'::text)) THEN 'SAUDI ARABIA'::text
              WHEN ((a."DUTY CITY" = 'CANBERRA'::text) AND (a."CONUS" = 'N'::text)) THEN 'AUSTRALIA'::text
              WHEN ((a."DUTY CITY" = 'NAIROBI'::text) AND (a."CONUS" = 'N'::text)) THEN 'KENYA'::text
              WHEN ((a."DUTY CITY" = 'VANCOUVER, B.C.'::text) AND (a."CONUS" = 'N'::text)) THEN 'CANADA'::text
              WHEN ((a."DUTY CITY" = 'ROME'::text) AND (a."CONUS" = 'N'::text)) THEN 'ITALY'::text
              WHEN ((a."DUTY CITY" = 'AGANA'::text) AND (a."CONUS" = 'N'::text)) THEN 'GUAM'::text
              WHEN ((a."DUTY CITY" = 'OTTAWA, ONTARIO'::text) AND (a."CONUS" = 'N'::text)) THEN 'CANADA'::text
              WHEN ((a."DUTY CITY" = 'CIUDAD JUAREZ'::text) AND (a."CONUS" = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."DUTY CITY" = 'CARTEGENA'::text) AND (a."CONUS" = 'N'::text)) THEN 'COLOMBIA'::text
              WHEN ((a."DUTY CITY" = 'VIENNA'::text) AND (a."CONUS" = 'N'::text)) THEN 'AUSTRIA'::text
              WHEN ((a."DUTY CITY" = 'TORONTO, ONTARIO'::text) AND (a."CONUS" = 'N'::text)) THEN 'CANADA'::text
              WHEN ((a."DUTY CITY" = 'MEXICO CITY'::text) AND (a."CONUS" = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."DUTY CITY" = 'MAITE'::text) AND (a."CONUS" = 'N'::text)) THEN 'GUAM'::text
              WHEN ((a."DUTY CITY" = 'TEGUCIGALPA'::text) AND (a."CONUS" = 'N'::text)) THEN 'HONDURAS'::text
              WHEN ((a."DUTY CITY" = 'ATHENS'::text) AND (a."CONUS" = 'N'::text)) THEN 'GREECE'::text
              WHEN ((a."DUTY CITY" = 'SINGAPORE'::text) AND (a."CONUS" = 'N'::text)) THEN 'SINGAPORE'::text
              WHEN ((a."DUTY CITY" = 'HANOI'::text) AND (a."CONUS" = 'N'::text)) THEN 'VIETNAM'::text
              WHEN ((a."DUTY CITY" = 'DOHA'::text) AND (a."CONUS" = 'N'::text)) THEN 'QATAR'::text
              WHEN ((a."DUTY CITY" = 'DHAHRAN'::text) AND (a."CONUS" = 'N'::text)) THEN 'SAUDI ARABIA'::text
              WHEN ((a."DUTY CITY" = 'ABU DHABI'::text) AND (a."CONUS" = 'N'::text)) THEN 'UNITED ARAB EMIRATES'::text
              WHEN ((a."DUTY CITY" = 'FAJARDO'::text) AND (a."CONUS" = 'N'::text)) THEN 'PUERTO RICO'::text
              WHEN ((a."DUTY CITY" = 'TAMUNING'::text) AND (a."CONUS" = 'N'::text)) THEN 'GUAM'::text
              WHEN ((a."DUTY CITY" = 'MONTERREY'::text) AND (a."CONUS" = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."DUTY CITY" = 'ANKARA'::text) AND (a."CONUS" = 'N'::text)) THEN 'TURKEY'::text
              WHEN ((a."DUTY CITY" = 'BRUSSELS'::text) AND (a."CONUS" = 'N'::text)) THEN 'BELGIUM'::text
              WHEN ((a."DUTY CITY" = 'TIJUANA'::text) AND (a."CONUS" = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."DUTY CITY" = 'PONCE'::text) AND (a."CONUS" = 'N'::text)) THEN 'PUERTO RICO'::text
              WHEN ((a."DUTY CITY" = 'MANAGUA'::text) AND (a."CONUS" = 'N'::text)) THEN 'NICARAGUA'::text
              WHEN ((a."DUTY CITY" = 'CAIRO'::text) AND (a."CONUS" = 'N'::text)) THEN 'EGYPT'::text
              WHEN ((a."DUTY CITY" = 'KUALA LUMPUR'::text) AND (a."CONUS" = 'N'::text)) THEN 'MALAYSIA'::text
              WHEN ((a."DUTY CITY" = 'LYON'::text) AND (a."CONUS" = 'N'::text)) THEN 'FRANCE'::text
              WHEN ((a."DUTY CITY" = 'TEL AVIV'::text) AND (a."CONUS" = 'N'::text)) THEN 'ISRAEL'::text
              WHEN ((a."DUTY CITY" = 'PRETORIA'::text) AND (a."CONUS" = 'N'::text)) THEN 'SOUTH AFRICA'::text
              WHEN ((a."DUTY CITY" = 'QUITO'::text) AND (a."CONUS" = 'N'::text)) THEN 'ECUADOR'::text
              WHEN ((a."DUTY CITY" = 'BUENOS AIRES'::text) AND (a."CONUS" = 'N'::text)) THEN 'ARGENTINA'::text
              WHEN ((a."DUTY CITY" = 'NASSAU'::text) AND (a."CONUS" = 'N'::text)) THEN 'THE BAHAMAS'::text
              WHEN ((a."DUTY CITY" = 'GUADALAJARA'::text) AND (a."CONUS" = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."DUTY CITY" = 'SEOUL'::text) AND (a."CONUS" = 'N'::text)) THEN 'KOREA, REPUBLIC OF'::text
              WHEN ((a."DUTY CITY" = 'RIYADH'::text) AND (a."CONUS" = 'N'::text)) THEN 'SAUDI ARABIA'::text
              WHEN ((a."DUTY CITY" = 'SAIPAN'::text) AND (a."CONUS" = 'N'::text)) THEN 'NORTHERN MARIANA ISL'::text
              WHEN ((a."DUTY CITY" = 'ST THOMAS'::text) AND (a."CONUS" = 'N'::text)) THEN 'VIRGIN ISLANDS, U.S.'::text
              WHEN ((a."DUTY CITY" = 'AMMAN'::text) AND (a."CONUS" = 'N'::text)) THEN 'JORDAN'::text
              WHEN ((a."DUTY CITY" = 'HO CH MINH CITY'::text) AND (a."CONUS" = 'N'::text)) THEN 'VIETNAM'::text
              WHEN ((a."DUTY CITY" = 'ST CROIX'::text) AND (a."CONUS" = 'N'::text)) THEN 'VIRGIN ISLANDS, U.S.'::text
              WHEN ((a."DUTY CITY" = 'HAVANA'::text) AND (a."CONUS" = 'N'::text)) THEN 'CUBA'::text
              WHEN ((a."DUTY CITY" = 'LIMA'::text) AND (a."CONUS" = 'N'::text)) THEN 'PERU'::text
              WHEN ((a."DUTY CITY" = 'CHARLOTTE AMALIE'::text) AND (a."CONUS" = 'N'::text)) THEN 'VIRGIN ISLANDS, U.S.'::text
              WHEN ((a."DUTY CITY" = 'JAKARTA, JAVA'::text) AND (a."CONUS" = 'N'::text)) THEN 'INDONESIA'::text
              WHEN ((a."DUTY CITY" = 'CALGARY, ALBERTA'::text) AND (a."CONUS" = 'N'::text)) THEN 'CANADA'::text
              WHEN ((a."DUTY CITY" = 'THE HAGUE'::text) AND (a."CONUS" = 'N'::text)) THEN 'NETHERLANDS'::text
              WHEN ((a."DUTY CITY" = 'PANAMA'::text) AND (a."CONUS" = 'N'::text)) THEN 'PANAMA'::text
              WHEN ((a."DUTY CITY" = 'HONG KONG'::text) AND (a."CONUS" = 'N'::text)) THEN 'HONG KONG'::text
              WHEN ((a."DUTY CITY" = 'BEIJING'::text) AND (a."CONUS" = 'N'::text)) THEN 'CHINA'::text
              WHEN ((a."DUTY CITY" = 'MADRID'::text) AND (a."CONUS" = 'N'::text)) THEN 'SPAIN'::text
              WHEN ((a."DUTY CITY" = 'DAKAR'::text) AND (a."CONUS" = 'N'::text)) THEN 'SENEGAL'::text
              ELSE 'United States'::text
          END AS cxo_country
     FROM public.cxo_nfc_tops_archive_v4 a
    WHERE (a."PML on board" = 'Y'::text)
    ORDER BY a.cxo_pp1;
;

CREATE VIEW "public"."vcxo_retirement" AS
  SELECT a."BARGAINING_UNIT_STATUS_CD",
      a."Pay Period End Date",
      a."Person ID",
      a."Name",
      a."RNO Cd",
      a."RNO cd nm",
      a."Handicap",
      a."Service Years",
      a."Age",
      a."Pay Plan",
      a."Grade",
      a."Step",
      a."Series",
      a."Title",
      a."Birth",
      a."BirthYear",
      a."WGI DATE",
      a."SCD WGI YMD",
      a."RET PGM",
      a."Duty City",
      a."Duty State_Abbr",
      a."Duty State",
      a."Residence State/Country Abbr",
      a."Veterans Preference RIF",
      a."Hourly Rate",
      a."Performance Evalunation Yr",
      a."Early Retirement Eligible Yr",
      a."Performance Evaluation Cd",
      a."Employment Status",
      a."Veterans Status",
      a."Entered Present Grade",
      a."1st Eligibility Date Early",
      a."Optional Eligible Retirement Plan",
      a."Veterans Preference",
      a."Mandatory Eligible Retirement Yr",
      a."Optional Eligible Retirement Yr",
      a."Retirement Type & Plan Current",
      a."Retirement Eligibility Current",
      a."Series Name",
      a."FED Retirement Eligibility",
      a."EOD",
      a."Pay Rate Determinant",
      a."SCD CSR",
      a."LWOP Retirement RIF",
      a."TITLE GROUP",
      a."CODE",
      a."SCD LV",
      a."Organization Cd",
      a."CONUS",
      a."SUPVY",
      a."Sex Cd",
      a.filename,
      a.cxo_pp1,
      a."1st Eligibility Date Optional",
      a.cxo_fy,
      a."DIR",
      a."BUD",
      a."OFFICE",
      a."ORG",
      a."ORG TEXT",
      a."SERIES",
      a."PML on board",
      a."LAW ENF",
      a.ingested_at,
      c.numeric_grouping,
      c.performance_evaluation_cd_tableau,
          CASE
              WHEN (a."Grade" = '0.0'::text) THEN '0'::text
              WHEN (a."Grade" = '11.0'::text) THEN '11'::text
              WHEN (a."Grade" = '15.0'::text) THEN '15'::text
              WHEN (a."Grade" = '8.0'::text) THEN '8'::text
              WHEN (a."Grade" = '3.0'::text) THEN '3'::text
              WHEN (a."Grade" = '4.0'::text) THEN '4'::text
              WHEN (a."Grade" = '2.0'::text) THEN '2'::text
              WHEN (a."Grade" = '7.0'::text) THEN '7'::text
              WHEN (a."Grade" = '14.0'::text) THEN '14'::text
              WHEN (a."Grade" = '9.0'::text) THEN '9'::text
              WHEN (a."Grade" = '12.0'::text) THEN '12'::text
              WHEN (a."Grade" = '10.0'::text) THEN '10'::text
              WHEN (a."Grade" = '5.0'::text) THEN '5'::text
              WHEN (a."Grade" = '13.0'::text) THEN '13'::text
              WHEN (a."Grade" = '6.0'::text) THEN '6'::text
              ELSE a."Grade"
          END AS tableau_grade,
          CASE
              WHEN (a."Title" = 'DEP DIR ICE'::text) THEN 'CI'::text
              WHEN (a."Title" = 'CHIEF OF STAFF'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'MGMT & PROG ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'DEP CH OF STAFF'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SPECIAL ADVISOR (PROTOCOL & SPEC EVTS)'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SPECIAL ADVISOR (PROTOCOL& SPEC EVTS)'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'PROG MGR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'MSN SUPT SPECL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'ASSISTANT EXEC SEC'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'WRI EDIT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ASST DIR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'CONGRSNL LIASN SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY CONGRSNL LIASN OFCR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SPEC ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY PUBLIC AFF SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'PUBLIC AFF SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'MISSION SUPPORT SPECIALIST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY MGMT & PROG ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'VIS INF SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'AUDIO VIS PRODN SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY AUDIO VIS PRODN SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ASST DIR DIVERSITY & CIVIL RIGHTS'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'EQ EMPLMT SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'CLK'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'EQ EMPLMT MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY POLICY ADVISOR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'PLCY ADVSR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY EQ EMPLMT SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY EQ OPP SPEC'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'POLICY ADVSR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY CRIM INVSTGR'::text) THEN 'CI'::text
              WHEN (a."Title" = 'CRIM INVSTGR'::text) THEN 'CI'::text
              WHEN (a."Title" = 'EQUIP SPECLST ORDNC'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPP TECHNCN OA'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY GEN ENGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ENGRG TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'LAW ENFORCEMENT PROG. MGR.'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'DEPRTN OFFCR (COURSE DEVLP/INSTR)'::text) THEN 'DO'::text
              WHEN (a."Title" = 'TRAINING SPEC (FIREARMS)'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'FIREARMS PGRM SPCLST'::text) THEN 'LEOTHR'::text
              WHEN (a."Title" = 'TRNG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'CRIMINAL INVESTIGATOR (INSTRUCTOR)'::text) THEN 'CI'::text
              WHEN (a."Title" = 'DETNTN & DEPORTATN OFFCR'::text) THEN 'DO'::text
              WHEN (a."Title" = 'SUPVY DETNTN & DEPORTATN OFFCR'::text) THEN 'DO'::text
              WHEN (a."Title" = 'FACIL OPERS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY COMMUNITY RELATIONS OFFCR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'COMMUNITY RELATIONS OFFCR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SENIOR ADVSR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'DEP CHIEF OF STAFF'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'STAFF ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'BUDG ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'REGULATORY AND POLICY ANALYST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'ECONMST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'PLCY ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY REGULATORY ANALYST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY PLCY ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'ECONOMIST (CHIEF)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'CH OF STAFF'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY MSN SUPT SPECL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'INSTRUCTNL SYS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY INSTRUCTNL SYS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'PROG MGR (LRNG MGMT)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'TRNG INSTRU'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY INSTRUCTIONAL SPECIALIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'MISSION SUPRT ASST OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY TRNG INSTRU'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'DEPUTY CHIEF HUMAN CAPITAL OFFICER'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'CHIEF HUMAN CAPITAL OFFICER'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'HUMAN RESOURCES SPECLST (COMPEN)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SENIOR HUMAN RESOURCES ADVISOR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY STRATEGIC ADVSR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY HUMAN RESOURCES SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'HUMAN RESOURCES SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'HUMAN RESOURCES ASST OA'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY HUMAN RESOURCES SPECLST (EMPL BE'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'HUMAN RESOURCES SPECLST (RECRUIT&PLAC)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY HUMAN RESOURCES SPECLST (RECRUIT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY HUMAN RESOURCES SPECLST (CLASSIF'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'HUMAN RESOURCES SPECLST (CLASSIFN)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'PRE-EMPLOYMENT SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'PRE EMPLOYMENT ASST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'STUD TR (HUMAN RESOURCES)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY HR SPECLST (EMPL & LABOR REL)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY HR SPECLST (EMPL &LABOR REL)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'HUMAN RESOURCES SPECLST (LABOR REL)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY HUMAN RESOURCES SPECLST (LABOR R'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'LEAD HUMAN RESOURCES SPECLST (EMPL REL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY HUMAN RESOURCES SPECLST (EMPL RE'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'HR SPECLST (CLASSIFN RECRUIT & PLAC)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY PHYSICIAN'::text) THEN 'MED'::text
              WHEN (a."Title" = 'PHYSICIAN'::text) THEN 'MED'::text
              WHEN (a."Title" = 'OCCUPTL HLTH NURSE'::text) THEN 'MED'::text
              WHEN (a."Title" = 'DRUG PROG COORD'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'HUMAN RESOURCES SPECLST (EMPL BENES)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'BEHAVIORAL HLTH SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'EMP ASSTNC PROG MGR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY PSYCH'::text) THEN 'MED'::text
              WHEN (a."Title" = 'CHAPLAIN DIR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'PERS RES PSYCH'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY PERS RESEARCH PSYCH'::text) THEN 'MED'::text
              WHEN (a."Title" = 'MGMT INF ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY HUMAN RESOURCES SPECLST (INFO SY'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ADMV OFFCR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY ADMV OFFCR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'CIVILIAN PAY TECHNCN OA'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY HUMAN RESOURCES SPECLST (COMPEN)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ASST DIR INF GOVERNANCE'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'RECS AND INFO MGMT SPEC'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'OPER RES ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'PRIVACY OFFICER'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'MGMT & PRO ANAL (PRIVACY COMPLIANCE)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SR INFO GOV ANALYST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'GOVNMNT INFO SPEC (PRIVACY COMPLIANCE)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'MGMT & PROG ANAL (BUDG & COR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'MGMT & PROG ANAL (BUDG &COR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY RECORDS & INFORMATION MGMT SPECI'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'PARALEGAL SPECLST (FOIA/PA)'::text) THEN 'LGLSUPT'::text
              WHEN (a."Title" = 'PARALEGAL SPECLST'::text) THEN 'LGLSUPT'::text
              WHEN (a."Title" = 'FOIA/PA ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY PARALEGAL SPECLST'::text) THEN 'LGLSUPT'::text
              WHEN (a."Title" = 'SUPVY PARALEGAL SPECLST (FOIA/PA)'::text) THEN 'LGLSUPT'::text
              WHEN (a."Title" = 'PARALEGAL SPECLST (FOIA)'::text) THEN 'LGLSUPT'::text
              WHEN (a."Title" = 'FREEDOM OF INFORMATION ACT DIRECTOR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'DEPUTY DIRECTOR FOIA'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'GEN ENGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ITSPEC (INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'OPERATIONS RESEARCH ANALYST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'DEP PRINC LEG ADVSR'::text) THEN 'ATTY'::text
              WHEN (a."Title" = 'DEP PRIN LEGAL ADVSR MANAGEMENT'::text) THEN 'ATTY'::text
              WHEN (a."Title" = 'PRINCIPAL LEGAL ADVISOR FOR ICE'::text) THEN 'ATTY'::text
              WHEN (a."Title" = 'SUPVY GEN ATTY'::text) THEN 'ATTY'::text
              WHEN (a."Title" = 'GEN ATTY'::text) THEN 'ATTY'::text
              WHEN (a."Title" = 'ATTY ADVSR'::text) THEN 'ATTY'::text
              WHEN (a."Title" = 'ASSOC DEP PRINC LEG ADVSR'::text) THEN 'ATTY'::text
              WHEN (a."Title" = 'PARALEGAL SPECIALIST (OPLA)'::text) THEN 'LGLSUPT'::text
              WHEN (a."Title" = 'DEP PRINC LEGAL ADVSR HEADQUARTES'::text) THEN 'ATTY'::text
              WHEN (a."Title" = 'HISTRN'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'LIBRN LAW'::text) THEN 'LGLSUPT'::text
              WHEN (a."Title" = 'LEG ASST OA'::text) THEN 'LGLSUPT'::text
              WHEN (a."Title" = 'SUPVY GEN ATTY (ETHICS)'::text) THEN 'ATTY'::text
              WHEN (a."Title" = 'GEN ATTY (ETHCIS)'::text) THEN 'ATTY'::text
              WHEN (a."Title" = 'MAIL & FILE CLK OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'LEAD LEG ASST'::text) THEN 'LGLSUPT'::text
              WHEN (a."Title" = 'CHIEF COUNSEL'::text) THEN 'ATTY'::text
              WHEN (a."Title" = 'LAW CLK'::text) THEN 'LGLSUPT'::text
              WHEN (a."Title" = 'SUPVY LEG ASST OA'::text) THEN 'LGLSUPT'::text
              WHEN (a."Title" = 'TRIAL ATTY'::text) THEN 'ATTY'::text
              WHEN (a."Title" = 'STUD TR (LEG ASST) OA'::text) THEN 'LGLSUPT'::text
              WHEN (a."Title" = 'ENFORCEMENT PROGRAMS MGR'::text) THEN 'LEOTHR'::text
              WHEN (a."Title" = 'ASST DIR ENFCMNT & REMOVAL OPS'::text) THEN 'DO'::text
              WHEN (a."Title" = 'DEP ASST DIR FLD OPERS'::text) THEN 'DO'::text
              WHEN (a."Title" = 'INTEL RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."Title" = 'EMERGENCY MANAGEMENT SPECIALIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY EMERGENCY MANAGEMENT SPECIALIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'STATCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'DEPUTY ASSISTANT DIRECTOR ERO'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'MGMT & PROG ANAL (DET SVCS MGR)'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'DEPRTN OFFCR (COMP STDS OFFCR)'::text) THEN 'DO'::text
              WHEN (a."Title" = 'ASST DIR SECURE COMMUNITIES'::text) THEN 'DO'::text
              WHEN (a."Title" = 'CRIM TARGETING SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY CRIM TARGETING SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'DEPRTN OFFCR'::text) THEN 'DO'::text
              WHEN (a."Title" = 'LAW ENFCMNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY LAW ENFCMNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'ASST DIR ICE SRVCS HLTH CORPS'::text) THEN 'MED'::text
              WHEN (a."Title" = 'HEALTH SYSTEMS SPECIALIST'::text) THEN 'MED'::text
              WHEN (a."Title" = 'SUPVY PHYSCN (PSYCHTRC)'::text) THEN 'MED'::text
              WHEN (a."Title" = 'PHYSICIAN (CLINICAL DIRECTOR)'::text) THEN 'MED'::text
              WHEN (a."Title" = 'PHYSICIAN (PSYCHIATRY)'::text) THEN 'MED'::text
              WHEN (a."Title" = 'MEDCL OFFCR'::text) THEN 'MED'::text
              WHEN (a."Title" = 'PHYSCN (GEN PRACTICE)'::text) THEN 'MED'::text
              WHEN (a."Title" = 'PHYSICIAN (REG CLINICAL DIR)'::text) THEN 'MED'::text
              WHEN (a."Title" = 'PHYSICIAN (CONSULTANT)'::text) THEN 'MED'::text
              WHEN (a."Title" = 'PHYSICIAN (DAD/MED DIRECTOR)'::text) THEN 'MED'::text
              WHEN (a."Title" = 'CLNCL NURSE'::text) THEN 'MED'::text
              WHEN (a."Title" = 'SUPVY HEALTH SYSTEM SPECIALIST'::text) THEN 'MED'::text
              WHEN (a."Title" = 'PRACTICAL NURSE'::text) THEN 'MED'::text
              WHEN (a."Title" = 'NURSE PRACTITIONER'::text) THEN 'MED'::text
              WHEN (a."Title" = 'MEDCL REC TECHNCN'::text) THEN 'MED'::text
              WHEN (a."Title" = 'DNTL HYGIENIST'::text) THEN 'MED'::text
              WHEN (a."Title" = 'SUPVY WRI EDIT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SECY OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'ADV PRAC NURSE (NURSE PRACTITIONER)'::text) THEN 'MED'::text
              WHEN (a."Title" = 'DIAGNSTC RADIOLOGIC TECHNCN'::text) THEN 'MED'::text
              WHEN (a."Title" = 'DNTL ASST'::text) THEN 'MED'::text
              WHEN (a."Title" = 'PHYSCN ASST'::text) THEN 'MED'::text
              WHEN (a."Title" = 'CLNCL PSYCH'::text) THEN 'MED'::text
              WHEN (a."Title" = 'SOC WRKR'::text) THEN 'MED'::text
              WHEN (a."Title" = 'ADVANCE NURSE PRAC'::text) THEN 'MED'::text
              WHEN (a."Title" = 'MATHCL STATCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY ENFCMNT & RMVL ASST OA'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'STUD TR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'TRAFF MGMT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'TRNG TECHNCN OA'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPP TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPP TECHNCN (INVENT)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'BOND CNTL SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY BOND SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'LAW ENFCMNT TECHNCN'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'ADMV ASST OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'RECR SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'MGMT ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'IMMGRTN ENF AGT'::text) THEN 'DO'::text
              WHEN (a."Title" = 'FOOD SRVS SPEC'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'AUTMTV MECH'::text) THEN 'WGSUPT'::text
              WHEN (a."Title" = 'LAW ENFCMNT COMMUN ASST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY MSN SUPT SPECL (COTR)'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'MTRLS HNDLR'::text) THEN 'WGSUPT'::text
              WHEN (a."Title" = 'OFF AUTOMATION ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'INVENT MGMT SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ELCTRON TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'OFF AUTOMATION CLK'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'MGMT PROG TECHNCN OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'ASST DIR OFF OF ACQ'::text) THEN 'CONT'::text
              WHEN (a."Title" = 'PROCUR ANAL'::text) THEN 'CONT'::text
              WHEN (a."Title" = 'DEBARMENT ANAL (SENIOR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'DEBARMENT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'CONTR SPECLST'::text) THEN 'CONT'::text
              WHEN (a."Title" = 'SUPVY CONTR SPECLST'::text) THEN 'CONT'::text
              WHEN (a."Title" = 'SUPVY DEBARMENT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'EXEC ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'PROCUR & BUS RESOURCES MGMT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY PROCUR & BUS RESOURCES MGT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SR PROCUR & BUS RESOURCES MGMT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SR PROCUR & BUS RESOURCESMGMT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'BUS OPERS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'DEP ASSOC DIRECTOR OPR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ASSOC DIR OPR'::text) THEN 'CI'::text
              WHEN (a."Title" = 'MGMT & PROG ANAL (SR PROG ADVSR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'MGMT & PROG ANAL (SR PROGADVSR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ASST DIR INVST OPR'::text) THEN 'CI'::text
              WHEN (a."Title" = 'OVERSIGHT ADM (PREA)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'INVESTIGATIVE ANALYST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'OPERTNL ANALS SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY INSIDER THREAT OPERTNL ANAL'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'INTELL RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."Title" = 'OPERATIONAL ANALYSIS SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'SUPVY INTEL RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."TITLE" = 'TECHNCL ENFCMNT OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."TITLE" = 'SUPVY TECHNCL ENFCMNT OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."TITLE" = 'SUPVY INTELL & INFO SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'INSIDER THREAT SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'MGMT & PROG ANALYST (PROG ADVSR)'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'INVESTIGATIVE PROGRAM OFFICER'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'DIV DIRINSPR & DETENTION OVERSIGHT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY INSPS & COMPLNC MGR'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'INSPS & COMPLNC SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY INSPS & COMPLC SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY SUPV ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY INSPS & COMPLNC SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY SECUR SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'PERS SECUR SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY PERS SECUR SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SECUR SPECLST (POLYGRAPH EXAMNR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY SECUR SPECLST (POLYGRAPH EXMNR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'PHYS SECUR SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SECUR SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SECUR INSPR'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'CHIEF INFORMATION OFFICER'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'DEP CHIEF INFORMATION OFFICER'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'SUPVY IT SPEC (ENTACH/INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'COMMUNICATIONS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ITSPEC (PLCYPLN)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'SUPVY ITSPEC (SYSANALYSIS)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'IT PROJ MGR'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'ITSPEC (SYSADMIN)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'SUPVY ITSPEC (INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'ITSPEC'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'SUPVY ITSPEC (APPSW/INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'LEAD ITSPEC (INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'ITSPEC (DATAMGT)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'ITSPEC (SYSANALYSIS)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'SUPVY ITSPEC (PLCYPLN)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'ITSPEC (CUSTSPT)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'ITSPEC (NETWORK)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'SUPVY ITSPEC (CUSTSPT)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'LEAD ITSPEC (NETWORK)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'LEAD ITSPEC (CUSTSPT)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'SUPVY ITSPEC (NETWORK)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'SUPVY BUS OPERS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'DEPUTY CHIEF FINANCIAL OFFICER'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'CHIEF FINANCIAL OFCR (ICE)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPV ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'LEAD MGMT & PROG ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'LEAD FNANCL PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'FNANCL PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'FIN PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'DIR BUDGET & PROGRAM PERFORMANCE'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY BUDG ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'PROGRAM MANAGEMENT SPECIALIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SAFETY & OCCUPTL HLTH SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY INDL HYGIENIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SAFETY & OCCUPTL HLTH MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'NURSE CONSULTANT'::text) THEN 'MED'::text
              WHEN (a."Title" = 'MAIL & FILE ASST (OA)'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SPACE MGMT SUPRT SPECL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ARCH'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'LEASE ADMIN PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SPACE MGMT SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'PROG MGR (FACILITIES)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'BLDG MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'FACIL PROG MGR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'UTIL SYS RPRER OPERTR'::text) THEN 'WGSUPT'::text
              WHEN (a."Title" = 'DIR OF FNANCL MGMT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY FNANCL PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY SYS ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'MISSION SUPRT SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'LEAD ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SYS ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY FNANCL SYS MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'FINANCIAL SYSTEMS MANAGER'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'FINANCIL MGMT SYSTEMS ANAL (TEAM LEAD)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY FNANCL BUS INTEG MANAGER'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ACCTG TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY MGMT INF ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY FNANCL ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'LEAD ACCTG TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'FNANCL MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ACCNT (TAX)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'DEPUTY DIRECTOR INVESTIGATIONS'::text) THEN 'CI'::text
              WHEN (a."Title" = 'ASST DIR OFFICE OF INVESTIGATIONS'::text) THEN 'CI'::text
              WHEN (a."Title" = 'AUDR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'DEP ASST DIR INVEST'::text) THEN 'CI'::text
              WHEN (a."Title" = 'INTELL OPERS SPECLST'::text) THEN 'IRS'::text
              WHEN (a."Title" = 'CRIM RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."Title" = 'PAROLE PROG SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'ASSET FORFEIT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY SOC SCI PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SOC SCI PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'INTELL OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY INTELL OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY FORENSIC DOCMT EXAMN'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'FORENSIC DOCMT EXAMNR'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'FNGRPRNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'PHOTOGR (FORENSIC)'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SR. DIG MULTIMEDIA FORENSIC ANALYST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SEIZED PROPERTY SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY FNGRPRNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY FORENSIC DOCMT EXAMNR'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'PHYS SCNTST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'EMER PREPAREDNESS SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SEVP APPEALS ADJUDR'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'COUNTERTERRORISM INTELL SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SEVP FLD REPR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY SEVP FLD REPR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SEVP ADJUDR'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY SEVP ADJUDR'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'EXECUTIVE DIRECTOR LEIS'::text) THEN 'CI'::text
              WHEN (a."Title" = 'CYBER OPERS OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'COMPR FORENSIC ANAL'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'CRIM INVSTGR (NATL PROG MGR)'::text) THEN 'CI'::text
              WHEN (a."Title" = 'TACTICAL COMMUN OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."Title" = 'TELECOMMUN SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SOC SCI PROG SPEC (VICTIM WIT ASST)'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'INVESTIGATIVE ASST OA'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SPEC AGT IN CHG'::text) THEN 'CI'::text
              WHEN (a."Title" = 'SUPVY INTELL RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."Title" = 'SEIZED PROP SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'INVESTIGATIVE CLK OA'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'FILE ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'TECHNCL OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'PROG ASST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'INTELL ASST'::text) THEN 'IRS'::text
              WHEN (a."Title" = 'ICE TACTICAL OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."Title" = 'SUPVY ICE TACTICAL OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."Title" = 'PROG SUPRT SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'INF RECPTNST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'ENFCMNT OPERS SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SECTOR ENFCMNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'LEAD SECTOR ENFCMNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'TECHNICAL EQUIPMENT SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY TACTICAL COMMUN OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'DIR FEDL EXPORT ENFCMNT COORDNTN CENTR'::text) THEN 'CI'::text
              WHEN (a."Title" = 'SUPVY PROG SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY PROG ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY INVESTIGATIVE ANALYST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY FOIA/PRIVACY ACT SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'DIR INTELL'::text) THEN 'IRS'::text
              WHEN (a."Title" = 'DEP ASST DIR INTEL'::text) THEN 'IRS'::text
              WHEN (a."Title" = 'SUPVY INTELL OPERS SPECLST'::text) THEN 'IRS'::text
              WHEN (a."Title" = 'DEP DIR, INTERNATIONAL AFFAIRS'::text) THEN 'CI'::text
              WHEN (a."Title" = 'DIR INTERPOL WASH'::text) THEN 'CI'::text
              WHEN (a."Title" = 'SUPVY CRIM INVSTGR (OPERS CH)'::text) THEN 'CI'::text
              WHEN (a."Title" = 'DEPRTN LIASN OFFCR'::text) THEN 'DO'::text
              WHEN (a."Title" = 'IMMIGRATN OFFCR'::text) THEN 'LEOTHR'::text
              ELSE NULL::text
          END AS tableau_title_group,
          CASE
              WHEN ((a."Duty City" = 'LORDS VALLEY'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'ATLANTA'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'CHICAGO'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'PASCO'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'STOCKTON'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'HOUMA'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'BLUE ASH'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'NEW YORK -QUEENS'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'GREAT FALLS'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'SAN ANGELO'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'KAILUA KONA'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'IDAHO FALLS'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'SALISBURY'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'CHARLESTON NAVAL CX'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'SALT LAKE CITY'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'FARMVILLE'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'LOUISVILLE'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'BOSTON'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'FT MYERS'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'CHEYENNE'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'GRAND ISLAND'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'ROSWELL'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'HOULTON'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'LITTLE ROCK'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'WINSTON SALEM'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'ATLANTIC CITY'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'KANSAS CITY'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'ANCHORAGE'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'FARGO'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'MESA'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'WASHINGTON'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'SAINT ALBANS'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'DURANGO'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'CHATTANOOGA'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'DETROIT'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'GADSDEN'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'OKMULGEE'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'DULUTH'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'HARTFORD'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'MEDFORD'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'GULFPORT'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'PORTSMOUTH'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'MADISON'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'FORT WAYNE'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'SIOUX FALLS'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'RENO'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'CHARLESTON'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'WICHITA'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'DOVER'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'WARWICK'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'SIOUX CITY'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              ELSE a."Duty State"
          END AS cxo_state,
          CASE
              WHEN ((a."Duty City" = 'FRANKFURT'::text) AND (a."CONUS" = 'N'::text)) THEN 'GERMANY'::text
              WHEN ((a."Duty City" = 'MANAMA'::text) AND (a."CONUS" = 'N'::text)) THEN 'BAHRAIN'::text
              WHEN ((a."Duty City" = 'KINGSTON'::text) AND (a."CONUS" = 'N'::text)) THEN 'JAMAICA'::text
              WHEN ((a."Duty City" = 'AGUADILLA'::text) AND (a."CONUS" = 'N'::text)) THEN 'PUERTO RICO'::text
              WHEN ((a."Duty City" = 'SAN JUAN'::text) AND (a."CONUS" = 'N'::text)) THEN 'PUERTO RICO'::text
              WHEN ((a."Duty City" = 'CASABLANCA'::text) AND (a."CONUS" = 'N'::text)) THEN 'MOROCCO'::text
              WHEN ((a."Duty City" = 'STUTTGART'::text) AND (a."CONUS" = 'N'::text)) THEN 'GERMANY'::text
              WHEN ((a."Duty City" = 'LONDON'::text) AND (a."CONUS" = 'N'::text)) THEN 'UNITED KINGDOM'::text
              WHEN ((a."Duty City" = 'JERUSALEM'::text) AND (a."CONUS" = 'N'::text)) THEN 'ISRAEL'::text
              WHEN ((a."Duty City" = 'BRASILIA'::text) AND (a."CONUS" = 'N'::text)) THEN 'BRAZIL'::text
              WHEN ((a."Duty City" = 'NEW DELHI'::text) AND (a."CONUS" = 'N'::text)) THEN 'INDIA'::text
              WHEN ((a."Duty City" = 'WARSAW'::text) AND (a."CONUS" = 'N'::text)) THEN 'POLAND'::text
              WHEN ((a."Duty City" = 'GUANGZHOU'::text) AND (a."CONUS" = 'N'::text)) THEN 'CHINA'::text
              WHEN ((a."Duty City" = 'PORT-AU-PRINCE'::text) AND (a."CONUS" = 'N'::text)) THEN 'HAITI'::text
              WHEN ((a."Duty City" = 'MANILA'::text) AND (a."CONUS" = 'N'::text)) THEN 'PHILIPPINES'::text
              WHEN ((a."Duty City" = 'DUBAI'::text) AND (a."CONUS" = 'N'::text)) THEN 'UNITED ARAB EMIRATES'::text
              WHEN ((a."Duty City" = 'MUSCAT'::text) AND (a."CONUS" = 'N'::text)) THEN 'OMAN'::text
              WHEN ((a."Duty City" = 'MAYAGUEZ'::text) AND (a."CONUS" = 'N'::text)) THEN 'PUERTO RICO'::text
              WHEN ((a."Duty City" = 'ISLAMABAD'::text) AND (a."CONUS" = 'N'::text)) THEN 'PAKISTAN'::text
              WHEN ((a."Duty City" = 'HERMOSILLO'::text) AND (a."CONUS" = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."Duty City" = 'SANTO DOMINGO'::text) AND (a."CONUS" = 'N'::text)) THEN 'DOMINICAN REPUBLIC'::text
              WHEN ((a."Duty City" = 'GUATEMALA'::text) AND (a."CONUS" = 'N'::text)) THEN 'GUATEMALA'::text
              WHEN ((a."Duty City" = 'BOGOTA'::text) AND (a."CONUS" = 'N'::text)) THEN 'COLOMBIA'::text
              WHEN ((a."Duty City" = 'BRIDGETOWN'::text) AND (a."CONUS" = 'N'::text)) THEN 'BARBADOS'::text
              WHEN ((a."Duty City" = 'ANTWERP'::text) AND (a."CONUS" = 'N'::text)) THEN 'BELGIUM'::text
              WHEN ((a."Duty City" = 'PARIS'::text) AND (a."CONUS" = 'N'::text)) THEN 'FRANCE'::text
              WHEN ((a."Duty City" = 'MATAMOROS'::text) AND (a."CONUS" = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."Duty City" = 'BANGKOK'::text) AND (a."CONUS" = 'N'::text)) THEN 'THAILAND'::text
              WHEN ((a."Duty City" = 'SAN SALVADOR'::text) AND (a."CONUS" = 'N'::text)) THEN 'EL SALVADOR'::text
              WHEN ((a."Duty City" = 'MONTREAL, QUEBEC'::text) AND (a."CONUS" = 'N'::text)) THEN 'CANADA'::text
              WHEN ((a."Duty City" = 'PHNOM PENH'::text) AND (a."CONUS" = 'N'::text)) THEN 'KAMPUCHEA'::text
              WHEN ((a."Duty City" = 'JIDDA'::text) AND (a."CONUS" = 'N'::text)) THEN 'SAUDI ARABIA'::text
              WHEN ((a."Duty City" = 'CANBERRA'::text) AND (a."CONUS" = 'N'::text)) THEN 'AUSTRALIA'::text
              WHEN ((a."Duty City" = 'NAIROBI'::text) AND (a."CONUS" = 'N'::text)) THEN 'KENYA'::text
              WHEN ((a."Duty City" = 'VANCOUVER, B.C.'::text) AND (a."CONUS" = 'N'::text)) THEN 'CANADA'::text
              WHEN ((a."Duty City" = 'ROME'::text) AND (a."CONUS" = 'N'::text)) THEN 'ITALY'::text
              WHEN ((a."Duty City" = 'AGANA'::text) AND (a."CONUS" = 'N'::text)) THEN 'GUAM'::text
              WHEN ((a."Duty City" = 'OTTAWA, ONTARIO'::text) AND (a."CONUS" = 'N'::text)) THEN 'CANADA'::text
              WHEN ((a."Duty City" = 'CIUDAD JUAREZ'::text) AND (a."CONUS" = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."Duty City" = 'CARTEGENA'::text) AND (a."CONUS" = 'N'::text)) THEN 'COLOMBIA'::text
              WHEN ((a."Duty City" = 'VIENNA'::text) AND (a."CONUS" = 'N'::text)) THEN 'AUSTRIA'::text
              WHEN ((a."Duty City" = 'TORONTO, ONTARIO'::text) AND (a."CONUS" = 'N'::text)) THEN 'CANADA'::text
              WHEN ((a."Duty City" = 'MEXICO CITY'::text) AND (a."CONUS" = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."Duty City" = 'MAITE'::text) AND (a."CONUS" = 'N'::text)) THEN 'GUAM'::text
              WHEN ((a."Duty City" = 'TEGUCIGALPA'::text) AND (a."CONUS" = 'N'::text)) THEN 'HONDURAS'::text
              WHEN ((a."Duty City" = 'ATHENS'::text) AND (a."CONUS" = 'N'::text)) THEN 'GREECE'::text
              WHEN ((a."Duty City" = 'SINGAPORE'::text) AND (a."CONUS" = 'N'::text)) THEN 'SINGAPORE'::text
              WHEN ((a."Duty City" = 'HANOI'::text) AND (a."CONUS" = 'N'::text)) THEN 'VIETNAM'::text
              WHEN ((a."Duty City" = 'DOHA'::text) AND (a."CONUS" = 'N'::text)) THEN 'QATAR'::text
              WHEN ((a."Duty City" = 'DHAHRAN'::text) AND (a."CONUS" = 'N'::text)) THEN 'SAUDI ARABIA'::text
              WHEN ((a."Duty City" = 'ABU DHABI'::text) AND (a."CONUS" = 'N'::text)) THEN 'UNITED ARAB EMIRATES'::text
              WHEN ((a."Duty City" = 'FAJARDO'::text) AND (a."CONUS" = 'N'::text)) THEN 'PUERTO RICO'::text
              WHEN ((a."Duty City" = 'TAMUNING'::text) AND (a."CONUS" = 'N'::text)) THEN 'GUAM'::text
              WHEN ((a."Duty City" = 'MONTERREY'::text) AND (a."CONUS" = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."Duty City" = 'ANKARA'::text) AND (a."CONUS" = 'N'::text)) THEN 'TURKEY'::text
              WHEN ((a."Duty City" = 'BRUSSELS'::text) AND (a."CONUS" = 'N'::text)) THEN 'BELGIUM'::text
              WHEN ((a."Duty City" = 'TIJUANA'::text) AND (a."CONUS" = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."Duty City" = 'PONCE'::text) AND (a."CONUS" = 'N'::text)) THEN 'PUERTO RICO'::text
              WHEN ((a."Duty City" = 'MANAGUA'::text) AND (a."CONUS" = 'N'::text)) THEN 'NICARAGUA'::text
              WHEN ((a."Duty City" = 'CAIRO'::text) AND (a."CONUS" = 'N'::text)) THEN 'EGYPT'::text
              WHEN ((a."Duty City" = 'KUALA LUMPUR'::text) AND (a."CONUS" = 'N'::text)) THEN 'MALAYSIA'::text
              WHEN ((a."Duty City" = 'LYON'::text) AND (a."CONUS" = 'N'::text)) THEN 'FRANCE'::text
              WHEN ((a."Duty City" = 'TEL AVIV'::text) AND (a."CONUS" = 'N'::text)) THEN 'ISRAEL'::text
              WHEN ((a."Duty City" = 'PRETORIA'::text) AND (a."CONUS" = 'N'::text)) THEN 'SOUTH AFRICA'::text
              WHEN ((a."Duty City" = 'QUITO'::text) AND (a."CONUS" = 'N'::text)) THEN 'ECUADOR'::text
              WHEN ((a."Duty City" = 'BUENOS AIRES'::text) AND (a."CONUS" = 'N'::text)) THEN 'ARGENTINA'::text
              WHEN ((a."Duty City" = 'NASSAU'::text) AND (a."CONUS" = 'N'::text)) THEN 'THE BAHAMAS'::text
              WHEN ((a."Duty City" = 'GUADALAJARA'::text) AND (a."CONUS" = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."Duty City" = 'SEOUL'::text) AND (a."CONUS" = 'N'::text)) THEN 'KOREA, REPUBLIC OF'::text
              WHEN ((a."Duty City" = 'RIYADH'::text) AND (a."CONUS" = 'N'::text)) THEN 'SAUDI ARABIA'::text
              WHEN ((a."Duty City" = 'SAIPAN'::text) AND (a."CONUS" = 'N'::text)) THEN 'NORTHERN MARIANA ISL'::text
              WHEN ((a."Duty City" = 'ST THOMAS'::text) AND (a."CONUS" = 'N'::text)) THEN 'VIRGIN ISLANDS, U.S.'::text
              WHEN ((a."Duty City" = 'AMMAN'::text) AND (a."CONUS" = 'N'::text)) THEN 'JORDAN'::text
              WHEN ((a."Duty City" = 'HO CH MINH CITY'::text) AND (a."CONUS" = 'N'::text)) THEN 'VIETNAM'::text
              WHEN ((a."Duty City" = 'ST CROIX'::text) AND (a."CONUS" = 'N'::text)) THEN 'VIRGIN ISLANDS, U.S.'::text
              WHEN ((a."Duty City" = 'HAVANA'::text) AND (a."CONUS" = 'N'::text)) THEN 'CUBA'::text
              WHEN ((a."Duty City" = 'LIMA'::text) AND (a."CONUS" = 'N'::text)) THEN 'PERU'::text
              WHEN ((a."Duty City" = 'CHARLOTTE AMALIE'::text) AND (a."CONUS" = 'N'::text)) THEN 'VIRGIN ISLANDS, U.S.'::text
              WHEN ((a."Duty City" = 'JAKARTA, JAVA'::text) AND (a."CONUS" = 'N'::text)) THEN 'INDONESIA'::text
              WHEN ((a."Duty City" = 'CALGARY, ALBERTA'::text) AND (a."CONUS" = 'N'::text)) THEN 'CANADA'::text
              WHEN ((a."Duty City" = 'THE HAGUE'::text) AND (a."CONUS" = 'N'::text)) THEN 'NETHERLANDS'::text
              WHEN ((a."Duty City" = 'PANAMA'::text) AND (a."CONUS" = 'N'::text)) THEN 'PANAMA'::text
              WHEN ((a."Duty City" = 'HONG KONG'::text) AND (a."CONUS" = 'N'::text)) THEN 'HONG KONG'::text
              WHEN ((a."Duty City" = 'BEIJING'::text) AND (a."CONUS" = 'N'::text)) THEN 'CHINA'::text
              WHEN ((a."Duty City" = 'MADRID'::text) AND (a."CONUS" = 'N'::text)) THEN 'SPAIN'::text
              WHEN ((a."Duty City" = 'DAKAR'::text) AND (a."CONUS" = 'N'::text)) THEN 'SENEGAL'::text
              ELSE 'United States'::text
          END AS cxo_country
     FROM (public.cxo_cpro_archive_v2 a
       LEFT JOIN public.performance_crosswalk c ON ((a."Performance Evaluation Cd" = c."Performance Evaluation Cd")))
    WHERE (a."PML on board" = 'Y'::text)
    ORDER BY a.cxo_pp1
;

CREATE VIEW "public"."vcxo_rno" AS
  SELECT a."Pay Period End Date",
      a."OFFICIAL_TITLE",
      a."Person ID",
      a."Name",
      a."RNO Cd",
      a."RNO cd nm",
      a."Handicap",
      a."Service Years",
      a."Age_x",
      a."Pay Plan",
      a."Grade",
      a."Step",
      a."Title",
      a."CONUS",
      a."WGI DATE",
      a."SCD WGI YMD",
      a."RET PGM",
      a."DUTY CITY",
      a."DUTY STATE",
      a."Duty State_Abbr",
      a."Residence State/Country Abbr",
      a."Veterans Preference RIF",
      a."Hourly Rate",
      a."Performance Evalunation Yr",
      a."Early Retirement Eligible Yr",
      a."Performance Evaluation Cd",
      a."Employment Status",
      a."Veterans Status",
      a."Entered Present Grade",
      a."1st Eligibility Date Early",
      a."Optional Eligible Retirement Plan",
      a."Veterans Preference",
      a."Mandatory Eligible Retirement Yr",
      a."Optional Eligible Retirement Yr",
      a."Retirement Type & Plan Current",
      a."Retirement Eligibility Current",
      a."Series Name",
      a."FED Retirement Eligibility",
      a."EOD",
      a."Pay Rate Determinant",
      a."SCD CSR",
      a."LWOP Retirement RIF",
      a."TITLE GROUP",
      a."CODE",
      a."SCD LV",
      a."Organization Cd",
      a."SUPVY",
      a."Sex Cd",
      a.filename,
      a.cxo_pp1,
      a."1st Eligibility Date Optional",
      a.cxo_fy,
      a."DIR",
      a."BUD",
      a."OFFICE",
      a."ORG",
      a."ORG TEXT",
      a."PML on board",
      a."LAW ENF",
      a."Pos Supv Cd",
      a."OPM Race",
      a."BARGAINING_UNIT_STATUS_CD",
      a.ingested_at,
      c.numeric_grouping,
      c.performance_evaluation_cd_tableau,
          CASE
              WHEN (a."OPM Race" IS NOT NULL) THEN a."OPM Race"
              ELSE a."RNO cd nm"
          END AS cxo_opm_race,
          CASE
              WHEN (a."Title" = 'DEP DIR ICE'::text) THEN 'CI'::text
              WHEN (a."Title" = 'CHIEF OF STAFF'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'MGMT & PROG ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'DEP CH OF STAFF'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SPECIAL ADVISOR (PROTOCOL & SPEC EVTS)'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SPECIAL ADVISOR (PROTOCOL& SPEC EVTS)'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'PROG MGR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'MSN SUPT SPECL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'ASSISTANT EXEC SEC'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'WRI EDIT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ASST DIR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'CONGRSNL LIASN SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY CONGRSNL LIASN OFCR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SPEC ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY PUBLIC AFF SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'PUBLIC AFF SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'MISSION SUPPORT SPECIALIST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY MGMT & PROG ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'VIS INF SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'AUDIO VIS PRODN SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY AUDIO VIS PRODN SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ASST DIR DIVERSITY & CIVIL RIGHTS'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'EQ EMPLMT SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'CLK'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'EQ EMPLMT MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY POLICY ADVISOR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'PLCY ADVSR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY EQ EMPLMT SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY EQ OPP SPEC'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'POLICY ADVSR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY CRIM INVSTGR'::text) THEN 'CI'::text
              WHEN (a."Title" = 'CRIM INVSTGR'::text) THEN 'CI'::text
              WHEN (a."Title" = 'EQUIP SPECLST ORDNC'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPP TECHNCN OA'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY GEN ENGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ENGRG TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'LAW ENFORCEMENT PROG. MGR.'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'DEPRTN OFFCR (COURSE DEVLP/INSTR)'::text) THEN 'DO'::text
              WHEN (a."Title" = 'TRAINING SPEC (FIREARMS)'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'FIREARMS PGRM SPCLST'::text) THEN 'LEOTHR'::text
              WHEN (a."Title" = 'TRNG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'CRIMINAL INVESTIGATOR (INSTRUCTOR)'::text) THEN 'CI'::text
              WHEN (a."Title" = 'DETNTN & DEPORTATN OFFCR'::text) THEN 'DO'::text
              WHEN (a."Title" = 'SUPVY DETNTN & DEPORTATN OFFCR'::text) THEN 'DO'::text
              WHEN (a."Title" = 'FACIL OPERS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY COMMUNITY RELATIONS OFFCR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'COMMUNITY RELATIONS OFFCR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SENIOR ADVSR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'DEP CHIEF OF STAFF'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'STAFF ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'BUDG ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'REGULATORY AND POLICY ANALYST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'ECONMST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'PLCY ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY REGULATORY ANALYST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY PLCY ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'ECONOMIST (CHIEF)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'CH OF STAFF'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY MSN SUPT SPECL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'INSTRUCTNL SYS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY INSTRUCTNL SYS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'PROG MGR (LRNG MGMT)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'TRNG INSTRU'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY INSTRUCTIONAL SPECIALIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'MISSION SUPRT ASST OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY TRNG INSTRU'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'DEPUTY CHIEF HUMAN CAPITAL OFFICER'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'CHIEF HUMAN CAPITAL OFFICER'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'HUMAN RESOURCES SPECLST (COMPEN)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SENIOR HUMAN RESOURCES ADVISOR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY STRATEGIC ADVSR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY HUMAN RESOURCES SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'HUMAN RESOURCES SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'HUMAN RESOURCES ASST OA'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY HUMAN RESOURCES SPECLST (EMPL BE'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'HUMAN RESOURCES SPECLST (RECRUIT&PLAC)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY HUMAN RESOURCES SPECLST (RECRUIT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY HUMAN RESOURCES SPECLST (CLASSIF'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'HUMAN RESOURCES SPECLST (CLASSIFN)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'PRE-EMPLOYMENT SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'PRE EMPLOYMENT ASST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'STUD TR (HUMAN RESOURCES)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY HR SPECLST (EMPL & LABOR REL)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY HR SPECLST (EMPL &LABOR REL)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'HUMAN RESOURCES SPECLST (LABOR REL)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY HUMAN RESOURCES SPECLST (LABOR R'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'LEAD HUMAN RESOURCES SPECLST (EMPL REL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY HUMAN RESOURCES SPECLST (EMPL RE'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'HR SPECLST (CLASSIFN RECRUIT & PLAC)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY PHYSICIAN'::text) THEN 'MED'::text
              WHEN (a."Title" = 'PHYSICIAN'::text) THEN 'MED'::text
              WHEN (a."Title" = 'OCCUPTL HLTH NURSE'::text) THEN 'MED'::text
              WHEN (a."Title" = 'DRUG PROG COORD'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'HUMAN RESOURCES SPECLST (EMPL BENES)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'BEHAVIORAL HLTH SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'EMP ASSTNC PROG MGR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY PSYCH'::text) THEN 'MED'::text
              WHEN (a."Title" = 'CHAPLAIN DIR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'PERS RES PSYCH'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY PERS RESEARCH PSYCH'::text) THEN 'MED'::text
              WHEN (a."Title" = 'MGMT INF ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY HUMAN RESOURCES SPECLST (INFO SY'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ADMV OFFCR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY ADMV OFFCR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'CIVILIAN PAY TECHNCN OA'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY HUMAN RESOURCES SPECLST (COMPEN)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ASST DIR INF GOVERNANCE'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'RECS AND INFO MGMT SPEC'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'OPER RES ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'PRIVACY OFFICER'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'MGMT & PRO ANAL (PRIVACY COMPLIANCE)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SR INFO GOV ANALYST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'GOVNMNT INFO SPEC (PRIVACY COMPLIANCE)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'MGMT & PROG ANAL (BUDG & COR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'MGMT & PROG ANAL (BUDG &COR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY RECORDS & INFORMATION MGMT SPECI'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'PARALEGAL SPECLST (FOIA/PA)'::text) THEN 'LGLSUPT'::text
              WHEN (a."Title" = 'PARALEGAL SPECLST'::text) THEN 'LGLSUPT'::text
              WHEN (a."Title" = 'FOIA/PA ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY PARALEGAL SPECLST'::text) THEN 'LGLSUPT'::text
              WHEN (a."Title" = 'SUPVY PARALEGAL SPECLST (FOIA/PA)'::text) THEN 'LGLSUPT'::text
              WHEN (a."Title" = 'PARALEGAL SPECLST (FOIA)'::text) THEN 'LGLSUPT'::text
              WHEN (a."Title" = 'FREEDOM OF INFORMATION ACT DIRECTOR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'DEPUTY DIRECTOR FOIA'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'GEN ENGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ITSPEC (INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'OPERATIONS RESEARCH ANALYST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'DEP PRINC LEG ADVSR'::text) THEN 'ATTY'::text
              WHEN (a."Title" = 'DEP PRIN LEGAL ADVSR MANAGEMENT'::text) THEN 'ATTY'::text
              WHEN (a."Title" = 'PRINCIPAL LEGAL ADVISOR FOR ICE'::text) THEN 'ATTY'::text
              WHEN (a."Title" = 'SUPVY GEN ATTY'::text) THEN 'ATTY'::text
              WHEN (a."Title" = 'GEN ATTY'::text) THEN 'ATTY'::text
              WHEN (a."Title" = 'ATTY ADVSR'::text) THEN 'ATTY'::text
              WHEN (a."Title" = 'ASSOC DEP PRINC LEG ADVSR'::text) THEN 'ATTY'::text
              WHEN (a."Title" = 'PARALEGAL SPECIALIST (OPLA)'::text) THEN 'LGLSUPT'::text
              WHEN (a."Title" = 'DEP PRINC LEGAL ADVSR HEADQUARTES'::text) THEN 'ATTY'::text
              WHEN (a."Title" = 'HISTRN'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'LIBRN LAW'::text) THEN 'LGLSUPT'::text
              WHEN (a."Title" = 'LEG ASST OA'::text) THEN 'LGLSUPT'::text
              WHEN (a."Title" = 'SUPVY GEN ATTY (ETHICS)'::text) THEN 'ATTY'::text
              WHEN (a."Title" = 'GEN ATTY (ETHCIS)'::text) THEN 'ATTY'::text
              WHEN (a."Title" = 'MAIL & FILE CLK OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'LEAD LEG ASST'::text) THEN 'LGLSUPT'::text
              WHEN (a."Title" = 'CHIEF COUNSEL'::text) THEN 'ATTY'::text
              WHEN (a."Title" = 'LAW CLK'::text) THEN 'LGLSUPT'::text
              WHEN (a."Title" = 'SUPVY LEG ASST OA'::text) THEN 'LGLSUPT'::text
              WHEN (a."Title" = 'TRIAL ATTY'::text) THEN 'ATTY'::text
              WHEN (a."Title" = 'STUD TR (LEG ASST) OA'::text) THEN 'LGLSUPT'::text
              WHEN (a."Title" = 'ENFORCEMENT PROGRAMS MGR'::text) THEN 'LEOTHR'::text
              WHEN (a."Title" = 'ASST DIR ENFCMNT & REMOVAL OPS'::text) THEN 'DO'::text
              WHEN (a."Title" = 'DEP ASST DIR FLD OPERS'::text) THEN 'DO'::text
              WHEN (a."Title" = 'INTEL RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."Title" = 'EMERGENCY MANAGEMENT SPECIALIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY EMERGENCY MANAGEMENT SPECIALIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'STATCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'DEPUTY ASSISTANT DIRECTOR ERO'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'MGMT & PROG ANAL (DET SVCS MGR)'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'DEPRTN OFFCR (COMP STDS OFFCR)'::text) THEN 'DO'::text
              WHEN (a."Title" = 'ASST DIR SECURE COMMUNITIES'::text) THEN 'DO'::text
              WHEN (a."Title" = 'CRIM TARGETING SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY CRIM TARGETING SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'DEPRTN OFFCR'::text) THEN 'DO'::text
              WHEN (a."Title" = 'LAW ENFCMNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY LAW ENFCMNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'ASST DIR ICE SRVCS HLTH CORPS'::text) THEN 'MED'::text
              WHEN (a."Title" = 'HEALTH SYSTEMS SPECIALIST'::text) THEN 'MED'::text
              WHEN (a."Title" = 'SUPVY PHYSCN (PSYCHTRC)'::text) THEN 'MED'::text
              WHEN (a."Title" = 'PHYSICIAN (CLINICAL DIRECTOR)'::text) THEN 'MED'::text
              WHEN (a."Title" = 'PHYSICIAN (PSYCHIATRY)'::text) THEN 'MED'::text
              WHEN (a."Title" = 'MEDCL OFFCR'::text) THEN 'MED'::text
              WHEN (a."Title" = 'PHYSCN (GEN PRACTICE)'::text) THEN 'MED'::text
              WHEN (a."Title" = 'PHYSICIAN (REG CLINICAL DIR)'::text) THEN 'MED'::text
              WHEN (a."Title" = 'PHYSICIAN (CONSULTANT)'::text) THEN 'MED'::text
              WHEN (a."Title" = 'PHYSICIAN (DAD/MED DIRECTOR)'::text) THEN 'MED'::text
              WHEN (a."Title" = 'CLNCL NURSE'::text) THEN 'MED'::text
              WHEN (a."Title" = 'SUPVY HEALTH SYSTEM SPECIALIST'::text) THEN 'MED'::text
              WHEN (a."Title" = 'PRACTICAL NURSE'::text) THEN 'MED'::text
              WHEN (a."Title" = 'NURSE PRACTITIONER'::text) THEN 'MED'::text
              WHEN (a."Title" = 'MEDCL REC TECHNCN'::text) THEN 'MED'::text
              WHEN (a."Title" = 'DNTL HYGIENIST'::text) THEN 'MED'::text
              WHEN (a."Title" = 'SUPVY WRI EDIT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SECY OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'ADV PRAC NURSE (NURSE PRACTITIONER)'::text) THEN 'MED'::text
              WHEN (a."Title" = 'DIAGNSTC RADIOLOGIC TECHNCN'::text) THEN 'MED'::text
              WHEN (a."Title" = 'DNTL ASST'::text) THEN 'MED'::text
              WHEN (a."Title" = 'PHYSCN ASST'::text) THEN 'MED'::text
              WHEN (a."Title" = 'CLNCL PSYCH'::text) THEN 'MED'::text
              WHEN (a."Title" = 'SOC WRKR'::text) THEN 'MED'::text
              WHEN (a."Title" = 'ADVANCE NURSE PRAC'::text) THEN 'MED'::text
              WHEN (a."Title" = 'MATHCL STATCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY ENFCMNT & RMVL ASST OA'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'STUD TR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'TRAFF MGMT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'TRNG TECHNCN OA'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPP TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPP TECHNCN (INVENT)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'BOND CNTL SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY BOND SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'LAW ENFCMNT TECHNCN'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'ADMV ASST OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'RECR SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'MGMT ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'IMMGRTN ENF AGT'::text) THEN 'DO'::text
              WHEN (a."Title" = 'FOOD SRVS SPEC'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'AUTMTV MECH'::text) THEN 'WGSUPT'::text
              WHEN (a."Title" = 'LAW ENFCMNT COMMUN ASST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY MSN SUPT SPECL (COTR)'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'MTRLS HNDLR'::text) THEN 'WGSUPT'::text
              WHEN (a."Title" = 'OFF AUTOMATION ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'INVENT MGMT SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ELCTRON TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'OFF AUTOMATION CLK'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'MGMT PROG TECHNCN OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'ASST DIR OFF OF ACQ'::text) THEN 'CONT'::text
              WHEN (a."Title" = 'PROCUR ANAL'::text) THEN 'CONT'::text
              WHEN (a."Title" = 'DEBARMENT ANAL (SENIOR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'DEBARMENT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'CONTR SPECLST'::text) THEN 'CONT'::text
              WHEN (a."Title" = 'SUPVY CONTR SPECLST'::text) THEN 'CONT'::text
              WHEN (a."Title" = 'SUPVY DEBARMENT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'EXEC ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'PROCUR & BUS RESOURCES MGMT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY PROCUR & BUS RESOURCES MGT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SR PROCUR & BUS RESOURCES MGMT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SR PROCUR & BUS RESOURCESMGMT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'BUS OPERS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'DEP ASSOC DIRECTOR OPR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ASSOC DIR OPR'::text) THEN 'CI'::text
              WHEN (a."Title" = 'MGMT & PROG ANAL (SR PROG ADVSR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'MGMT & PROG ANAL (SR PROGADVSR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ASST DIR INVST OPR'::text) THEN 'CI'::text
              WHEN (a."Title" = 'OVERSIGHT ADM (PREA)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'INVESTIGATIVE ANALYST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'OPERTNL ANALS SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY INSIDER THREAT OPERTNL ANAL'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'INTELL RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."Title" = 'OPERATIONAL ANALYSIS SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'SUPVY INTEL RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."TITLE" = 'TECHNCL ENFCMNT OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."TITLE" = 'SUPVY TECHNCL ENFCMNT OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."TITLE" = 'SUPVY INTELL & INFO SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'INSIDER THREAT SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'MGMT & PROG ANALYST (PROG ADVSR)'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'INVESTIGATIVE PROGRAM OFFICER'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'DIV DIRINSPR & DETENTION OVERSIGHT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY INSPS & COMPLNC MGR'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'INSPS & COMPLNC SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY INSPS & COMPLC SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY SUPV ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY INSPS & COMPLNC SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY SECUR SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'PERS SECUR SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY PERS SECUR SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SECUR SPECLST (POLYGRAPH EXAMNR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY SECUR SPECLST (POLYGRAPH EXMNR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'PHYS SECUR SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SECUR SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SECUR INSPR'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'CHIEF INFORMATION OFFICER'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'DEP CHIEF INFORMATION OFFICER'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'SUPVY IT SPEC (ENTACH/INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'COMMUNICATIONS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ITSPEC (PLCYPLN)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'SUPVY ITSPEC (SYSANALYSIS)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'IT PROJ MGR'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'ITSPEC (SYSADMIN)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'SUPVY ITSPEC (INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'ITSPEC'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'SUPVY ITSPEC (APPSW/INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'LEAD ITSPEC (INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'ITSPEC (DATAMGT)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'ITSPEC (SYSANALYSIS)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'SUPVY ITSPEC (PLCYPLN)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'ITSPEC (CUSTSPT)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'ITSPEC (NETWORK)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'SUPVY ITSPEC (CUSTSPT)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'LEAD ITSPEC (NETWORK)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'LEAD ITSPEC (CUSTSPT)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'SUPVY ITSPEC (NETWORK)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'SUPVY BUS OPERS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'DEPUTY CHIEF FINANCIAL OFFICER'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'CHIEF FINANCIAL OFCR (ICE)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPV ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'LEAD MGMT & PROG ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'LEAD FNANCL PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'FNANCL PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'FIN PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'DIR BUDGET & PROGRAM PERFORMANCE'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY BUDG ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'PROGRAM MANAGEMENT SPECIALIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SAFETY & OCCUPTL HLTH SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY INDL HYGIENIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SAFETY & OCCUPTL HLTH MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'NURSE CONSULTANT'::text) THEN 'MED'::text
              WHEN (a."Title" = 'MAIL & FILE ASST (OA)'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SPACE MGMT SUPRT SPECL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ARCH'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'LEASE ADMIN PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SPACE MGMT SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'PROG MGR (FACILITIES)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'BLDG MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'FACIL PROG MGR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'UTIL SYS RPRER OPERTR'::text) THEN 'WGSUPT'::text
              WHEN (a."Title" = 'DIR OF FNANCL MGMT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY FNANCL PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY SYS ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'MISSION SUPRT SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'LEAD ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SYS ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY FNANCL SYS MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'FINANCIAL SYSTEMS MANAGER'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'FINANCIL MGMT SYSTEMS ANAL (TEAM LEAD)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY FNANCL BUS INTEG MANAGER'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ACCTG TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY MGMT INF ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY FNANCL ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'LEAD ACCTG TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'FNANCL MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ACCNT (TAX)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'DEPUTY DIRECTOR INVESTIGATIONS'::text) THEN 'CI'::text
              WHEN (a."Title" = 'ASST DIR OFFICE OF INVESTIGATIONS'::text) THEN 'CI'::text
              WHEN (a."Title" = 'AUDR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'DEP ASST DIR INVEST'::text) THEN 'CI'::text
              WHEN (a."Title" = 'INTELL OPERS SPECLST'::text) THEN 'IRS'::text
              WHEN (a."Title" = 'CRIM RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."Title" = 'PAROLE PROG SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'ASSET FORFEIT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY SOC SCI PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SOC SCI PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'INTELL OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY INTELL OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY FORENSIC DOCMT EXAMN'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'FORENSIC DOCMT EXAMNR'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'FNGRPRNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'PHOTOGR (FORENSIC)'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SR. DIG MULTIMEDIA FORENSIC ANALYST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SEIZED PROPERTY SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY FNGRPRNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY FORENSIC DOCMT EXAMNR'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'PHYS SCNTST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'EMER PREPAREDNESS SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SEVP APPEALS ADJUDR'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'COUNTERTERRORISM INTELL SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SEVP FLD REPR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY SEVP FLD REPR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SEVP ADJUDR'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY SEVP ADJUDR'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'EXECUTIVE DIRECTOR LEIS'::text) THEN 'CI'::text
              WHEN (a."Title" = 'CYBER OPERS OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'COMPR FORENSIC ANAL'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'CRIM INVSTGR (NATL PROG MGR)'::text) THEN 'CI'::text
              WHEN (a."Title" = 'TACTICAL COMMUN OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."Title" = 'TELECOMMUN SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SOC SCI PROG SPEC (VICTIM WIT ASST)'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'INVESTIGATIVE ASST OA'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SPEC AGT IN CHG'::text) THEN 'CI'::text
              WHEN (a."Title" = 'SUPVY INTELL RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."Title" = 'SEIZED PROP SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'INVESTIGATIVE CLK OA'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'FILE ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'TECHNCL OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'PROG ASST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'INTELL ASST'::text) THEN 'IRS'::text
              WHEN (a."Title" = 'ICE TACTICAL OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."Title" = 'SUPVY ICE TACTICAL OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."Title" = 'PROG SUPRT SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'INF RECPTNST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'ENFCMNT OPERS SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SECTOR ENFCMNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'LEAD SECTOR ENFCMNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'TECHNICAL EQUIPMENT SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY TACTICAL COMMUN OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'DIR FEDL EXPORT ENFCMNT COORDNTN CENTR'::text) THEN 'CI'::text
              WHEN (a."Title" = 'SUPVY PROG SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY PROG ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY INVESTIGATIVE ANALYST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY FOIA/PRIVACY ACT SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'DIR INTELL'::text) THEN 'IRS'::text
              WHEN (a."Title" = 'DEP ASST DIR INTEL'::text) THEN 'IRS'::text
              WHEN (a."Title" = 'SUPVY INTELL OPERS SPECLST'::text) THEN 'IRS'::text
              WHEN (a."Title" = 'DEP DIR, INTERNATIONAL AFFAIRS'::text) THEN 'CI'::text
              WHEN (a."Title" = 'DIR INTERPOL WASH'::text) THEN 'CI'::text
              WHEN (a."Title" = 'SUPVY CRIM INVSTGR (OPERS CH)'::text) THEN 'CI'::text
              WHEN (a."Title" = 'DEPRTN LIASN OFFCR'::text) THEN 'DO'::text
              WHEN (a."Title" = 'IMMIGRATN OFFCR'::text) THEN 'LEOTHR'::text
              ELSE a."TITLE GROUP"
          END AS tableau_title_group,
          CASE
              WHEN ((a."DUTY CITY" = 'LORDS VALLEY'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'ATLANTA'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'CHICAGO'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'PASCO'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'STOCKTON'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'HOUMA'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'BLUE ASH'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'NEW YORK -QUEENS'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'GREAT FALLS'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'SAN ANGELO'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'KAILUA KONA'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'IDAHO FALLS'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'SALISBURY'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'CHARLESTON NAVAL CX'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'SALT LAKE CITY'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'FARMVILLE'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'LOUISVILLE'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'BOSTON'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'FT MYERS'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'CHEYENNE'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'GRAND ISLAND'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'ROSWELL'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'HOULTON'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'LITTLE ROCK'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'WINSTON SALEM'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'ATLANTIC CITY'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'KANSAS CITY'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'ANCHORAGE'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'FARGO'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'MESA'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'WASHINGTON'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'SAINT ALBANS'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'DURANGO'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'CHATTANOOGA'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'DETROIT'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'GADSDEN'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'OKMULGEE'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'DULUTH'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'HARTFORD'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'MEDFORD'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'GULFPORT'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'PORTSMOUTH'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'MADISON'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'FORT WAYNE'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'SIOUX FALLS'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'RENO'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'CHARLESTON'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'WICHITA'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'DOVER'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'WARWICK'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              WHEN ((a."DUTY CITY" = 'SIOUX CITY'::text) AND (a."CONUS" = 'Y'::text)) THEN a."DUTY STATE"
              ELSE a."DUTY STATE"
          END AS cxo_state,
          CASE
              WHEN ((a."DUTY CITY" = 'FRANKFURT'::text) AND (a."CONUS" = 'N'::text)) THEN 'GERMANY'::text
              WHEN ((a."DUTY CITY" = 'MANAMA'::text) AND (a."CONUS" = 'N'::text)) THEN 'BAHRAIN'::text
              WHEN ((a."DUTY CITY" = 'KINGSTON'::text) AND (a."CONUS" = 'N'::text)) THEN 'JAMAICA'::text
              WHEN ((a."DUTY CITY" = 'AGUADILLA'::text) AND (a."CONUS" = 'N'::text)) THEN 'PUERTO RICO'::text
              WHEN ((a."DUTY CITY" = 'SAN JUAN'::text) AND (a."CONUS" = 'N'::text)) THEN 'PUERTO RICO'::text
              WHEN ((a."DUTY CITY" = 'CASABLANCA'::text) AND (a."CONUS" = 'N'::text)) THEN 'MOROCCO'::text
              WHEN ((a."DUTY CITY" = 'STUTTGART'::text) AND (a."CONUS" = 'N'::text)) THEN 'GERMANY'::text
              WHEN ((a."DUTY CITY" = 'LONDON'::text) AND (a."CONUS" = 'N'::text)) THEN 'UNITED KINGDOM'::text
              WHEN ((a."DUTY CITY" = 'JERUSALEM'::text) AND (a."CONUS" = 'N'::text)) THEN 'ISRAEL'::text
              WHEN ((a."DUTY CITY" = 'BRASILIA'::text) AND (a."CONUS" = 'N'::text)) THEN 'BRAZIL'::text
              WHEN ((a."DUTY CITY" = 'NEW DELHI'::text) AND (a."CONUS" = 'N'::text)) THEN 'INDIA'::text
              WHEN ((a."DUTY CITY" = 'WARSAW'::text) AND (a."CONUS" = 'N'::text)) THEN 'POLAND'::text
              WHEN ((a."DUTY CITY" = 'GUANGZHOU'::text) AND (a."CONUS" = 'N'::text)) THEN 'CHINA'::text
              WHEN ((a."DUTY CITY" = 'PORT-AU-PRINCE'::text) AND (a."CONUS" = 'N'::text)) THEN 'HAITI'::text
              WHEN ((a."DUTY CITY" = 'MANILA'::text) AND (a."CONUS" = 'N'::text)) THEN 'PHILIPPINES'::text
              WHEN ((a."DUTY CITY" = 'DUBAI'::text) AND (a."CONUS" = 'N'::text)) THEN 'UNITED ARAB EMIRATES'::text
              WHEN ((a."DUTY CITY" = 'MUSCAT'::text) AND (a."CONUS" = 'N'::text)) THEN 'OMAN'::text
              WHEN ((a."DUTY CITY" = 'MAYAGUEZ'::text) AND (a."CONUS" = 'N'::text)) THEN 'PUERTO RICO'::text
              WHEN ((a."DUTY CITY" = 'ISLAMABAD'::text) AND (a."CONUS" = 'N'::text)) THEN 'PAKISTAN'::text
              WHEN ((a."DUTY CITY" = 'HERMOSILLO'::text) AND (a."CONUS" = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."DUTY CITY" = 'SANTO DOMINGO'::text) AND (a."CONUS" = 'N'::text)) THEN 'DOMINICAN REPUBLIC'::text
              WHEN ((a."DUTY CITY" = 'GUATEMALA'::text) AND (a."CONUS" = 'N'::text)) THEN 'GUATEMALA'::text
              WHEN ((a."DUTY CITY" = 'BOGOTA'::text) AND (a."CONUS" = 'N'::text)) THEN 'COLOMBIA'::text
              WHEN ((a."DUTY CITY" = 'BRIDGETOWN'::text) AND (a."CONUS" = 'N'::text)) THEN 'BARBADOS'::text
              WHEN ((a."DUTY CITY" = 'ANTWERP'::text) AND (a."CONUS" = 'N'::text)) THEN 'BELGIUM'::text
              WHEN ((a."DUTY CITY" = 'PARIS'::text) AND (a."CONUS" = 'N'::text)) THEN 'FRANCE'::text
              WHEN ((a."DUTY CITY" = 'MATAMOROS'::text) AND (a."CONUS" = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."DUTY CITY" = 'BANGKOK'::text) AND (a."CONUS" = 'N'::text)) THEN 'THAILAND'::text
              WHEN ((a."DUTY CITY" = 'SAN SALVADOR'::text) AND (a."CONUS" = 'N'::text)) THEN 'EL SALVADOR'::text
              WHEN ((a."DUTY CITY" = 'MONTREAL, QUEBEC'::text) AND (a."CONUS" = 'N'::text)) THEN 'CANADA'::text
              WHEN ((a."DUTY CITY" = 'PHNOM PENH'::text) AND (a."CONUS" = 'N'::text)) THEN 'KAMPUCHEA'::text
              WHEN ((a."DUTY CITY" = 'JIDDA'::text) AND (a."CONUS" = 'N'::text)) THEN 'SAUDI ARABIA'::text
              WHEN ((a."DUTY CITY" = 'CANBERRA'::text) AND (a."CONUS" = 'N'::text)) THEN 'AUSTRALIA'::text
              WHEN ((a."DUTY CITY" = 'NAIROBI'::text) AND (a."CONUS" = 'N'::text)) THEN 'KENYA'::text
              WHEN ((a."DUTY CITY" = 'VANCOUVER, B.C.'::text) AND (a."CONUS" = 'N'::text)) THEN 'CANADA'::text
              WHEN ((a."DUTY CITY" = 'ROME'::text) AND (a."CONUS" = 'N'::text)) THEN 'ITALY'::text
              WHEN ((a."DUTY CITY" = 'AGANA'::text) AND (a."CONUS" = 'N'::text)) THEN 'GUAM'::text
              WHEN ((a."DUTY CITY" = 'OTTAWA, ONTARIO'::text) AND (a."CONUS" = 'N'::text)) THEN 'CANADA'::text
              WHEN ((a."DUTY CITY" = 'CIUDAD JUAREZ'::text) AND (a."CONUS" = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."DUTY CITY" = 'CARTEGENA'::text) AND (a."CONUS" = 'N'::text)) THEN 'COLOMBIA'::text
              WHEN ((a."DUTY CITY" = 'VIENNA'::text) AND (a."CONUS" = 'N'::text)) THEN 'AUSTRIA'::text
              WHEN ((a."DUTY CITY" = 'TORONTO, ONTARIO'::text) AND (a."CONUS" = 'N'::text)) THEN 'CANADA'::text
              WHEN ((a."DUTY CITY" = 'MEXICO CITY'::text) AND (a."CONUS" = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."DUTY CITY" = 'MAITE'::text) AND (a."CONUS" = 'N'::text)) THEN 'GUAM'::text
              WHEN ((a."DUTY CITY" = 'TEGUCIGALPA'::text) AND (a."CONUS" = 'N'::text)) THEN 'HONDURAS'::text
              WHEN ((a."DUTY CITY" = 'ATHENS'::text) AND (a."CONUS" = 'N'::text)) THEN 'GREECE'::text
              WHEN ((a."DUTY CITY" = 'SINGAPORE'::text) AND (a."CONUS" = 'N'::text)) THEN 'SINGAPORE'::text
              WHEN ((a."DUTY CITY" = 'HANOI'::text) AND (a."CONUS" = 'N'::text)) THEN 'VIETNAM'::text
              WHEN ((a."DUTY CITY" = 'DOHA'::text) AND (a."CONUS" = 'N'::text)) THEN 'QATAR'::text
              WHEN ((a."DUTY CITY" = 'DHAHRAN'::text) AND (a."CONUS" = 'N'::text)) THEN 'SAUDI ARABIA'::text
              WHEN ((a."DUTY CITY" = 'ABU DHABI'::text) AND (a."CONUS" = 'N'::text)) THEN 'UNITED ARAB EMIRATES'::text
              WHEN ((a."DUTY CITY" = 'FAJARDO'::text) AND (a."CONUS" = 'N'::text)) THEN 'PUERTO RICO'::text
              WHEN ((a."DUTY CITY" = 'TAMUNING'::text) AND (a."CONUS" = 'N'::text)) THEN 'GUAM'::text
              WHEN ((a."DUTY CITY" = 'MONTERREY'::text) AND (a."CONUS" = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."DUTY CITY" = 'ANKARA'::text) AND (a."CONUS" = 'N'::text)) THEN 'TURKEY'::text
              WHEN ((a."DUTY CITY" = 'BRUSSELS'::text) AND (a."CONUS" = 'N'::text)) THEN 'BELGIUM'::text
              WHEN ((a."DUTY CITY" = 'TIJUANA'::text) AND (a."CONUS" = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."DUTY CITY" = 'PONCE'::text) AND (a."CONUS" = 'N'::text)) THEN 'PUERTO RICO'::text
              WHEN ((a."DUTY CITY" = 'MANAGUA'::text) AND (a."CONUS" = 'N'::text)) THEN 'NICARAGUA'::text
              WHEN ((a."DUTY CITY" = 'CAIRO'::text) AND (a."CONUS" = 'N'::text)) THEN 'EGYPT'::text
              WHEN ((a."DUTY CITY" = 'KUALA LUMPUR'::text) AND (a."CONUS" = 'N'::text)) THEN 'MALAYSIA'::text
              WHEN ((a."DUTY CITY" = 'LYON'::text) AND (a."CONUS" = 'N'::text)) THEN 'FRANCE'::text
              WHEN ((a."DUTY CITY" = 'TEL AVIV'::text) AND (a."CONUS" = 'N'::text)) THEN 'ISRAEL'::text
              WHEN ((a."DUTY CITY" = 'PRETORIA'::text) AND (a."CONUS" = 'N'::text)) THEN 'SOUTH AFRICA'::text
              WHEN ((a."DUTY CITY" = 'QUITO'::text) AND (a."CONUS" = 'N'::text)) THEN 'ECUADOR'::text
              WHEN ((a."DUTY CITY" = 'BUENOS AIRES'::text) AND (a."CONUS" = 'N'::text)) THEN 'ARGENTINA'::text
              WHEN ((a."DUTY CITY" = 'NASSAU'::text) AND (a."CONUS" = 'N'::text)) THEN 'THE BAHAMAS'::text
              WHEN ((a."DUTY CITY" = 'GUADALAJARA'::text) AND (a."CONUS" = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."DUTY CITY" = 'SEOUL'::text) AND (a."CONUS" = 'N'::text)) THEN 'KOREA, REPUBLIC OF'::text
              WHEN ((a."DUTY CITY" = 'RIYADH'::text) AND (a."CONUS" = 'N'::text)) THEN 'SAUDI ARABIA'::text
              WHEN ((a."DUTY CITY" = 'SAIPAN'::text) AND (a."CONUS" = 'N'::text)) THEN 'NORTHERN MARIANA ISL'::text
              WHEN ((a."DUTY CITY" = 'ST THOMAS'::text) AND (a."CONUS" = 'N'::text)) THEN 'VIRGIN ISLANDS, U.S.'::text
              WHEN ((a."DUTY CITY" = 'AMMAN'::text) AND (a."CONUS" = 'N'::text)) THEN 'JORDAN'::text
              WHEN ((a."DUTY CITY" = 'HO CH MINH CITY'::text) AND (a."CONUS" = 'N'::text)) THEN 'VIETNAM'::text
              WHEN ((a."DUTY CITY" = 'ST CROIX'::text) AND (a."CONUS" = 'N'::text)) THEN 'VIRGIN ISLANDS, U.S.'::text
              WHEN ((a."DUTY CITY" = 'HAVANA'::text) AND (a."CONUS" = 'N'::text)) THEN 'CUBA'::text
              WHEN ((a."DUTY CITY" = 'LIMA'::text) AND (a."CONUS" = 'N'::text)) THEN 'PERU'::text
              WHEN ((a."DUTY CITY" = 'CHARLOTTE AMALIE'::text) AND (a."CONUS" = 'N'::text)) THEN 'VIRGIN ISLANDS, U.S.'::text
              WHEN ((a."DUTY CITY" = 'JAKARTA, JAVA'::text) AND (a."CONUS" = 'N'::text)) THEN 'INDONESIA'::text
              WHEN ((a."DUTY CITY" = 'CALGARY, ALBERTA'::text) AND (a."CONUS" = 'N'::text)) THEN 'CANADA'::text
              WHEN ((a."DUTY CITY" = 'THE HAGUE'::text) AND (a."CONUS" = 'N'::text)) THEN 'NETHERLANDS'::text
              WHEN ((a."DUTY CITY" = 'PANAMA'::text) AND (a."CONUS" = 'N'::text)) THEN 'PANAMA'::text
              WHEN ((a."DUTY CITY" = 'HONG KONG'::text) AND (a."CONUS" = 'N'::text)) THEN 'HONG KONG'::text
              WHEN ((a."DUTY CITY" = 'BEIJING'::text) AND (a."CONUS" = 'N'::text)) THEN 'CHINA'::text
              WHEN ((a."DUTY CITY" = 'MADRID'::text) AND (a."CONUS" = 'N'::text)) THEN 'SPAIN'::text
              WHEN ((a."DUTY CITY" = 'DAKAR'::text) AND (a."CONUS" = 'N'::text)) THEN 'SENEGAL'::text
              ELSE 'United States'::text
          END AS cxo_country
     FROM (public.cxo_nfc_rno_archive a
       LEFT JOIN public.performance_crosswalk c ON ((a."Performance Evaluation Cd" = c."Performance Evaluation Cd")))
    ORDER BY a.cxo_pp1
;

CREATE VIEW "public"."vcxo_t2h" AS
   SELECT cxo_t2h_archive."PAY PERIOD",
      cxo_t2h_archive."GAIN/LOSS",
      cxo_t2h_archive."OFC",
      cxo_t2h_archive."BUD",
      cxo_t2h_archive."ORG",
      cxo_t2h_archive."ORG TEXT",
      cxo_t2h_archive."NAME",
      cxo_t2h_archive."GRADE",
      cxo_t2h_archive."CAT CD",
      cxo_t2h_archive."SERIES",
      cxo_t2h_archive."TITLE",
      cxo_t2h_archive."TITLE GROUP",
      cxo_t2h_archive."INCMB EOD DT",
      cxo_t2h_archive."LEO",
      cxo_t2h_archive."DIR",
      cxo_t2h_archive."Touch Point",
      cxo_t2h_archive."SF-52 Number",
      cxo_t2h_archive."Need Validated",
      cxo_t2h_archive."SF-52 Date",
      cxo_t2h_archive."Days",
      cxo_t2h_archive."SF-52 Received Date",
      cxo_t2h_archive."PD Reviewed",
      cxo_t2h_archive."Days.1",
      cxo_t2h_archive."PD Reviewed.1",
      cxo_t2h_archive."Job Analysis End Date",
      cxo_t2h_archive."Days.2",
      cxo_t2h_archive."Job ANAlysis End Date",
      cxo_t2h_archive."Anncmt Open Date",
      cxo_t2h_archive."Days.3",
      cxo_t2h_archive."Anncmt Open Date.1",
      cxo_t2h_archive."Anncmt Closed Date",
      cxo_t2h_archive."Days.4",
      cxo_t2h_archive."Anncmt Closed Date.1",
      cxo_t2h_archive."Days.5",
      cxo_t2h_archive."Evaluate Applications",
      cxo_t2h_archive."Evaluate Applications.1",
      cxo_t2h_archive."Days.6",
      cxo_t2h_archive."Certifiate Issued Date",
      cxo_t2h_archive."Days.7",
      cxo_t2h_archive."Certifiate Issued Date.1",
      cxo_t2h_archive."Cert Returned Date",
      cxo_t2h_archive."Days.8",
      cxo_t2h_archive."Cert Returned Date.1",
      cxo_t2h_archive."Tentative Job Offer Date",
      cxo_t2h_archive."Days.9",
      cxo_t2h_archive."Tentative Job Offer Date.1",
      cxo_t2h_archive."PSU Inquiry",
      cxo_t2h_archive."Days.10",
      cxo_t2h_archive."Final PSU",
      cxo_t2h_archive."Official Offer Date",
      cxo_t2h_archive."Days.11",
      cxo_t2h_archive."Official Offer Date.1",
      cxo_t2h_archive."EOD DT",
      cxo_t2h_archive."T2H",
      cxo_t2h_archive."EOD-TJO",
      cxo_t2h_archive."EOD-OJO",
      cxo_t2h_archive."T2h Need to TJO",
      cxo_t2h_archive.filename,
      cxo_t2h_archive.ingested_at
     FROM public.cxo_t2h_archive;
;

CREATE VIEW "public"."vcxo_vet" AS
  SELECT a."BARGAINING_UNIT_STATUS_CD",
      a."Pay Period End Date",
      a."Person ID",
      a."Name",
      a."RNO Cd",
      a."RNO cd nm",
      a."Handicap",
      a."Service Years",
      a."Age",
      a."Pay Plan",
      a."Grade",
      a."Step",
      a."Series",
      a."Title",
      a."Birth",
      a."BirthYear",
      a."WGI DATE",
      a."SCD WGI YMD",
      a."RET PGM",
      a."Duty City",
      a."Duty State_Abbr",
      a."Duty State",
      a."Residence State/Country Abbr",
      a."Veterans Preference RIF",
      a."Hourly Rate",
      a."Performance Evalunation Yr",
      a."Early Retirement Eligible Yr",
      a."Performance Evaluation Cd",
      a."Employment Status",
      a."Veterans Status",
      a."Entered Present Grade",
      a."1st Eligibility Date Early",
      a."Optional Eligible Retirement Plan",
      a."Veterans Preference",
      a."Mandatory Eligible Retirement Yr",
      a."Optional Eligible Retirement Yr",
      a."Retirement Type & Plan Current",
      a."Retirement Eligibility Current",
      a."Series Name",
      a."FED Retirement Eligibility",
      a."EOD",
      a."Pay Rate Determinant",
      a."SCD CSR",
      a."LWOP Retirement RIF",
      a."TITLE GROUP",
      a."CODE",
      a."SCD LV",
      a."Organization Cd",
      a."CONUS",
      a."SUPVY",
      a."Sex Cd",
      a.filename,
      a.cxo_pp1,
      a."1st Eligibility Date Optional",
      a.cxo_fy,
      a."DIR",
      a."BUD",
      a."OFFICE",
      a."ORG",
      a."ORG TEXT",
      a."SERIES",
      a."PML on board",
      a."LAW ENF",
      a.ingested_at,
      c.numeric_grouping,
      c.performance_evaluation_cd_tableau,
          CASE
              WHEN (a."Grade" = '0.0'::text) THEN '0'::text
              WHEN (a."Grade" = '11.0'::text) THEN '11'::text
              WHEN (a."Grade" = '15.0'::text) THEN '15'::text
              WHEN (a."Grade" = '8.0'::text) THEN '8'::text
              WHEN (a."Grade" = '3.0'::text) THEN '3'::text
              WHEN (a."Grade" = '4.0'::text) THEN '4'::text
              WHEN (a."Grade" = '2.0'::text) THEN '2'::text
              WHEN (a."Grade" = '7.0'::text) THEN '7'::text
              WHEN (a."Grade" = '14.0'::text) THEN '14'::text
              WHEN (a."Grade" = '9.0'::text) THEN '9'::text
              WHEN (a."Grade" = '12.0'::text) THEN '12'::text
              WHEN (a."Grade" = '10.0'::text) THEN '10'::text
              WHEN (a."Grade" = '5.0'::text) THEN '5'::text
              WHEN (a."Grade" = '13.0'::text) THEN '13'::text
              WHEN (a."Grade" = '6.0'::text) THEN '6'::text
              ELSE a."Grade"
          END AS tableau_grade,
          CASE
              WHEN (a."Title" = 'DEP DIR ICE'::text) THEN 'CI'::text
              WHEN (a."Title" = 'CHIEF OF STAFF'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'MGMT & PROG ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'DEP CH OF STAFF'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SPECIAL ADVISOR (PROTOCOL & SPEC EVTS)'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SPECIAL ADVISOR (PROTOCOL& SPEC EVTS)'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'PROG MGR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'MSN SUPT SPECL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'ASSISTANT EXEC SEC'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'WRI EDIT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ASST DIR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'CONGRSNL LIASN SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY CONGRSNL LIASN OFCR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SPEC ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY PUBLIC AFF SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'PUBLIC AFF SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'MISSION SUPPORT SPECIALIST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY MGMT & PROG ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'VIS INF SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'AUDIO VIS PRODN SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY AUDIO VIS PRODN SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ASST DIR DIVERSITY & CIVIL RIGHTS'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'EQ EMPLMT SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'CLK'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'EQ EMPLMT MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY POLICY ADVISOR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'PLCY ADVSR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY EQ EMPLMT SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY EQ OPP SPEC'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'POLICY ADVSR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY CRIM INVSTGR'::text) THEN 'CI'::text
              WHEN (a."Title" = 'CRIM INVSTGR'::text) THEN 'CI'::text
              WHEN (a."Title" = 'EQUIP SPECLST ORDNC'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPP TECHNCN OA'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY GEN ENGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ENGRG TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'LAW ENFORCEMENT PROG. MGR.'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'DEPRTN OFFCR (COURSE DEVLP/INSTR)'::text) THEN 'DO'::text
              WHEN (a."Title" = 'TRAINING SPEC (FIREARMS)'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'FIREARMS PGRM SPCLST'::text) THEN 'LEOTHR'::text
              WHEN (a."Title" = 'TRNG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'CRIMINAL INVESTIGATOR (INSTRUCTOR)'::text) THEN 'CI'::text
              WHEN (a."Title" = 'DETNTN & DEPORTATN OFFCR'::text) THEN 'DO'::text
              WHEN (a."Title" = 'SUPVY DETNTN & DEPORTATN OFFCR'::text) THEN 'DO'::text
              WHEN (a."Title" = 'FACIL OPERS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY COMMUNITY RELATIONS OFFCR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'COMMUNITY RELATIONS OFFCR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SENIOR ADVSR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'DEP CHIEF OF STAFF'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'STAFF ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'BUDG ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'REGULATORY AND POLICY ANALYST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'ECONMST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'PLCY ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY REGULATORY ANALYST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY PLCY ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'ECONOMIST (CHIEF)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'CH OF STAFF'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY MSN SUPT SPECL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'INSTRUCTNL SYS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY INSTRUCTNL SYS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'PROG MGR (LRNG MGMT)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'TRNG INSTRU'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY INSTRUCTIONAL SPECIALIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'MISSION SUPRT ASST OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY TRNG INSTRU'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'DEPUTY CHIEF HUMAN CAPITAL OFFICER'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'CHIEF HUMAN CAPITAL OFFICER'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'HUMAN RESOURCES SPECLST (COMPEN)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SENIOR HUMAN RESOURCES ADVISOR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY STRATEGIC ADVSR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY HUMAN RESOURCES SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'HUMAN RESOURCES SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'HUMAN RESOURCES ASST OA'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY HUMAN RESOURCES SPECLST (EMPL BE'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'HUMAN RESOURCES SPECLST (RECRUIT&PLAC)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY HUMAN RESOURCES SPECLST (RECRUIT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY HUMAN RESOURCES SPECLST (CLASSIF'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'HUMAN RESOURCES SPECLST (CLASSIFN)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'PRE-EMPLOYMENT SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'PRE EMPLOYMENT ASST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'STUD TR (HUMAN RESOURCES)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY HR SPECLST (EMPL & LABOR REL)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY HR SPECLST (EMPL &LABOR REL)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'HUMAN RESOURCES SPECLST (LABOR REL)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY HUMAN RESOURCES SPECLST (LABOR R'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'LEAD HUMAN RESOURCES SPECLST (EMPL REL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY HUMAN RESOURCES SPECLST (EMPL RE'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'HR SPECLST (CLASSIFN RECRUIT & PLAC)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY PHYSICIAN'::text) THEN 'MED'::text
              WHEN (a."Title" = 'PHYSICIAN'::text) THEN 'MED'::text
              WHEN (a."Title" = 'OCCUPTL HLTH NURSE'::text) THEN 'MED'::text
              WHEN (a."Title" = 'DRUG PROG COORD'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'HUMAN RESOURCES SPECLST (EMPL BENES)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'BEHAVIORAL HLTH SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'EMP ASSTNC PROG MGR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY PSYCH'::text) THEN 'MED'::text
              WHEN (a."Title" = 'CHAPLAIN DIR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'PERS RES PSYCH'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY PERS RESEARCH PSYCH'::text) THEN 'MED'::text
              WHEN (a."Title" = 'MGMT INF ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY HUMAN RESOURCES SPECLST (INFO SY'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ADMV OFFCR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY ADMV OFFCR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'CIVILIAN PAY TECHNCN OA'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY HUMAN RESOURCES SPECLST (COMPEN)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ASST DIR INF GOVERNANCE'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'RECS AND INFO MGMT SPEC'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'OPER RES ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'PRIVACY OFFICER'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'MGMT & PRO ANAL (PRIVACY COMPLIANCE)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SR INFO GOV ANALYST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'GOVNMNT INFO SPEC (PRIVACY COMPLIANCE)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'MGMT & PROG ANAL (BUDG & COR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'MGMT & PROG ANAL (BUDG &COR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY RECORDS & INFORMATION MGMT SPECI'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'PARALEGAL SPECLST (FOIA/PA)'::text) THEN 'LGLSUPT'::text
              WHEN (a."Title" = 'PARALEGAL SPECLST'::text) THEN 'LGLSUPT'::text
              WHEN (a."Title" = 'FOIA/PA ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY PARALEGAL SPECLST'::text) THEN 'LGLSUPT'::text
              WHEN (a."Title" = 'SUPVY PARALEGAL SPECLST (FOIA/PA)'::text) THEN 'LGLSUPT'::text
              WHEN (a."Title" = 'PARALEGAL SPECLST (FOIA)'::text) THEN 'LGLSUPT'::text
              WHEN (a."Title" = 'FREEDOM OF INFORMATION ACT DIRECTOR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'DEPUTY DIRECTOR FOIA'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'GEN ENGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ITSPEC (INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'OPERATIONS RESEARCH ANALYST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'DEP PRINC LEG ADVSR'::text) THEN 'ATTY'::text
              WHEN (a."Title" = 'DEP PRIN LEGAL ADVSR MANAGEMENT'::text) THEN 'ATTY'::text
              WHEN (a."Title" = 'PRINCIPAL LEGAL ADVISOR FOR ICE'::text) THEN 'ATTY'::text
              WHEN (a."Title" = 'SUPVY GEN ATTY'::text) THEN 'ATTY'::text
              WHEN (a."Title" = 'GEN ATTY'::text) THEN 'ATTY'::text
              WHEN (a."Title" = 'ATTY ADVSR'::text) THEN 'ATTY'::text
              WHEN (a."Title" = 'ASSOC DEP PRINC LEG ADVSR'::text) THEN 'ATTY'::text
              WHEN (a."Title" = 'PARALEGAL SPECIALIST (OPLA)'::text) THEN 'LGLSUPT'::text
              WHEN (a."Title" = 'DEP PRINC LEGAL ADVSR HEADQUARTES'::text) THEN 'ATTY'::text
              WHEN (a."Title" = 'HISTRN'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'LIBRN LAW'::text) THEN 'LGLSUPT'::text
              WHEN (a."Title" = 'LEG ASST OA'::text) THEN 'LGLSUPT'::text
              WHEN (a."Title" = 'SUPVY GEN ATTY (ETHICS)'::text) THEN 'ATTY'::text
              WHEN (a."Title" = 'GEN ATTY (ETHCIS)'::text) THEN 'ATTY'::text
              WHEN (a."Title" = 'MAIL & FILE CLK OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'LEAD LEG ASST'::text) THEN 'LGLSUPT'::text
              WHEN (a."Title" = 'CHIEF COUNSEL'::text) THEN 'ATTY'::text
              WHEN (a."Title" = 'LAW CLK'::text) THEN 'LGLSUPT'::text
              WHEN (a."Title" = 'SUPVY LEG ASST OA'::text) THEN 'LGLSUPT'::text
              WHEN (a."Title" = 'TRIAL ATTY'::text) THEN 'ATTY'::text
              WHEN (a."Title" = 'STUD TR (LEG ASST) OA'::text) THEN 'LGLSUPT'::text
              WHEN (a."Title" = 'ENFORCEMENT PROGRAMS MGR'::text) THEN 'LEOTHR'::text
              WHEN (a."Title" = 'ASST DIR ENFCMNT & REMOVAL OPS'::text) THEN 'DO'::text
              WHEN (a."Title" = 'DEP ASST DIR FLD OPERS'::text) THEN 'DO'::text
              WHEN (a."Title" = 'INTEL RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."Title" = 'EMERGENCY MANAGEMENT SPECIALIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY EMERGENCY MANAGEMENT SPECIALIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'STATCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'DEPUTY ASSISTANT DIRECTOR ERO'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'MGMT & PROG ANAL (DET SVCS MGR)'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'DEPRTN OFFCR (COMP STDS OFFCR)'::text) THEN 'DO'::text
              WHEN (a."Title" = 'ASST DIR SECURE COMMUNITIES'::text) THEN 'DO'::text
              WHEN (a."Title" = 'CRIM TARGETING SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY CRIM TARGETING SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'DEPRTN OFFCR'::text) THEN 'DO'::text
              WHEN (a."Title" = 'LAW ENFCMNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY LAW ENFCMNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'ASST DIR ICE SRVCS HLTH CORPS'::text) THEN 'MED'::text
              WHEN (a."Title" = 'HEALTH SYSTEMS SPECIALIST'::text) THEN 'MED'::text
              WHEN (a."Title" = 'SUPVY PHYSCN (PSYCHTRC)'::text) THEN 'MED'::text
              WHEN (a."Title" = 'PHYSICIAN (CLINICAL DIRECTOR)'::text) THEN 'MED'::text
              WHEN (a."Title" = 'PHYSICIAN (PSYCHIATRY)'::text) THEN 'MED'::text
              WHEN (a."Title" = 'MEDCL OFFCR'::text) THEN 'MED'::text
              WHEN (a."Title" = 'PHYSCN (GEN PRACTICE)'::text) THEN 'MED'::text
              WHEN (a."Title" = 'PHYSICIAN (REG CLINICAL DIR)'::text) THEN 'MED'::text
              WHEN (a."Title" = 'PHYSICIAN (CONSULTANT)'::text) THEN 'MED'::text
              WHEN (a."Title" = 'PHYSICIAN (DAD/MED DIRECTOR)'::text) THEN 'MED'::text
              WHEN (a."Title" = 'CLNCL NURSE'::text) THEN 'MED'::text
              WHEN (a."Title" = 'SUPVY HEALTH SYSTEM SPECIALIST'::text) THEN 'MED'::text
              WHEN (a."Title" = 'PRACTICAL NURSE'::text) THEN 'MED'::text
              WHEN (a."Title" = 'NURSE PRACTITIONER'::text) THEN 'MED'::text
              WHEN (a."Title" = 'MEDCL REC TECHNCN'::text) THEN 'MED'::text
              WHEN (a."Title" = 'DNTL HYGIENIST'::text) THEN 'MED'::text
              WHEN (a."Title" = 'SUPVY WRI EDIT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SECY OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'ADV PRAC NURSE (NURSE PRACTITIONER)'::text) THEN 'MED'::text
              WHEN (a."Title" = 'DIAGNSTC RADIOLOGIC TECHNCN'::text) THEN 'MED'::text
              WHEN (a."Title" = 'DNTL ASST'::text) THEN 'MED'::text
              WHEN (a."Title" = 'PHYSCN ASST'::text) THEN 'MED'::text
              WHEN (a."Title" = 'CLNCL PSYCH'::text) THEN 'MED'::text
              WHEN (a."Title" = 'SOC WRKR'::text) THEN 'MED'::text
              WHEN (a."Title" = 'ADVANCE NURSE PRAC'::text) THEN 'MED'::text
              WHEN (a."Title" = 'MATHCL STATCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY ENFCMNT & RMVL ASST OA'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'STUD TR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'TRAFF MGMT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'TRNG TECHNCN OA'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPP TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPP TECHNCN (INVENT)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'BOND CNTL SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY BOND SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'LAW ENFCMNT TECHNCN'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'ADMV ASST OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'RECR SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'MGMT ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'IMMGRTN ENF AGT'::text) THEN 'DO'::text
              WHEN (a."Title" = 'FOOD SRVS SPEC'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'AUTMTV MECH'::text) THEN 'WGSUPT'::text
              WHEN (a."Title" = 'LAW ENFCMNT COMMUN ASST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY MSN SUPT SPECL (COTR)'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'MTRLS HNDLR'::text) THEN 'WGSUPT'::text
              WHEN (a."Title" = 'OFF AUTOMATION ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'INVENT MGMT SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ELCTRON TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'OFF AUTOMATION CLK'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'MGMT PROG TECHNCN OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'ASST DIR OFF OF ACQ'::text) THEN 'CONT'::text
              WHEN (a."Title" = 'PROCUR ANAL'::text) THEN 'CONT'::text
              WHEN (a."Title" = 'DEBARMENT ANAL (SENIOR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'DEBARMENT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'CONTR SPECLST'::text) THEN 'CONT'::text
              WHEN (a."Title" = 'SUPVY CONTR SPECLST'::text) THEN 'CONT'::text
              WHEN (a."Title" = 'SUPVY DEBARMENT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'EXEC ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'PROCUR & BUS RESOURCES MGMT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY PROCUR & BUS RESOURCES MGT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SR PROCUR & BUS RESOURCES MGMT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SR PROCUR & BUS RESOURCESMGMT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'BUS OPERS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'DEP ASSOC DIRECTOR OPR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ASSOC DIR OPR'::text) THEN 'CI'::text
              WHEN (a."Title" = 'MGMT & PROG ANAL (SR PROG ADVSR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'MGMT & PROG ANAL (SR PROGADVSR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ASST DIR INVST OPR'::text) THEN 'CI'::text
              WHEN (a."Title" = 'OVERSIGHT ADM (PREA)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'INVESTIGATIVE ANALYST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'OPERTNL ANALS SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY INSIDER THREAT OPERTNL ANAL'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'INTELL RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."Title" = 'OPERATIONAL ANALYSIS SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."TITLE" = 'SUPVY INTEL RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."TITLE" = 'TECHNCL ENFCMNT OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."TITLE" = 'SUPVY TECHNCL ENFCMNT OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."TITLE" = 'SUPVY INTELL & INFO SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'INSIDER THREAT SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'MGMT & PROG ANALYST (PROG ADVSR)'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'INVESTIGATIVE PROGRAM OFFICER'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'DIV DIRINSPR & DETENTION OVERSIGHT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY INSPS & COMPLNC MGR'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'INSPS & COMPLNC SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY INSPS & COMPLC SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY SUPV ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY INSPS & COMPLNC SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY SECUR SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'PERS SECUR SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY PERS SECUR SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SECUR SPECLST (POLYGRAPH EXAMNR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY SECUR SPECLST (POLYGRAPH EXMNR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'PHYS SECUR SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SECUR SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SECUR INSPR'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'CHIEF INFORMATION OFFICER'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'DEP CHIEF INFORMATION OFFICER'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'SUPVY IT SPEC (ENTACH/INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'COMMUNICATIONS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ITSPEC (PLCYPLN)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'SUPVY ITSPEC (SYSANALYSIS)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'IT PROJ MGR'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'ITSPEC (SYSADMIN)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'SUPVY ITSPEC (INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'ITSPEC'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'SUPVY ITSPEC (APPSW/INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'LEAD ITSPEC (INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'ITSPEC (DATAMGT)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'ITSPEC (SYSANALYSIS)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'SUPVY ITSPEC (PLCYPLN)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'ITSPEC (CUSTSPT)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'ITSPEC (NETWORK)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'SUPVY ITSPEC (CUSTSPT)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'LEAD ITSPEC (NETWORK)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'LEAD ITSPEC (CUSTSPT)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'SUPVY ITSPEC (NETWORK)'::text) THEN 'ITSPEC'::text
              WHEN (a."Title" = 'SUPVY BUS OPERS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'DEPUTY CHIEF FINANCIAL OFFICER'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'CHIEF FINANCIAL OFCR (ICE)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPV ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'LEAD MGMT & PROG ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'LEAD FNANCL PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'FNANCL PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'FIN PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'DIR BUDGET & PROGRAM PERFORMANCE'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY BUDG ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'PROGRAM MANAGEMENT SPECIALIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SAFETY & OCCUPTL HLTH SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY INDL HYGIENIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SAFETY & OCCUPTL HLTH MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'NURSE CONSULTANT'::text) THEN 'MED'::text
              WHEN (a."Title" = 'MAIL & FILE ASST (OA)'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SPACE MGMT SUPRT SPECL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ARCH'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'LEASE ADMIN PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SPACE MGMT SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'PROG MGR (FACILITIES)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'BLDG MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'FACIL PROG MGR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'UTIL SYS RPRER OPERTR'::text) THEN 'WGSUPT'::text
              WHEN (a."Title" = 'DIR OF FNANCL MGMT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY FNANCL PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY SYS ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'MISSION SUPRT SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'LEAD ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SYS ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY FNANCL SYS MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'FINANCIAL SYSTEMS MANAGER'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'FINANCIL MGMT SYSTEMS ANAL (TEAM LEAD)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY FNANCL BUS INTEG MANAGER'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ACCTG TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SUPVY MGMT INF ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY FNANCL ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'LEAD ACCTG TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'FNANCL MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'ACCNT (TAX)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'DEPUTY DIRECTOR INVESTIGATIONS'::text) THEN 'CI'::text
              WHEN (a."Title" = 'ASST DIR OFFICE OF INVESTIGATIONS'::text) THEN 'CI'::text
              WHEN (a."Title" = 'AUDR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'DEP ASST DIR INVEST'::text) THEN 'CI'::text
              WHEN (a."Title" = 'INTELL OPERS SPECLST'::text) THEN 'IRS'::text
              WHEN (a."Title" = 'CRIM RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."Title" = 'PAROLE PROG SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'ASSET FORFEIT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY SOC SCI PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'SOC SCI PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'INTELL OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY INTELL OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY FORENSIC DOCMT EXAMN'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'FORENSIC DOCMT EXAMNR'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'FNGRPRNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'PHOTOGR (FORENSIC)'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SR. DIG MULTIMEDIA FORENSIC ANALYST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SEIZED PROPERTY SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY FNGRPRNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY FORENSIC DOCMT EXAMNR'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'PHYS SCNTST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'EMER PREPAREDNESS SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SEVP APPEALS ADJUDR'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'COUNTERTERRORISM INTELL SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SEVP FLD REPR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY SEVP FLD REPR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SEVP ADJUDR'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY SEVP ADJUDR'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'EXECUTIVE DIRECTOR LEIS'::text) THEN 'CI'::text
              WHEN (a."Title" = 'CYBER OPERS OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'COMPR FORENSIC ANAL'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'CRIM INVSTGR (NATL PROG MGR)'::text) THEN 'CI'::text
              WHEN (a."Title" = 'TACTICAL COMMUN OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."Title" = 'TELECOMMUN SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SOC SCI PROG SPEC (VICTIM WIT ASST)'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'INVESTIGATIVE ASST OA'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SPEC AGT IN CHG'::text) THEN 'CI'::text
              WHEN (a."Title" = 'SUPVY INTELL RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."Title" = 'SEIZED PROP SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'INVESTIGATIVE CLK OA'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'FILE ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'TECHNCL OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'PROG ASST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Title" = 'INTELL ASST'::text) THEN 'IRS'::text
              WHEN (a."Title" = 'ICE TACTICAL OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."Title" = 'SUPVY ICE TACTICAL OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."Title" = 'PROG SUPRT SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'INF RECPTNST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'ENFCMNT OPERS SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SECTOR ENFCMNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'LEAD SECTOR ENFCMNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'TECHNICAL EQUIPMENT SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY TACTICAL COMMUN OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'DIR FEDL EXPORT ENFCMNT COORDNTN CENTR'::text) THEN 'CI'::text
              WHEN (a."Title" = 'SUPVY PROG SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY PROG ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'SUPVY INVESTIGATIVE ANALYST'::text) THEN 'LESUPT'::text
              WHEN (a."Title" = 'SUPVY FOIA/PRIVACY ACT SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Title" = 'DIR INTELL'::text) THEN 'IRS'::text
              WHEN (a."Title" = 'DEP ASST DIR INTEL'::text) THEN 'IRS'::text
              WHEN (a."Title" = 'SUPVY INTELL OPERS SPECLST'::text) THEN 'IRS'::text
              WHEN (a."Title" = 'DEP DIR, INTERNATIONAL AFFAIRS'::text) THEN 'CI'::text
              WHEN (a."Title" = 'DIR INTERPOL WASH'::text) THEN 'CI'::text
              WHEN (a."Title" = 'SUPVY CRIM INVSTGR (OPERS CH)'::text) THEN 'CI'::text
              WHEN (a."Title" = 'DEPRTN LIASN OFFCR'::text) THEN 'DO'::text
              WHEN (a."Title" = 'IMMIGRATN OFFCR'::text) THEN 'LEOTHR'::text
              ELSE NULL::text
          END AS tableau_title_group,
          CASE
              WHEN ((a."Duty City" = 'LORDS VALLEY'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'ATLANTA'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'CHICAGO'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'PASCO'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'STOCKTON'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'HOUMA'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'BLUE ASH'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'NEW YORK -QUEENS'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'GREAT FALLS'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'SAN ANGELO'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'KAILUA KONA'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'IDAHO FALLS'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'SALISBURY'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'CHARLESTON NAVAL CX'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'SALT LAKE CITY'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'FARMVILLE'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'LOUISVILLE'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'BOSTON'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'FT MYERS'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'CHEYENNE'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'GRAND ISLAND'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'ROSWELL'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'HOULTON'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'LITTLE ROCK'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'WINSTON SALEM'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'ATLANTIC CITY'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'KANSAS CITY'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'ANCHORAGE'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'FARGO'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'MESA'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'WASHINGTON'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'SAINT ALBANS'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'DURANGO'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'CHATTANOOGA'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'DETROIT'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'GADSDEN'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'OKMULGEE'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'DULUTH'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'HARTFORD'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'MEDFORD'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'GULFPORT'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'PORTSMOUTH'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'MADISON'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'FORT WAYNE'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'SIOUX FALLS'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'RENO'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'CHARLESTON'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'WICHITA'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'DOVER'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'WARWICK'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              WHEN ((a."Duty City" = 'SIOUX CITY'::text) AND (a."CONUS" = 'Y'::text)) THEN a."Duty State"
              ELSE a."Duty State"
          END AS cxo_state,
          CASE
              WHEN ((a."Duty City" = 'FRANKFURT'::text) AND (a."CONUS" = 'N'::text)) THEN 'GERMANY'::text
              WHEN ((a."Duty City" = 'MANAMA'::text) AND (a."CONUS" = 'N'::text)) THEN 'BAHRAIN'::text
              WHEN ((a."Duty City" = 'KINGSTON'::text) AND (a."CONUS" = 'N'::text)) THEN 'JAMAICA'::text
              WHEN ((a."Duty City" = 'AGUADILLA'::text) AND (a."CONUS" = 'N'::text)) THEN 'PUERTO RICO'::text
              WHEN ((a."Duty City" = 'SAN JUAN'::text) AND (a."CONUS" = 'N'::text)) THEN 'PUERTO RICO'::text
              WHEN ((a."Duty City" = 'CASABLANCA'::text) AND (a."CONUS" = 'N'::text)) THEN 'MOROCCO'::text
              WHEN ((a."Duty City" = 'STUTTGART'::text) AND (a."CONUS" = 'N'::text)) THEN 'GERMANY'::text
              WHEN ((a."Duty City" = 'LONDON'::text) AND (a."CONUS" = 'N'::text)) THEN 'UNITED KINGDOM'::text
              WHEN ((a."Duty City" = 'JERUSALEM'::text) AND (a."CONUS" = 'N'::text)) THEN 'ISRAEL'::text
              WHEN ((a."Duty City" = 'BRASILIA'::text) AND (a."CONUS" = 'N'::text)) THEN 'BRAZIL'::text
              WHEN ((a."Duty City" = 'NEW DELHI'::text) AND (a."CONUS" = 'N'::text)) THEN 'INDIA'::text
              WHEN ((a."Duty City" = 'WARSAW'::text) AND (a."CONUS" = 'N'::text)) THEN 'POLAND'::text
              WHEN ((a."Duty City" = 'GUANGZHOU'::text) AND (a."CONUS" = 'N'::text)) THEN 'CHINA'::text
              WHEN ((a."Duty City" = 'PORT-AU-PRINCE'::text) AND (a."CONUS" = 'N'::text)) THEN 'HAITI'::text
              WHEN ((a."Duty City" = 'MANILA'::text) AND (a."CONUS" = 'N'::text)) THEN 'PHILIPPINES'::text
              WHEN ((a."Duty City" = 'DUBAI'::text) AND (a."CONUS" = 'N'::text)) THEN 'UNITED ARAB EMIRATES'::text
              WHEN ((a."Duty City" = 'MUSCAT'::text) AND (a."CONUS" = 'N'::text)) THEN 'OMAN'::text
              WHEN ((a."Duty City" = 'MAYAGUEZ'::text) AND (a."CONUS" = 'N'::text)) THEN 'PUERTO RICO'::text
              WHEN ((a."Duty City" = 'ISLAMABAD'::text) AND (a."CONUS" = 'N'::text)) THEN 'PAKISTAN'::text
              WHEN ((a."Duty City" = 'HERMOSILLO'::text) AND (a."CONUS" = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."Duty City" = 'SANTO DOMINGO'::text) AND (a."CONUS" = 'N'::text)) THEN 'DOMINICAN REPUBLIC'::text
              WHEN ((a."Duty City" = 'GUATEMALA'::text) AND (a."CONUS" = 'N'::text)) THEN 'GUATEMALA'::text
              WHEN ((a."Duty City" = 'BOGOTA'::text) AND (a."CONUS" = 'N'::text)) THEN 'COLOMBIA'::text
              WHEN ((a."Duty City" = 'BRIDGETOWN'::text) AND (a."CONUS" = 'N'::text)) THEN 'BARBADOS'::text
              WHEN ((a."Duty City" = 'ANTWERP'::text) AND (a."CONUS" = 'N'::text)) THEN 'BELGIUM'::text
              WHEN ((a."Duty City" = 'PARIS'::text) AND (a."CONUS" = 'N'::text)) THEN 'FRANCE'::text
              WHEN ((a."Duty City" = 'MATAMOROS'::text) AND (a."CONUS" = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."Duty City" = 'BANGKOK'::text) AND (a."CONUS" = 'N'::text)) THEN 'THAILAND'::text
              WHEN ((a."Duty City" = 'SAN SALVADOR'::text) AND (a."CONUS" = 'N'::text)) THEN 'EL SALVADOR'::text
              WHEN ((a."Duty City" = 'MONTREAL, QUEBEC'::text) AND (a."CONUS" = 'N'::text)) THEN 'CANADA'::text
              WHEN ((a."Duty City" = 'PHNOM PENH'::text) AND (a."CONUS" = 'N'::text)) THEN 'KAMPUCHEA'::text
              WHEN ((a."Duty City" = 'JIDDA'::text) AND (a."CONUS" = 'N'::text)) THEN 'SAUDI ARABIA'::text
              WHEN ((a."Duty City" = 'CANBERRA'::text) AND (a."CONUS" = 'N'::text)) THEN 'AUSTRALIA'::text
              WHEN ((a."Duty City" = 'NAIROBI'::text) AND (a."CONUS" = 'N'::text)) THEN 'KENYA'::text
              WHEN ((a."Duty City" = 'VANCOUVER, B.C.'::text) AND (a."CONUS" = 'N'::text)) THEN 'CANADA'::text
              WHEN ((a."Duty City" = 'ROME'::text) AND (a."CONUS" = 'N'::text)) THEN 'ITALY'::text
              WHEN ((a."Duty City" = 'AGANA'::text) AND (a."CONUS" = 'N'::text)) THEN 'GUAM'::text
              WHEN ((a."Duty City" = 'OTTAWA, ONTARIO'::text) AND (a."CONUS" = 'N'::text)) THEN 'CANADA'::text
              WHEN ((a."Duty City" = 'CIUDAD JUAREZ'::text) AND (a."CONUS" = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."Duty City" = 'CARTEGENA'::text) AND (a."CONUS" = 'N'::text)) THEN 'COLOMBIA'::text
              WHEN ((a."Duty City" = 'VIENNA'::text) AND (a."CONUS" = 'N'::text)) THEN 'AUSTRIA'::text
              WHEN ((a."Duty City" = 'TORONTO, ONTARIO'::text) AND (a."CONUS" = 'N'::text)) THEN 'CANADA'::text
              WHEN ((a."Duty City" = 'MEXICO CITY'::text) AND (a."CONUS" = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."Duty City" = 'MAITE'::text) AND (a."CONUS" = 'N'::text)) THEN 'GUAM'::text
              WHEN ((a."Duty City" = 'TEGUCIGALPA'::text) AND (a."CONUS" = 'N'::text)) THEN 'HONDURAS'::text
              WHEN ((a."Duty City" = 'ATHENS'::text) AND (a."CONUS" = 'N'::text)) THEN 'GREECE'::text
              WHEN ((a."Duty City" = 'SINGAPORE'::text) AND (a."CONUS" = 'N'::text)) THEN 'SINGAPORE'::text
              WHEN ((a."Duty City" = 'HANOI'::text) AND (a."CONUS" = 'N'::text)) THEN 'VIETNAM'::text
              WHEN ((a."Duty City" = 'DOHA'::text) AND (a."CONUS" = 'N'::text)) THEN 'QATAR'::text
              WHEN ((a."Duty City" = 'DHAHRAN'::text) AND (a."CONUS" = 'N'::text)) THEN 'SAUDI ARABIA'::text
              WHEN ((a."Duty City" = 'ABU DHABI'::text) AND (a."CONUS" = 'N'::text)) THEN 'UNITED ARAB EMIRATES'::text
              WHEN ((a."Duty City" = 'FAJARDO'::text) AND (a."CONUS" = 'N'::text)) THEN 'PUERTO RICO'::text
              WHEN ((a."Duty City" = 'TAMUNING'::text) AND (a."CONUS" = 'N'::text)) THEN 'GUAM'::text
              WHEN ((a."Duty City" = 'MONTERREY'::text) AND (a."CONUS" = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."Duty City" = 'ANKARA'::text) AND (a."CONUS" = 'N'::text)) THEN 'TURKEY'::text
              WHEN ((a."Duty City" = 'BRUSSELS'::text) AND (a."CONUS" = 'N'::text)) THEN 'BELGIUM'::text
              WHEN ((a."Duty City" = 'TIJUANA'::text) AND (a."CONUS" = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."Duty City" = 'PONCE'::text) AND (a."CONUS" = 'N'::text)) THEN 'PUERTO RICO'::text
              WHEN ((a."Duty City" = 'MANAGUA'::text) AND (a."CONUS" = 'N'::text)) THEN 'NICARAGUA'::text
              WHEN ((a."Duty City" = 'CAIRO'::text) AND (a."CONUS" = 'N'::text)) THEN 'EGYPT'::text
              WHEN ((a."Duty City" = 'KUALA LUMPUR'::text) AND (a."CONUS" = 'N'::text)) THEN 'MALAYSIA'::text
              WHEN ((a."Duty City" = 'LYON'::text) AND (a."CONUS" = 'N'::text)) THEN 'FRANCE'::text
              WHEN ((a."Duty City" = 'TEL AVIV'::text) AND (a."CONUS" = 'N'::text)) THEN 'ISRAEL'::text
              WHEN ((a."Duty City" = 'PRETORIA'::text) AND (a."CONUS" = 'N'::text)) THEN 'SOUTH AFRICA'::text
              WHEN ((a."Duty City" = 'QUITO'::text) AND (a."CONUS" = 'N'::text)) THEN 'ECUADOR'::text
              WHEN ((a."Duty City" = 'BUENOS AIRES'::text) AND (a."CONUS" = 'N'::text)) THEN 'ARGENTINA'::text
              WHEN ((a."Duty City" = 'NASSAU'::text) AND (a."CONUS" = 'N'::text)) THEN 'THE BAHAMAS'::text
              WHEN ((a."Duty City" = 'GUADALAJARA'::text) AND (a."CONUS" = 'N'::text)) THEN 'MEXICO'::text
              WHEN ((a."Duty City" = 'SEOUL'::text) AND (a."CONUS" = 'N'::text)) THEN 'KOREA, REPUBLIC OF'::text
              WHEN ((a."Duty City" = 'RIYADH'::text) AND (a."CONUS" = 'N'::text)) THEN 'SAUDI ARABIA'::text
              WHEN ((a."Duty City" = 'SAIPAN'::text) AND (a."CONUS" = 'N'::text)) THEN 'NORTHERN MARIANA ISL'::text
              WHEN ((a."Duty City" = 'ST THOMAS'::text) AND (a."CONUS" = 'N'::text)) THEN 'VIRGIN ISLANDS, U.S.'::text
              WHEN ((a."Duty City" = 'AMMAN'::text) AND (a."CONUS" = 'N'::text)) THEN 'JORDAN'::text
              WHEN ((a."Duty City" = 'HO CH MINH CITY'::text) AND (a."CONUS" = 'N'::text)) THEN 'VIETNAM'::text
              WHEN ((a."Duty City" = 'ST CROIX'::text) AND (a."CONUS" = 'N'::text)) THEN 'VIRGIN ISLANDS, U.S.'::text
              WHEN ((a."Duty City" = 'HAVANA'::text) AND (a."CONUS" = 'N'::text)) THEN 'CUBA'::text
              WHEN ((a."Duty City" = 'LIMA'::text) AND (a."CONUS" = 'N'::text)) THEN 'PERU'::text
              WHEN ((a."Duty City" = 'CHARLOTTE AMALIE'::text) AND (a."CONUS" = 'N'::text)) THEN 'VIRGIN ISLANDS, U.S.'::text
              WHEN ((a."Duty City" = 'JAKARTA, JAVA'::text) AND (a."CONUS" = 'N'::text)) THEN 'INDONESIA'::text
              WHEN ((a."Duty City" = 'CALGARY, ALBERTA'::text) AND (a."CONUS" = 'N'::text)) THEN 'CANADA'::text
              WHEN ((a."Duty City" = 'THE HAGUE'::text) AND (a."CONUS" = 'N'::text)) THEN 'NETHERLANDS'::text
              WHEN ((a."Duty City" = 'PANAMA'::text) AND (a."CONUS" = 'N'::text)) THEN 'PANAMA'::text
              WHEN ((a."Duty City" = 'HONG KONG'::text) AND (a."CONUS" = 'N'::text)) THEN 'HONG KONG'::text
              WHEN ((a."Duty City" = 'BEIJING'::text) AND (a."CONUS" = 'N'::text)) THEN 'CHINA'::text
              WHEN ((a."Duty City" = 'MADRID'::text) AND (a."CONUS" = 'N'::text)) THEN 'SPAIN'::text
              WHEN ((a."Duty City" = 'DAKAR'::text) AND (a."CONUS" = 'N'::text)) THEN 'SENEGAL'::text
              ELSE 'United States'::text
          END AS cxo_country
     FROM (public.cxo_cpro_archive_v2 a
       LEFT JOIN public.performance_crosswalk c ON ((a."Performance Evaluation Cd" = c."Performance Evaluation Cd")))
    ORDER BY a.cxo_pp1
;

CREATE VIEW "public"."vcxo_noa" AS
   SELECT a."PrsnID",
      a."Last Name",
      a."First Name",
      a."Middle Name",
      a."Sex Cd",
      a."Rno Cd",
      a."Longtitle",
      a."Dept Cd",
      a."Org",
      a."Pay Plan",
      a."Grade",
      a."Step",
      a."Series",
      a."Pos Off Ttl",
      a."Type Apnt",
      a."Type Emp",
      a."Mr No",
      a."Pos No",
      a."Dty Hrs",
      a."Duty",
      a."Bus",
      a."Pos Spvs Cd",
      a."Leo Ind",
      a."Off Ttl Cd",
      a."Vet Pref Rif",
      a."Vet Pref Cd",
      a."Emp Status",
      a."Salary Rt",
      a."NOA Cd",
      a."NOA Description",
      a."Csc Auth 12",
      a."Csc Auth 22",
      a."NOA Dt",
      a."Apnt Na Actn",
      a."Apnt Auth 1",
      a."Apnt Auth 2",
      a."Apnt Ymd",
      a."Pp Nbr",
      a."Pp Ymd",
      a."Lt 063 Ida",
      a."Valid Ymd",
      a."BirthDt",
      a."Agcy Eod",
      a."NTE",
      a."Apnt Cd",
      a."Ga Lo N Usda",
      a."Geo Adj Pct",
      a."Actn Cd",
      a."Poi",
      a."Prog Cd",
      a."Award Amount",
      a.filename,
      a.cxo_pp1,
      a.cxo_fy,
      a.ingested_at,
          CASE
              WHEN ("left"(a."Org", 8) = '70040002'::text) THEN 'HSI'::text
              WHEN ("left"(a."Org", 8) = '70040003'::text) THEN 'HSI'::text
              WHEN ("left"(a."Org", 8) = '70080001'::text) THEN 'HSI'::text
              WHEN ("left"(a."Org", 8) = '18620500'::text) THEN 'ERO'::text
              WHEN ("left"(a."Org", 8) = '70050002'::text) THEN 'HSI'::text
              WHEN ("left"(a."Org", 8) = '18610200'::text) THEN 'ERO'::text
              WHEN ("left"(a."Org", 8) = '23030000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '70010003'::text) THEN 'HSI'::text
              WHEN ("left"(a."Org", 8) = '07100700'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '18630200'::text) THEN 'ERO'::text
              WHEN ("left"(a."Org", 8) = '07100050'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '07102400'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '70030002'::text) THEN 'HSI'::text
              WHEN ("left"(a."Org", 8) = '18630400'::text) THEN 'ERO'::text
              WHEN ("left"(a."Org", 8) = '18630500'::text) THEN 'ERO'::text
              WHEN ("left"(a."Org", 8) = '24403001'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '70040004'::text) THEN 'HSI'::text
              WHEN ("left"(a."Org", 8) = '18630700'::text) THEN 'ERO'::text
              WHEN ("left"(a."Org", 8) = '22120013'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '18620200'::text) THEN 'ERO'::text
              WHEN ("left"(a."Org", 8) = '18630100'::text) THEN 'ERO'::text
              WHEN ("left"(a."Org", 8) = '05010000'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '18620300'::text) THEN 'ERO'::text
              WHEN ("left"(a."Org", 8) = '06171000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '24200000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '18060400'::text) THEN 'ERO'::text
              WHEN ("left"(a."Org", 8) = '07101400'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '18610500'::text) THEN 'ERO'::text
              WHEN ("left"(a."Org", 8) = '07101900'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '70060002'::text) THEN 'HSI'::text
              WHEN ("left"(a."Org", 8) = '07100200'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '70080002'::text) THEN 'HSI'::text
              WHEN ("left"(a."Org", 8) = '21000000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '06098000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '18620400'::text) THEN 'ERO'::text
              WHEN ("left"(a."Org", 8) = '23030600'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '18000200'::text) THEN 'ERO'::text
              WHEN ("left"(a."Org", 8) = '18000300'::text) THEN 'ERO'::text
              WHEN ("left"(a."Org", 8) = '24301000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '22100020'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '18620700'::text) THEN 'ERO'::text
              WHEN ("left"(a."Org", 8) = '07102000'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '70090001'::text) THEN 'HSI'::text
              WHEN ("left"(a."Org", 8) = '70020002'::text) THEN 'HSI'::text
              WHEN ("left"(a."Org", 8) = '18620100'::text) THEN 'ERO'::text
              WHEN ("left"(a."Org", 8) = '22120012'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '22100019'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '22110010'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '18620800'::text) THEN 'ERO'::text
              WHEN ("left"(a."Org", 8) = '18060100'::text) THEN 'ERO'::text
              WHEN ("left"(a."Org", 8) = '18610100'::text) THEN 'ERO'::text
              WHEN ("left"(a."Org", 8) = '18620600'::text) THEN 'ERO'::text
              WHEN ("left"(a."Org", 8) = '07102200'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '18060700'::text) THEN 'ERO'::text
              WHEN ("left"(a."Org", 8) = '06000000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '18630600'::text) THEN 'ERO'::text
              WHEN ("left"(a."Org", 8) = '18630300'::text) THEN 'ERO'::text
              WHEN ("left"(a."Org", 8) = '70060001'::text) THEN 'HSI'::text
              WHEN ("left"(a."Org", 8) = '23040300'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '23020100'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '70010001'::text) THEN 'HSI'::text
              WHEN ("left"(a."Org", 8) = '24203000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '18060300'::text) THEN 'ERO'::text
              WHEN ("left"(a."Org", 8) = '18060600'::text) THEN 'ERO'::text
              WHEN ("left"(a."Org", 8) = '07100060'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '70030003'::text) THEN 'HSI'::text
              WHEN ("left"(a."Org", 8) = '70010002'::text) THEN 'HSI'::text
              WHEN ("left"(a."Org", 8) = '70020001'::text) THEN 'HSI'::text
              WHEN ("left"(a."Org", 8) = '18610300'::text) THEN 'ERO'::text
              WHEN ("left"(a."Org", 8) = '07100070'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '18610900'::text) THEN 'ERO'::text
              WHEN ("left"(a."Org", 8) = '18610600'::text) THEN 'ERO'::text
              WHEN ("left"(a."Org", 8) = '18610800'::text) THEN 'ERO'::text
              WHEN ("left"(a."Org", 8) = '05030200'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '05030400'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '06090100'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '22120010'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '23020500'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '18610700'::text) THEN 'ERO'::text
              WHEN ("left"(a."Org", 8) = '07102300'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '70020000'::text) THEN 'HSI'::text
              WHEN ("left"(a."Org", 8) = '07100500'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '06051000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '70050000'::text) THEN 'HSI'::text
              WHEN ("left"(a."Org", 8) = '06091000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '18610400'::text) THEN 'ERO'::text
              WHEN ("left"(a."Org", 8) = '07101300'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '07101000'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '05050300'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '22100021'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '18000100'::text) THEN 'ERO'::text
              WHEN ("left"(a."Org", 8) = '23030200'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '07102500'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '70080000'::text) THEN 'HSI'::text
              WHEN ("left"(a."Org", 8) = '23050100'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '23020400'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '23020200'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '24403000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '05040100'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '05060000'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '23030100'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '24302000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '06052000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '05040000'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '07101800'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '07100800'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '06050000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '06020000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '07100600'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '18500300'::text) THEN 'ERO'::text
              WHEN ("left"(a."Org", 8) = '21400000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '22120000'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '07100001'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '18060200'::text) THEN 'ERO'::text
              WHEN ("left"(a."Org", 8) = '07102600'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '07100100'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '07102100'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '21500000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '07101700'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '23040100'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '23020600'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '07100900'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '23010000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '23020300'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '70000000'::text) THEN 'HSI'::text
              WHEN ("left"(a."Org", 8) = '70030001'::text) THEN 'HSI'::text
              WHEN ("left"(a."Org", 8) = '21600000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '70010000'::text) THEN 'HSI'::text
              WHEN ("left"(a."Org", 8) = '22100022'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '24300000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '05020000'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '70040001'::text) THEN 'HSI'::text
              WHEN ("left"(a."Org", 8) = '70070001'::text) THEN 'HSI'::text
              WHEN ("left"(a."Org", 8) = '06090000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '07101600'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '22140010'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '05050200'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '18060800'::text) THEN 'ERO'::text
              WHEN ("left"(a."Org", 8) = '22110011'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '07100300'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '06098100'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '07100400'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '07101200'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '24402000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '18060000'::text) THEN 'ERO'::text
              WHEN ("left"(a."Org", 8) = '18000000'::text) THEN 'ERO'::text
              WHEN ("left"(a."Org", 8) = '06030000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '24100000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '24000000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '06170000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '06098200'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '70050001'::text) THEN 'HSI'::text
              WHEN ("left"(a."Org", 8) = '24400000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '23050300'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '23050200'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '21900000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '07101100'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '24401000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '21501000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '21200000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '07100040'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '22100017'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '06093000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '24201000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '23030300'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '05050000'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '05030000'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '06095000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '23030500'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '06096000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '22110013'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '06097000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '06220000'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '22100016'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '23020000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '23050000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '23030400'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '23000000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '05050100'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '21310000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '23020700'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '70090000'::text) THEN 'HSI'::text
              WHEN ("left"(a."Org", 8) = '22000000'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '70060000'::text) THEN 'HSI'::text
              WHEN ("left"(a."Org", 8) = '06098300'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '06094000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '06050100'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '22100015'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '05080000'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '05030300'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '05030100'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '23040200'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '22100000'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '05000000'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '70030000'::text) THEN 'HSI'::text
              WHEN ("left"(a."Org", 8) = '06092000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '05040200'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '22110012'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '21601000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '24202000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '70040000'::text) THEN 'HSI'::text
              WHEN ("left"(a."Org", 8) = '24205000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '24204000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '22110000'::text) THEN 'DIR'::text
              WHEN ("left"(a."Org", 8) = '21100000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '21602000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '70070000'::text) THEN 'HSI'::text
              WHEN ("left"(a."Org", 8) = '23040000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '21800000'::text) THEN 'MGT'::text
              WHEN ("left"(a."Org", 8) = '21320000'::text) THEN 'MGT'::text
              ELSE NULL::text
          END AS cxo_dir,
          CASE
              WHEN ("left"(a."Org", 8) = '70040002'::text) THEN 'INV'::text
              WHEN ("left"(a."Org", 8) = '70040003'::text) THEN 'INV'::text
              WHEN ("left"(a."Org", 8) = '70080001'::text) THEN 'ITL'::text
              WHEN ("left"(a."Org", 8) = '18620500'::text) THEN 'DRO'::text
              WHEN ("left"(a."Org", 8) = '70050002'::text) THEN 'INV'::text
              WHEN ("left"(a."Org", 8) = '18610200'::text) THEN 'DRO'::text
              WHEN ("left"(a."Org", 8) = '23030000'::text) THEN 'CIO'::text
              WHEN ("left"(a."Org", 8) = '70010003'::text) THEN 'INV'::text
              WHEN ("left"(a."Org", 8) = '07100700'::text) THEN 'PLA'::text
              WHEN ("left"(a."Org", 8) = '18630200'::text) THEN 'DRO'::text
              WHEN ("left"(a."Org", 8) = '07100050'::text) THEN 'PLA'::text
              WHEN ("left"(a."Org", 8) = '07102400'::text) THEN 'PLA'::text
              WHEN ("left"(a."Org", 8) = '70030002'::text) THEN 'INV'::text
              WHEN ("left"(a."Org", 8) = '18630400'::text) THEN 'DRO'::text
              WHEN ("left"(a."Org", 8) = '18630500'::text) THEN 'DRO'::text
              WHEN ("left"(a."Org", 8) = '24403001'::text) THEN 'CFO'::text
              WHEN ("left"(a."Org", 8) = '70040004'::text) THEN 'INV'::text
              WHEN ("left"(a."Org", 8) = '18630700'::text) THEN 'DRO'::text
              WHEN ("left"(a."Org", 8) = '22120013'::text) THEN 'OPR'::text
              WHEN ("left"(a."Org", 8) = '18620200'::text) THEN 'DRO'::text
              WHEN ("left"(a."Org", 8) = '18630100'::text) THEN 'DRO'::text
              WHEN ("left"(a."Org", 8) = '05010000'::text) THEN 'OOD'::text
              WHEN ("left"(a."Org", 8) = '18620300'::text) THEN 'DRO'::text
              WHEN ("left"(a."Org", 8) = '06171000'::text) THEN 'OAS'::text
              WHEN ("left"(a."Org", 8) = '24200000'::text) THEN 'CFO'::text
              WHEN ("left"(a."Org", 8) = '18060400'::text) THEN 'DRO'::text
              WHEN ("left"(a."Org", 8) = '07101400'::text) THEN 'PLA'::text
              WHEN ("left"(a."Org", 8) = '18610500'::text) THEN 'DRO'::text
              WHEN ("left"(a."Org", 8) = '07101900'::text) THEN 'PLA'::text
              WHEN ("left"(a."Org", 8) = '70060002'::text) THEN 'INV'::text
              WHEN ("left"(a."Org", 8) = '07100200'::text) THEN 'PLA'::text
              WHEN ("left"(a."Org", 8) = '70080002'::text) THEN 'ITL'::text
              WHEN ("left"(a."Org", 8) = '21000000'::text) THEN 'OAQ'::text
              WHEN ("left"(a."Org", 8) = '06098000'::text) THEN 'OAS'::text
              WHEN ("left"(a."Org", 8) = '18620400'::text) THEN 'DRO'::text
              WHEN ("left"(a."Org", 8) = '23030600'::text) THEN 'CIO'::text
              WHEN ("left"(a."Org", 8) = '18000200'::text) THEN 'DRO'::text
              WHEN ("left"(a."Org", 8) = '18000300'::text) THEN 'DRO'::text
              WHEN ("left"(a."Org", 8) = '24301000'::text) THEN 'CFO'::text
              WHEN ("left"(a."Org", 8) = '22100020'::text) THEN 'OPR'::text
              WHEN ("left"(a."Org", 8) = '18620700'::text) THEN 'DRO'::text
              WHEN ("left"(a."Org", 8) = '07102000'::text) THEN 'PLA'::text
              WHEN ("left"(a."Org", 8) = '70090001'::text) THEN 'IAF'::text
              WHEN ("left"(a."Org", 8) = '70020002'::text) THEN 'INV'::text
              WHEN ("left"(a."Org", 8) = '18620100'::text) THEN 'DRO'::text
              WHEN ("left"(a."Org", 8) = '22120012'::text) THEN 'OPR'::text
              WHEN ("left"(a."Org", 8) = '22100019'::text) THEN 'OPR'::text
              WHEN ("left"(a."Org", 8) = '22110010'::text) THEN 'OPR'::text
              WHEN ("left"(a."Org", 8) = '18620800'::text) THEN 'DRO'::text
              WHEN ("left"(a."Org", 8) = '18060100'::text) THEN 'DRO'::text
              WHEN ("left"(a."Org", 8) = '18610100'::text) THEN 'DRO'::text
              WHEN ("left"(a."Org", 8) = '18620600'::text) THEN 'DRO'::text
              WHEN ("left"(a."Org", 8) = '07102200'::text) THEN 'PLA'::text
              WHEN ("left"(a."Org", 8) = '18060700'::text) THEN 'DRO'::text
              WHEN ("left"(a."Org", 8) = '06000000'::text) THEN 'MAA'::text
              WHEN ("left"(a."Org", 8) = '18630600'::text) THEN 'DRO'::text
              WHEN ("left"(a."Org", 8) = '18630300'::text) THEN 'DRO'::text
              WHEN ("left"(a."Org", 8) = '70060001'::text) THEN 'INV'::text
              WHEN ("left"(a."Org", 8) = '23040300'::text) THEN 'CIO'::text
              WHEN ("left"(a."Org", 8) = '23020100'::text) THEN 'CIO'::text
              WHEN ("left"(a."Org", 8) = '70010001'::text) THEN 'INV'::text
              WHEN ("left"(a."Org", 8) = '24203000'::text) THEN 'CFO'::text
              WHEN ("left"(a."Org", 8) = '18060300'::text) THEN 'DRO'::text
              WHEN ("left"(a."Org", 8) = '18060600'::text) THEN 'DRO'::text
              WHEN ("left"(a."Org", 8) = '07100060'::text) THEN 'PLA'::text
              WHEN ("left"(a."Org", 8) = '70030003'::text) THEN 'INV'::text
              WHEN ("left"(a."Org", 8) = '70010002'::text) THEN 'INV'::text
              WHEN ("left"(a."Org", 8) = '70020001'::text) THEN 'INV'::text
              WHEN ("left"(a."Org", 8) = '18610300'::text) THEN 'DRO'::text
              WHEN ("left"(a."Org", 8) = '07100070'::text) THEN 'PLA'::text
              WHEN ("left"(a."Org", 8) = '18610900'::text) THEN 'DRO'::text
              WHEN ("left"(a."Org", 8) = '18610600'::text) THEN 'DRO'::text
              WHEN ("left"(a."Org", 8) = '18610800'::text) THEN 'DRO'::text
              WHEN ("left"(a."Org", 8) = '05030200'::text) THEN 'OOD'::text
              WHEN ("left"(a."Org", 8) = '05030400'::text) THEN 'OOD'::text
              WHEN ("left"(a."Org", 8) = '06090100'::text) THEN 'OAS'::text
              WHEN ("left"(a."Org", 8) = '22120010'::text) THEN 'OPR'::text
              WHEN ("left"(a."Org", 8) = '23020500'::text) THEN 'CIO'::text
              WHEN ("left"(a."Org", 8) = '18610700'::text) THEN 'DRO'::text
              WHEN ("left"(a."Org", 8) = '07102300'::text) THEN 'PLA'::text
              WHEN ("left"(a."Org", 8) = '70020000'::text) THEN 'INV'::text
              WHEN ("left"(a."Org", 8) = '07100500'::text) THEN 'PLA'::text
              WHEN ("left"(a."Org", 8) = '06051000'::text) THEN 'OAS'::text
              WHEN ("left"(a."Org", 8) = '70050000'::text) THEN 'INV'::text
              WHEN ("left"(a."Org", 8) = '06091000'::text) THEN 'OAS'::text
              WHEN ("left"(a."Org", 8) = '18610400'::text) THEN 'DRO'::text
              WHEN ("left"(a."Org", 8) = '07101300'::text) THEN 'PLA'::text
              WHEN ("left"(a."Org", 8) = '07101000'::text) THEN 'PLA'::text
              WHEN ("left"(a."Org", 8) = '05050300'::text) THEN 'OOD'::text
              WHEN ("left"(a."Org", 8) = '22100021'::text) THEN 'OPR'::text
              WHEN ("left"(a."Org", 8) = '18000100'::text) THEN 'DRO'::text
              WHEN ("left"(a."Org", 8) = '23030200'::text) THEN 'CIO'::text
              WHEN ("left"(a."Org", 8) = '07102500'::text) THEN 'PLA'::text
              WHEN ("left"(a."Org", 8) = '70080000'::text) THEN 'ITL'::text
              WHEN ("left"(a."Org", 8) = '23050100'::text) THEN 'CIO'::text
              WHEN ("left"(a."Org", 8) = '23020400'::text) THEN 'CIO'::text
              WHEN ("left"(a."Org", 8) = '23020200'::text) THEN 'CIO'::text
              WHEN ("left"(a."Org", 8) = '24403000'::text) THEN 'CFO'::text
              WHEN ("left"(a."Org", 8) = '05040100'::text) THEN 'OOD'::text
              WHEN ("left"(a."Org", 8) = '05060000'::text) THEN 'OOD'::text
              WHEN ("left"(a."Org", 8) = '23030100'::text) THEN 'CIO'::text
              WHEN ("left"(a."Org", 8) = '24302000'::text) THEN 'CFO'::text
              WHEN ("left"(a."Org", 8) = '06052000'::text) THEN 'OAS'::text
              WHEN ("left"(a."Org", 8) = '05040000'::text) THEN 'OOD'::text
              WHEN ("left"(a."Org", 8) = '07101800'::text) THEN 'PLA'::text
              WHEN ("left"(a."Org", 8) = '07100800'::text) THEN 'PLA'::text
              WHEN ("left"(a."Org", 8) = '06050000'::text) THEN 'OAS'::text
              WHEN ("left"(a."Org", 8) = '06020000'::text) THEN 'MAA'::text
              WHEN ("left"(a."Org", 8) = '07100600'::text) THEN 'PLA'::text
              WHEN ("left"(a."Org", 8) = '18500300'::text) THEN 'DRO'::text
              WHEN ("left"(a."Org", 8) = '21400000'::text) THEN 'OAQ'::text
              WHEN ("left"(a."Org", 8) = '22120000'::text) THEN 'OPR'::text
              WHEN ("left"(a."Org", 8) = '07100001'::text) THEN 'PLA'::text
              WHEN ("left"(a."Org", 8) = '18060200'::text) THEN 'DRO'::text
              WHEN ("left"(a."Org", 8) = '07102600'::text) THEN 'PLA'::text
              WHEN ("left"(a."Org", 8) = '07100100'::text) THEN 'PLA'::text
              WHEN ("left"(a."Org", 8) = '07102100'::text) THEN 'PLA'::text
              WHEN ("left"(a."Org", 8) = '21500000'::text) THEN 'OAQ'::text
              WHEN ("left"(a."Org", 8) = '07101700'::text) THEN 'PLA'::text
              WHEN ("left"(a."Org", 8) = '23040100'::text) THEN 'CIO'::text
              WHEN ("left"(a."Org", 8) = '23020600'::text) THEN 'CIO'::text
              WHEN ("left"(a."Org", 8) = '07100900'::text) THEN 'PLA'::text
              WHEN ("left"(a."Org", 8) = '23010000'::text) THEN 'CIO'::text
              WHEN ("left"(a."Org", 8) = '23020300'::text) THEN 'CIO'::text
              WHEN ("left"(a."Org", 8) = '70000000'::text) THEN 'INV'::text
              WHEN ("left"(a."Org", 8) = '70030001'::text) THEN 'INV'::text
              WHEN ("left"(a."Org", 8) = '21600000'::text) THEN 'OAQ'::text
              WHEN ("left"(a."Org", 8) = '70010000'::text) THEN 'INV'::text
              WHEN ("left"(a."Org", 8) = '22100022'::text) THEN 'OPR'::text
              WHEN ("left"(a."Org", 8) = '24300000'::text) THEN 'CFO'::text
              WHEN ("left"(a."Org", 8) = '05020000'::text) THEN 'OOD'::text
              WHEN ("left"(a."Org", 8) = '70040001'::text) THEN 'INV'::text
              WHEN ("left"(a."Org", 8) = '70070001'::text) THEN 'INV'::text
              WHEN ("left"(a."Org", 8) = '06090000'::text) THEN 'OAS'::text
              WHEN ("left"(a."Org", 8) = '07101600'::text) THEN 'PLA'::text
              WHEN ("left"(a."Org", 8) = '22140010'::text) THEN 'OPR'::text
              WHEN ("left"(a."Org", 8) = '05050200'::text) THEN 'OOD'::text
              WHEN ("left"(a."Org", 8) = '18060800'::text) THEN 'DRO'::text
              WHEN ("left"(a."Org", 8) = '22110011'::text) THEN 'OPR'::text
              WHEN ("left"(a."Org", 8) = '07100300'::text) THEN 'PLA'::text
              WHEN ("left"(a."Org", 8) = '06098100'::text) THEN 'OAS'::text
              WHEN ("left"(a."Org", 8) = '07100400'::text) THEN 'PLA'::text
              WHEN ("left"(a."Org", 8) = '07101200'::text) THEN 'PLA'::text
              WHEN ("left"(a."Org", 8) = '24402000'::text) THEN 'CFO'::text
              WHEN ("left"(a."Org", 8) = '18060000'::text) THEN 'DRO'::text
              WHEN ("left"(a."Org", 8) = '18000000'::text) THEN 'DRO'::text
              WHEN ("left"(a."Org", 8) = '06030000'::text) THEN 'OAS'::text
              WHEN ("left"(a."Org", 8) = '24100000'::text) THEN 'CFO'::text
              WHEN ("left"(a."Org", 8) = '24000000'::text) THEN 'CFO'::text
              WHEN ("left"(a."Org", 8) = '06170000'::text) THEN 'OAS'::text
              WHEN ("left"(a."Org", 8) = '06098200'::text) THEN 'OAS'::text
              WHEN ("left"(a."Org", 8) = '70050001'::text) THEN 'INV'::text
              WHEN ("left"(a."Org", 8) = '24400000'::text) THEN 'CFO'::text
              WHEN ("left"(a."Org", 8) = '23050300'::text) THEN 'CIO'::text
              WHEN ("left"(a."Org", 8) = '23050200'::text) THEN 'CIO'::text
              WHEN ("left"(a."Org", 8) = '21900000'::text) THEN 'OAQ'::text
              WHEN ("left"(a."Org", 8) = '07101100'::text) THEN 'PLA'::text
              WHEN ("left"(a."Org", 8) = '24401000'::text) THEN 'CFO'::text
              WHEN ("left"(a."Org", 8) = '21501000'::text) THEN 'OAQ'::text
              WHEN ("left"(a."Org", 8) = '21200000'::text) THEN 'OAQ'::text
              WHEN ("left"(a."Org", 8) = '07100040'::text) THEN 'PLA'::text
              WHEN ("left"(a."Org", 8) = '22100017'::text) THEN 'OPR'::text
              WHEN ("left"(a."Org", 8) = '06093000'::text) THEN 'OAS'::text
              WHEN ("left"(a."Org", 8) = '24201000'::text) THEN 'CFO'::text
              WHEN ("left"(a."Org", 8) = '23030300'::text) THEN 'CIO'::text
              WHEN ("left"(a."Org", 8) = '05050000'::text) THEN 'OOD'::text
              WHEN ("left"(a."Org", 8) = '05030000'::text) THEN 'OOD'::text
              WHEN ("left"(a."Org", 8) = '06095000'::text) THEN 'OAS'::text
              WHEN ("left"(a."Org", 8) = '23030500'::text) THEN 'CIO'::text
              WHEN ("left"(a."Org", 8) = '06096000'::text) THEN 'OAS'::text
              WHEN ("left"(a."Org", 8) = '22110013'::text) THEN 'OPR'::text
              WHEN ("left"(a."Org", 8) = '06097000'::text) THEN 'OAS'::text
              WHEN ("left"(a."Org", 8) = '06220000'::text) THEN 'OAS'::text
              WHEN ("left"(a."Org", 8) = '22100016'::text) THEN 'OPR'::text
              WHEN ("left"(a."Org", 8) = '23020000'::text) THEN 'CIO'::text
              WHEN ("left"(a."Org", 8) = '23050000'::text) THEN 'CIO'::text
              WHEN ("left"(a."Org", 8) = '23030400'::text) THEN 'CIO'::text
              WHEN ("left"(a."Org", 8) = '23000000'::text) THEN 'CIO'::text
              WHEN ("left"(a."Org", 8) = '05050100'::text) THEN 'OOD'::text
              WHEN ("left"(a."Org", 8) = '21310000'::text) THEN 'OAQ'::text
              WHEN ("left"(a."Org", 8) = '23020700'::text) THEN 'CIO'::text
              WHEN ("left"(a."Org", 8) = '70090000'::text) THEN 'IAF'::text
              WHEN ("left"(a."Org", 8) = '22000000'::text) THEN 'OPR'::text
              WHEN ("left"(a."Org", 8) = '70060000'::text) THEN 'INV'::text
              WHEN ("left"(a."Org", 8) = '06098300'::text) THEN 'OAS'::text
              WHEN ("left"(a."Org", 8) = '06094000'::text) THEN 'OAS'::text
              WHEN ("left"(a."Org", 8) = '06050100'::text) THEN 'OAS'::text
              WHEN ("left"(a."Org", 8) = '22100015'::text) THEN 'OPR'::text
              WHEN ("left"(a."Org", 8) = '05080000'::text) THEN 'OOD'::text
              WHEN ("left"(a."Org", 8) = '05030300'::text) THEN 'OOD'::text
              WHEN ("left"(a."Org", 8) = '05030100'::text) THEN 'OOD'::text
              WHEN ("left"(a."Org", 8) = '23040200'::text) THEN 'CIO'::text
              WHEN ("left"(a."Org", 8) = '22100000'::text) THEN 'OPR'::text
              WHEN ("left"(a."Org", 8) = '05000000'::text) THEN 'OOD'::text
              WHEN ("left"(a."Org", 8) = '70030000'::text) THEN 'INV'::text
              WHEN ("left"(a."Org", 8) = '06092000'::text) THEN 'OAS'::text
              WHEN ("left"(a."Org", 8) = '05040200'::text) THEN 'OOD'::text
              WHEN ("left"(a."Org", 8) = '22110012'::text) THEN 'OPR'::text
              WHEN ("left"(a."Org", 8) = '21601000'::text) THEN 'OAQ'::text
              WHEN ("left"(a."Org", 8) = '24202000'::text) THEN 'CFO'::text
              WHEN ("left"(a."Org", 8) = '70040000'::text) THEN 'INV'::text
              WHEN ("left"(a."Org", 8) = '24205000'::text) THEN 'CFO'::text
              WHEN ("left"(a."Org", 8) = '24204000'::text) THEN 'CFO'::text
              WHEN ("left"(a."Org", 8) = '22110000'::text) THEN 'OPR'::text
              WHEN ("left"(a."Org", 8) = '21100000'::text) THEN 'OAQ'::text
              WHEN ("left"(a."Org", 8) = '21602000'::text) THEN 'OAQ'::text
              WHEN ("left"(a."Org", 8) = '70070000'::text) THEN 'INV'::text
              WHEN ("left"(a."Org", 8) = '23040000'::text) THEN 'CIO'::text
              WHEN ("left"(a."Org", 8) = '21800000'::text) THEN 'OAQ'::text
              WHEN ("left"(a."Org", 8) = '21320000'::text) THEN 'OAQ'::text
              ELSE NULL::text
          END AS cxo_office,
          CASE
              WHEN ("left"(a."Org", 8) = '70040002'::text) THEN 'SAC DENVER, CO'::text
              WHEN ("left"(a."Org", 8) = '70040003'::text) THEN 'ASAC-SELLS, AZ'::text
              WHEN ("left"(a."Org", 8) = '70080001'::text) THEN 'DIV 1 UNIT 4 HUMAN SMUG & TRAF'::text
              WHEN ("left"(a."Org", 8) = '18620500'::text) THEN 'DRO HOU HOUSTON TX CDF'::text
              WHEN ("left"(a."Org", 8) = '70050002'::text) THEN 'UNIT 2 EXPRT EFMNT CORD CTR'::text
              WHEN ("left"(a."Org", 8) = '18610200'::text) THEN 'DRO BAL SALISBURY MD SUBOFFICE'::text
              WHEN ("left"(a."Org", 8) = '23030000'::text) THEN 'IT OPERATIONS DIVISION'::text
              WHEN ("left"(a."Org", 8) = '70010003'::text) THEN 'DIV 1 UNIT 3 VTM AST & MGM OS'::text
              WHEN ("left"(a."Org", 8) = '07100700'::text) THEN 'OPLA CHICAGO (KANSAS CITY)'::text
              WHEN ("left"(a."Org", 8) = '18630200'::text) THEN 'DRO LOS REMOVAL MGT BR'::text
              WHEN ("left"(a."Org", 8) = '07100050'::text) THEN 'OPLA NATL SECURITY LAW UNIT'::text
              WHEN ("left"(a."Org", 8) = '07102400'::text) THEN 'OPLA SAN FRANCISCO'::text
              WHEN ("left"(a."Org", 8) = '70030002'::text) THEN 'UNIT 2 DATA MGMT REPORTG'::text
              WHEN ("left"(a."Org", 8) = '18630400'::text) THEN 'DRO SND DETENTN MGT BR'::text
              WHEN ("left"(a."Org", 8) = '18630500'::text) THEN 'DRO SFO HONOLULU DET MGT BR'::text
              WHEN ("left"(a."Org", 8) = '24403001'::text) THEN 'TRAVEL & BANK CARD SERVICES'::text
              WHEN ("left"(a."Org", 8) = '70040004'::text) THEN 'RAC-FREDERICK, MD'::text
              WHEN ("left"(a."Org", 8) = '18630700'::text) THEN 'DRO SLC LAS VEGAS DET MGT BR'::text
              WHEN ("left"(a."Org", 8) = '22120013'::text) THEN 'SMO, SPECIAL SECURITY'::text
              WHEN ("left"(a."Org", 8) = '18620200'::text) THEN 'DRO FIELD OFC DALLAS'::text
              WHEN ("left"(a."Org", 8) = '18630100'::text) THEN 'DRO DEN CHEYENNE WY DTY POST'::text
              WHEN ("left"(a."Org", 8) = '05010000'::text) THEN 'OD EXECUTIVE SECRETARIAT'::text
              WHEN ("left"(a."Org", 8) = '18620300'::text) THEN 'DRO DET CLEVELAND SUBOFFICE'::text
              WHEN ("left"(a."Org", 8) = '06171000'::text) THEN 'FREEDOM OF INFORMATION BRANCH'::text
              WHEN ("left"(a."Org", 8) = '24200000'::text) THEN 'OFC OF BUDGET & PROG PERFORMNC'::text
              WHEN ("left"(a."Org", 8) = '18060400'::text) THEN 'DRO LAW ENF SUPP CTR'::text
              WHEN ("left"(a."Org", 8) = '07101400'::text) THEN 'OPLA LOS ANGELES'::text
              WHEN ("left"(a."Org", 8) = '18610500'::text) THEN 'DRO MIA ORLANDO FL'::text
              WHEN ("left"(a."Org", 8) = '07101900'::text) THEN 'OPLA SEATTLE (TACOMA)'::text
              WHEN ("left"(a."Org", 8) = '70060002'::text) THEN 'DIV 1 UNIT 3 INFORM DISCLOSURE'::text
              WHEN ("left"(a."Org", 8) = '07100200'::text) THEN 'OPLA NEW YORK CITY'::text
              WHEN ("left"(a."Org", 8) = '70080002'::text) THEN 'DIV 2 UNIT 1 MISSION MGMT'::text
              WHEN ("left"(a."Org", 8) = '21000000'::text) THEN 'OFC OF ACQUISITION MANAGEMENT'::text
              WHEN ("left"(a."Org", 8) = '06098000'::text) THEN 'OHC STRATGIC REC & RETN UNIT'::text
              WHEN ("left"(a."Org", 8) = '18620400'::text) THEN 'DRO ELP EL PASO TX SPC'::text
              WHEN ("left"(a."Org", 8) = '23030600'::text) THEN 'IT FIELD OPERATIONS BRANCH'::text
              WHEN ("left"(a."Org", 8) = '18000200'::text) THEN 'DRO EXEC INFO UNIT'::text
              WHEN ("left"(a."Org", 8) = '18000300'::text) THEN 'DRO STRATEGIC INITIATIVES UNIT'::text
              WHEN ("left"(a."Org", 8) = '24301000'::text) THEN 'PROPERTY MANAGEMENT BRANCH'::text
              WHEN ("left"(a."Org", 8) = '22100020'::text) THEN 'RAC PLANTATION 2'::text
              WHEN ("left"(a."Org", 8) = '18620700'::text) THEN 'DRO SNA REMOVAL MGT BR'::text
              WHEN ("left"(a."Org", 8) = '07102000'::text) THEN 'OPLA HOUSTON'::text
              WHEN ("left"(a."Org", 8) = '70090001'::text) THEN 'DIV 1 UNIT 2 MIDDLE EAST-ASIA'::text
              WHEN ("left"(a."Org", 8) = '70020002'::text) THEN 'DIV 1 UNIT 1 FIELD REP FRU'::text
              WHEN ("left"(a."Org", 8) = '18620100'::text) THEN 'DRO FIELD OFC CHICAGO'::text
              WHEN ("left"(a."Org", 8) = '22120012'::text) THEN 'PSO FIELD OPS EASTERN REGION'::text
              WHEN ("left"(a."Org", 8) = '22100019'::text) THEN 'INTEGRITY PGMS SECTION'::text
              WHEN ("left"(a."Org", 8) = '22110010'::text) THEN 'ODO, SECTION 1'::text
              WHEN ("left"(a."Org", 8) = '18620800'::text) THEN 'DRO SPM OMAHA GRAND ISLND QRT'::text
              WHEN ("left"(a."Org", 8) = '18060100'::text) THEN 'DRO OPS INCIDENT & SPEC RESP'::text
              WHEN ("left"(a."Org", 8) = '18610100'::text) THEN 'DRO ATL DETENTN MGT BR'::text
              WHEN ("left"(a."Org", 8) = '18620600'::text) THEN 'DRO NOL JACKSON MS'::text
              WHEN ("left"(a."Org", 8) = '07102200'::text) THEN 'OPLA SAN DIEGO'::text
              WHEN ("left"(a."Org", 8) = '18060700'::text) THEN 'DRO AD REMOVAL'::text
              WHEN ("left"(a."Org", 8) = '06000000'::text) THEN 'MGMT & ADMIN EXEC ASSOC DIR'::text
              WHEN ("left"(a."Org", 8) = '18630600'::text) THEN 'DRO SEA PORTLAND OR SUBOFC'::text
              WHEN ("left"(a."Org", 8) = '18630300'::text) THEN 'DRO FPH PHO INSTITUT REMV PROG'::text
              WHEN ("left"(a."Org", 8) = '70060001'::text) THEN 'DIV 1 UNIT 4 ITRN RSRC FIN MGT'::text
              WHEN ("left"(a."Org", 8) = '23040300'::text) THEN 'INTEG SEC OPS CENTER BR'::text
              WHEN ("left"(a."Org", 8) = '23020100'::text) THEN 'HSI PORTF DEL BR'::text
              WHEN ("left"(a."Org", 8) = '70010001'::text) THEN 'UNIT 4 BULK CASH SMUGLNG'::text
              WHEN ("left"(a."Org", 8) = '24203000'::text) THEN 'OPERATN & MISSION SUPT BRANCH'::text
              WHEN ("left"(a."Org", 8) = '18060300'::text) THEN 'DRO ALT TO DETN UNIT'::text
              WHEN ("left"(a."Org", 8) = '18060600'::text) THEN 'DRO DAD CLINICAL SVCS DIVISION'::text
              WHEN ("left"(a."Org", 8) = '07100060'::text) THEN 'OPLA EXEC COMMUNICATIONS UNIT'::text
              WHEN ("left"(a."Org", 8) = '70030003'::text) THEN 'UNIT 2 TITLE 3 LINGUISTICS'::text
              WHEN ("left"(a."Org", 8) = '70010002'::text) THEN 'UNIT 1 NTC-1'::text
              WHEN ("left"(a."Org", 8) = '70020001'::text) THEN 'UNIT 3 CTR TRSM CRIM EXPLTN'::text
              WHEN ("left"(a."Org", 8) = '18610300'::text) THEN 'DRO BOS FUGITIVE OPS'::text
              WHEN ("left"(a."Org", 8) = '07100070'::text) THEN 'OPLA ETHICS UNIT'::text
              WHEN ("left"(a."Org", 8) = '18610900'::text) THEN 'DRO PHILADELPHIA YORK CO PA'::text
              WHEN ("left"(a."Org", 8) = '18610600'::text) THEN 'DRO NEW REMOVAL MGT BR'::text
              WHEN ("left"(a."Org", 8) = '18610800'::text) THEN 'DRO WAS NORFOLK VA DUTY POST'::text
              WHEN ("left"(a."Org", 8) = '05030200'::text) THEN 'DIGITAL MARKETING & OUTREACH'::text
              WHEN ("left"(a."Org", 8) = '05030400'::text) THEN 'CENTRAL REGION'::text
              WHEN ("left"(a."Org", 8) = '06090100'::text) THEN 'HUMAN RESOURCES OPRTNS CNTR'::text
              WHEN ("left"(a."Org", 8) = '22120010'::text) THEN 'PSU EOD'::text
              WHEN ("left"(a."Org", 8) = '23020500'::text) THEN 'M&A PORTF DEL BR'::text
              WHEN ("left"(a."Org", 8) = '18610700'::text) THEN 'DRO NYC VARICK NY'::text
              WHEN ("left"(a."Org", 8) = '07102300'::text) THEN 'OPLA MIAMI'::text
              WHEN ("left"(a."Org", 8) = '70020000'::text) THEN 'ASST DIR NATIONAL SECURTY INV'::text
              WHEN ("left"(a."Org", 8) = '07100500'::text) THEN 'OPLA BOSTON'::text
              WHEN ("left"(a."Org", 8) = '06051000'::text) THEN 'OLCD TRN & PERFORMANCE SUPPORT'::text
              WHEN ("left"(a."Org", 8) = '70050000'::text) THEN 'ASST DIR GLOBL TRADE INV IPRCC'::text
              WHEN ("left"(a."Org", 8) = '06091000'::text) THEN 'OHC LABOR RELATIONS BRANCH'::text
              WHEN ("left"(a."Org", 8) = '18610400'::text) THEN 'DRO FIELD OFC BUFFALO'::text
              WHEN ("left"(a."Org", 8) = '07101300'::text) THEN 'OPLA DALLAS'::text
              WHEN ("left"(a."Org", 8) = '07101000'::text) THEN 'OPLA DENVER'::text
              WHEN ("left"(a."Org", 8) = '05050300'::text) THEN 'OFTP TACTICAL OPS FT BENNING'::text
              WHEN ("left"(a."Org", 8) = '22100021'::text) THEN 'SAC CENTRAL'::text
              WHEN ("left"(a."Org", 8) = '18000100'::text) THEN 'DRO ADMIN INQUIRY UNIT'::text
              WHEN ("left"(a."Org", 8) = '23030200'::text) THEN 'CUSTOMER SUPPORT BRANCH'::text
              WHEN ("left"(a."Org", 8) = '07102500'::text) THEN 'OPLA NEWARK'::text
              WHEN ("left"(a."Org", 8) = '70080000'::text) THEN 'ASST DIR INTELLIGENCE'::text
              WHEN ("left"(a."Org", 8) = '23050100'::text) THEN 'WORKFORCE MANAGEMENT BR'::text
              WHEN ("left"(a."Org", 8) = '23020400'::text) THEN 'ENT PLTFRM SERV BR'::text
              WHEN ("left"(a."Org", 8) = '23020200'::text) THEN 'ERO PORTF DEL BR'::text
              WHEN ("left"(a."Org", 8) = '24403000'::text) THEN 'DEBT COLLECTION & MANAGEMENT'::text
              WHEN ("left"(a."Org", 8) = '05040100'::text) THEN 'DIVERSITY MANAGEMENT DIVISION'::text
              WHEN ("left"(a."Org", 8) = '05060000'::text) THEN 'OFC OF PARTNRSHP ENGAGMNT'::text
              WHEN ("left"(a."Org", 8) = '23030100'::text) THEN 'TACTICAL COMM BRANCH'::text
              WHEN ("left"(a."Org", 8) = '24302000'::text) THEN 'CONSTRUCTION & SUSTAINABILITY'::text
              WHEN ("left"(a."Org", 8) = '06052000'::text) THEN 'OLCD LEADERSHIP DEV (DALLAS)'::text
              WHEN ("left"(a."Org", 8) = '05040000'::text) THEN 'OFC OF DIVERSTY & CIVIL RIGHTS'::text
              WHEN ("left"(a."Org", 8) = '07101800'::text) THEN 'OPLA NEW ORLEANS'::text
              WHEN ("left"(a."Org", 8) = '07100800'::text) THEN 'OPLA ORLANDO'::text
              WHEN ("left"(a."Org", 8) = '06050000'::text) THEN 'OLCD HQ'::text
              WHEN ("left"(a."Org", 8) = '06020000'::text) THEN 'STRATEGC RESOURCE ALIGNMNT DIV'::text
              WHEN ("left"(a."Org", 8) = '07100600'::text) THEN 'OPLA BALTIMORE'::text
              WHEN ("left"(a."Org", 8) = '18500300'::text) THEN 'ERO ADV/SPECL TRNG(CHARLESTON)'::text
              WHEN ("left"(a."Org", 8) = '21400000'::text) THEN 'OAQ MISSION SUPPORT BRANCH'::text
              WHEN ("left"(a."Org", 8) = '22120000'::text) THEN 'SECURITY'::text
              WHEN ("left"(a."Org", 8) = '07100001'::text) THEN 'OPLA EXECUTIVE OFFICE'::text
              WHEN ("left"(a."Org", 8) = '18060200'::text) THEN 'DRO OSD ASSET MGMT UNIT'::text
              WHEN ("left"(a."Org", 8) = '07102600'::text) THEN 'OPLA MINNPLS/ST PAUL (OMAHA)'::text
              WHEN ("left"(a."Org", 8) = '07100100'::text) THEN 'OPLA WASHINGTON, D.C.'::text
              WHEN ("left"(a."Org", 8) = '07102100'::text) THEN 'OPLA PHOENIX (FLORENCE)'::text
              WHEN ("left"(a."Org", 8) = '21500000'::text) THEN 'OAQ INVESTIGTNS & MSN SPT'::text
              WHEN ("left"(a."Org", 8) = '07101700'::text) THEN 'OPLA EL PASO'::text
              WHEN ("left"(a."Org", 8) = '23040100'::text) THEN 'GOVERNANCE & RISK MGMT BRANCH'::text
              WHEN ("left"(a."Org", 8) = '23020600'::text) THEN 'OD-OPLA PORTF DEL BRANCH'::text
              WHEN ("left"(a."Org", 8) = '07100900'::text) THEN 'OPLA BUFFALO (BATAVIA)'::text
              WHEN ("left"(a."Org", 8) = '23010000'::text) THEN 'SOLUTIONS ENGINEERING DIVISION'::text
              WHEN ("left"(a."Org", 8) = '23020300'::text) THEN 'M&A, OD-OPLA PORT BR'::text
              WHEN ("left"(a."Org", 8) = '70000000'::text) THEN 'HOMELAND SECURTY INVESTIGATNS'::text
              WHEN ("left"(a."Org", 8) = '70030001'::text) THEN 'UNIT 1 CYBER CRIMES CTR'::text
              WHEN ("left"(a."Org", 8) = '21600000'::text) THEN 'OAQ DETENTION MANAGEMENT BR'::text
              WHEN ("left"(a."Org", 8) = '70010000'::text) THEN 'ASST DIR HSI INV PGMS'::text
              WHEN ("left"(a."Org", 8) = '22100022'::text) THEN 'RAC PHOENIX'::text
              WHEN ("left"(a."Org", 8) = '24300000'::text) THEN 'OFC OF ASSET & FACILITIES MGMT'::text
              WHEN ("left"(a."Org", 8) = '05020000'::text) THEN 'OFC OF CONGRESSIONAL RELATIONS'::text
              WHEN ("left"(a."Org", 8) = '70040001'::text) THEN 'UNIT 3 OPERTNS SOUTHWEST'::text
              WHEN ("left"(a."Org", 8) = '70070001'::text) THEN 'UNIT 2 OPERATIONS'::text
              WHEN ("left"(a."Org", 8) = '06090000'::text) THEN 'OHC CHIEF HUMAN CAPITAL OFFCR'::text
              WHEN ("left"(a."Org", 8) = '07101600'::text) THEN 'OPLA SAN ANTONIO (PORT ISABEL)'::text
              WHEN ("left"(a."Org", 8) = '22140010'::text) THEN 'MISSION SUPPORT'::text
              WHEN ("left"(a."Org", 8) = '05050200'::text) THEN 'ARMORY OPERATIONS, ALTOONA, PA'::text
              WHEN ("left"(a."Org", 8) = '18060800'::text) THEN 'DRO AD LAW ENF SYSTEMS'::text
              WHEN ("left"(a."Org", 8) = '22110011'::text) THEN 'MANAGEMENT INSPECTIONS UNIT'::text
              WHEN ("left"(a."Org", 8) = '07100300'::text) THEN 'OPLA PHILADELPHIA'::text
              WHEN ("left"(a."Org", 8) = '06098100'::text) THEN 'OHC BUSINESS MGMT UNIT'::text
              WHEN ("left"(a."Org", 8) = '07100400'::text) THEN 'OPLA ATLANTA'::text
              WHEN ("left"(a."Org", 8) = '07101200'::text) THEN 'OPLA HONOLULU'::text
              WHEN ("left"(a."Org", 8) = '24402000'::text) THEN 'FINANCIAL BUSINESS INTEGRATN'::text
              WHEN ("left"(a."Org", 8) = '18060000'::text) THEN 'DRO DEPUTY DIRECTOR'::text
              WHEN ("left"(a."Org", 8) = '18000000'::text) THEN 'DRO DIRECTOR'::text
              WHEN ("left"(a."Org", 8) = '06030000'::text) THEN 'OAS OFFICE OF POLICY'::text
              WHEN ("left"(a."Org", 8) = '24100000'::text) THEN 'OFC OF ASSURANCE & COMPLIANCE'::text
              WHEN ("left"(a."Org", 8) = '24000000'::text) THEN 'CHIEF FINANCIAL OFFICER'::text
              WHEN ("left"(a."Org", 8) = '06170000'::text) THEN 'INFO GOVERNANCE & PRIVACY'::text
              WHEN ("left"(a."Org", 8) = '06098200'::text) THEN 'OHC INTERNAL CONTROLS UNIT'::text
              WHEN ("left"(a."Org", 8) = '70050001'::text) THEN 'NATL INTLCL PROP RGHTS CTR DIV'::text
              WHEN ("left"(a."Org", 8) = '24400000'::text) THEN 'OFC OF FINANCIAL MANAGEMENT'::text
              WHEN ("left"(a."Org", 8) = '23050300'::text) THEN 'ACQ & INVENTORY MGMT BR'::text
              WHEN ("left"(a."Org", 8) = '23050200'::text) THEN 'FINANCIAL MGMT BRANCH'::text
              WHEN ("left"(a."Org", 8) = '21900000'::text) THEN 'OAQ MISSION SUPPORT ORLANDO'::text
              WHEN ("left"(a."Org", 8) = '07101100'::text) THEN 'OPLA DETROIT'::text
              WHEN ("left"(a."Org", 8) = '24401000'::text) THEN 'FINANCIAL RPTG & ACCNTABILITY'::text
              WHEN ("left"(a."Org", 8) = '21501000'::text) THEN 'OAQ PURCHASE CARD'::text
              WHEN ("left"(a."Org", 8) = '21200000'::text) THEN 'OAQ INFO TECHNOLOGY SRVCS BR'::text
              WHEN ("left"(a."Org", 8) = '07100040'::text) THEN 'OPLA FIELD LEGAL OPS'::text
              WHEN ("left"(a."Org", 8) = '22100017'::text) THEN 'OPERATIONAL SUPPORT'::text
              WHEN ("left"(a."Org", 8) = '06093000'::text) THEN 'OHC MEDICAL AFFAIRS UNIT'::text
              WHEN ("left"(a."Org", 8) = '24201000'::text) THEN 'FORMULATION BRANCH'::text
              WHEN ("left"(a."Org", 8) = '23030300'::text) THEN 'NETWORK & INFRA BRANCH'::text
              WHEN ("left"(a."Org", 8) = '05050000'::text) THEN 'OFC OF FIREARMS & TACTICAL PRG'::text
              WHEN ("left"(a."Org", 8) = '05030000'::text) THEN 'OFFICE OF PUBLIC AFFAIRS'::text
              WHEN ("left"(a."Org", 8) = '06095000'::text) THEN 'OHC EMPL RESILIENCE UNIT'::text
              WHEN ("left"(a."Org", 8) = '23030500'::text) THEN 'ENTERPRISE SERVICES BRANCH'::text
              WHEN ("left"(a."Org", 8) = '06096000'::text) THEN 'OHC STRATEGIC INITIATIVES'::text
              WHEN ("left"(a."Org", 8) = '22110013'::text) THEN 'OPR, IDO, ERAU'::text
              WHEN ("left"(a."Org", 8) = '06097000'::text) THEN 'OHC HRIT UNIT'::text
              WHEN ("left"(a."Org", 8) = '06220000'::text) THEN 'OFC OF INVEST & PRG ACCNTABLTY'::text
              WHEN ("left"(a."Org", 8) = '22100016'::text) THEN 'JOINT INTAKE CENTER'::text
              WHEN ("left"(a."Org", 8) = '23020000'::text) THEN 'SOLUTIONS DELIVERY DIVISION'::text
              WHEN ("left"(a."Org", 8) = '23050000'::text) THEN 'RESOURCE MGMT DIV'::text
              WHEN ("left"(a."Org", 8) = '23030400'::text) THEN 'APPLICATION SERVICES BRANCH'::text
              WHEN ("left"(a."Org", 8) = '23000000'::text) THEN 'CHIEF INFORMATION OFFICER'::text
              WHEN ("left"(a."Org", 8) = '05050100'::text) THEN 'OFTP POLICY & PROGRAMS BRANCH'::text
              WHEN ("left"(a."Org", 8) = '21310000'::text) THEN 'OAQ BUSINESS OPERATIONS DIV'::text
              WHEN ("left"(a."Org", 8) = '23020700'::text) THEN 'IT INFRASTRUCTURE BRANCH'::text
              WHEN ("left"(a."Org", 8) = '70090000'::text) THEN 'ASST DIR INTERNATL OPERATNS'::text
              WHEN ("left"(a."Org", 8) = '22000000'::text) THEN 'OPR, DIRECTOR'::text
              WHEN ("left"(a."Org", 8) = '70060000'::text) THEN 'ASST DIR MISSION SUPPORT'::text
              WHEN ("left"(a."Org", 8) = '06098300'::text) THEN 'OHC PAYROLL UNIT'::text
              WHEN ("left"(a."Org", 8) = '06094000'::text) THEN 'OHC EXECUTIVE SERVICES UNIT'::text
              WHEN ("left"(a."Org", 8) = '06050100'::text) THEN 'OLCD MISSION SUPPORT'::text
              WHEN ("left"(a."Org", 8) = '22100015'::text) THEN 'SPECIAL INVESTIGATIONS'::text
              WHEN ("left"(a."Org", 8) = '05080000'::text) THEN 'OFC OF IMMIGRATION PROG EVALTN'::text
              WHEN ("left"(a."Org", 8) = '05030300'::text) THEN 'INTERNAL COMMUNICATION DIV'::text
              WHEN ("left"(a."Org", 8) = '05030100'::text) THEN 'MISSION SUPPORT DIV'::text
              WHEN ("left"(a."Org", 8) = '23040200'::text) THEN 'SECURITY ASSURANCE BRANCH'::text
              WHEN ("left"(a."Org", 8) = '22100000'::text) THEN 'OPR, INVESTIGATIONS'::text
              WHEN ("left"(a."Org", 8) = '05000000'::text) THEN 'OFFICE OF THE DIRECTOR'::text
              WHEN ("left"(a."Org", 8) = '70030000'::text) THEN 'ASST DIR OPRTNL TECHNLY & CYBR'::text
              WHEN ("left"(a."Org", 8) = '06092000'::text) THEN 'OHC POLICY UNIT'::text
              WHEN ("left"(a."Org", 8) = '05040200'::text) THEN 'COMPLAINTS & RESOLUTION DIV'::text
              WHEN ("left"(a."Org", 8) = '22110012'::text) THEN 'HQ, 287(G) PROGRAM'::text
              WHEN ("left"(a."Org", 8) = '21601000'::text) THEN 'OAQ DETENTION CONTRACTS LAGUNA'::text
              WHEN ("left"(a."Org", 8) = '24202000'::text) THEN 'EXECUTION BRANCH'::text
              WHEN ("left"(a."Org", 8) = '70040000'::text) THEN 'ASST DIR DOMESTIC OPERATIONS'::text
              WHEN ("left"(a."Org", 8) = '24205000'::text) THEN 'PAYROLL & POSITION MGMT BRANCH'::text
              WHEN ("left"(a."Org", 8) = '24204000'::text) THEN 'PROG ANALYSIS & EVALUATION BR'::text
              WHEN ("left"(a."Org", 8) = '22110000'::text) THEN 'INSPS & DET OVERSIGHT'::text
              WHEN ("left"(a."Org", 8) = '21100000'::text) THEN 'OAQ ACQIS PLCY & STRATGC SRCNG'::text
              WHEN ("left"(a."Org", 8) = '21602000'::text) THEN 'OAQ DETENTN CONTRACTS DETROIT'::text
              WHEN ("left"(a."Org", 8) = '70070000'::text) THEN 'ASST DIR JOINT TASK FORCE INV'::text
              WHEN ("left"(a."Org", 8) = '23040000'::text) THEN 'CISO & INFOR ASSURANCE DIV'::text
              WHEN ("left"(a."Org", 8) = '21800000'::text) THEN 'OAQ ACQUISITION SYSTEMS BRANCH'::text
              WHEN ("left"(a."Org", 8) = '21320000'::text) THEN 'OAQ MISSION SUPPORT DALLAS'::text
              ELSE NULL::text
          END AS cxo_org_text,
          CASE
              WHEN (a."Pos Off Ttl" = 'DEP DIR ICE'::text) THEN 'CI'::text
              WHEN (a."Pos Off Ttl" = 'CHIEF OF STAFF'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'MGMT & PROG ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'DEP CH OF STAFF'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SPECIAL ADVISOR (PROTOCOL & SPEC EVTS)'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'PROG MGR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'MSN SUPT SPECL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'ASSISTANT EXEC SEC'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'WRI EDIT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'ASST DIR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'CONGRSNL LIASN SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY CONGRSNL LIASN OFCR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SPEC ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY PUBLIC AFF SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'PUBLIC AFF SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'MISSION SUPPORT SPECIALIST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY MGMT & PROG ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'VIS INF SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'AUDIO VIS PRODN SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY AUDIO VIS PRODN SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'ASST DIR DIVERSITY & CIVIL RIGHTS'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'EQ EMPLMT SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'CLK'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'EQ EMPLMT MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY POLICY ADVISOR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'PLCY ADVSR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY EQ EMPLMT SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY EQ OPP SPEC'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'POLICY ADVSR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY CRIM INVSTGR'::text) THEN 'CI'::text
              WHEN (a."Pos Off Ttl" = 'CRIM INVSTGR'::text) THEN 'CI'::text
              WHEN (a."Pos Off Ttl" = 'EQUIP SPECLST ORDNC'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPP TECHNCN OA'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY GEN ENGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'ENGRG TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'LAW ENFORCEMENT PROG. MGR.'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'DEPRTN OFFCR (COURSE DEVLP/INSTR)'::text) THEN 'DO'::text
              WHEN (a."Pos Off Ttl" = 'TRAINING SPEC (FIREARMS)'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'FIREARMS PGRM SPCLST'::text) THEN 'LEOTHR'::text
              WHEN (a."Pos Off Ttl" = 'TRNG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'CRIMINAL INVESTIGATOR (INSTRUCTOR)'::text) THEN 'CI'::text
              WHEN (a."Pos Off Ttl" = 'DETNTN & DEPORTATN OFFCR'::text) THEN 'DO'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY DETNTN & DEPORTATN OFFCR'::text) THEN 'DO'::text
              WHEN (a."Pos Off Ttl" = 'FACIL OPERS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY COMMUNITY RELATIONS OFFCR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'COMMUNITY RELATIONS OFFCR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'SENIOR ADVSR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'DEP CHIEF OF STAFF'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'STAFF ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'BUDG ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'REGULATORY AND POLICY ANALYST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'ECONMST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'PLCY ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY REGULATORY ANALYST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY PLCY ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'ECONOMIST (CHIEF)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'CH OF STAFF'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY MSN SUPT SPECL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'INSTRUCTNL SYS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY INSTRUCTNL SYS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'PROG MGR (LRNG MGMT)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'TRNG INSTRU'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY INSTRUCTIONAL SPECIALIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'MISSION SUPRT ASST OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY TRNG INSTRU'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'DEPUTY CHIEF HUMAN CAPITAL OFFICER'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'CHIEF HUMAN CAPITAL OFFICER'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'HUMAN RESOURCES SPECLST (COMPEN)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SENIOR HUMAN RESOURCES ADVISOR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY STRATEGIC ADVSR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY HUMAN RESOURCES SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'HUMAN RESOURCES SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'HUMAN RESOURCES ASST OA'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY HUMAN RESOURCES SPECLST (EMPL BE'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'HUMAN RESOURCES SPECLST (RECRUIT&PLAC)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY HUMAN RESOURCES SPECLST (RECRUIT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY HUMAN RESOURCES SPECLST (CLASSIF'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'HUMAN RESOURCES SPECLST (CLASSIFN)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'PRE-EMPLOYMENT SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'PRE EMPLOYMENT ASST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'STUD TR (HUMAN RESOURCES)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY HR SPECLST (EMPL & LABOR REL)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'HUMAN RESOURCES SPECLST (LABOR REL)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY HUMAN RESOURCES SPECLST (LABOR R'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'LEAD HUMAN RESOURCES SPECLST (EMPL REL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY HUMAN RESOURCES SPECLST (EMPL RE'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'HR SPECLST (CLASSIFN RECRUIT & PLAC)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY PHYSICIAN'::text) THEN 'MED'::text
              WHEN (a."Pos Off Ttl" = 'PHYSICIAN'::text) THEN 'MED'::text
              WHEN (a."Pos Off Ttl" = 'OCCUPTL HLTH NURSE'::text) THEN 'MED'::text
              WHEN (a."Pos Off Ttl" = 'DRUG PROG COORD'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'HUMAN RESOURCES SPECLST (EMPL BENES)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'BEHAVIORAL HLTH SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'EMP ASSTNC PROG MGR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY PSYCH'::text) THEN 'MED'::text
              WHEN (a."Pos Off Ttl" = 'CHAPLAIN DIR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'PERS RES PSYCH'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY PERS RESEARCH PSYCH'::text) THEN 'MED'::text
              WHEN (a."Pos Off Ttl" = 'MGMT INF ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY HUMAN RESOURCES SPECLST (INFO SY'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'ADMV OFFCR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY ADMV OFFCR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'CIVILIAN PAY TECHNCN OA'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY HUMAN RESOURCES SPECLST (COMPEN)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'ASST DIR INF GOVERNANCE'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'RECS AND INFO MGMT SPEC'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'OPER RES ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'PRIVACY OFFICER'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'MGMT & PRO ANAL (PRIVACY COMPLIANCE)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SR INFO GOV ANALYST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'GOVNMNT INFO SPEC (PRIVACY COMPLIANCE)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'MGMT & PROG ANAL (BUDG & COR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY RECORDS & INFORMATION MGMT SPECI'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'PARALEGAL SPECLST (FOIA/PA)'::text) THEN 'LGLSUPT'::text
              WHEN (a."Pos Off Ttl" = 'PARALEGAL SPECLST'::text) THEN 'LGLSUPT'::text
              WHEN (a."Pos Off Ttl" = 'FOIA/PA ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY PARALEGAL SPECLST'::text) THEN 'LGLSUPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY PARALEGAL SPECLST (FOIA/PA)'::text) THEN 'LGLSUPT'::text
              WHEN (a."Pos Off Ttl" = 'PARALEGAL SPECLST (FOIA)'::text) THEN 'LGLSUPT'::text
              WHEN (a."Pos Off Ttl" = 'FREEDOM OF INFORMATION ACT DIRECTOR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'DEPUTY DIRECTOR FOIA'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'GEN ENGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'ITSPEC (INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."Pos Off Ttl" = 'OPERATIONS RESEARCH ANALYST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'DEP PRINC LEG ADVSR'::text) THEN 'ATTY'::text
              WHEN (a."Pos Off Ttl" = 'DEP PRIN LEGAL ADVSR MANAGEMENT'::text) THEN 'ATTY'::text
              WHEN (a."Pos Off Ttl" = 'PRINCIPAL LEGAL ADVISOR FOR ICE'::text) THEN 'ATTY'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY GEN ATTY'::text) THEN 'ATTY'::text
              WHEN (a."Pos Off Ttl" = 'GEN ATTY'::text) THEN 'ATTY'::text
              WHEN (a."Pos Off Ttl" = 'ATTY ADVSR'::text) THEN 'ATTY'::text
              WHEN (a."Pos Off Ttl" = 'ASSOC DEP PRINC LEG ADVSR'::text) THEN 'ATTY'::text
              WHEN (a."Pos Off Ttl" = 'PARALEGAL SPECIALIST (OPLA)'::text) THEN 'LGLSUPT'::text
              WHEN (a."Pos Off Ttl" = 'DEP PRINC LEGAL ADVSR HEADQUARTES'::text) THEN 'ATTY'::text
              WHEN (a."Pos Off Ttl" = 'HISTRN'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'LIBRN LAW'::text) THEN 'LGLSUPT'::text
              WHEN (a."Pos Off Ttl" = 'LEG ASST OA'::text) THEN 'LGLSUPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY GEN ATTY (ETHICS)'::text) THEN 'ATTY'::text
              WHEN (a."Pos Off Ttl" = 'GEN ATTY (ETHCIS)'::text) THEN 'ATTY'::text
              WHEN (a."Pos Off Ttl" = 'MAIL & FILE CLK OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'LEAD LEG ASST'::text) THEN 'LGLSUPT'::text
              WHEN (a."Pos Off Ttl" = 'CHIEF COUNSEL'::text) THEN 'ATTY'::text
              WHEN (a."Pos Off Ttl" = 'LAW CLK'::text) THEN 'LGLSUPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY LEG ASST OA'::text) THEN 'LGLSUPT'::text
              WHEN (a."Pos Off Ttl" = 'TRIAL ATTY'::text) THEN 'ATTY'::text
              WHEN (a."Pos Off Ttl" = 'STUD TR (LEG ASST) OA'::text) THEN 'LGLSUPT'::text
              WHEN (a."Pos Off Ttl" = 'ENFORCEMENT PROGRAMS MGR'::text) THEN 'LEOTHR'::text
              WHEN (a."Pos Off Ttl" = 'ASST DIR ENFCMNT & REMOVAL OPS'::text) THEN 'DO'::text
              WHEN (a."Pos Off Ttl" = 'DEP ASST DIR FLD OPERS'::text) THEN 'DO'::text
              WHEN (a."Pos Off Ttl" = 'INTEL RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."Pos Off Ttl" = 'EMERGENCY MANAGEMENT SPECIALIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY EMERGENCY MANAGEMENT SPECIALIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'STATCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'DEPUTY ASSISTANT DIRECTOR ERO'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'MGMT & PROG ANAL (DET SVCS MGR)'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'DEPRTN OFFCR (COMP STDS OFFCR)'::text) THEN 'DO'::text
              WHEN (a."Pos Off Ttl" = 'ASST DIR SECURE COMMUNITIES'::text) THEN 'DO'::text
              WHEN (a."Pos Off Ttl" = 'CRIM TARGETING SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY CRIM TARGETING SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'DEPRTN OFFCR'::text) THEN 'DO'::text
              WHEN (a."Pos Off Ttl" = 'LAW ENFCMNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY LAW ENFCMNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'ASST DIR ICE SRVCS HLTH CORPS'::text) THEN 'MED'::text
              WHEN (a."Pos Off Ttl" = 'HEALTH SYSTEMS SPECIALIST'::text) THEN 'MED'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY PHYSCN (PSYCHTRC)'::text) THEN 'MED'::text
              WHEN (a."Pos Off Ttl" = 'PHYSICIAN (CLINICAL DIRECTOR)'::text) THEN 'MED'::text
              WHEN (a."Pos Off Ttl" = 'PHYSICIAN (PSYCHIATRY)'::text) THEN 'MED'::text
              WHEN (a."Pos Off Ttl" = 'MEDCL OFFCR'::text) THEN 'MED'::text
              WHEN (a."Pos Off Ttl" = 'PHYSCN (GEN PRACTICE)'::text) THEN 'MED'::text
              WHEN (a."Pos Off Ttl" = 'PHYSICIAN (REG CLINICAL DIR)'::text) THEN 'MED'::text
              WHEN (a."Pos Off Ttl" = 'PHYSICIAN (CONSULTANT)'::text) THEN 'MED'::text
              WHEN (a."Pos Off Ttl" = 'PHYSICIAN (DAD/MED DIRECTOR)'::text) THEN 'MED'::text
              WHEN (a."Pos Off Ttl" = 'CLNCL NURSE'::text) THEN 'MED'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY HEALTH SYSTEM SPECIALIST'::text) THEN 'MED'::text
              WHEN (a."Pos Off Ttl" = 'PRACTICAL NURSE'::text) THEN 'MED'::text
              WHEN (a."Pos Off Ttl" = 'NURSE PRACTITIONER'::text) THEN 'MED'::text
              WHEN (a."Pos Off Ttl" = 'MEDCL REC TECHNCN'::text) THEN 'MED'::text
              WHEN (a."Pos Off Ttl" = 'DNTL HYGIENIST'::text) THEN 'MED'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY WRI EDIT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SECY OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'ADV PRAC NURSE (NURSE PRACTITIONER)'::text) THEN 'MED'::text
              WHEN (a."Pos Off Ttl" = 'DIAGNSTC RADIOLOGIC TECHNCN'::text) THEN 'MED'::text
              WHEN (a."Pos Off Ttl" = 'DNTL ASST'::text) THEN 'MED'::text
              WHEN (a."Pos Off Ttl" = 'PHYSCN ASST'::text) THEN 'MED'::text
              WHEN (a."Pos Off Ttl" = 'CLNCL PSYCH'::text) THEN 'MED'::text
              WHEN (a."Pos Off Ttl" = 'SOC WRKR'::text) THEN 'MED'::text
              WHEN (a."Pos Off Ttl" = 'ADVANCE NURSE PRAC'::text) THEN 'MED'::text
              WHEN (a."Pos Off Ttl" = 'MATHCL STATCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY ENFCMNT & RMVL ASST OA'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'STUD TR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'TRAFF MGMT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'TRNG TECHNCN OA'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPP TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPP TECHNCN (INVENT)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'BOND CNTL SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY BOND SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'LAW ENFCMNT TECHNCN'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'ADMV ASST OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'RECR SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'MGMT ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'IMMGRTN ENF AGT'::text) THEN 'DO'::text
              WHEN (a."Pos Off Ttl" = 'FOOD SRVS SPEC'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'AUTMTV MECH'::text) THEN 'WGSUPT'::text
              WHEN (a."Pos Off Ttl" = 'LAW ENFCMNT COMMUN ASST'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY MSN SUPT SPECL (COTR)'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'MTRLS HNDLR'::text) THEN 'WGSUPT'::text
              WHEN (a."Pos Off Ttl" = 'OFF AUTOMATION ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'INVENT MGMT SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'ELCTRON TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'OFF AUTOMATION CLK'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'MGMT PROG TECHNCN OA'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'ASST DIR OFF OF ACQ'::text) THEN 'CONT'::text
              WHEN (a."Pos Off Ttl" = 'PROCUR ANAL'::text) THEN 'CONT'::text
              WHEN (a."Pos Off Ttl" = 'DEBARMENT ANAL (SENIOR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'DEBARMENT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'CONTR SPECLST'::text) THEN 'CONT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY CONTR SPECLST'::text) THEN 'CONT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY DEBARMENT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'EXEC ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'PROCUR & BUS RESOURCES MGMT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY PROCUR & BUS RESOURCES MGT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SR PROCUR & BUS RESOURCES MGMT ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'BUS OPERS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'DEP ASSOC DIRECTOR OPR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'ASSOC DIR OPR'::text) THEN 'CI'::text
              WHEN (a."Pos Off Ttl" = 'MGMT & PROG ANAL (SR PROG ADVSR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'ASST DIR INVST OPR'::text) THEN 'CI'::text
              WHEN (a."Pos Off Ttl" = 'OVERSIGHT ADM (PREA)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'INVESTIGATIVE ANALYST'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'OPERTNL ANALS SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY INSIDER THREAT OPERTNL ANAL'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'INTELL RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."Pos Off Ttl" = 'OPERATIONAL ANALYSIS SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY INTEL RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."Pos Off Ttl" = 'TECHNCL ENFCMNT OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY TECHNCL ENFCMNT OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY INTELL & INFO SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'INSIDER THREAT SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'MGMT & PROG ANALYST (PROG ADVSR)'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'INVESTIGATIVE PROGRAM OFFICER'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'DIV DIRINSPR & DETENTION OVERSIGHT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY INSPS & COMPLNC MGR'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'INSPS & COMPLNC SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY INSPS & COMPLC SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY SUPV ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY INSPS & COMPLNC SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY SECUR SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'PERS SECUR SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY PERS SECUR SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'SECUR SPECLST (POLYGRAPH EXAMNR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY SECUR SPECLST (POLYGRAPH EXMNR)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'PHYS SECUR SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'SECUR SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SECUR INSPR'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'CHIEF INFORMATION OFFICER'::text) THEN 'ITSPEC'::text
              WHEN (a."Pos Off Ttl" = 'DEP CHIEF INFORMATION OFFICER'::text) THEN 'ITSPEC'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY IT SPEC (ENTACH/INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."Pos Off Ttl" = 'COMMUNICATIONS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'ITSPEC (PLCYPLN)'::text) THEN 'ITSPEC'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY ITSPEC (SYSANALYSIS)'::text) THEN 'ITSPEC'::text
              WHEN (a."Pos Off Ttl" = 'IT PROJ MGR'::text) THEN 'ITSPEC'::text
              WHEN (a."Pos Off Ttl" = 'ITSPEC (SYSADMIN)'::text) THEN 'ITSPEC'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY ITSPEC (INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."Pos Off Ttl" = 'ITSPEC'::text) THEN 'ITSPEC'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY ITSPEC (APPSW/INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."Pos Off Ttl" = 'LEAD ITSPEC (INFOSEC)'::text) THEN 'ITSPEC'::text
              WHEN (a."Pos Off Ttl" = 'ITSPEC (DATAMGT)'::text) THEN 'ITSPEC'::text
              WHEN (a."Pos Off Ttl" = 'ITSPEC (SYSANALYSIS)'::text) THEN 'ITSPEC'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY ITSPEC (PLCYPLN)'::text) THEN 'ITSPEC'::text
              WHEN (a."Pos Off Ttl" = 'ITSPEC (CUSTSPT)'::text) THEN 'ITSPEC'::text
              WHEN (a."Pos Off Ttl" = 'ITSPEC (NETWORK)'::text) THEN 'ITSPEC'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY ITSPEC (CUSTSPT)'::text) THEN 'ITSPEC'::text
              WHEN (a."Pos Off Ttl" = 'LEAD ITSPEC (NETWORK)'::text) THEN 'ITSPEC'::text
              WHEN (a."Pos Off Ttl" = 'LEAD ITSPEC (CUSTSPT)'::text) THEN 'ITSPEC'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY ITSPEC (NETWORK)'::text) THEN 'ITSPEC'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY BUS OPERS SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'DEPUTY CHIEF FINANCIAL OFFICER'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'CHIEF FINANCIAL OFCR (ICE)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPV ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'LEAD MGMT & PROG ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'LEAD FNANCL PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'FNANCL PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'FIN PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'DIR BUDGET & PROGRAM PERFORMANCE'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY BUDG ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'PROGRAM MANAGEMENT SPECIALIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SAFETY & OCCUPTL HLTH SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY INDL HYGIENIST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SAFETY & OCCUPTL HLTH MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'NURSE CONSULTANT'::text) THEN 'MED'::text
              WHEN (a."Pos Off Ttl" = 'MAIL & FILE ASST (OA)'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'SPACE MGMT SUPRT SPECL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'ARCH'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'LEASE ADMIN PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SPACE MGMT SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'PROG MGR (FACILITIES)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'BLDG MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'FACIL PROG MGR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'UTIL SYS RPRER OPERTR'::text) THEN 'WGSUPT'::text
              WHEN (a."Pos Off Ttl" = 'DIR OF FNANCL MGMT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY FNANCL PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY SYS ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'MISSION SUPRT SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'LEAD ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SYS ACCTNT'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY FNANCL SYS MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'FINANCIAL SYSTEMS MANAGER'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'FINANCIL MGMT SYSTEMS ANAL (TEAM LEAD)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY FNANCL BUS INTEG MANAGER'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'ACCTG TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY MGMT INF ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY FNANCL ANAL'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'LEAD ACCTG TECHNCN'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'FNANCL MGR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'ACCNT (TAX)'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'DEPUTY DIRECTOR INVESTIGATIONS'::text) THEN 'CI'::text
              WHEN (a."Pos Off Ttl" = 'ASST DIR OFFICE OF INVESTIGATIONS'::text) THEN 'CI'::text
              WHEN (a."Pos Off Ttl" = 'AUDR'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'DEP ASST DIR INVEST'::text) THEN 'CI'::text
              WHEN (a."Pos Off Ttl" = 'INTELL OPERS SPECLST'::text) THEN 'IRS'::text
              WHEN (a."Pos Off Ttl" = 'CRIM RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."Pos Off Ttl" = 'PAROLE PROG SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'ASSET FORFEIT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY SOC SCI PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'SOC SCI PROG SPECLST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'INTELL OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY INTELL OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY FORENSIC DOCMT EXAMN'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'FORENSIC DOCMT EXAMNR'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'FNGRPRNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'PHOTOGR (FORENSIC)'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'SR. DIG MULTIMEDIA FORENSIC ANALYST'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'SEIZED PROPERTY SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY FNGRPRNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY FORENSIC DOCMT EXAMNR'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'PHYS SCNTST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'EMER PREPAREDNESS SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'SEVP APPEALS ADJUDR'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'COUNTERTERRORISM INTELL SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'SEVP FLD REPR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY SEVP FLD REPR'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'SEVP ADJUDR'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY SEVP ADJUDR'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'EXECUTIVE DIRECTOR LEIS'::text) THEN 'CI'::text
              WHEN (a."Pos Off Ttl" = 'CYBER OPERS OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'COMPR FORENSIC ANAL'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'CRIM INVSTGR (NATL PROG MGR)'::text) THEN 'CI'::text
              WHEN (a."Pos Off Ttl" = 'TACTICAL COMMUN OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."Pos Off Ttl" = 'TELECOMMUN SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'SOC SCI PROG SPEC (VICTIM WIT ASST)'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'INVESTIGATIVE ASST OA'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'SPEC AGT IN CHG'::text) THEN 'CI'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY INTELL RES SPECLST'::text) THEN 'IRS'::text
              WHEN (a."Pos Off Ttl" = 'SEIZED PROP SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'INVESTIGATIVE CLK OA'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'FILE ASST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'TECHNCL OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'PROG ASST'::text) THEN 'OTHRSPT'::text
              WHEN (a."Pos Off Ttl" = 'INTELL ASST'::text) THEN 'IRS'::text
              WHEN (a."Pos Off Ttl" = 'ICE TACTICAL OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY ICE TACTICAL OFFCR'::text) THEN 'LEOTHR'::text
              WHEN (a."Pos Off Ttl" = 'PROG SUPRT SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'INF RECPTNST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'ENFCMNT OPERS SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'SECTOR ENFCMNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'LEAD SECTOR ENFCMNT SPECLST'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'TECHNICAL EQUIPMENT SPECIALIST'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY TACTICAL COMMUN OFFCR'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'DIR FEDL EXPORT ENFCMNT COORDNTN CENTR'::text) THEN 'CI'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY PROG SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY PROG ANAL'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY INVESTIGATIVE ANALYST'::text) THEN 'LESUPT'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY FOIA/PRIVACY ACT SPECLST'::text) THEN 'MSNSUPT'::text
              WHEN (a."Pos Off Ttl" = 'DIR INTELL'::text) THEN 'IRS'::text
              WHEN (a."Pos Off Ttl" = 'DEP ASST DIR INTEL'::text) THEN 'IRS'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY INTELL OPERS SPECLST'::text) THEN 'IRS'::text
              WHEN (a."Pos Off Ttl" = 'DEP DIR, INTERNATIONAL AFFAIRS'::text) THEN 'CI'::text
              WHEN (a."Pos Off Ttl" = 'DIR INTERPOL WASH'::text) THEN 'CI'::text
              WHEN (a."Pos Off Ttl" = 'SUPVY CRIM INVSTGR (OPERS CH)'::text) THEN 'CI'::text
              WHEN (a."Pos Off Ttl" = 'DEPRTN LIASN OFFCR'::text) THEN 'DO'::text
              WHEN (a."Pos Off Ttl" = 'IMMIGRATN OFFCR'::text) THEN 'LEOTHR'::text
              ELSE a."Pos Off Ttl"
          END AS "tableau_TG",
          CASE
              WHEN ("left"(a."Org", 8) = '70040002'::text) THEN 'CRIM INVSTGR'::text
              WHEN ("left"(a."Org", 8) = '70040003'::text) THEN 'CRIM INVSTGR'::text
              WHEN ("left"(a."Org", 8) = '70080001'::text) THEN 'INTEL RES SPECLST'::text
              WHEN ("left"(a."Org", 8) = '18620500'::text) THEN 'DEPRTN OFFCR'::text
              WHEN ("left"(a."Org", 8) = '70050002'::text) THEN 'INTELL RES SPECLST'::text
              WHEN ("left"(a."Org", 8) = '18610200'::text) THEN 'DEPRTN OFFCR'::text
              WHEN ("left"(a."Org", 8) = '23030000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN ("left"(a."Org", 8) = '70010003'::text) THEN 'SUPVY VICTIM ASST PROG SPECLST'::text
              WHEN ("left"(a."Org", 8) = '07100700'::text) THEN 'GEN ATTY'::text
              WHEN ("left"(a."Org", 8) = '18630200'::text) THEN 'DEPRTN OFFCR'::text
              WHEN ("left"(a."Org", 8) = '07100050'::text) THEN 'GEN ATTY'::text
              WHEN ("left"(a."Org", 8) = '07102400'::text) THEN 'GEN ATTY'::text
              WHEN ("left"(a."Org", 8) = '70030002'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN ("left"(a."Org", 8) = '18630400'::text) THEN 'DEPRTN OFFCR'::text
              WHEN ("left"(a."Org", 8) = '18630500'::text) THEN 'DEPRTN OFFCR'::text
              WHEN ("left"(a."Org", 8) = '24403001'::text) THEN 'FNANCL PROG SPECLST'::text
              WHEN ("left"(a."Org", 8) = '70040004'::text) THEN 'CRIM INVSTGR'::text
              WHEN ("left"(a."Org", 8) = '18630700'::text) THEN 'DEPRTN OFFCR'::text
              WHEN ("left"(a."Org", 8) = '22120013'::text) THEN 'SECUR SPECLST'::text
              WHEN ("left"(a."Org", 8) = '18620200'::text) THEN 'DEPRTN OFFCR'::text
              WHEN ("left"(a."Org", 8) = '18630100'::text) THEN 'DEPRTN OFFCR'::text
              WHEN ("left"(a."Org", 8) = '05010000'::text) THEN 'MISSION SUPPORT SPECIALIST'::text
              WHEN ("left"(a."Org", 8) = '18620300'::text) THEN 'DEPRTN OFFCR'::text
              WHEN ("left"(a."Org", 8) = '06171000'::text) THEN 'PARALEGAL SPECLST (FOIA/PA)'::text
              WHEN ("left"(a."Org", 8) = '24200000'::text) THEN 'BUDG ANAL'::text
              WHEN ("left"(a."Org", 8) = '18060400'::text) THEN 'SUPVY DETNTN & DEPORTATNOFFCR'::text
              WHEN ("left"(a."Org", 8) = '07101400'::text) THEN 'GEN ATTY'::text
              WHEN ("left"(a."Org", 8) = '18610500'::text) THEN 'SUPVY DETNTN & DEPORTATNOFFCR'::text
              WHEN ("left"(a."Org", 8) = '07101900'::text) THEN 'LEG ASST OA'::text
              WHEN ("left"(a."Org", 8) = '70060002'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN ("left"(a."Org", 8) = '07100200'::text) THEN 'GEN ATTY'::text
              WHEN ("left"(a."Org", 8) = '70080002'::text) THEN 'SUPVY MGMT & PROG ANAL'::text
              WHEN ("left"(a."Org", 8) = '21000000'::text) THEN 'PROCUR ANAL'::text
              WHEN ("left"(a."Org", 8) = '06098000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN ("left"(a."Org", 8) = '18620400'::text) THEN 'DEPRTN OFFCR'::text
              WHEN ("left"(a."Org", 8) = '23030600'::text) THEN 'ITSPEC (INFOSEC)'::text
              WHEN ("left"(a."Org", 8) = '18000200'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN ("left"(a."Org", 8) = '18000300'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN ("left"(a."Org", 8) = '24301000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN ("left"(a."Org", 8) = '22100020'::text) THEN 'CRIM INVSTGR'::text
              WHEN ("left"(a."Org", 8) = '18620700'::text) THEN 'DEPRTN OFFCR'::text
              WHEN ("left"(a."Org", 8) = '07102000'::text) THEN 'LEG ASST OA'::text
              WHEN ("left"(a."Org", 8) = '70090001'::text) THEN 'CRIM INVSTGR'::text
              WHEN ("left"(a."Org", 8) = '70020002'::text) THEN 'SUPVY MGMT & PROG ANAL'::text
              WHEN ("left"(a."Org", 8) = '18620100'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN ("left"(a."Org", 8) = '22120012'::text) THEN 'PHYS SECUR SPECLST'::text
              WHEN ("left"(a."Org", 8) = '22100019'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN ("left"(a."Org", 8) = '22110010'::text) THEN 'INSPS & COMPLNC SPECLST'::text
              WHEN ("left"(a."Org", 8) = '18620800'::text) THEN 'DEPRTN OFFCR'::text
              WHEN ("left"(a."Org", 8) = '18060100'::text) THEN 'EMERGENCY MANAGEMENT SPECIALIST'::text
              WHEN ("left"(a."Org", 8) = '18610100'::text) THEN 'MSN SUPT SPECL'::text
              WHEN ("left"(a."Org", 8) = '18620600'::text) THEN 'DETNTN & DEPORTATN OFFCR'::text
              WHEN ("left"(a."Org", 8) = '07102200'::text) THEN 'GEN ATTY'::text
              WHEN ("left"(a."Org", 8) = '18060700'::text) THEN 'ENFORCEMENT PROGRAMS MGR'::text
              WHEN ("left"(a."Org", 8) = '06000000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN ("left"(a."Org", 8) = '18630600'::text) THEN 'DEPRTN OFFCR'::text
              WHEN ("left"(a."Org", 8) = '18630300'::text) THEN 'DEPRTN OFFCR'::text
              WHEN ("left"(a."Org", 8) = '70060001'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN ("left"(a."Org", 8) = '23040300'::text) THEN 'ITSPEC (INFOSEC)'::text
              WHEN ("left"(a."Org", 8) = '23020100'::text) THEN 'IT PROJ MGR'::text
              WHEN ("left"(a."Org", 8) = '70010001'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN ("left"(a."Org", 8) = '24203000'::text) THEN 'SUPVY BUDG ANAL'::text
              WHEN ("left"(a."Org", 8) = '18060300'::text) THEN 'SUPVY DETNTN & DEPORTATNOFFCR'::text
              WHEN ("left"(a."Org", 8) = '18060600'::text) THEN 'CLNCL NURSE'::text
              WHEN ("left"(a."Org", 8) = '07100060'::text) THEN 'GEN ATTY'::text
              WHEN ("left"(a."Org", 8) = '70030003'::text) THEN 'BUS OPERS SPECLST'::text
              WHEN ("left"(a."Org", 8) = '70010002'::text) THEN 'INTELL RES SPECLST'::text
              WHEN ("left"(a."Org", 8) = '70020001'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN ("left"(a."Org", 8) = '18610300'::text) THEN 'DEPRTN OFFCR'::text
              WHEN ("left"(a."Org", 8) = '07100070'::text) THEN 'GEN ATTY'::text
              WHEN ("left"(a."Org", 8) = '18610900'::text) THEN 'ENFORCEMENT & REMOVAL ASSISTANT OA'::text
              WHEN ("left"(a."Org", 8) = '18610600'::text) THEN 'DEPRTN OFFCR'::text
              WHEN ("left"(a."Org", 8) = '18610800'::text) THEN 'DEPRTN OFFCR'::text
              WHEN ("left"(a."Org", 8) = '05030200'::text) THEN 'PUBLIC AFF SPECLST'::text
              WHEN ("left"(a."Org", 8) = '05030400'::text) THEN 'PUBLIC AFF SPECLST'::text
              WHEN ("left"(a."Org", 8) = '06090100'::text) THEN 'DEPRTN OFFCR'::text
              WHEN ("left"(a."Org", 8) = '22120010'::text) THEN 'PERS SECUR SPECLST'::text
              WHEN ("left"(a."Org", 8) = '23020500'::text) THEN 'ITSPEC (INFOSEC)'::text
              WHEN ("left"(a."Org", 8) = '18610700'::text) THEN 'DEPRTN OFFCR'::text
              WHEN ("left"(a."Org", 8) = '07102300'::text) THEN 'MSN SUPT SPECL'::text
              WHEN ("left"(a."Org", 8) = '70020000'::text) THEN 'INVESTIGATIVE ANALYST'::text
              WHEN ("left"(a."Org", 8) = '07100500'::text) THEN 'LEG ASST OA'::text
              WHEN ("left"(a."Org", 8) = '06051000'::text) THEN 'SUPVY MGMT & PROG ANAL'::text
              WHEN ("left"(a."Org", 8) = '70050000'::text) THEN 'DEPUTY DIRECTOR INVESTIGATIONS'::text
              WHEN ("left"(a."Org", 8) = '06091000'::text) THEN 'HUMAN RESOURCES SPECLST'::text
              WHEN ("left"(a."Org", 8) = '18610400'::text) THEN 'DEPRTN OFFCR'::text
              WHEN ("left"(a."Org", 8) = '07101300'::text) THEN 'GEN ATTY'::text
              WHEN ("left"(a."Org", 8) = '07101000'::text) THEN 'SUPVY GEN ATTY'::text
              WHEN ("left"(a."Org", 8) = '05050300'::text) THEN 'DEPRTN OFFCR (COURSE DEVLP/INSTR)'::text
              WHEN ("left"(a."Org", 8) = '22100021'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN ("left"(a."Org", 8) = '18000100'::text) THEN 'DETNTN & DEPORTATN OFFCR'::text
              WHEN ("left"(a."Org", 8) = '23030200'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN ("left"(a."Org", 8) = '07102500'::text) THEN 'GEN ATTY'::text
              WHEN ("left"(a."Org", 8) = '70080000'::text) THEN 'INTELL RES SPECLST'::text
              WHEN ("left"(a."Org", 8) = '23050100'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN ("left"(a."Org", 8) = '23020400'::text) THEN 'ITSPEC (INFOSEC)'::text
              WHEN ("left"(a."Org", 8) = '23020200'::text) THEN 'IT PROJ MGR'::text
              WHEN ("left"(a."Org", 8) = '24403000'::text) THEN 'FNANCL PROG SPECLST'::text
              WHEN ("left"(a."Org", 8) = '05040100'::text) THEN 'PLCY ADVSR'::text
              WHEN ("left"(a."Org", 8) = '05060000'::text) THEN 'COMMUNITY RELATIONS OFFCR'::text
              WHEN ("left"(a."Org", 8) = '23030100'::text) THEN 'ITSPEC (CUSTSPT)'::text
              WHEN ("left"(a."Org", 8) = '24302000'::text) THEN 'BLDG MGR'::text
              WHEN ("left"(a."Org", 8) = '06052000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN ("left"(a."Org", 8) = '05040000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN ("left"(a."Org", 8) = '07101800'::text) THEN 'GEN ATTY'::text
              WHEN ("left"(a."Org", 8) = '07100800'::text) THEN 'GEN ATTY'::text
              WHEN ("left"(a."Org", 8) = '06050000'::text) THEN 'CHIEF OF STAFF'::text
              WHEN ("left"(a."Org", 8) = '06020000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN ("left"(a."Org", 8) = '07100600'::text) THEN 'SUPVY GEN ATTY'::text
              WHEN ("left"(a."Org", 8) = '18500300'::text) THEN 'DEPRTN OFFCR (COURSE DEVLP/INSTR)'::text
              WHEN ("left"(a."Org", 8) = '21400000'::text) THEN 'CONTR SPECLST'::text
              WHEN ("left"(a."Org", 8) = '22120000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN ("left"(a."Org", 8) = '07100001'::text) THEN 'SUPVY GEN ATTY'::text
              WHEN ("left"(a."Org", 8) = '18060200'::text) THEN 'MSN SUPT SPECL'::text
              WHEN ("left"(a."Org", 8) = '07102600'::text) THEN 'STUD TR (LEG ASST) OA'::text
              WHEN ("left"(a."Org", 8) = '07100100'::text) THEN 'GEN ATTY'::text
              WHEN ("left"(a."Org", 8) = '07102100'::text) THEN 'MAIL & FILE CLK OA'::text
              WHEN ("left"(a."Org", 8) = '21500000'::text) THEN 'SUPVY CONTR SPECLST'::text
              WHEN ("left"(a."Org", 8) = '07101700'::text) THEN 'MSN SUPT SPECL'::text
              WHEN ("left"(a."Org", 8) = '23040100'::text) THEN 'ITSPEC (INFOSEC)'::text
              WHEN ("left"(a."Org", 8) = '23020600'::text) THEN 'SUPVY ITSPEC (SYSANALYSIS)'::text
              WHEN ("left"(a."Org", 8) = '07100900'::text) THEN 'MAIL & FILE CLK OA'::text
              WHEN ("left"(a."Org", 8) = '23010000'::text) THEN 'SUPVY ITSPEC (APPSW/INFOSEC)'::text
              WHEN ("left"(a."Org", 8) = '23020300'::text) THEN 'SUPVY ITSPEC (APPSW/INFOSEC)'::text
              WHEN ("left"(a."Org", 8) = '70000000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN ("left"(a."Org", 8) = '70030001'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN ("left"(a."Org", 8) = '21600000'::text) THEN 'PROCUR ANAL'::text
              WHEN ("left"(a."Org", 8) = '70010000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN ("left"(a."Org", 8) = '22100022'::text) THEN 'CRIM INVSTGR'::text
              WHEN ("left"(a."Org", 8) = '24300000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN ("left"(a."Org", 8) = '05020000'::text) THEN 'MSN SUPT SPECL'::text
              WHEN ("left"(a."Org", 8) = '70040001'::text) THEN 'CRIM INVSTGR'::text
              WHEN ("left"(a."Org", 8) = '70070001'::text) THEN 'CRIM INVSTGR'::text
              WHEN ("left"(a."Org", 8) = '06090000'::text) THEN 'CHIEF OF STAFF'::text
              WHEN ("left"(a."Org", 8) = '07101600'::text) THEN 'GEN ATTY'::text
              WHEN ("left"(a."Org", 8) = '22140010'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN ("left"(a."Org", 8) = '05050200'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN ("left"(a."Org", 8) = '18060800'::text) THEN 'DETNTN & DEPORTATN OFFCR'::text
              WHEN ("left"(a."Org", 8) = '22110011'::text) THEN 'SUPVY INSPS & COMPLNC MGR'::text
              WHEN ("left"(a."Org", 8) = '07100300'::text) THEN 'GEN ATTY'::text
              WHEN ("left"(a."Org", 8) = '06098100'::text) THEN 'MSN SUPT SPECL'::text
              WHEN ("left"(a."Org", 8) = '07100400'::text) THEN 'GEN ATTY'::text
              WHEN ("left"(a."Org", 8) = '07101200'::text) THEN 'SUPVY GEN ATTY'::text
              WHEN ("left"(a."Org", 8) = '24402000'::text) THEN 'SYS ACCTNT'::text
              WHEN ("left"(a."Org", 8) = '18060000'::text) THEN 'ASST DIR ENFCMNT & REMOVAL OPS'::text
              WHEN ("left"(a."Org", 8) = '18000000'::text) THEN 'SUPVY DETNTN & DEPORTATNOFFCR'::text
              WHEN ("left"(a."Org", 8) = '06030000'::text) THEN 'REGULATORY AND POLICY ANALYST'::text
              WHEN ("left"(a."Org", 8) = '24100000'::text) THEN 'SUPVY ACCTNT'::text
              WHEN ("left"(a."Org", 8) = '24000000'::text) THEN 'CHIEF OF STAFF'::text
              WHEN ("left"(a."Org", 8) = '06170000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN ("left"(a."Org", 8) = '06098200'::text) THEN 'HUMAN RESOURCES SPECLST'::text
              WHEN ("left"(a."Org", 8) = '70050001'::text) THEN 'MISSION SUPRT ASST OA'::text
              WHEN ("left"(a."Org", 8) = '24400000'::text) THEN 'ACCTNT'::text
              WHEN ("left"(a."Org", 8) = '23050300'::text) THEN 'BUS OPERS SPECLST'::text
              WHEN ("left"(a."Org", 8) = '23050200'::text) THEN 'ITSPEC'::text
              WHEN ("left"(a."Org", 8) = '21900000'::text) THEN 'BUS OPERS SPECLST'::text
              WHEN ("left"(a."Org", 8) = '07101100'::text) THEN 'GEN ATTY'::text
              WHEN ("left"(a."Org", 8) = '24401000'::text) THEN 'FNANCL PROG SPECLST'::text
              WHEN ("left"(a."Org", 8) = '21501000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN ("left"(a."Org", 8) = '21200000'::text) THEN 'SUPVY CONTR SPECLST'::text
              WHEN ("left"(a."Org", 8) = '07100040'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN ("left"(a."Org", 8) = '22100017'::text) THEN 'INTELL RES SPECLST'::text
              WHEN ("left"(a."Org", 8) = '06093000'::text) THEN 'OCCUPTL HLTH NURSE'::text
              WHEN ("left"(a."Org", 8) = '24201000'::text) THEN 'BUDG ANAL'::text
              WHEN ("left"(a."Org", 8) = '23030300'::text) THEN 'LEAD ITSPEC (CUSTSPT)'::text
              WHEN ("left"(a."Org", 8) = '05050000'::text) THEN 'SUPVY MGMT & PROG ANAL'::text
              WHEN ("left"(a."Org", 8) = '05030000'::text) THEN 'SUPVY PUBLIC AFF SPECLST'::text
              WHEN ("left"(a."Org", 8) = '06095000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN ("left"(a."Org", 8) = '23030500'::text) THEN 'ITSPEC (INFOSEC)'::text
              WHEN ("left"(a."Org", 8) = '06096000'::text) THEN 'PERS RES PSYCH'::text
              WHEN ("left"(a."Org", 8) = '22110013'::text) THEN 'SUPVY INSP AND COMPLNC SPEC'::text
              WHEN ("left"(a."Org", 8) = '06097000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN ("left"(a."Org", 8) = '06220000'::text) THEN 'SYS ENGR'::text
              WHEN ("left"(a."Org", 8) = '22100016'::text) THEN 'OPERTNL ANALS SPECLST'::text
              WHEN ("left"(a."Org", 8) = '23020000'::text) THEN 'SUPVY ITSPEC (INFOSEC)'::text
              WHEN ("left"(a."Org", 8) = '23050000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN ("left"(a."Org", 8) = '23030400'::text) THEN 'ITSPEC'::text
              WHEN ("left"(a."Org", 8) = '23000000'::text) THEN 'SUPVY IT SPEC (ENTACH/INFOSEC)'::text
              WHEN ("left"(a."Org", 8) = '05050100'::text) THEN 'MSN SUPT SPECL'::text
              WHEN ("left"(a."Org", 8) = '21310000'::text) THEN 'PROCUR & BUS RESOURCES MGMT ANAL'::text
              WHEN ("left"(a."Org", 8) = '23020700'::text) THEN 'IT PROJ MGR'::text
              WHEN ("left"(a."Org", 8) = '70090000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN ("left"(a."Org", 8) = '22000000'::text) THEN 'SUPVY CRIM INVSTGR'::text
              WHEN ("left"(a."Org", 8) = '70060000'::text) THEN 'ASST DIR OFFICE OF INVESTIGATIONS'::text
              WHEN ("left"(a."Org", 8) = '06098300'::text) THEN 'CIVILIAN PAY TECHNCN OA'::text
              WHEN ("left"(a."Org", 8) = '06094000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN ("left"(a."Org", 8) = '06050100'::text) THEN 'MSN SUPT SPECL'::text
              WHEN ("left"(a."Org", 8) = '22100015'::text) THEN 'CRIM INVSTGR'::text
              WHEN ("left"(a."Org", 8) = '05080000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN ("left"(a."Org", 8) = '05030300'::text) THEN 'COMPR FORENSIC ANAL'::text
              WHEN ("left"(a."Org", 8) = '05030100'::text) THEN 'MISSION SUPPORT SPECIALIST'::text
              WHEN ("left"(a."Org", 8) = '23040200'::text) THEN 'SUPVY ITSPEC (INFOSEC)'::text
              WHEN ("left"(a."Org", 8) = '22100000'::text) THEN 'ASST DIR INVST OPR'::text
              WHEN ("left"(a."Org", 8) = '05000000'::text) THEN 'SUPVY GEN ATTY'::text
              WHEN ("left"(a."Org", 8) = '70030000'::text) THEN 'SPEC ASST'::text
              WHEN ("left"(a."Org", 8) = '06092000'::text) THEN 'HUMAN RESOURCES SPECLST'::text
              WHEN ("left"(a."Org", 8) = '05040200'::text) THEN 'EQ EMPLMT SPECLST'::text
              WHEN ("left"(a."Org", 8) = '22110012'::text) THEN 'INSPS & COMPLNC SPECLST'::text
              WHEN ("left"(a."Org", 8) = '21601000'::text) THEN 'SUPVY CONTR SPECLST'::text
              WHEN ("left"(a."Org", 8) = '24202000'::text) THEN 'BUDG ANAL'::text
              WHEN ("left"(a."Org", 8) = '70040000'::text) THEN 'CRIM INVSTGR'::text
              WHEN ("left"(a."Org", 8) = '24205000'::text) THEN 'BUDG ANAL'::text
              WHEN ("left"(a."Org", 8) = '24204000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN ("left"(a."Org", 8) = '22110000'::text) THEN 'MGMT & PROG ANAL'::text
              WHEN ("left"(a."Org", 8) = '21100000'::text) THEN 'CONTR SPECLST'::text
              WHEN ("left"(a."Org", 8) = '21602000'::text) THEN 'CONTR SPECLST'::text
              WHEN ("left"(a."Org", 8) = '70070000'::text) THEN 'DEP ASST DIR INVEST'::text
              WHEN ("left"(a."Org", 8) = '23040000'::text) THEN 'SUPVY ITSPEC (INFOSEC)'::text
              WHEN ("left"(a."Org", 8) = '21800000'::text) THEN 'MGMT INF ANAL'::text
              WHEN ("left"(a."Org", 8) = '21320000'::text) THEN 'CONTR SPECLST'::text
              ELSE NULL::text
          END AS cxo_title
     FROM public.cxo_noa_archive_v2 a;
;

CREATE VIEW "public"."vcxo_staffing" AS
  SELECT DISTINCT b."Vacancy Total Applicants",
      a."Certificate Number",
      a."Certificate Vacancy Staffing Office Name",
      a."Certificate Vacancy Customer Agency Reference Code",
      a."Certificate Announcement Open Date",
      a."Certificate Vacancy Number",
      a."Certificate Vacancy Series Title",
      a."Certificate Vacancy Series",
      a."Certificate Request Description",
      a.filename,
      a.cxo_fy,
      a.cxo_pp1,
      a.ingested_at,
      b."Vacancy Number",
      b."Vacancy Total Selected Applicants",
          CASE
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB07'::text) THEN 'DIR'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB70'::text) THEN 'HSI'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB18'::text) THEN 'ERO'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB23'::text) THEN 'MGT'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB22'::text) THEN 'DIR'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB24'::text) THEN 'MGT'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB21'::text) THEN 'MGT'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB05'::text) THEN 'DIR'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB06'::text) THEN 'DIR'::text
              ELSE NULL::text
          END AS dir,
          CASE
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB06'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB0622'::text)) THEN 'OAS'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB05'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB0504'::text)) THEN 'OOD'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB05'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB0508'::text)) THEN 'OOD'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB05'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB0502'::text)) THEN 'OOD'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB05'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB0505'::text)) THEN 'OOD'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB05'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB0500'::text)) THEN 'OOD'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB05'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB0501'::text)) THEN 'OOD'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB05'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB0503'::text)) THEN 'OOD'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB05'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB0506'::text)) THEN 'OOD'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB22'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2200'::text)) THEN 'OPR'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB22'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2210'::text)) THEN 'OPR'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB22'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2211'::text)) THEN 'OPR'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB22'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2212'::text)) THEN 'OPR'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB22'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2214'::text)) THEN 'OPR'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB07'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB0710'::text)) THEN 'PLA'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB18'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB1862'::text)) THEN 'DRO'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB18'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB1861'::text)) THEN 'DRO'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB18'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB1850'::text)) THEN 'DRO'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB18'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB1863'::text)) THEN 'DRO'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB18'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB1800'::text)) THEN 'DRO'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB18'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB1806'::text)) THEN 'DRO'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB70'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB7009'::text)) THEN 'IAF'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB70'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB7004'::text)) THEN 'INV'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB70'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB7000'::text)) THEN 'INV'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB70'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB7001'::text)) THEN 'INV'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB70'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB7002'::text)) THEN 'INV'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB70'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB7003'::text)) THEN 'INV'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB70'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB7005'::text)) THEN 'INV'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB70'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB7006'::text)) THEN 'INV'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB70'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB7007'::text)) THEN 'INV'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB70'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB7010'::text)) THEN 'INV'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB70'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB7008'::text)) THEN 'ITL'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB24'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2410'::text)) THEN 'CFO'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB24'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2440'::text)) THEN 'CFO'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB24'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2400'::text)) THEN 'CFO'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB24'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2420'::text)) THEN 'CFO'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB24'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2430'::text)) THEN 'CFO'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB23'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2300'::text)) THEN 'CIO'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB23'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2301'::text)) THEN 'CIO'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB23'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2302'::text)) THEN 'CIO'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB23'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2303'::text)) THEN 'CIO'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB23'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2304'::text)) THEN 'CIO'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB23'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2305'::text)) THEN 'CIO'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB06'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB0600'::text)) THEN 'MAA'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB06'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB0602'::text)) THEN 'MAA'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB21'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2100'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB21'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2110'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB21'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2120'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB21'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2131'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB21'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2132'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB21'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2140'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB21'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2150'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB21'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2160'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB21'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2180'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB21'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2190'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB06'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB0609'::text)) THEN 'OAS'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB06'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB0617'::text)) THEN 'OAS'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB06'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB0605'::text)) THEN 'OAS'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB06'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB0603'::text)) THEN 'OAS'::text
              ELSE NULL::text
          END AS office,
          CASE
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB06'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB0622'::text)) THEN 'IPA'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB05'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB0504'::text)) THEN 'DCR'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB05'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB0508'::text)) THEN 'IPE'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB05'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB0502'::text)) THEN 'OCR'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB05'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB0505'::text)) THEN 'OFT'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB05'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB0500'::text)) THEN 'OOD'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB05'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB0501'::text)) THEN 'OOD'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB05'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB0503'::text)) THEN 'OPA'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB05'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB0506'::text)) THEN 'OPE'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB22'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2200'::text)) THEN 'OPR'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB22'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2210'::text)) THEN 'OPR'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB22'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2211'::text)) THEN 'OPR'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB22'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2212'::text)) THEN 'OPR'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB22'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2214'::text)) THEN 'OPR'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB07'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB0710'::text)) THEN 'CCO'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB18'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB1862'::text)) THEN 'FAO'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB18'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB1861'::text)) THEN 'FAT'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB18'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB1850'::text)) THEN 'FCT'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB18'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB1863'::text)) THEN 'FDN'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB18'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB1800'::text)) THEN 'FHQ'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB18'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB1806'::text)) THEN 'FHQ'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB70'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB7009'::text)) THEN 'OAG'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB70'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB7004'::text)) THEN 'VAT'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB70'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB7000'::text)) THEN 'VHQ'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB70'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB7001'::text)) THEN 'VHQ'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB70'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB7002'::text)) THEN 'VHQ'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB70'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB7003'::text)) THEN 'VHQ'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB70'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB7005'::text)) THEN 'VHQ'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB70'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB7006'::text)) THEN 'VHQ'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB70'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB7007'::text)) THEN 'VHQ'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB70'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB7010'::text)) THEN 'VHQ'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB70'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB7008'::text)) THEN 'IHQ'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB24'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2410'::text)) THEN 'ACO'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB24'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2440'::text)) THEN 'BFC'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB24'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2400'::text)) THEN 'CFO'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB24'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2420'::text)) THEN 'OBD'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB24'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2430'::text)) THEN 'OFA'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB23'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2300'::text)) THEN 'CIO'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB23'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2301'::text)) THEN 'CIO'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB23'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2302'::text)) THEN 'CIO'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB23'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2303'::text)) THEN 'CIO'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB23'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2304'::text)) THEN 'CIO'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB23'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2305'::text)) THEN 'CIO'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB06'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB0600'::text)) THEN 'MAA'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB06'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB0602'::text)) THEN 'SRD'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB21'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2100'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB21'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2110'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB21'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2120'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB21'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2131'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB21'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2132'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB21'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2140'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB21'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2150'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB21'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2160'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB21'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2180'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB21'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB2190'::text)) THEN 'OAQ'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB06'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB0609'::text)) THEN 'HCD'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB06'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB0617'::text)) THEN 'IGP'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB06'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB0605'::text)) THEN 'LDC'::text
              WHEN (("left"(a."Certificate Vacancy Customer Agency Reference Code", 4) = 'BB06'::text) OR ("left"(a."Certificate Vacancy Customer Agency Reference Code", 6) = 'BB0603'::text)) THEN 'POL'::text
              ELSE NULL::text
          END AS bud,
          CASE
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB050000'::text) THEN 'OFFICE OF THE DIRECTOR'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB050100'::text) THEN 'OD EXECUTIVE SECRETARIAT'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB050200'::text) THEN 'OFC OF CONGRESSIONAL RELATIONS'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB050300'::text) THEN 'OFFICE OF PUBLIC AFFAIRS'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB050301'::text) THEN 'MISSION SUPPORT DIV'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB050302'::text) THEN 'STRATEGIC COMMUNICATION DIV'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB050303'::text) THEN 'INTERNAL COMMUNICATION DIV'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB050304'::text) THEN 'HQ MEDIA OPERATIONS DIV'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB050400'::text) THEN 'OFC OF DIVERSTY & CIVIL RIGHTS'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB050401'::text) THEN 'DIVERSITY MANAGEMENT DIVISION'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB050402'::text) THEN 'COMPLAINTS & RESOLUTION DIV'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB050500'::text) THEN 'OFC OF FIREARMS & TACTICAL PRG'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB050501'::text) THEN 'OFTP POLICY & PROGRAMS BRANCH'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB050502'::text) THEN 'ARMORY OPERATIONS, ALTOONA, PA'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB050503'::text) THEN 'OFTP TACTICAL OPS FT BENNING'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB050600'::text) THEN 'OFC OF PARTNRSHP ENGAGMNT'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB050800'::text) THEN 'OFC OF IMMIGRATION PROG EVALTN'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB060000'::text) THEN 'MGMT & ADMIN EXEC ASSOC DIR'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB060200'::text) THEN 'STRATEGC RESOURCE ALIGNMNT DIV'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB060300'::text) THEN 'OAS OFFICE OF POLICY'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB060500'::text) THEN 'OLCD HQ'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB060501'::text) THEN 'OLCD MISSION SUPPORT'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB060510'::text) THEN 'OLCD TRN & PERFORMANCE SUPPORT'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB060520'::text) THEN 'OLCD LEADERSHIP DEV (DALLAS)'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB060900'::text) THEN 'OHC CHIEF HUMAN CAPITAL OFFCR'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB060901'::text) THEN 'HUMAN RESOURCES OPRTNS CNTR'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB060910'::text) THEN 'OHC EMPL & LABOR RELTN UNIT'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB060920'::text) THEN 'OHC POLICY UNIT'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB060930'::text) THEN 'OHC MEDICAL AFFAIRS UNIT'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB060940'::text) THEN 'OHC EXECUTIVE SERVICES UNIT'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB060950'::text) THEN 'OHC EMPL RESILIENCE UNIT'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB060960'::text) THEN 'OHC STRATEGIC INITIATIVES'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB060970'::text) THEN 'OHC HRIT UNIT'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB060980'::text) THEN 'OHC STRATGIC REC & RETN UNIT'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB060981'::text) THEN 'OHC BUSINESS MGMT UNIT'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB060982'::text) THEN 'OHC INTERNAL CONTROLS UNIT'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB060983'::text) THEN 'OHC PAYROLL UNIT'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB061700'::text) THEN 'INFO GOVERNANCE & PRIVACY'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB061710'::text) THEN 'FREEDOM OF INFORMATION BRANCH'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB062200'::text) THEN 'OFC OF INVEST & PRG ACCNTABLTY'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB071000'::text) THEN 'OPLA EXECUTIVE OFFICE'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB071001'::text) THEN 'OPLA WASHINGTON, D.C.'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB071002'::text) THEN 'OPLA NEW YORK CITY'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB071003'::text) THEN 'OPLA PHILADELPHIA'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB071004'::text) THEN 'OPLA ATLANTA'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB071005'::text) THEN 'OPLA BOSTON'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB071006'::text) THEN 'OPLA BALTIMORE'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB071007'::text) THEN 'OPLA CHICAGO'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB071008'::text) THEN 'OPLA ORLANDO'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB071009'::text) THEN 'OPLA BUFFALO'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB071010'::text) THEN 'OPLA DENVER'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB071011'::text) THEN 'OPLA DETROIT'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB071012'::text) THEN 'OPLA HONOLULU'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB071013'::text) THEN 'OPLA DALLAS'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB071014'::text) THEN 'OPLA LOS ANGELES'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB071016'::text) THEN 'OPLA SAN ANTONIO'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB071017'::text) THEN 'OPLA EL PASO'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB071018'::text) THEN 'OPLA NEW ORLEANS'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB071019'::text) THEN 'OPLA SEATTLE'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB071020'::text) THEN 'OPLA HOUSTON'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB071021'::text) THEN 'OPLA PHOENIX'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB071022'::text) THEN 'OPLA SAN DIEGO'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB071023'::text) THEN 'OPLA MIAMI'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB071024'::text) THEN 'OPLA SAN FRANCISCO'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB071025'::text) THEN 'OPLA NEWARK'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB071026'::text) THEN 'OPLA MINNEAPOLIS/ST PAUL'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB180000'::text) THEN 'DRO DIRECTOR'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB180001'::text) THEN 'DRO ADMIN INQUIRY UNIT'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB180002'::text) THEN 'DRO EXEC INFO UNIT'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB180003'::text) THEN 'DRO STRATEGIC INITIATIVES UNIT'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB180600'::text) THEN 'DRO DEPUTY DIRECTOR'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB180601'::text) THEN 'DRO AD FIELD OPERATIONS'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB180602'::text) THEN 'DRO AD OPERATIONS SUPPORT'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB180603'::text) THEN 'DRO AD CUSTODY MGMT'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB180604'::text) THEN 'DRO AD ENFORCEMENT'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB180606'::text) THEN 'DRO HEALTH SERVICE CORPS'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB180607'::text) THEN 'DRO AD REMOVAL'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB180608'::text) THEN 'DRO AD LAW ENF SYSTEMS'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB185003'::text) THEN 'ERO BASIC TRNG (GLYNCO)'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB186101'::text) THEN 'DRO FIELD OFC ATLANTA'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB186102'::text) THEN 'DRO FIELD OFC BALTIMORE'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB186103'::text) THEN 'DRO FIELD OFC BOSTON'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB186104'::text) THEN 'DRO FIELD OFC BUFFALO'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB186105'::text) THEN 'DRO FIELD OFC MIAMI'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB186106'::text) THEN 'DRO FIELD OFC NEWARK'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB186107'::text) THEN 'DRO FIELD OFC NEW YORK'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB186108'::text) THEN 'DRO FIELD OFC WASHINGTON DC'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB186109'::text) THEN 'DRO FIELD OFC PHILADELPHIA'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB186201'::text) THEN 'DRO FIELD OFC CHICAGO'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB186202'::text) THEN 'DRO FIELD OFC DALLAS'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB186203'::text) THEN 'DRO FIELD OFC DETROIT'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB186204'::text) THEN 'DRO FIELD OFC EL PASO'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB186205'::text) THEN 'DRO FIELD OFC HOUSTON'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB186206'::text) THEN 'DRO FIELD OFC NEW ORLEANS'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB186207'::text) THEN 'DRO FIELD OFC SAN ANTONIO'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB186208'::text) THEN 'DRO FIELD OFC ST PAUL'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB186301'::text) THEN 'DRO FIELD OFC DENVER'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB186302'::text) THEN 'DRO FIELD OFC LOS ANGELES'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB186303'::text) THEN 'DRO FIELD OFC PHOENIX AZ'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB186304'::text) THEN 'DRO FIELD OFC SAN DIEGO'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB186305'::text) THEN 'DRO FIELD OFC SAN FRANCISCO'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB186306'::text) THEN 'DRO FIELD OFC SEATTLE'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB186307'::text) THEN 'DRO FIELD OFC SALT LAKE CITY'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB210000'::text) THEN 'OFC OF ACQUISITION MANAGEMENT'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB211000'::text) THEN 'OAQ ACQIS PLCY & STRATGC SRCNG'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB212000'::text) THEN 'OAQ INFO TECHNOLOGY SRVCS BR'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB213100'::text) THEN 'OAQ BUSINESS OPERATIONS DIV'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB213200'::text) THEN 'OAQ MISSION SUPPORT DALLAS'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB214000'::text) THEN 'OAQ MISSION SUPPORT BRANCH'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB215000'::text) THEN 'OAQ INVESTIGTNS & MSN SPT'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB215010'::text) THEN 'OAQ PURCHASE CARD'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB216000'::text) THEN 'OAQ DETENTION MANAGEMENT BR'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB216010'::text) THEN 'OAQ DETENTION CONTRACTS LAGUNA'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB216020'::text) THEN 'OAQ DETENTN CONTRACTS DETROIT'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB218000'::text) THEN 'OAQ ACQUISITION SYSTEMS BRANCH'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB219000'::text) THEN 'OAQ MISSION SUPPORT ORLANDO'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB220000'::text) THEN 'OPR, DIRECTOR'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB221000'::text) THEN 'OPR, INVESTIGATIONS'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB221100'::text) THEN 'INSPS & DET OVERSIGHT'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB221200'::text) THEN 'SECURITY'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB221400'::text) THEN 'MISSION SUPPORT'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB230000'::text) THEN 'CHIEF INFORMATION OFFICER'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB230100'::text) THEN 'SOLUTIONS ENGINEERING DIVISION'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB230200'::text) THEN 'SOLUTIONS DELIVERY DIVISION'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB230201'::text) THEN 'HSI PORTF DEL BR'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB230202'::text) THEN 'ERO PORTF DEL BR'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB230203'::text) THEN 'M&A, OD-OPLA PORT BR'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB230204'::text) THEN 'ENT PLTFRM SERV BR'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB230205'::text) THEN 'M&A PORTF DEL BR'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB230206'::text) THEN 'OD-OPLA PORTF DEL BRANCH'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB230207'::text) THEN 'IT INFRASTRUCTURE BRANCH'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB230300'::text) THEN 'IT OPERATIONS DIVISION'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB230301'::text) THEN 'TACTICAL COMM BRANCH'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB230302'::text) THEN 'CUSTOMER SUPPORT BRANCH'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB230303'::text) THEN 'NETWORK & INFRA BRANCH'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB230304'::text) THEN 'APPLICATION SERVICES BRANCH'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB230305'::text) THEN 'ENTERPRISE SERVICES BRANCH'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB230306'::text) THEN 'IT FIELD OPERATIONS BRANCH'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB230400'::text) THEN 'CISO & INFOR ASSURANCE DIV'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB230401'::text) THEN 'GOVERNANCE & RISK MGMT BRANCH'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB230402'::text) THEN 'SECURITY ASSURANCE BRANCH'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB230403'::text) THEN 'INTEG SEC OPS CENTER BR'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB230500'::text) THEN 'RESOURCE MGMT DIV'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB230501'::text) THEN 'WORKFORCE MANAGEMENT BR'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB230502'::text) THEN 'FINANCIAL MGMT BRANCH'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB230503'::text) THEN 'ACQ & INVENTORY MGMT BR'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB240000'::text) THEN 'CHIEF FINANCIAL OFFICER'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB241000'::text) THEN 'OFC OF ASSURANCE & COMPLIANCE'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB242000'::text) THEN 'OFC OF BUDGET & PROG PERFORMNC'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB242010'::text) THEN 'FORMULATION BRANCH'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB242020'::text) THEN 'EXECUTION BRANCH'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB242030'::text) THEN 'OPERATN & MISSION SUPT BRANCH'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB242040'::text) THEN 'PROG ANALYSIS & EVALUATION BR'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB242050'::text) THEN 'PAYROLL & POSITION MGMT BRANCH'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB243000'::text) THEN 'OFC OF ASSET & FACILITIES MGMT'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB243010'::text) THEN 'OFC OF ASSET MANAGEMENT'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB243020'::text) THEN 'OFFICE OF FACILITIES MGMT'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB244000'::text) THEN 'OFC OF FINANCIAL MANAGEMENT'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB244010'::text) THEN 'FINANCIAL RPTG & ACCNTABILITY'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB244020'::text) THEN 'FINANCIAL BUSINESS INTEGRATN'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB244030'::text) THEN 'FINANCIAL OPERATIONS'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB700000'::text) THEN 'HOMELAND SECURTY INVESTIGATNS'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB700100'::text) THEN 'ASST DIR HSI INV PGMS'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB700200'::text) THEN 'ASST DIR NATIONAL SECURTY INV'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB700300'::text) THEN 'ASST DIR OPRTNL TECHNLY & CYBR'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB700400'::text) THEN 'ASST DIR DOMESTIC OPERATIONS'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB700500'::text) THEN 'ASST DIR GLOBL TRADE INV IPRCC'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB700600'::text) THEN 'ASST DIR MISSION SUPPORT'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB700700'::text) THEN 'ASST DIR JOINT TASK FORCE INV'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB700800'::text) THEN 'ASST DIR INTELLIGENCE'::text
              WHEN ("left"(a."Certificate Vacancy Customer Agency Reference Code", 8) = 'BB700900'::text) THEN 'ASST DIR INTERNATL OPERATNS'::text
              ELSE NULL::text
          END AS cxo_org_text
     FROM (public.cxo_usa1_archive a
       LEFT JOIN public.cxo_usa2_archive b ON ((b."Vacancy Number" = a."Certificate Vacancy Number")))
    WHERE (a.cxo_pp1 = b.cxo_pp1)
    ORDER BY a.cxo_pp1
;

-- Grant permissions section -------------------------------------------------


