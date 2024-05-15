
//Flag to track if a toast is currently being displayed
let isToastVisible = false;

function showToast(message) {
    // If a toast is already visible, return early
    if (isToastVisible) return;

    // Set the flag to indicate a toast is being displayed
    isToastVisible = true;

    // Create toast element
    var toast = document.createElement('div');
    toast.classList.add('toast');
    toast.textContent = message;

    // Append toast to container
    var container = document.getElementById('toast-container');
    container.appendChild(toast);

    // Show toast
    setTimeout(function () {
        toast.classList.add('show');
    }, 100);

    // Hide toast after 6 seconds
    setTimeout(function () {
        toast.classList.remove('show');
        // Remove toast from DOM after transition and reset the flag
        setTimeout(function () {
            container.removeChild(toast);
            isToastVisible = false;
        }, 300);
    }, 6000);
}

document.getElementById('confirmStartExam').addEventListener('click', function () {
    var selectedExamId = document.getElementById('examSelection').value;
    var selectedExamName = document.getElementById('examSelection').options[document.getElementById('examSelection').selectedIndex].text;
    var selectedSchedule = document.getElementById('scheduleSelection').options[document.getElementById('scheduleSelection').selectedIndex].text;
    var selectedSubject = document.getElementById('subjectSelection').options[document.getElementById('subjectSelection').selectedIndex].text;
    var selectedTime = document.getElementById('timeSelection').value;

    // Get the current date in yyyy-mm-dd format
    var currentDate = new Date().toISOString().split('T')[0];

    // Parse the selected date to yyyy-mm-dd format
    var selectedDateParts = selectedSchedule.split('-');
    var selectedDate = selectedDateParts[0] + '-' + selectedDateParts[1].padStart(2, '0') + '-' + selectedDateParts[2].padStart(2, '0');

    // Check if the selected date is before the current date or if the date is invalid
    if (selectedDate < currentDate) {
        // Log current date and selected date for debugging
        console.log("Current Date:", currentDate);
        console.log("Selected Date:", selectedDate);
        var errorMessage = 'This exam schedule has already passed or the selected date is invalid';

        // Show toast message
        showToast(errorMessage);
    } else {
        // Encode subject name
        var encodedSubject = encodeURIComponent(selectedSubject);
        // Redirect to the exam page with necessary parameters
        window.location.href = 'exam.jsp?examId=' + selectedExamId + '&date=' + selectedSchedule + '&subname=' + encodedSubject + '&ename=' + encodeURIComponent(selectedExamName) + '&time=' + selectedTime;
    }
});

document.addEventListener('DOMContentLoaded', function () {
    var params = new URLSearchParams(window.location.search);
    var errorMessage = params.get('errorMessage');

    if (errorMessage) {
        // Check if the toast has already been shown
        var toastShown = sessionStorage.getItem('toastShown');

        if (!toastShown) {
            // Show toast message with the error message
            showToast(errorMessage);
            // Set flag to indicate that the toast has been shown
            sessionStorage.setItem('toastShown', 'true');
        }
    }
});


	
// 		document.getElementById('confirmStartExam').addEventListener('click',
// 				function() {
// 					window.location.href = 'exam.jsp';
// 				});
	
	