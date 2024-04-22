// Example:
// String rawID = "";                           // Your string
// ThaiCitizenID thaiID = ThaiCitizenID(rawID); // Construct thaiID instance
// thaiID.valid();                              // return boolean
// =================================================================
class ThaiCitizenID {
  final String rawID;

  ThaiCitizenID(this.rawID);

  bool valid() {
    return _checkFormat() && _checkSum();
  }

  // Thai Citizen ID consist of 13 digits integer.
  bool _checkFormat() => RegExp(r'^\d{13}$').hasMatch(rawID);

  // Thai Citizen ID use last digit as a checksum of 1-12 digits substring
  bool _checkSum() {
    final int remainder = (11 - _calculatedSum() % 11) % 10;
    final int lastDigit = int.parse(rawID[12]);
    return remainder == lastDigit;
  }

  int _calculatedSum() {
    List<int> numbers = rawID.split('').map((char) => int.parse(char)).toList();

    return numbers
        .sublist(0, numbers.length - 1)
        .asMap()
        .entries
        .map((entry) => entry.value * (13 - entry.key))
        .reduce((value, element) => value + element);
  }
}
