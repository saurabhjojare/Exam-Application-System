//Function to validate the full name
function validateFullName() {
  var fullNameInput = document.getElementById('fullName').value.trim();
  var fullNameWarningMsg = document.getElementById('fullNameWarningMsg');
	var isValid = /^[A-Za-z\s]{1,255}$/.test(fullNameInput);

  
  if (fullNameInput === '') {
    fullNameWarningMsg.textContent = ''; // Clear the warning message if input is empty
  } else {
    fullNameWarningMsg.textContent = isValid ? '' : 'Enter your first name followed by a space, then your last name';
  }
  return isValid; // Return the validation result
}

// Function to validate the username
function validateUsername() {
  var usernameInput = document.getElementById('username').value.trim();
  var usernameWarningMsg = document.getElementById('usernameWarningMsg');
  var isValid = /^[a-z0-9_]{1,255}$/i.test(usernameInput); // Regular expression to allow letters, numbers, and underscores

  if (usernameInput === '') {
     usernameWarningMsg.textContent = ''; // Clear the warning message if input is empty
  } else {
     usernameWarningMsg.textContent = isValid ? '' : 'Username can only lowercase contain letters & digits';
  }

  return isValid; // Return the validation result
}


//Function to validate the password
function validatePassword() {
  var password = document.getElementById('signupPassword').value;
  var passwordWarningMsg = document.getElementById('passwordWarningMsg1'); // Updated ID
  var isValid = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*])(?=.{8,255})/.test(password);

  if (password === '') {
    passwordWarningMsg.textContent = ''; // Clear the warning message if input is empty
  } else {
    passwordWarningMsg.textContent = isValid ? '' : 'Password must be 8+ characters with uppercase, lowercase, number, and special character.';
  }

  return isValid; // Return the validation result
}

//Function to validate the contact
function validateContact() {
  var contact = document.getElementById('contact').value.trim();
  var contactWarningMsg = document.getElementById('contactWarningMsg');
  var isValid = /^\+\d{1,3}\d{9,10}$/.test(contact); // Assuming contact format is +CCXXXXXXXXX

  if (contact === '') {
    contactWarningMsg.textContent = ''; // Clear the warning message if input is empty
  } else {
    contactWarningMsg.textContent = isValid ? '' : 'Contact should be in international format';
  }

  return isValid; // Return the validation result
}

//Function to validate the email address
function validateEmail() {
  var email = document.getElementById('email').value.trim();
  var emailWarningMsg = document.getElementById('emailWarningMsg');
  var isValid = /^[^\s@]{1,255}@[^\s@]+\.[^\s@]+$/.test(email);

  if (email === '') {
    emailWarningMsg.textContent = ''; // Clear the warning message if input is empty
  } else {
    emailWarningMsg.textContent = isValid ? '' : 'Enter a valid email address';
  }

  return isValid; // Return the validation result
}

// Event listeners
document.getElementById('fullName').addEventListener('input', validateFullName);
document.getElementById('username').addEventListener('input', validateUsername);
document.getElementById('signupPassword').addEventListener('input', validatePassword); 
document.getElementById('contact').addEventListener('input', validateContact);
document.getElementById('email').addEventListener('input', validateEmail);

// Clear warning messages when input fields lose focus
document.getElementById('fullName').addEventListener('blur', validateFullName);
document.getElementById('username').addEventListener('blur', validateUsername);
document.getElementById('signupPassword').addEventListener('blur', validatePassword);
document.getElementById('contact').addEventListener('blur', validateContact);
document.getElementById('email').addEventListener('blur', validateEmail);

$(document).ready(function() {
  $('#signupForm').submit(function(e) {
    // Perform all validations before submitting the form
    var isValid = validateFullName() && validatePassword() && validateContact() && validateEmail() && validateUsername();
    
    if (!isValid) {
      // Prevent form submission if any validation fails
      e.preventDefault();
      console.log('Form submission prevented due to validation errors.');
    }
  });
});
