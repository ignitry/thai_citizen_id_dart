import 'package:thai_citizen_id/thai_citizen_id.dart';
import 'package:test/test.dart';

void main() {
  group('ThaiCitizenID', () {
    test('valid ID should return true', () {
      final thaiID = ThaiCitizenID('1234567890121');

      expect(thaiID.valid(), true);
      expect(thaiID.errors, isEmpty);
    });

    test('invalid ID should return false', () {
      final thaiID = ThaiCitizenID('1234567890123');

      expect(thaiID.valid(), false);
      expect(thaiID.errors, ['invalid_checksum']);
    });

    test('invalid ID format should return false', () {
      final thaiID = ThaiCitizenID('123456789');

      expect(thaiID.valid(), false);
      expect(thaiID.errors, ['invalid_format']);
    });

    test('generated ID should have 13 digits', () {
      String generatedID = ThaiCitizenID.generate();

      expect(generatedID.length, equals(13));
      expect(RegExp(r'^\d{13}$').hasMatch(generatedID), isTrue);
    });

    test('generated ID should be valid', () {
      String generatedID = ThaiCitizenID.generate();
      final thaiID = ThaiCitizenID(generatedID);

      expect(thaiID.valid(), true);
      expect(thaiID.errors, isEmpty);
    });
  });
}
