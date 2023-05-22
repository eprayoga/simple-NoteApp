import 'package:intl/intl.dart';

extension DateFormatting on String {
  String formatDate() {
    final DateFormat formatter = DateFormat('MMMM dd, yyyy');
    final String formatted = formatter.format(DateTime.parse(this));
    return formatted;
  }
}
