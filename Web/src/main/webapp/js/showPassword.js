document.getElementById('showPasswordButton').addEventListener(
			'click',
			function() {
				const passwordInput = document
						.getElementById('signupPassword');
				if (passwordInput.type === 'password') {
					passwordInput.type = 'text';
					this.textContent = 'Hide';
				} else {
					passwordInput.type = 'password';
					this.textContent = 'Show';
				}
			});
	