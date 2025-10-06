class AppException implements Exception {
  final String message;
  final int? statusCode;
  final String? code;
  final Map<String, dynamic>? details;
  final Exception? originalException;

  AppException(
    this.message, {
    this.statusCode,
    this.code,
    this.details,
    this.originalException,
  });

  /// ✅ Factory constructors para diferentes tipos de erro
  factory AppException.network(String message, {int? statusCode}) {
    return AppException(
      message,
      statusCode: statusCode,
      code: 'NETWORK_ERROR',
    );
  }

  factory AppException.auth(String message, {String? code}) {
    return AppException(
      message,
      code: code ?? 'AUTH_ERROR',
    );
  }

  factory AppException.validation(String message, {Map<String, dynamic>? details}) {
    return AppException(
      message,
      code: 'VALIDATION_ERROR',
      details: details,
    );
  }

  factory AppException.notFound(String resource) {
    return AppException(
      '$resource não encontrado',
      statusCode: 404,
      code: 'NOT_FOUND',
    );
  }

  factory AppException.permission(String message) {
    return AppException(
      message,
      statusCode: 403,
      code: 'PERMISSION_DENIED',
    );
  }

  factory AppException.server(String message, {int? statusCode}) {
    return AppException(
      message,
      statusCode: statusCode ?? 500,
      code: 'SERVER_ERROR',
    );
  }

  /// ✅ Métodos utilitários
  bool get isNetworkError => code == 'NETWORK_ERROR';
  bool get isAuthError => code == 'AUTH_ERROR';
  bool get isValidationError => code == 'VALIDATION_ERROR';
  bool get isServerError => code == 'SERVER_ERROR';

  @override
  String toString() {
    final buffer = StringBuffer('AppException: $message');
    if (statusCode != null) buffer.write(' (status: $statusCode)');
    if (code != null) buffer.write(' [code: $code]');
    return buffer.toString();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppException &&
          runtimeType == other.runtimeType &&
          message == other.message &&
          statusCode == other.statusCode &&
          code == other.code;

  @override
  int get hashCode => message.hashCode ^ statusCode.hashCode ^ code.hashCode;
}
