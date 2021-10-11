SELECT cohorts.name, count(assignment_submissions.assignment_id) AS total_submissions FROM cohorts 
JOIN students ON cohorts.id = students.cohort_id
JOIN assignment_submissions ON students.id = assignment_submissions.student_id
GROUP BY cohorts.name
ORDER BY count(assignment_submissions.assignment_id) DESC;