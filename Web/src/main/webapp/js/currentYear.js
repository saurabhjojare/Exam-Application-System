// Get the current date
const currentDate = new Date();

// Extract the year from the current date
const currentYear = currentDate.getFullYear();

// Set the year in the HTML element with id "year"
document.getElementById('year').textContent = currentYear;