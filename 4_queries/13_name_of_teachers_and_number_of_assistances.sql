SELECT teachers.name as teacher, cohorts.name as cohort, count(assistance_requests.*) 
FROM cohorts 
JOIN students ON cohorts.id = students.cohort_id
JOIN assistance_requests ON students.id = assistance_requests.student_id
JOIN teachers ON assistance_requests.teacher_id = teachers.id
WHERE cohorts.name = 'JUL02'
GROUP BY cohorts.name, teachers.name
ORDER BY teachers.name;