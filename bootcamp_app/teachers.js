const { Pool } = require('pg');

const pool = new Pool ({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});


pool.query(`
SELECT teachers.name as teacher, cohorts.name as cohort 
FROM cohorts 
JOIN students ON cohorts.id = students.cohort_id
JOIN assistance_requests ON students.id = assistance_requests.student_id
JOIN teachers ON assistance_requests.teacher_id = teachers.id
WHERE cohorts.name = '${process.argv[2] || 'JUL02'}'
GROUP BY cohorts.name, teachers.name
ORDER BY teachers.name;
`)
  .then(res => {
    //console.log(res.rows);
    res.rows.forEach(teacher => {
      console.log(`${teacher.cohort}: ${teacher.teacher}`);
    });
  });
  