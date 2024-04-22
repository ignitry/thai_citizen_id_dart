import 'package:thai_citizen_id/thai_citizen_id.dart';
import 'package:test/test.dart';

void main() {
  group('ThaiCitizenID', () {
    test('valid ID should return true', () {
      final thaiID = ThaiCitizenID('1234567890121');
      expect(thaiID.valid(), true);
    });

    test('invalid ID should return false', () {
      final thaiID = ThaiCitizenID('1234567890123');
      expect(thaiID.valid(), false);
    });

    test('invalid ID format should return false', () {
      final thaiID = ThaiCitizenID('123456789');
      expect(thaiID.valid(), false);
    });
  });
}
