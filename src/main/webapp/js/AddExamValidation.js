const examNameInput = document.getElementById('examName');
		const totalMarksInput = document.getElementById('totalMarks');
		const passingMarksInput = document.getElementById('passingMarks');

		const examNameWarning = document.getElementById('ExamWarningMsg');
		const totalMarksWarning = document.getElementById('TotalWarningMsg');
		const passingMarksWarning = document.getElementById('PassingWarningMsg');

		const examNamePattern = /^[A-Za-z0-9!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/? ]{1,35}$/;
		const numberPattern = /^\d{1,4}(\.\d{1,2})?$/;

		examNameInput.addEventListener('input', function() {
			const examName = examNameInput.value.trim();
			if (examName === "") {
				examNameWarning.textContent = '';
			} else if (!examNamePattern.test(examName) || examName !== examNameInput.value) {
				examNameWarning.textContent = 'Exam Name should only contain letters, numbers, and spaces, and should not start or end with a space.';
			} else {
				examNameWarning.textContent = '';
			}
		});

		totalMarksInput.addEventListener('input', function() {
			const totalMarks = totalMarksInput.value.trim();
			if (totalMarks === "") {
				totalMarksWarning.textContent = '';
			} else if (!numberPattern.test(totalMarks) || totalMarks !== totalMarksInput.value) {
				totalMarksWarning.textContent = 'Total Marks should only contain numbers and should not have any spaces.';
			} else {
				totalMarksWarning.textContent = '';
			}
		});

		passingMarksInput.addEventListener('input', function() {
			const passingMarks = passingMarksInput.value.trim();
			if (passingMarks === "") {
				passingMarksWarning.textContent = '';
			} else if (!numberPattern.test(passingMarks) || passingMarks !== passingMarksInput.value) {
				passingMarksWarning.textContent = 'Passing Marks should only contain numbers and should not have any spaces.';
			} else {
				passingMarksWarning.textContent = '';
			}
		});

		document.getElementById('newExamForm').addEventListener('submit', function(event) {
			const examName = examNameInput.value.trim();
			const totalMarks = totalMarksInput.value.trim();
			const passingMarks = passingMarksInput.value.trim();

			let isValid = true;

			if (!examName || !examNamePattern.test(examName) || examName !== examNameInput.value) {
				isValid = false;
				examNameWarning.textContent = 'Exam Name should only contain letters, numbers, and spaces.';
			}

			if (!totalMarks || !numberPattern.test(totalMarks) || totalMarks !== totalMarksInput.value) {
				isValid = false;
				totalMarksWarning.textContent = 'Total Marks should only contain numbers.';
			}

			if (!passingMarks || !numberPattern.test(passingMarks) || passingMarks !== passingMarksInput.value) {
				isValid = false;
				passingMarksWarning.textContent = 'Passing Marks should only contain numbers.';
			}

			if (!isValid) {
				event.preventDefault();
			}
		});