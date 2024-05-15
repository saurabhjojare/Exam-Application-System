
	
		// Function to handle importing CSV file
		function handleFileSelect(event) {
			const file = event.target.files[0];
			const reader = new FileReader();

			reader.onload = function(e) {
				const csv = e.target.result;
				// Process the CSV data here, for example, you can parse it and extract questions
				console.log(csv);
			};

			reader.readAsText(file);
		}

		// Add event listener to the import button
		document.getElementById('importQuestionsBtn').addEventListener('click',
				function() {
					// Trigger file input click
					document.getElementById('fileInput').click();
				});

		// Add event listener to file input
		document.getElementById('fileInput').addEventListener('change',
				handleFileSelect);
	
