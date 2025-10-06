import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:shift_space/core/classes/app_exception_class.dart';

class ErrorUtils {
  static void handle({
    required String file,
    required String method,
    required BuildContext context,
    required Object e,
  }) {
    final msg = _formatError(file, method, e);

    Logger().e(msg);

    if (ScaffoldMessenger.maybeOf(context) case final messenger?) {
      messenger.clearSnackBars();
    }
  }

  static Exception informAndReturn({
    required Object message,
    BuildContext? context,
    bool isWarning = true,
  }) {
    final msg = _formatInfoError(
      message: message,
      isWarning: isWarning,
    );

    if (context == null) return Exception(message.toString());

    if (ScaffoldMessenger.maybeOf(context) case final messenger?) {
      messenger.clearSnackBars();
    }

    return Exception(msg);
  }

  static Exception handleAndReturn({
    required String file,
    required String method,
    required Object error,
    BuildContext? context,
  }) {
    final msg = _formatError(file, method, error);

    Logger().e(msg);

    if (context != null) {
      if (ScaffoldMessenger.maybeOf(context) case final messenger?) {
        messenger.clearSnackBars();
      }
    }

    return error is Exception ? error : Exception(error.toString());
  }

  static String _formatError(String archive, String method, Object error) {
    final status = (error is AppException && error.statusCode != null)
        ? ' [status: ${error.statusCode}]'
        : '';
    return 'Erro em $archive: $method -> $error$status';
  }

  static String _formatInfoError({
    required Object message,
    bool isWarning = true,
  }) {
    if (isWarning) return 'Atenção: $message';

    return '$message';
  }
}
