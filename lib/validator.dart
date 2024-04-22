class Validator {
  static bool isValidThaiCitizenID(String id) {
    return _checkFormat(id) && _checkSum(id);
  }

  static List<String> validateThaiCitizenID(String id) {
    List<String> errors = [];

    if (!_checkFormat(id)) {
      errors.add('invalid_format');
    } else {
      if (!_checkSum(id)) {
        errors.add('invalid_checksum');
      }
    }

    return errors;
  }

  // Thai Citizen ID consist of 13 digits integer.
  static bool _checkFormat(String id) => RegExp(r'^\d{13}$').hasMatch(id);

  // Thai Citizen ID use last digit as a checksum of 1-12 digits substring
  static bool _checkSum(String id) {
    final int remainder = (11 - _calculatedSum(id) % 11) % 10;
    final int lastDigit = int.parse(id[12]);
    return remainder == lastDigit;
  }

  static int _calculatedSum(String id) {
    List<int> numbers = id.split('').map((char) => int.parse(char)).toList();

    return numbers
        .sublist(0, numbers.length - 1)
        .asMap()
        .entries
        .map((entry) => entry.value * (13 - entry.key))
        .reduce((value, element) => value + element);
  }
}
