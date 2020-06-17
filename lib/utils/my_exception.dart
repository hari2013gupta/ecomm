
class FetchDataException implements Exception {
  String message;
  FetchDataException(this.message);
  String toString() {
    return 'Exception: $message';
  }
}