<!DOCTYPE html>
<html>
<head>
    <title>Local Storage Data</title>
</head>
<body>
    <h1>Local Storage Data</h1>
    <table>
        <tr>
            <th>Key</th>
            <th>Value</th>
        </tr>
        <tbody id="localStorageData"></tbody>
        
        
    </table>
    <button onclick="clearLocalStorage()">Clear Local Storage</button>
    
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
</body>
</html>
