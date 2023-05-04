const mysql = require('mysql');
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  database: 'escolar',
  password: ''
});
connection.connect();
module.exports = connection;