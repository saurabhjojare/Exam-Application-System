const questionNameInput = document.getElementById('questionName');
		const option1Input = document.getElementById('option1');
		const option2Input = document.getElementById('option2');
		const option3Input = document.getElementById('option3');
		const option4Input = document.getElementById('option4');

		const questionNameWarning = document.getElementById('QuestionWarningMsg');
		const option1Warning = document.getElementById('Option1WarningMsg');
		const option2Warning = document.getElementById('Option2WarningMsg');
		const option3Warning = document.getElementById('Option3WarningMsg');
		const option4Warning = document.getElementById('Option4WarningMsg');

		const textPattern = /^[A-Za-z0-9!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/? ]{1,400}$/;

		questionNameInput.addEventListener('input', function() {
			const questionName = questionNameInput.value.trim();
			if (questionName === "") {
				questionNameWarning.textContent = '';
			} else if (!textPattern.test(questionName) || questionName !== questionNameInput.value) {
				questionNameWarning.textContent = 'Question Name should only contain letters, numbers, and spaces.';
			} else {
				questionNameWarning.textContent = '';
			}
		});

		option1Input.addEventListener('input', function() {
			const option1 = option1Input.value.trim();
			if (option1 === "") {
				option1Warning.textContent = '';
			} else if (!textPattern.test(option1) || option1 !== option1Input.value) {
				option1Warning.textContent = 'Option 1 should only contain letters, numbers.';
			} else {
				option1Warning.textContent = '';
			}
		});

		option2Input.addEventListener('input', function() {
			const option2 = option2Input.value.trim();
			if (option2 === "") {
				option2Warning.textContent = '';
			} else if (!textPattern.test(option2) || option2 !== option2Input.value) {
				option2Warning.textContent = 'Option 2 should only contain letters, numbers.';
			} else {
				option2Warning.textContent = '';
			}
		});

		option3Input.addEventListener('input', function() {
			const option3 = option3Input.value.trim();
			if (option3 === "") {
				option3Warning.textContent = '';
			} else if (!textPattern.test(option3) || option3 !== option3Input.value) {
				option3Warning.textContent = 'Option 3 should only contain letters, numbers, and spaces.';
			} else {
				option3Warning.textContent = '';
			}
		});

		option4Input.addEventListener('input', function() {
			const option4 = option4Input.value.trim();
			if (option4 === "") {
				option4Warning.textContent = '';
			} else if (!textPattern.test(option4) || option4 !== option4Input.value) {
				option4Warning.textContent = 'Option 4 should only contain letters, numbers, and spaces.';
			} else {
				option4Warning.textContent = '';
			}
		});

		document.getElementById('addQuestionForm').addEventListener('submit', function(event) {
			const questionName = questionNameInput.value.trim();
			const option1 = option1Input.value.trim();
			const option2 = option2Input.value.trim();
			const option3 = option3Input.value.trim();
			const option4 = option4Input.value.trim();

			let isValid = true;

			if (!questionName || !textPattern.test(questionName) || questionName !== questionNameInput.value) {
				isValid = false;
				questionNameWarning.textContent = 'Question Name should only contain letters, numbers, and spaces.';
			}

			if (!option1 || !textPattern.test(option1) || option1 !== option1Input.value) {
				isValid = false;
				option1Warning.textContent = 'Option 1 should only contain letters, numbers, and spaces.';
			}

			if (!option2 || !textPattern.test(option2) || option2 !== option2Input.value) {
				isValid = false;
				option2Warning.textContent = 'Option 2 should only contain letters, numbers, and spaces';
			}

			if (!option3 || !textPattern.test(option3) || option3 !== option3Input.value) {
				isValid = false;
				option3Warning.textContent = 'Option 3 should only contain letters, numbers, and spaces';
			}

			if (!option4 || !textPattern.test(option4) || option4 !== option4Input.value) {
				isValid = false;
				option4Warning.textContent = 'Option 4 should only contain letters, numbers, and spaces';
			}

			if (!isValid) {
				event.preventDefault();
			}
		});
