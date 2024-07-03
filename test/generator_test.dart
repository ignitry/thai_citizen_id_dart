import 'package:test/test.dart';
import 'package:thai_citizen_id/thai_citizen_id.dart';
import 'package:thai_citizen_id/generator.dart';

void main() {
  group('Generator', () {
    test('should generate valid Thai Citizen ID', () {
      String generatedID = Generator.generateThaiCitizenID();
      ThaiCitizenID thaiID = ThaiCitizenID(generatedID);

      expect(thaiID.valid(), isTrue);
      expect(thaiID.errors, isEmpty);
    });

    test('should have 13 digits', () {
      String generatedID = Generator.generateThaiCitizenID();

      expect(generatedID.length, equals(13));
      expect(RegExp(r'^\d{13}$').hasMatch(generatedID), isTrue);
    });

    test('should have 1 as a starting digit', () {
      String generatedID = Generator.generateThaiCitizenID();

      expect(generatedID[0], equals("1"));
    });
  });
}
