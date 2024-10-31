  String? validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter description';
    }

    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter your full name';
    }

    return null;
  }

    String? validateSityAndCountry(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter your country and sity';
    }

    return null;
  }

  String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter your full name';
    }
    // Регулярное выражение для проверки, что имя состоит только из букв и пробелов
    if (!RegExp(r'^[a-zA-Zа-яА-Я\s]+$').hasMatch(value)) {
      return 'The name must contain only letters and spaces';
    }
    // Проверка на минимальную длину (например, хотя бы два слова)
    if (value.trim().split(' ').length < 2) {
      return 'Enter your full name (first and last name)';
    }
    return null;
  }