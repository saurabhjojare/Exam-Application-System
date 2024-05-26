// Function to validate the Full Name
function validateFullName() {
  var fullNameInput = document.getElementById('fullName').value.trim();
  var fullNameWarningMsg = document.getElementById('fullNameWarningMsg');
  var isValid = /^[A-Za-z]+(?:\s+[A-Za-z]+)+$/.test(fullNameInput);

  if (fullNameInput === '') {
    fullNameWarningMsg.textContent = ''; // Clear the warning message if input is empty
  } else {
    fullNameWarningMsg.textContent = isValid ? '' : 'Enter your first name followed by a space, then your last name';
  }
  return isValid; // Return the validation result
}

// Function to validate the password match
function validatePasswordMatch() {
  var password = document.getElementById('password').value.trim();
  var confirmPassword = document.getElementById('confirmPassword').value.trim();
  var passwordWarningMsg = document.getElementById('passwordWarningMsg');

  var isValid = password === confirmPassword;

  if (confirmPassword === '') {
    passwordWarningMsg.textContent = ''; // Clear the warning message if input is empty
  } else if (isValid) {
    passwordWarningMsg.textContent = '';
  } else {
    passwordWarningMsg.textContent = 'Passwords do not match.';
  }

  return isValid; // Return the validation result
}

// Function to validate the password
function validatePassword() {
  var password = document.getElementById('password').value.trim();
  var passwordWarningMsg = document.getElementById('passwordWarningMsg1'); // Updated ID
  var isValid = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*])(?=.{8,})/.test(password);

  if (password === '') {
    passwordWarningMsg.textContent = ''; // Clear the warning message if input is empty
  } else {
    passwordWarningMsg.textContent = isValid ? '' : 'Password must be 8+ characters with uppercase, lowercase, number, and special character.';
  }

  return isValid; // Return the validation result
}

// Function to validate the contact
function validateContact() {
  var contact = document.getElementById('contact').value.trim();
  var contactWarningMsg = document.getElementById('contactWarningMsg');
  var isValid = /^\+\d{1,3}\d{9,10}$/.test(contact) && !/\s/.test(contact); // No spaces allowed

  if (contact === '') {
    contactWarningMsg.textContent = ''; // Clear the warning message if input is empty
  } else {
    contactWarningMsg.textContent = isValid ? '' : 'Contact should be in international format without spaces';
  }

  return isValid; // Return the validation result
}

// Function to validate the email address
function validateEmail() {
  var email = document.getElementById('email').value.trim();
  var emailWarningMsg = document.getElementById('emailWarningMsg');
  var isValid = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email) && !/\s/.test(email); // No spaces allowed

  if (email === '') {
    emailWarningMsg.textContent = ''; // Clear the warning message if input is empty
  } else {
    emailWarningMsg.textContent = isValid ? '' : 'Enter a valid email address without spaces';
  }

  return isValid; // Return the validation result
}

// Event listeners
document.getElementById('fullName').addEventListener('keyup', validateFullName);
document.getElementById('confirmPassword').addEventListener('input', validatePasswordMatch);
document.getElementById('password').addEventListener('input', validatePassword);
document.getElementById('contact').addEventListener('input', validateContact);
document.getElementById('email').addEventListener('input', validateEmail);

// Clear warning messages when input fields lose focus
document.getElementById('fullName').addEventListener('blur', validateFullName);
document.getElementById('confirmPassword').addEventListener('blur', validatePasswordMatch);
document.getElementById('contact').addEventListener('blur', validateContact);
document.getElementById('email').addEventListener('blur', validateEmail);

// Form submission validation
$(document).ready(function() {
  $('#signupForm').submit(function(e) {
    // Perform all validations before submitting the form
    var isValid = validateFullName() && validatePassword() && validatePasswordMatch() && validateContact() && validateEmail();
    
    if (!isValid) {
      // Prevent form submission if any validation fails
      e.preventDefault();
    }
  });
});
