# Thai Citizen ID - Dart

A utility program related to Thai Citizen ID

## Features
- Validation

  ```dart
  String rawID = "1234567890121";              // Your string
  ThaiCitizenID thaiID = ThaiCitizenID(rawID); // Construct thaiID instance
  thaiID.valid();                              // return boolean
  thaiID.errors;                               // return list of errors
  ```
