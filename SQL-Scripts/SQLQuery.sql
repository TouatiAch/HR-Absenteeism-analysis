--create a join table 
select * from Absenteeism_at_work a 
left  join compensation b   
on a.ID = b.ID 
left join Reasons  r
on a.Reason_for_absence = r.Number;

--find the healthiest 
select * from Absenteeism_at_work 
where Social_drinker=0 and Social_smoker=0
and Body_mass_index<25 and 
Absenteeism_time_in_hours < (select AVG(Absenteeism_time_in_hours) from
Absenteeism_at_work)

--query otimization  
select 
a.ID,
r.Reason,
Month_of_absence,
Body_mass_index,
CASE WHEN Body_mass_index <18.5 then 'Underweight'
	 WHEN Body_mass_index between 18.5 and 25 then 'Healthy Weight'
	 WHEN Body_mass_index between 25 and 30 then 'Overweight'
	 WHEN Body_mass_index > 18.5  then 'Obese'
	 ELSE 'Unkonwn' end as BMI_Category,
CASE WHEN Month_of_absence in (12,1,2) then 'Winter'
	 WHEN Month_of_absence in (3,4,5) then 'Spring'
	 WHEN Month_of_absence in (6,7,8) then 'Summer'
	 WHEN Month_of_absence in (9,10,11) then 'Fall'
	 ELSE 'Unkonwn' end as Season_Names,
Month_of_absence,
Day_of_the_week,
Transportation_expense,
Education,
Son,
Social_drinker,
Social_smoker,
Pet,
Disciplinary_failure,
Age,
Work_load_Average_day,
Absenteeism_time_in_hours
from Absenteeism_at_work a 
left  join compensation b   
on a.ID = b.ID 
left join Reasons  r
on a.Reason_for_absence = r.Number;
