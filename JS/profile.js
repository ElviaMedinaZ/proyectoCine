document.addEventListener("DOMContentLoaded", () => {
    fetch("../php_funcion/getProfileData.php")
        .then(response => response.json())
        .then(data => {
            if (data.error) {
                alert(data.message);
                return;
            }

            document.getElementById("nombre").value = data.nombre || "";
            document.getElementById("apellido").value = data.apellido || "";
            document.getElementById("username").value = data.username;
            document.getElementById("correo").value = data.correo;
            document.getElementById("puntos").value = data.puntos;

            // Cargar imagen por defecto o personalizada
            const profilePic = document.getElementById("profilePic");
            profilePic.src = data.imagen ? `../uploads/${data.imagen}` : "../image/default.png";
        })
        .catch(error => console.error("Error al cargar los datos del perfil:", error));
});
