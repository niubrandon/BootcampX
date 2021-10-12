SELECT count(*) as total_assistances, students.name 
FROM students 
JOIN assistance_requests ON students.id = assistance_requests.student_id 
GROUP BY students.name
HAVING students.name = 'Elliot Dickinson';