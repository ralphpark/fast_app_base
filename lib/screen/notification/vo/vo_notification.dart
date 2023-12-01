import 'package:fast_app_base/screen/notification/vo/notification_type.dart';

class TossNotification {
  final NotificationType type;
  final String title;
  final DateTime date;
  bool isRead;
  TossNotification(this.type, this.title, this.date, {this.isRead = false});
}