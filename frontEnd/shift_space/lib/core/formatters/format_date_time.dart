import 'package:intl/intl.dart';
abstract class FormatDateTime{
  static String formatDate(DateTime date) => DateFormat('yyyy-MM-dd').format(date);
}