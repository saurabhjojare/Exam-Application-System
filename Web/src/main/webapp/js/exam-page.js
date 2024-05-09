// Show modal on page load
$(document).ready(function() {
    $('#staticBackdrop').modal('show');
});

// Event listener for the "Understood" button in the modal
document.getElementById("startExamBtn").addEventListener("click", function() {
    // Hide modal
    $('#staticBackdrop').modal('hide');
    // Show main content
    document.querySelector('main').style.display = 'block';
    document.querySelector('#divSpan').style.display = 'block';
    document.querySelector('#divSpan2').style.display = 'block';

    // Enter full-screen mode
    enterFullScreen();
});

// Function to enter full-screen mode
function enterFullScreen() {
    var element = document.documentElement;
    if (element.requestFullscreen) {
        element.requestFullscreen();
    } else if (element.mozRequestFullScreen) { /* Firefox */
        element.mozRequestFullScreen();
    } else if (element.webkitRequestFullscreen) { /* Chrome, Safari & Opera */
        element.webkitRequestFullscreen();
    } else if (element.msRequestFullscreen) { /* IE/Edge */
        element.msRequestFullscreen();
    }
}

// Listen for the fullscreenchange event
document.addEventListener("fullscreenchange", function () {
    if (!document.fullscreenElement) {
        // Explain to the user why the tab isn't closing
        alert("To close this window, please use your browser's close button.");

        // Close the current tab and open a new one
        openNewWindow();
    }
});

// Function to open a new window and close the current tab
function openNewWindow() {
    // Open a new window with a minimal page
    var newWindow = window.open("", "_blank");
    newWindow.document.write("<html><head><title>Closed Tab</title></head><body><h1>This tab has been closed.</h1></body></html>");
    // Close the current tab
    window.close();
}