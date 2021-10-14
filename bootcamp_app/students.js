const { Pool } = require('pg');

const pool = new Pool ({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const cohortName = process.argv[2];
const displayLimit = Number(process.argv[3]);

pool.query(`
SELECT students.id, students.name, cohorts.name as cohort_name
FROM students JOIN cohorts
ON students.cohort_id = cohorts.id
WHERE cohorts.name LIKE "%${cohortName || 'JUL'}%"
LIMIT ${displayLimit || 5};
`)
  .then(res => {
    res.rows.forEach(user => {
      console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohort_name} cohort`);
    });
  });
  