import 'dart:math';

class PassGenerator {
  String generatePass({
    required int length,
    required bool includeUppercase,
    required bool includeLowercase,
    required bool includeNumbers,
    required bool includeSymbols,
  }) {
    const String upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const String lower = 'abcdefghijklmnopqrstuvwxyz';
    const String nums = '0123456789';
    const String specials = '!@#\$%^&*()_+-=[]{}|;:,.<>?';

    String allowedChars = '';
    final Random rnd = Random.secure();
    List<String> password = [];

    // Add one character from each selected set
    if (includeUppercase) {
      allowedChars += upper;
      password.add(upper[rnd.nextInt(upper.length)]);
    }
    if (includeLowercase) {
      allowedChars += lower;
      password.add(lower[rnd.nextInt(lower.length)]);
    }
    if (includeNumbers) {
      allowedChars += nums;
      password.add(nums[rnd.nextInt(nums.length)]);
    }
    if (includeSymbols) {
      allowedChars += specials;
      password.add(specials[rnd.nextInt(specials.length)]);
    }

    if (allowedChars.isEmpty) {
      throw ArgumentError('At least one character type must be selected.');
    }

    // Fill the rest randomly
    for (int i = password.length; i < length; i++) {
      password.add(allowedChars[rnd.nextInt(allowedChars.length)]);
    }

    // Shuffle to avoid predictable positions
    password.shuffle(rnd);

    return password.join();
  }
}


