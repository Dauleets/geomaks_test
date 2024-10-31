
String formatUrl(String originalUrl) {
  const String baseUrl = 'http://localhost';

  // Убедитесь, что URL начинается с http://localhost/
  if (originalUrl.startsWith(baseUrl)) {
    // TODO: Заменяем http://localhost/ на kBaseUrl вместо '' 
    String formattedUrl = originalUrl.replaceFirst(baseUrl, '');

    // Убираем возможные окончания /api/v1 или /api/ из kBaseUrl
    if (formattedUrl.contains('/api/v1')) {
      formattedUrl = formattedUrl.replaceFirst('/api/v1', '');
    } else if (formattedUrl.contains('/api/')) {
      formattedUrl = formattedUrl.replaceFirst('/api/', '');
    }

    return formattedUrl;
  } else {
    return originalUrl;
  }
}
