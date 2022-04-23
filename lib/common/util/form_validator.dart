class FormValidator {
  static bool validateName(String value) {
    if (value.isEmpty) {
      return false;
    }
    return true;
  }

  static String validateEmail(String value) {
    if (value.isEmpty) {
      return "Please Enter Email";
    }
    // Regex for email validation
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regExp = new RegExp(p);
    if (regExp.hasMatch(value)) {
      return null;
    }
    return "Please Enter Valid Email";
  }

  static String validatePassword(String value) {
    if (value.isEmpty) {
      return "Please Enter Password";
    }
    // Use any password length of your choice here
    if (value.length < 5) {
      return "Must be atleast 6 characters, have an uppercase leter and a special symbol";
    }

    return null;
  }
}
