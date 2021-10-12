SELECT COUNT(*) as total_assistances, (SELECT name FROM teachers 
WHERE name = 'Waylon Boehm') as name FROM assistance_requests
WHERE teacher_id = 
(SELECT id FROM teachers 
WHERE name = 'Waylon Boehm');