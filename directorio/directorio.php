<?php
include 'conexion.php'; // Asegúrate de que tienes el archivo de conexión a la base de datos

// Inicializar variables de búsqueda
$filter_dependencia = isset($_GET['filter_dependencia']) ? $_GET['filter_dependencia'] : '';
$filter_tipo = isset($_GET['filter_tipo']) ? $_GET['filter_tipo'] : '';
$search_query = isset($_GET['search_query']) ? $_GET['search_query'] : '';
$filter_letter = isset($_GET['filter_letter']) ? $_GET['filter_letter'] : ''; // Nueva variable para la letra

// Verificar la conexión a la base de datos
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

// Construir la consulta con filtros opcionales
$sql = "SELECT id, nombre, rango, dependencia, correo, numerotelef, edificio, ext, tipo FROM directorio_general WHERE 1=1";

// Filtro de dependencia
if (!empty($filter_dependencia)) {
    $sql .= " AND dependencia = '" . $conn->real_escape_string($filter_dependencia) . "'";
}

// Filtro de tipo
if (!empty($filter_tipo)) {
    $sql .= " AND tipo = '" . $conn->real_escape_string($filter_tipo) . "'";
}

// Filtro de búsqueda por nombre
if (!empty($search_query)) {
    $sql .= " AND nombre LIKE '%" . $conn->real_escape_string($search_query) . "%'";
}

// Filtro por letra inicial del nombre
if (!empty($filter_letter)) {
    $sql .= " AND nombre LIKE '" . $conn->real_escape_string($filter_letter) . "%'";
}

$result = $conn->query($sql);

// Verificar si la consulta falló
if (!$result) {
    die("Error en la consulta: " . $conn->error);
}

// Obtener todas las dependencias y tipos únicos para los filtros
$dependencias = $conn->query("SELECT DISTINCT dependencia FROM directorio_general");
$tipos = $conn->query("SELECT DISTINCT tipo FROM directorio_general");

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Directorio</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/cssdirec.css">
        
    </style>
</head>
<body>

    <div class="container">
        <h2 class="mt-5 text-center">Directorio</h2>
        
        <!-- Filtros de búsqueda -->
        <form method="GET" action="directorio.php" class="mb-4">
            <div class="form-row">
                <div class="form-group col-md-3">
                    <label for="filter_dependencia">Dependencia</label>
                    <select name="filter_dependencia" id="filter_dependencia" class="form-control">
                        <option value="">Todas</option>
                        <?php if ($dependencias->num_rows > 0): ?>
                            <?php while($dep = $dependencias->fetch_assoc()): ?>
                                <option value="<?php echo $dep['dependencia']; ?>" <?php echo ($dep['dependencia'] == $filter_dependencia) ? 'selected' : ''; ?>>
                                    <?php echo htmlspecialchars($dep['dependencia']); ?>
                                </option>
                            <?php endwhile; ?>
                        <?php endif; ?>
                    </select>
                </div>
                <div class="form-group col-md-3">
                    <label for="filter_tipo">Tipo</label>
                    <select name="filter_tipo" id="filter_tipo" class="form-control">
                        <option value="">Todos</option>
                        <?php if ($tipos->num_rows > 0): ?>
                            <?php while($tip = $tipos->fetch_assoc()): ?>
                                <option value="<?php echo $tip['tipo']; ?>" <?php echo ($tip['tipo'] == $filter_tipo) ? 'selected' : ''; ?>>
                                    <?php echo htmlspecialchars($tip['tipo']); ?>
                                </option>
                            <?php endwhile; ?>
                        <?php endif; ?>
                    </select>
                </div>
                <div class="form-group col-md-3">
                    <label for="search_query">Buscar por nombre</label>
                    <input type="text" name="search_query" id="search_query" class="form-control" value="<?php echo htmlspecialchars($search_query); ?>">
                </div>
                <div class="form-group col-md-3">
                    <label>&nbsp;</label>
                    <button type="submit" class="btn btn-primary btn-block">Buscar</button>
                </div>
            </div>
        </form>

        <!-- Filtro por letra inicial del nombre -->
        <div class="letter-filter">
            <strong>Filtrar por letra:</strong>
            <?php foreach (range('A', 'Z') as $letter): ?>
                <a href="directorio.php?filter_letter=<?php echo $letter; ?>&filter_dependencia=<?php echo htmlspecialchars($filter_dependencia); ?>&filter_tipo=<?php echo htmlspecialchars($filter_tipo); ?>&search_query=<?php echo htmlspecialchars($search_query); ?>"><?php echo $letter; ?></a>
            <?php endforeach; ?>
        </div>

        <!-- Tabla para mostrar solo los nombres al principio -->
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>Nombre</th>
                </tr>
            </thead>
            <tbody>
                <?php if ($result->num_rows > 0): ?>
                    <!-- Iterar sobre los resultados de la consulta -->
                    <?php while($row = $result->fetch_assoc()): ?>
                        <tr>
                            <td>
                                <!-- Nombre clicable con el ID del registro -->
                                <a href="#" class="nombre-link" data-id="<?php echo $row['id']; ?>">
                                    <?php echo htmlspecialchars($row['nombre']); ?> 
                                    <?php echo (!empty($row['rango'])) ? "({$row['rango']})" : ''; ?>
                                </a>
                                
                                <!-- Información oculta al principio -->
                                <div class="hidden-info" id="info-<?php echo $row['id']; ?>">
                                    <p><strong>Dependencia:</strong> <?php echo htmlspecialchars($row['dependencia']); ?></p>
                                    <p><strong>Correo:</strong> <?php echo htmlspecialchars($row['correo']); ?></p>
                                    <p><strong>Teléfono:</strong> <?php echo htmlspecialchars($row['numerotelef']); ?></p>
                                    <p><strong>Edificio:</strong> <?php echo htmlspecialchars($row['edificio']); ?></p>
                                    <p><strong>Extensión:</strong> <?php echo htmlspecialchars($row['ext']); ?></p>
                                    <p><strong>Tipo:</strong> <?php echo htmlspecialchars($row['tipo']); ?></p>
                                </div>
                            </td>
                        </tr>
                    <?php endwhile; ?>
                <?php else: ?>
                    <!-- Mensaje en caso de que no haya resultados -->
                    <tr>
                        <td colspan="7" class="text-center">No se encontraron resultados</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
    </div>

    <!-- Scripts necesarios para jQuery y Bootstrap -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <script>
        $(document).ready(function() {
            // Manejar el evento de clic en un nombre
            $('.nombre-link').on('click', function(e) {
                e.preventDefault(); // Evitar que el enlace recargue la página

                var id = $(this).data('id'); // Obtener el ID del registro
                var infoDiv = $('#info-' + id); // Buscar el div correspondiente a la información

                // Alternar la visibilidad de la información
                infoDiv.slideToggle();
            });
        });
    </script>

</body>
</html>
