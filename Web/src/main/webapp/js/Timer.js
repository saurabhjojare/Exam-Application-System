
        // Set the date and time for the countdown (1 hour from now)
        var countdownDate = new Date();
        countdownDate.setHours(countdownDate.getHours() + 1);

        // Update the countdown every second
        var countdown = setInterval(function() {
            var now = new Date().getTime();
            var distance = countdownDate - now;
            
            // Calculate remaining time
            var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
            var seconds = Math.floor((distance % (1000 * 60)) / 1000);
            
            // Display the countdown
            document.getElementById("countdown").innerHTML = "Time Left: " 
            + minutes + "m " + seconds + "s ";
            
            // If the countdown is over, display a message
            if (distance < 0) {
                clearInterval(countdown);
                document.getElementById("countdown").innerHTML = "Time Out";
            }
        }, 1000);
