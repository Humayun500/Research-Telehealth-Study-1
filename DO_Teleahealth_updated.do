*Data management after rechecking

*ther percived benifit and predisposition score have to be reverse

*benifit
#pb1_telemed pb2_telemed pb3_telemed pb4_telemed 
gen pb1_telemed_new = 6 if pb1_telemed ==1
replace pb1_telemed_new = 7 if pb1_telemed ==2
replace pb1_telemed_new = 8 if pb1_telemed ==3
replace pb1_telemed_new = 9 if pb1_telemed ==4
replace pb1_telemed_new = 10 if pb1_telemed ==5
recode pb1_telemed_new 6=5 7=4 8=3 9=2 10=1
label define pb1_telemed_new 1 "Strongly disagree" 2 "Disagree" 3"Neutral" 4 "Agree" 5"Stongly agree"
label value pb1_telemed_new pb1_telemed_new

*
gen pb2_telemed_new = 6 if pd2_telemed ==1
replace pb2_telemed_new = 7 if pd2_telemed ==2
replace pb2_telemed_new = 8 if pd2_telemed ==3
replace pb2_telemed_new = 9 if pd2_telemed ==4
replace pb2_telemed_new = 10 if pd2_telemed ==5
recode pb2_telemed_new 6=5 7=4 8=3 9=2 10=1
label define pb2_telemed_new 1 "Strongly disagree" 2 "Disagree" 3"Neutral" 4 "Agree" 5"Stongly agree"
label value pb2_telemed_new pb2_telemed_new
*
gen pb3_telemed_new = 6 if pb3_telemed ==1
replace pb3_telemed_new = 7 if pb3_telemed ==2
replace pb3_telemed_new = 8 if pb3_telemed ==3
replace pb3_telemed_new = 9 if pb3_telemed ==4
replace pb3_telemed_new = 10 if pb3_telemed ==5
recode pb3_telemed_new 6=5 7=4 8=3 9=2 10=1
label define pb3_telemed_new 1 "Strongly disagree" 2 "Disagree" 3"Neutral" 4 "Agree" 5"Stongly agree"
label value pb3_telemed_new pb3_telemed_new
*
gen pb4_telemed_new = 6 if pb4_telemed ==1
replace pb4_telemed_new = 7 if pb4_telemed ==2
replace pb4_telemed_new = 8 if pb4_telemed ==3
replace pb4_telemed_new = 9 if pb4_telemed ==4
replace pb4_telemed_new = 10 if pb4_telemed ==5
recode pb4_telemed_new 6=5 7=4 8=3 9=2 10=1
label define pb4_telemed_new 1 "Strongly disagree" 2 "Disagree" 3"Neutral" 4 "Agree" 5"Stongly agree"
label value pb4_telemed_new pb4_telemed_new

*
gen benefits_score_new = pb4_telemed_new +pb3_telemed_new +pb2_telemed_new+ pb1_telemed_new

*
#pd1_telemed pd2_telemed
*
gen pd1_telemed_new = 6 if pd1_telemed ==1
replace pd1_telemed_new = 7 if pd1_telemed ==2
replace pd1_telemed_new = 8 if pd1_telemed ==3
replace pd1_telemed_new = 9 if pd1_telemed ==4
replace pd1_telemed_new = 10 if pd1_telemed ==5
recode pd1_telemed_new 6=5 7=4 8=3 9=2 10=1
label define pd1_telemed_new 1 "Strongly disagree" 2 "Disagree" 3"Neutral" 4 "Agree" 5"Stongly agree"
label value pd1_telemed_new pd1_telemed_new
*
gen pd2_telemed_new = 6 if pd2_telemed ==1
replace pd2_telemed_new = 7 if pd2_telemed ==2
replace pd2_telemed_new = 8 if pd2_telemed ==3
replace pd2_telemed_new = 9 if pd2_telemed ==4
replace pd2_telemed_new = 10 if pd2_telemed ==5
recode pd2_telemed_new 6=5 7=4 8=3 9=2 10=1
label define pd2_telemed_new 1 "Strongly disagree" 2 "Disagree" 3"Neutral" 4 "Agree" 5"Stongly agree"
label value pd2_telemed_new pd2_telemed_new
*
gen predisposition_score_new = pd1_telemed_new+ pd2_telemed_new


*Analysis plan:
*
*Table 1: Distribution of study variables
tab1 age_cat Gender Marital_status_new Educational_status_new Profession_new Residence Devision_new used_telemed plan_use_telemed
tabstat age_cont, statistics( mean sd median  p25 p75)

*Table 2: Distribution of scores of knowledge, perceived benefits, perceived concerns, predisposition of telehealth (mean, sd, median, range)
tabstat knowledge_score, statistics( mean sd median  p25 p75 min max)
tabstat benefits_score, statistics( mean sd median  p25 p75 min max)
tabstat pc2_telemed, statistics( mean sd median  p25 p75 min max)
tabstat predisposition_score, statistics( mean sd median  p25 p75 min max)

tabstat benefits_score_new, statistics( mean sd median  p25 p75 min max)
tabstat predisposition_score_new, statistics( mean sd median  p25 p75 min max)


*Table 3: Association between study variables and knowledge of telehealth
*age
tabstat knowledge_score, statistics( mean sd median  p25 p75 ) by(age_cat)
kwallis knowledge_score, by(age_cat)
*Gender
tabstat knowledge_score, statistics( mean sd median  p25 p75 ) by(Gender)
ranksum knowledge_score, by (Gender)
*Marital_status_new
tabstat knowledge_score, statistics( mean sd median  p25 p75 ) by(Marital_status_new)
ranksum knowledge_score, by (Marital_status_new)
*Educational_status_new
tabstat knowledge_score, statistics( mean sd median  p25 p75 ) by(Educational_status_new)
kwallis knowledge_score, by(Educational_status_new)
*Profession_new
tabstat knowledge_score, statistics( mean sd median  p25 p75 ) by(Profession_new)
ranksum knowledge_score, by (Profession_new)
*Residence
tabstat knowledge_score, statistics( mean sd median  p25 p75 ) by(Residence)
ranksum knowledge_score, by (Residence)
*Devision_new
tabstat knowledge_score, statistics( mean sd median  p25 p75 ) by(Devision_new)
ranksum knowledge_score, by (Devision_new)
*used_telemed
tabstat knowledge_score, statistics( mean sd median  p25 p75) by(used_telemed)
ranksum knowledge_score, by (used_telemed)
*plan_use_telemed
tabstat knowledge_score, statistics( mean sd median  p25 p75 ) by(plan_use_telemed)
kwallis knowledge_score, by(plan_use_telemed)
*health_status_new
tabstat knowledge_score, statistics( mean sd median  p25 p75 ) by(health_status_new)
kwallis knowledge_score, by(health_status_new)


*Table 4: Association between study variables and perceived benefits of telehealth (wrong, please do with benefits_score_new)
*age
tabstat benefits_score, statistics( mean sd median  p25 p75 ) by(age_cat)
kwallis benefits_score, by(age_cat)
*Gender
tabstat benefits_score, statistics( mean sd median  p25 p75 ) by(Gender)
ranksum benefits_score, by (Gender)
*Marital_status_new
tabstat benefits_score, statistics( mean sd median  p25 p75 ) by(Marital_status_new)
ranksum benefits_score, by (Marital_status_new)
*Educational_status_new
tabstat benefits_score, statistics( mean sd median  p25 p75 ) by(Educational_status_new)
kwallis benefits_score, by(Educational_status_new)
*Profession_new
tabstat benefits_score, statistics( mean sd median  p25 p75 ) by(Profession_new)
ranksum benefits_score, by (Profession_new)
*Residence
tabstat benefits_score, statistics( mean sd median  p25 p75 ) by(Residence)
ranksum benefits_score, by (Residence)
*Devision_new
tabstat benefits_score, statistics( mean sd median  p25 p75 ) by(Devision_new)
ranksum benefits_score, by (Devision_new)
*used_telemed
tabstat benefits_score, statistics( mean sd median  p25 p75) by(used_telemed)
ranksum benefits_score, by (used_telemed)
*plan_use_telemed
tabstat benefits_score, statistics( mean sd median  p25 p75 ) by(plan_use_telemed)
kwallis benefits_score, by(plan_use_telemed)
*health_status_new
tabstat benefits_score, statistics( mean sd median  p25 p75 ) by(health_status_new)
kwallis benefits_score, by(health_status_new)
***
*age
tabstat benefits_score_new, statistics( mean sd median  p25 p75 ) by(age_cat)
kwallis benefits_score_new, by(age_cat)
*Gender
tabstat benefits_score_new, statistics( mean sd median  p25 p75 ) by(Gender)
ranksum benefits_score_new, by (Gender)
*Marital_status_new
tabstat benefits_score_new, statistics( mean sd median  p25 p75 ) by(Marital_status_new)
ranksum benefits_score_new, by (Marital_status_new)
*Educational_status_new
tabstat benefits_score_new, statistics( mean sd median  p25 p75 ) by(Educational_status_new)
kwallis benefits_score_new, by(Educational_status_new)
*Profession_new
tabstat benefits_score_new, statistics( mean sd median  p25 p75 ) by(Profession_new)
ranksum benefits_score_new, by (Profession_new)
*Residence
tabstat benefits_score_new, statistics( mean sd median  p25 p75 ) by(Residence)
ranksum benefits_score_new, by (Residence)
*Devision_new
tabstat benefits_score_new, statistics( mean sd median  p25 p75 ) by(Devision_new)
ranksum benefits_score_new, by (Devision_new)
*used_telemed
tabstat benefits_score_new, statistics( mean sd median  p25 p75) by(used_telemed)
ranksum benefits_score_new, by (used_telemed)
*plan_use_telemed
tabstat benefits_score_new, statistics( mean sd median  p25 p75 ) by(plan_use_telemed)
kwallis benefits_score_new, by(plan_use_telemed)
*health_status_new
tabstat benefits_score_new, statistics( mean sd median  p25 p75 ) by(health_status_new)
kwallis benefits_score_new, by(health_status_new)

*Table 5: Association between study variables and perceived concerns of telehealth
*age
tabstat pc2_telemed, statistics( mean sd median  p25 p75 ) by(age_cat)
kwallis pc2_telemed, by(age_cat)
*Gender
tabstat pc2_telemed, statistics( mean sd median  p25 p75 ) by(Gender)
ranksum pc2_telemed, by (Gender)
*Marital_status_new
tabstat pc2_telemed, statistics( mean sd median  p25 p75 ) by(Marital_status_new)
ranksum pc2_telemed, by (Marital_status_new)
*Educational_status_new
tabstat pc2_telemed, statistics( mean sd median  p25 p75 ) by(Educational_status_new)
kwallis pc2_telemed, by(Educational_status_new)
*Profession_new
tabstat pc2_telemed, statistics( mean sd median  p25 p75 ) by(Profession_new)
ranksum pc2_telemed, by (Profession_new)
*Residence
tabstat pc2_telemed, statistics( mean sd median  p25 p75 ) by(Residence)
ranksum pc2_telemed, by (Residence)
*Devision_new
tabstat pc2_telemed, statistics( mean sd median  p25 p75 ) by(Devision_new)
ranksum pc2_telemed, by (Devision_new)
*used_telemed
tabstat pc2_telemed, statistics( mean sd median  p25 p75) by(used_telemed)
ranksum pc2_telemed, by (used_telemed)
*plan_use_telemed
tabstat pc2_telemed, statistics( mean sd median  p25 p75 ) by(plan_use_telemed)
kwallis pc2_telemed, by(plan_use_telemed)
*health_status_new
tabstat pc2_telemed, statistics( mean sd median  p25 p75 ) by(health_status_new)
kwallis pc2_telemed, by(health_status_new)

*Table 6: Association between study variables and predisposition of telehealth (wrong, please do with predisposition_score_new)
*age
tabstat predisposition_score, statistics( mean sd median  p25 p75 ) by(age_cat)
kwallis predisposition_score, by(age_cat)
*Gender
tabstat predisposition_score, statistics( mean sd median  p25 p75 ) by(Gender)
ranksum predisposition_score, by (Gender)
*Marital_status_new
tabstat predisposition_score, statistics( mean sd median  p25 p75 ) by(Marital_status_new)
ranksum predisposition_score, by (Marital_status_new)
*Educational_status_new
tabstat predisposition_score, statistics( mean sd median  p25 p75 ) by(Educational_status_new)
kwallis predisposition_score, by(Educational_status_new)
*Profession_new
tabstat predisposition_score, statistics( mean sd median  p25 p75 ) by(Profession_new)
ranksum predisposition_score, by (Profession_new)
*Residence
tabstat predisposition_score, statistics( mean sd median  p25 p75 ) by(Residence)
ranksum predisposition_score, by (Residence)
*Devision_new
tabstat predisposition_score, statistics( mean sd median  p25 p75 ) by(Devision_new)
ranksum predisposition_score, by (Devision_new)
*used_telemed
tabstat predisposition_score, statistics( mean sd median  p25 p75) by(used_telemed)
ranksum predisposition_score, by (used_telemed)
*plan_use_telemed
tabstat predisposition_score, statistics( mean sd median  p25 p75 ) by(plan_use_telemed)
kwallis predisposition_score, by(plan_use_telemed)
*health_status_new
tabstat predisposition_score, statistics( mean sd median  p25 p75 ) by(health_status_new)
kwallis predisposition_score, by(health_status_new)
*
*age
tabstat predisposition_score_new, statistics( mean sd median  p25 p75 ) by(age_cat)
kwallis predisposition_score_new, by(age_cat)
*Gender
tabstat predisposition_score_new, statistics( mean sd median  p25 p75 ) by(Gender)
ranksum predisposition_score_new, by (Gender)
*Marital_status_new
tabstat predisposition_score_new, statistics( mean sd median  p25 p75 ) by(Marital_status_new)
ranksum predisposition_score_new, by (Marital_status_new)
*Educational_status_new
tabstat predisposition_score_new, statistics( mean sd median  p25 p75 ) by(Educational_status_new)
kwallis predisposition_score_new, by(Educational_status_new)
*Profession_new
tabstat predisposition_score_new, statistics( mean sd median  p25 p75 ) by(Profession_new)
ranksum predisposition_score_new, by (Profession_new)
*Residence
tabstat predisposition_score_new, statistics( mean sd median  p25 p75 ) by(Residence)
ranksum predisposition_score_new, by (Residence)
*Devision_new
tabstat predisposition_score_new, statistics( mean sd median  p25 p75 ) by(Devision_new)
ranksum predisposition_score_new, by (Devision_new)
*used_telemed
tabstat predisposition_score_new, statistics( mean sd median  p25 p75) by(used_telemed)
ranksum predisposition_score_new, by (used_telemed)
*plan_use_telemed
tabstat predisposition_score_new, statistics( mean sd median  p25 p75 ) by(plan_use_telemed)
kwallis predisposition_score_new, by(plan_use_telemed)
*health_status_new
tabstat predisposition_score_new, statistics( mean sd median  p25 p75 ) by(health_status_new)
kwallis predisposition_score_new, by(health_status_new)


*spearman correlation matrix
spearman knowledge_score  benefits_score_new pc2_telemed predisposition_score_new  , star(0.05)

*Analysis for drawing figures
*items of knowledge (5 items) will be used for drawing figure
#Figure 1: Distribution knowledge related items of telehealth 
#short form of knowledge items:
#Telehealth (general term) = gk_heard_telemed
#Telediagnosis = k1_telemed
#Teleintervention = k2_telemed
#Teletriage = k3_telemed
#Telemonitoring = k4_telemed

tab1 gk_heard_telemed k1_telemed k2_telemed k3_telemed k4_telemed

*items of perceived benefits (4 items)
#Figure 2: Distribution perceived benefits related items of telehealth 
#short form of perceived benefits items:
#Continuing education =pb1_telemed_new
#Cost reduction = pb2_telemed_new
#Improved access = pb3_telemed_new
#Quality of care=pb4_telemed_new

tab1 pb1_telemed_new pb2_telemed_new pb3_telemed_new pb4_telemed_new

*items of perceived concerns
#Figure 3: Distribution perceived concens related item of telehealth 
#short form of perceived concens item:
#Interpersonal relationship = pc2_telemed

tab pc2_telemed

*Predisposition
#Figure 4: Distribution predisposition related item of telehealth 
#short form of predisposition items:
#Receiving a telediagnosis = pd1_telemed_new
#Receiving a teleintervention = pd2_telemed_new

tab1 pd1_telemed_new pd2_telemed_new
************************************************************************************************
omega gk_heard_telemed k1_telemed k2_telemed k3_telemed k4_telemed pb1_telemed_new pb2_telemed_new pb3_telemed_new pb4_telemed_new pc2_telemed pd1_telemed_new pd2_telemed_new

br gk_heard_telemed k1_telemed k2_telemed k3_telemed k4_telemed pb1_telemed_new pb2_telemed_new pb3_telemed_new pb4_telemed_new pc2_telemed pd1_telemed_new pd2_telemed_new

codebook  gk_heard_telemed k1_telemed k2_telemed k3_telemed k4_telemed pb1_telemed_new pb2_telemed_new pb3_telemed_new pb4_telemed_new pc2_telemed pd1_telemed_new pd2_telemed_new

alpha  gk_heard_telemed k1_telemed k2_telemed k3_telemed k4_telemed pb1_telemed_new pb2_telemed_new pb3_telemed_new pb4_telemed_new pc2_telemed pd1_telemed_new pd2_telemed_new

