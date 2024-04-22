import 'package:thai_citizen_id/validator.dart';
import 'package:test/test.dart';

void main() {
  group('Validator', () {
    group('isValidThaiCitizenID', () {
      test('Valid Thai Citizen ID', () {
        expect(Validator.isValidThaiCitizenID('1234567890121'), true);
      });

      test('Invalid Thai Citizen ID - Less than 13 digits', () {
        expect(Validator.isValidThaiCitizenID('123456789012'), false);
      });

      test('Invalid Thai Citizen ID - More than 13 digits', () {
        expect(Validator.isValidThaiCitizenID('12345678901234'), false);
      });

      test('Invalid Thai Citizen ID - Non-digit characters', () {
        expect(Validator.isValidThaiCitizenID('123456789012a'), false);
      });

      test('Invalid Thai Citizen ID - Invalid checksum', () {
        expect(Validator.isValidThaiCitizenID('1234567890124'), false);
      });
    });

    group('validateThaiCitizenID', () {
      test('Valid Thai Citizen ID', () {
        expect(Validator.validateThaiCitizenID('1234567890121'), isEmpty);
      });

      test('Invalid Thai Citizen ID - Less than 13 digits', () {
        expect(Validator.validateThaiCitizenID('123456789012'),
            ['invalid_format']);
      });

      test('Invalid Thai Citizen ID - More than 13 digits', () {
        expect(Validator.validateThaiCitizenID('12345678901234'),
            ['invalid_format']);
      });

      test('Invalid Thai Citizen ID - Non-digit characters', () {
        expect(Validator.validateThaiCitizenID('123456789012a'),
            ['invalid_format']);
      });

      test('Invalid Thai Citizen ID - Invalid checksum', () {
        expect(Validator.validateThaiCitizenID('1234567890124'),
            ['invalid_checksum']);
      });
    });
  });
}
