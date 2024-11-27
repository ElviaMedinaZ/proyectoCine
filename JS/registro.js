document.addEventListener("DOMContentLoaded", () => {
    const form = document.querySelector("#registerForm");

    form.addEventListener("submit", (event) => {
        event.preventDefault(); // Evitar el envío predeterminado del formulario

        // Obtener los valores de los inputs
        const user = document.getElementById("user").value.trim();
        const email = document.getElementById("email").value.trim();
        const password = document.getElementById("password").value.trim();

        // Validar campos vacíos
        if (!user || !email || !password) {
            alert("Por favor, completa todos los campos.");
            return;
        }

        // Crear un objeto FormData
        const formData = new FormData(form);

        // Enviar los datos al servidor usando fetch
        fetch("../PHP/registro.php", {
            method: "POST",
            body: formData,
        })
            .then((response) => {
                if (!response.ok) {
                    throw new Error("Error en la respuesta del servidor.");
                }
                return response.json();
            })
            .then((errors) => {
                if (errors.user) {
                    alert("El nombre de usuario ya existe.");
                } else if (errors.email) {
                    alert("El correo electrónico ya está registrado.");
                } else {
                    window.location.href = "../php/login.php"; // Redirigir al login
                }
            })
            .catch((err) => {
                console.error("Error al procesar el formulario:", err);
            });
    });
});
