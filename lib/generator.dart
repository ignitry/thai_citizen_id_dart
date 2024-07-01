import 'dart:math';

class Generator {
  static String generateThaiCitizenID() {
    Random random = Random();
    List<int> numbers = List.generate(12, (index) => random.nextInt(10));

    int sum = numbers
        .asMap()
        .entries
        .map((entry) => entry.value * (13 - entry.key))
        .reduce((value, element) => value + element);
    int checksum = (11 - sum % 11) % 10;

    numbers.add(checksum);

    return numbers.join('');
  }
}
