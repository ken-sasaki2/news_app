
class NewsApiException implements Exception {
  final String message;
  const NewsApiException(this.message);

  @override
  String toString() => message;
}
