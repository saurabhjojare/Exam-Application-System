document.addEventListener('DOMContentLoaded', function () {
        // Get the form and subject name input element
        var form = document.forms['form'];
        var subjectNameInput = form.elements['subjectName'];

        // Function to validate subject name
        function validateSubjectName() {
            var subjectName = subjectNameInput.value.trim();

            // Check if subject name is empty
            if (subjectName === '') {
                document.getElementById('SubjectWarningMsg').textContent = '';
                return false;
            }

            // Check if subject name contains only alphanumeric characters and spaces in between
			var alphanumericRegex = /^[A-Za-z0-9!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]{1,75}(?: [A-Za-z0-9!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]{1,75})*$/;
            if (!alphanumericRegex.test(subjectName)) {
                document.getElementById('SubjectWarningMsg').textContent = 'Subject name can only contain alphanumeric characters and spaces in between';
                return false;
            }

            // Check if subject name has leading or trailing spaces
            if (subjectNameInput.value !== subjectName) {
                document.getElementById('SubjectWarningMsg').textContent = 'Subject name should not have leading or trailing spaces';
                return false;
            }

            // Clear any previous warning messages
            document.getElementById('SubjectWarningMsg').textContent = '';
            return true;
        }

        // Event listener for form submission
        form.addEventListener('submit', function (event) {
            // Prevent form submission if subject name is not valid
            if (!validateSubjectName()) {
                event.preventDefault();
            }
        });

        // Event listener for subject name input change
        subjectNameInput.addEventListener('input', function () {
            validateSubjectName();
        });
    });