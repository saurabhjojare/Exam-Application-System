
    // Function to get the current time in HH:MM format
    function getCurrentTime() {
        const now = new Date();
        const hours = now.getHours().toString().padStart(2, '0');
        const minutes = now.getMinutes().toString().padStart(2, '0');
        return 'Current Time: '+ hours + ':' + minutes;
    }

    // Update the current time element every second
    function updateTime() {
        const currentTimeElement = document.getElementById('current-time');
        if (currentTimeElement) {
            currentTimeElement.textContent = getCurrentTime();
        }
    }

    // Update time initially and then every second
    updateTime(); // Initial update
    setInterval(updateTime, 1000); // Update every second
