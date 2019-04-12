class ValidationMixin {

  String validateEmail(String value) {
    if(!value.contains('@')) {
      return 'Please enter a valid email.';
    }
    return null;
  }

  String validatePassword(String value) {
    if(value.length < 6) {
      return 'Password has to be atleast 6 characters long.';
    }
    return null;
  }
}