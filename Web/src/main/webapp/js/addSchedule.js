	
    // Get tomorrow's date
    var tomorrow = new Date();
    tomorrow.setDate(tomorrow.getDate() + 1);

    // Format date as YYYY-MM-DD
    var dd = String(tomorrow.getDate()).padStart(2, '0');
    var mm = String(tomorrow.getMonth() + 1).padStart(2, '0'); // January is 0!
    var yyyy = tomorrow.getFullYear();

    tomorrow = yyyy + '-' + mm + '-' + dd;

    // Set the value of the input field to tomorrow's date
    document.getElementById("examDate").value = tomorrow;



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


    // Get current time
    var now = new Date();

    // Add 2 hours to the current time
    now.setHours(now.getHours() + 2);
    now.setMinutes(0); // Set minutes to 0

    // Format time as HH:MM
    var hh = String(now.getHours()).padStart(2, '0');
    var mm = String(now.getMinutes()).padStart(2, '0');

    var endTime = hh + ':' + mm;

    // Set the value of the input field "endTime" to 2 hours after the current time with minutes set to 00
    document.getElementById("endTime").value = endTime;

