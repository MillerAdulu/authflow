part of utils;

//const String _kMin8CharsOneUpperLetterOneLowerLetterOneNumber =
// r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$";
// const String _kMin8CharsOneLetterOneNumber = r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$";
//const String _kMin8CharsOneLetterOneNumberOnSpecialCharacter = r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$";
//const String _kMin8CharsOneUpperOneLowerOneNumberOneSpecial = r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$";
//const String _kMin8Max10OneUpperOneLowerOneNumberOneSpecial = r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,10}$";

// Apply whatever necessary regex
class PasswordValidator {
  final StreamTransformer<String, String> validatePassword =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (password, sink) {
    // final RegExp passwordExp =
    // new RegExp(_kMin8CharsOneLetterOneNumber);

    if (password == null || password.length < 4) {
      sink.addError('Enter a valid password');
    } else {
      sink.add(password);
    }
  });
}
