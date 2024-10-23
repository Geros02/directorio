<?php
$host = 'localhost';
$user = 'root';
$password = '';
$dbname = 'directorio';

$conn = new mysqli($host, $user, $password, $dbname);

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

function obtenerEstadosBotones($conn) {
    $query = "SELECT nombre_nicho, estado FROM registros";
    $result = $conn->query($query);

    $data = [];
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $data[$row['nombre_nicho']] = $row['estado'];
            
        }
    }
    
    return $data;
}
?>