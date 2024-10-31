String formatAddress({
    required String cityName,
  required String street,
  required String apart,
  String? entrance,
  String? domofon,
}) {
  // Формируем строку адреса
  String address = '$cityName, $street, $apart';

  // Добавляем entrance, если он не пустой или не null
  if (entrance != null && entrance.isNotEmpty) {
    address += ', $entrance';
  }

  // Добавляем domofon с /, если он не пустой или не null и entrance уже добавлен
  if (domofon != null && domofon.isNotEmpty) {
    if (entrance != null && entrance.isNotEmpty) {
      address += ' / $domofon';
    } else {
      address += ', $domofon';
    }
  }

  return address;
}

String formatAddressSity({
  required String districtName,
  required String cityName,
}) {
  String address = '$cityName, $districtName';

  return address;
}
