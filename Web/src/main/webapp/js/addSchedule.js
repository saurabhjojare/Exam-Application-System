// Get today's date
var today = new Date();

// Format date as YYYY-MM-DD
var dd = String(today.getDate()).padStart(2, '0');
var mm = String(today.getMonth() + 1).padStart(2, '0'); // January is 0!
var yyyy = today.getFullYear();

var formattedDate = yyyy + '-' + mm + '-' + dd;

// Set the value of the input field to today's date
document.getElementById("examDate").value = formattedDate;

// Get current time
var now = new Date();

// Set minutes to 0
now.setMinutes(0);

// Format time as HH:00
var hh = String(now.getHours()).padStart(2, '0');
var mm = '00';

var currentTime = hh + ':' + mm;

// Set the value of the input field "startTime" to the current time with minutes set to 00
document.getElementById("startTime").value = currentTime;

// Add 2 hours to the current time
var endNow = new Date();
endNow.setHours(now.getHours() + 2);
endNow.setMinutes(0); // Set minutes to 0

// Format time as HH:MM
var endHh = String(endNow.getHours()).padStart(2, '0');
var endMm = String(endNow.getMinutes()).padStart(2, '0');

var endTime = endHh + ':' + endMm;

// Set the value of the input field "endTime" to 2 hours after the current time with minutes set to 00
document.getElementById("endTime").value = endTime;
