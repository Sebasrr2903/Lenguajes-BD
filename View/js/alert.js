function showSuccessAlert(message, isError) {
    const alertElement = document.getElementById('success-alert');
    alertElement.textContent = message;
    alertElement.style.display = 'block';
    
    if (isError) {
        alertElement.style.backgroundColor = '#B13131'; 
        alertElement.style.color = 'white';
        alertElement.style.border = 'none';
    } else {
        alertElement.style.backgroundColor = 'green'; 
    }
    
    setTimeout(function () {
        alertElement.style.display = 'none';
    }, 5000); 
}

if (new URLSearchParams(window.location.search).has('success')) {
    const successMessage = new URLSearchParams(window.location.search).get('success');
    showSuccessAlert(successMessage, false); // Llama a la función con isError como falso para mensajes de éxito
}

if (new URLSearchParams(window.location.search).has('error')) {
    const errorMessage = new URLSearchParams(window.location.search).get('error');
    showSuccessAlert(errorMessage, true); // Llama a la función con isError como verdadero para mensajes de error
}
