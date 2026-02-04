// Password visibility toggle functionality
document.addEventListener('DOMContentLoaded', function() {
  // Login password toggle
  const toggleLoginPassword = document.getElementById('toggle-login-password');
  if (toggleLoginPassword) {
    toggleLoginPassword.addEventListener('click', function() {
      togglePasswordVisibility('login-password', 'login-eye-icon');
    });
  }

  // Signup password toggle
  const toggleSignupPassword = document.getElementById('toggle-signup-password');
  if (toggleSignupPassword) {
    toggleSignupPassword.addEventListener('click', function() {
      togglePasswordVisibility('signup-password', 'signup-eye-icon');
    });
  }

  // Signup password confirmation toggle
  const toggleSignupPasswordConfirm = document.getElementById('toggle-signup-password-confirm');
  if (toggleSignupPasswordConfirm) {
    toggleSignupPasswordConfirm.addEventListener('click', function() {
      togglePasswordVisibility('signup-password-confirm', 'signup-confirm-eye-icon');
    });
  }

  // Reset password toggle
  const toggleResetPassword = document.getElementById('toggle-reset-password');
  if (toggleResetPassword) {
    toggleResetPassword.addEventListener('click', function() {
      togglePasswordVisibility('reset-password', 'reset-eye-icon');
    });
  }

  // Reset password confirmation toggle
  const toggleResetPasswordConfirm = document.getElementById('toggle-reset-password-confirm');
  if (toggleResetPasswordConfirm) {
    toggleResetPasswordConfirm.addEventListener('click', function() {
      togglePasswordVisibility('reset-password-confirm', 'reset-confirm-eye-icon');
    });
  }

  function togglePasswordVisibility(passwordFieldId, eyeIconId) {
    const passwordField = document.getElementById(passwordFieldId);
    const eyeIcon = document.getElementById(eyeIconId);
    
    if (passwordField.type === 'password') {
      passwordField.type = 'text';
      eyeIcon.classList.remove('bi-eye');
      eyeIcon.classList.add('bi-eye-slash');
    } else {
      passwordField.type = 'password';
      eyeIcon.classList.remove('bi-eye-slash');
      eyeIcon.classList.add('bi-eye');
    }
  }
});
