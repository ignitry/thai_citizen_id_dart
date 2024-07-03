import 'dart:math';

class Generator {
  static String generateThaiCitizenID() {
    Random random = Random();

    // Ensure the first digit is always '1'
    // To make it more realistic in test scenarios.
    List<int> numbers = [1] + List.generate(11, (index) => random.nextInt(10));

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
