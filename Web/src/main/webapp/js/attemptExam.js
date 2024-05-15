
    // Function to make an XMLHttpRequest
    function makeRequest(method, url, callback) {
        var xhr = new XMLHttpRequest();
        xhr.open(method, url, true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                callback(xhr);
            }
        };
        xhr.send();
    }

    // Function to handle successful response for fetching subjects
    function handleSubjectResponse(xhr) {
        if (xhr.status === 200) {
            var subjects = JSON.parse(xhr.responseText);
            var subjectDropdown = document.getElementById('subjectSelection');
            subjectDropdown.innerHTML = '';
            if (subjects.length > 0) {
                subjects.forEach(function(subject) {
                    var option = new Option(subject.name, subject.id);
                    subjectDropdown.add(option);
                });
            } else {
                subjectDropdown.add(new Option('No subjects available', ''));
            }
        } else {
            console.error('Error fetching subjects');
        }
    }

    // Function to handle successful response for fetching schedules
    function handleScheduleResponse(xhr) {
        if (xhr.status === 200) {
            var schedules = JSON.parse(xhr.responseText);
            var scheduleDropdown = document.getElementById('scheduleSelection');
            scheduleDropdown.innerHTML = '';
            if (schedules.length > 0) {
                schedules.forEach(function(schedule) {
                    var option = new Option(schedule.examDate, schedule.schid);
                    scheduleDropdown.add(option);
                });
                // Automatically fetch subjects for the currently selected schedule
                var selectedScheduleId = scheduleDropdown.value;
                fetchSubjects(selectedScheduleId);
                // Fetch times for the currently selected schedule
                fetchTimes(selectedScheduleId);
            } else {
                scheduleDropdown.add(new Option('No schedules available', ''));
                // If no schedules available, clear subjects dropdown
                var subjectDropdown = document.getElementById('subjectSelection');
                subjectDropdown.innerHTML = '';
                subjectDropdown.add(new Option('No subjects available', ''));
                // Clear times dropdown
                var timeDropdown = document.getElementById('timeSelection');
                timeDropdown.innerHTML = '';
                timeDropdown.add(new Option('No time available', ''));
            }
        } else {
            console.error('Error fetching schedules');
        }
    }

    // Function to handle successful response for fetching times
    function handleTimeResponse(xhr) {
        if (xhr.status === 200) {
            console.log('Response received:', xhr.responseText); // Log the response
            var times = JSON.parse(xhr.responseText);
            console.log('Parsed time data:', times); // Log the parsed time data
            var timeDropdown = document.getElementById('timeSelection');
            timeDropdown.innerHTML = '';
            if (times.length > 0) {
                times.forEach(function(time) {
                    var option = new Option(time);
                    timeDropdown.add(option);
                });
            } else {
                timeDropdown.add(new Option('No time available', ''));
            }
        } else {
            console.error('Error fetching times');
        }
    }

    // Function to fetch subjects for the selected schedule
    function fetchSubjects(scheduleId) {
        var url = 'fetchSubjects?scheduleId=' + scheduleId;
        makeRequest('GET', url, handleSubjectResponse);
    }

    // Function to fetch schedules for the selected exam
    function fetchSchedules(examId) {
        var url = 'fetchSchedules?examId=' + examId;
        makeRequest('GET', url, handleScheduleResponse);
    }

    // Function to fetch times for the selected schedule
    function fetchTimes(scheduleId) {
        var url = 'fetchTime?scheduleId=' + scheduleId;
        makeRequest('GET', url, handleTimeResponse);
    }

    // Fetch times when the schedule selection changes
    document.getElementById('scheduleSelection').addEventListener('change', function() {
        var scheduleId = this.value;
        fetchTimes(scheduleId);
    });

    // Fetch schedules and times for the currently selected exam on page load
    window.addEventListener('load', function() {
        var examSelection = document.getElementById('examSelection');
        var selectedExamId = examSelection.value;
        fetchSchedules(selectedExamId);
    });
    
 // Fetch subjects and times when the schedule selection changes
    document.getElementById('scheduleSelection').addEventListener('change', function() {
        var scheduleId = this.value;
        fetchSubjects(scheduleId);
        fetchTimes(scheduleId); // Also fetch times for the selected schedule
    });


    // Fetch schedules, subjects, and times when the exam selection changes
    document.getElementById('examSelection').addEventListener('change', function() {
        var examId = this.value;
        fetchSchedules(examId);
    });
