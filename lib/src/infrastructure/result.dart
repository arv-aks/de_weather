// ignore_for_file: public_member_api_docs, sort_constructors_first

sealed class Result<T> {
  const Result();
}

class Success<T> extends Result<T> {
  final T data;
  final bool isInternetConnected;
  const Success({required this.data, this.isInternetConnected = true});
}

class Error<T> extends Result<T> {
  final Exception exception;
  final String message;
  Error({
    required this.exception,
    required this.message,
  });
}
