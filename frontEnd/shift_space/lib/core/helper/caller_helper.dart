import 'package:logger/logger.dart';

abstract class CallerHelper {
  static void printCaller({String? methodName = 'Actual Method'}) {
    final trace = StackTrace.current;
    final lines = trace.toString().split('\n');

    Logger().d('👉 $methodName Called by: ');

    for (int i = 0; i < 5 && i < lines.length; i++) {
      final line = lines[i].trim();

      if (line.isNotEmpty) {
        Logger().d(line);
      }
    }
    Logger().d('');
  }
}
