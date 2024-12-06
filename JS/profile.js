function previewImage(event) {
    var reader = new FileReader();
    reader.onload = function () {
        var output = document.getElementById('profilePic');
        output.src = reader.result; // Actualiza la imagen previa
    };
    reader.readAsDataURL(event.target.files[0]); // Lee la imagen seleccionada
}