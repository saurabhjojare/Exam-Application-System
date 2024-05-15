	// JavaScript to hide the message after 4 seconds
		setTimeout(function() {
			var messageElement = document.getElementById('message');
			if (messageElement) {
				messageElement.style.display = 'none';
			}
		}, 60000); // 4 seconds