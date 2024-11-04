<?php
include 'conexion.php';

$filter_dependencia = isset($_GET['filter_dependencia']) ? $_GET['filter_dependencia'] : '';
$filter_tipo = isset($_GET['filter_tipo']) ? $_GET['filter_tipo'] : '';
$search_query = isset($_GET['search_query']) ? $_GET['search_query'] : '';
$filter_letter = isset($_GET['filter_letter']) ? $_GET['filter_letter'] : '';

if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

$sql = "SELECT id, nombre, rango, dependencia, correo, numerotelef, edificio, ext, tipo FROM directorio_general WHERE 1=1";

if (!empty($filter_dependencia)) {
    $sql .= " AND dependencia = '" . $conn->real_escape_string($filter_dependencia) . "'";
}

if (!empty($filter_tipo)) {
    $sql .= " AND tipo = '" . $conn->real_escape_string($filter_tipo) . "'";
}

if (!empty($search_query)) {
    $sql .= " AND nombre LIKE '%" . $conn->real_escape_string($search_query) . "%'";
}

if (!empty($filter_letter)) {
    $sql .= " AND nombre LIKE '" . $conn->real_escape_string($filter_letter) . "%'";
}
$sql .= " ORDER BY nombre ASC";

$result = $conn->query($sql);

if (!$result) {
    die("Error en la consulta: " . $conn->error);
}

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
    <style >
        .header-images {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
        }
        .header-images img {
            height: 120px;
        }
    </style>
</head>
<body>
    <div class="header-images">
        <img src="https://altamira.gob.mx/op/images/altamira.png" alt="Logo Altamira">
        <img src="https://altamira.gob.mx/altamira_somos_todos.png" alt="Altamira Somos Todos">
    </div>
    <div class="container">
        <h2 class="mt-5 text-center">Directorio</h2>
        
        <form method="GET" action="directorio.php" class="mb-4">
            <div class="form-row">
                <div class="form-group col-md-3">
                    <label for="search_query">Buscar por nombre</label>
                    <input type="text" name="search_query" id="search_query" class="form-control" value="<?php echo htmlspecialchars($search_query); ?>">
                </div>
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
                    <label for="filter_tipo">Lugar</label>
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
                <div class="form-group col-md-3 d-flex align-items-end">
                    <button type="submit" class="btn btn-primary mr-2">Buscar</button>
                    <a href="directorio.php" class="btn btn-secondary">Limpiar</a>
                </div>
            </div>
        </form>

        <div class="letter-filter">
            <strong>Filtrar nombre por letra:</strong>
            <?php foreach (range('A', 'Z') as $letter): ?>
                <a href="directorio.php?filter_letter=<?php echo $letter; ?>&filter_dependencia=<?php echo htmlspecialchars($filter_dependencia); ?>&filter_tipo=<?php echo htmlspecialchars($filter_tipo); ?>&search_query=<?php echo htmlspecialchars($search_query); ?>"><?php echo $letter; ?></a>
            <?php endforeach; ?>
        </div>

        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>Nombre</th>
                </tr>
            </thead>
            <tbody>
    <?php if ($result->num_rows > 0): ?>
        <?php while($row = $result->fetch_assoc()): ?>
            <tr>
                <td>
                    <a class="nombre-link" data-id="<?php echo $row['id']; ?>">
                        <?php echo htmlspecialchars($row['nombre']); ?> 
                        <?php echo (!empty($row['rango'])) ? "({$row['rango']})" : ''; ?>
                    </a>

                    <div class="hidden-info" id="info-<?php echo $row['id']; ?>">
                        <?php if (!empty($row['dependencia'])): ?>
                            <p><strong>Dependencia:</strong> <?php echo htmlspecialchars($row['dependencia']); ?></p>
                        <?php endif; ?>

                        <?php if (!empty($row['correo'])): ?>
                            <p><strong>Correo:</strong> <?php echo htmlspecialchars($row['correo']); ?></p>
                        <?php endif; ?>

                        <?php if (!empty($row['numerotelef'])): ?>
                            <p><strong>Teléfono:</strong> <?php echo htmlspecialchars($row['numerotelef']); ?></p>
                        <?php endif; ?>

                        <?php if (!empty($row['edificio'])): ?>
                            <p><strong>Edificio:</strong> <?php echo htmlspecialchars($row['edificio']); ?></p>
                        <?php endif; ?>

                        <?php if (!empty($row['ext'])): ?>
                            <p><strong>Extensión:</strong> <?php echo htmlspecialchars($row['ext']); ?></p>
                        <?php endif; ?>

                        <?php if (!empty($row['tipo'])): ?>
                            <p><strong>Lugar:</strong> <?php echo htmlspecialchars($row['tipo']); ?></p>
                        <?php endif; ?>
                    </div>
                </td>
            </tr>
        <?php endwhile; ?>
    <?php else: ?>
        <tr>
            <td colspan="7" class="text-center">No se encontraron resultados</td>
        </tr>
    <?php endif; ?>
</tbody>
        </table>
    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <script>
        $(document).ready(function() {
            $('.nombre-link').on('click', function(e) {
                e.preventDefault();

                var id = $(this).data('id');
                var infoDiv = $('#info-' + id);

                infoDiv.slideToggle();
            });
        });
    </script>

</body>
</html>

