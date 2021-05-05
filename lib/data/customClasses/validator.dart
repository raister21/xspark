class Validator {
  bool isValidEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  bool isValidName(String name) {
    if (name.length < 2) {
      return false;
    }
    return RegExp(r"^(?![\s.]+$)[a-zA-Z\s.]*$").hasMatch(name);
  }

  bool isValidMobile(String number) {
    return RegExp(r"\d{10}").hasMatch(number);
  }

  bool isValidPassword(String password) {
    return RegExp(r"[a-zA-Z0-9]{6,16}").hasMatch(password);
  }
}
