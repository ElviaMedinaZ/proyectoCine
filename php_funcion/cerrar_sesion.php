<?php
session_start(); // Inicia la sesión

// Destruir todas las variables de sesión
$_SESSION = [];
session_unset();
session_destroy();

// Redirigir al usuario a la página de inicio de sesión
header("Location: ../index.php");
exit();
?>