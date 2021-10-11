SELECT SUM(assignment_submissions.duration) 
FROM assignments 
JOIN assignment_submissions ON assignments.id = assignment_submissions.assignment_id
WHERE assignment_submissions.student_id IN (SELECT students.id FROM cohorts JOIN students ON cohorts.id = students.cohort_id WHERE cohorts.name ='FEB12');

