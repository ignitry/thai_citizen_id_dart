import 'package:thai_citizen_id/validator.dart';
import 'package:thai_citizen_id/generator.dart';

// Example:
// String rawID = "";                           // Your string
// ThaiCitizenID thaiID = ThaiCitizenID(rawID); // Construct thaiID instance
// thaiID.valid();                              // return boolean
// thaiID.errors;                               // return list of errors
// =================================================================
class ThaiCitizenID {
  final String rawID;
  late List<String> errors;

  ThaiCitizenID(this.rawID) {
    _validate();
  }

  static String generate() {
    return Generator.generateThaiCitizenID();
  }

  bool valid() {
    return errors.isEmpty;
  }

  void _validate() {
    errors = Validator.validateThaiCitizenID(rawID);
  }
}
