const { Pool } = require('pg');

const pool = new Pool({
    host: 'localhost',
    port: 5432,
    user: 'postgres',
    password: 'havanaguila93L',
    database: 'biblioteca'
});

module.exports = pool;
