<!DOCTYPE html>
<html>
<head>
    <title>Local Storage Data</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    
</head>
<body>
	<center>
	<div class = "container">
    <h1 class = "fw-light mt-5">Local Storage Data</h1>
    <table class="table">
        <tr>
            <th>Key</th>
            <th>Value</th>
        </tr>
        <tbody id="localStorageData"></tbody> 
    </table>
    <button type="button" class="btn btn-light" onclick="clearLocalStorage()">Clear Local Storage</button>
    </div>
    </center>
    
    <script>
    function clearLocalStorage() {
        localStorage.clear();
        console.log("localStorage cleared.");
    }

    </script>

    <script>
        // Function to display all data stored in localStorage
        function displayLocalStorageData() {
            if (typeof(Storage) !== "undefined") {
                const localStorageDataElement = document.getElementById("localStorageData");
                localStorageDataElement.innerHTML = ""; // Clear previous data

                // Iterate through localStorage keys and display data
                for (let i = 0; i < localStorage.length; i++) {
                    const key = localStorage.key(i);
                    const value = localStorage.getItem(key);
                    const row = document.createElement("tr");
                    const keyCell = document.createElement("td");
                    const valueCell = document.createElement("td");
                    keyCell.textContent = key;
                    if (key.startsWith("endTime")) {
                        const endTime = new Date(parseInt(value));
                        const now = new Date();
                        const timeDifference = Math.max(0, endTime - now); // Calculate remaining time, ensuring it's not negative
                        const hours = Math.floor(timeDifference / (1000 * 60 * 60));
                        const minutes = Math.floor((timeDifference % (1000 * 60 * 60)) / (1000 * 60));
                        valueCell.textContent = "Time Left: " + hours + " hours, " + minutes + " minutes";
                    } else if (key.startsWith("remainingTime")) {
                        valueCell.textContent = value + " seconds";
                    } else {
                        valueCell.textContent = value;
                    }
                    row.appendChild(keyCell);
                    row.appendChild(valueCell);
                    localStorageDataElement.appendChild(row);
                }

                if (localStorageDataElement.childElementCount === 0) {
                    const noDataRow = document.createElement("tr");
                    const noDataMessage = document.createElement("td");
                    noDataMessage.setAttribute("colspan", "2");
                    noDataMessage.textContent = "No data stored in localStorage.";
                    noDataRow.appendChild(noDataMessage);
                    localStorageDataElement.appendChild(noDataRow);
                }
            } else {
                console.log("Sorry, your browser does not support Web Storage.");
            }
        }

        // Call the function when the page is loaded
        window.onload = displayLocalStorageData;
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    
</body>
</html>
