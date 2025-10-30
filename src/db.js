// Configuración de MySQL
const mysql = require('mysql2');

// Cargo la conexion y las variables desde .env
process.loadEnvFile();

// Creo la conexión a la base de datos 
const connection = mysql.createConnection({
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USER || 'magda',
    password: process.env.DB_PASSWORD || 'magda',
    database: process.env.DB_NAME || 'Umm-Jair-Martinez'
});

// Conecto a la base de datos
connection.connect((err) => {
    if (err) {
        console.error('Error conectando a la base de datos');
        return;
    }
    console.log('Conectado a la base de datos MySQL');
});

// Exporto la conexión para usarla en otros archivos
module.exports = connection;