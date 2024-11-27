document.addEventListener("DOMContentLoaded", () => {
    const form = document.querySelector("#loginForm");

    form.addEventListener("submit", (event) => {
        event.preventDefault(); // Evitar el envío predeterminado del formulario

        const user = document.getElementById("user").value.trim();
        const password = document.getElementById("password").value.trim();

        // Validar campos vacíos
        if (!user || !password) {
            alert("Por favor, completa todos los campos.");
            return;
        }

        const formData = new FormData(form);

        // Enviar los datos al servidor
        fetch("../php_funcion/inicio_secion.php", {
            method: "POST",
            body: formData,
        })
            .then((response) => {
                if (!response.ok) {
                    throw new Error("Error en la respuesta del servidor.");
                }
                return response.json();
            })
            .then((data) => {
                if (data.error) {
                    alert(data.message); // Mostrar mensaje de error del servidor
                } else {
                    alert("Inicio de sesión exitoso.");
                    window.location.href = "../php/landingSesionAbierta.php"; // Redirigir al dashboard
                }
            })
            .catch((error) => {
                console.error("Error al procesar la solicitud:", error);
            });
    });
});