
import 'package:fast_app_base/common/dart/extension/num_duration_extension.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';
import 'vo/notification_type.dart';

final notificationDummies = <TossNotification>[
  TossNotification(
    NotificationType.tossPay,
    '토스페이로 1000원을 받았습니다.',
    DateTime.now().subtract(27.minutes),
  ),
  TossNotification(
    NotificationType.luck,
    '행운복권 당첨! 1000원을 받았습니다.',
    DateTime.now().subtract(30.minutes),
  ),
  TossNotification(
    NotificationType.people,
    '토스공동구매에 참여해보세요!',
    DateTime.now().subtract(50.minutes),
  ),
  TossNotification(
    NotificationType.stock,
    '토스증권 컨텐츠를 확인해보세요!',
    DateTime.now().subtract(8.hours),
  ),
  TossNotification(
    NotificationType.luck,
    '행운복권이 도착했어요!',
    DateTime.now().subtract(11.hours),
  ),
  TossNotification(
    NotificationType.people,
    '띵동! 월요일 공동구매 보러가기!',
    DateTime.now().subtract(1.days),
  ),
  TossNotification(
    NotificationType.walk,
    '만보기를 시작해보세요!',
    DateTime.now().subtract(2.days),
  ),
  TossNotification(
    NotificationType.moneyTip,
    '오늘의 머니 팁을 확인해보세요!\n남반석님, 토스머니를 1000원 받았습니다.',
    DateTime.now().subtract(3.days),
  ),
];