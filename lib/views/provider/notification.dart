import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationProvider extends ChangeNotifier {
  List<String> notifications = [];
  List<bool> selectedList = [];
  bool _showCheckbox = false;

  bool get showCheckboxes => _showCheckbox;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  LocalNotificationsProvider() {
    _initializeNotifications();
  }

  Future<void> _initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void addNotification(String notification) {
    notifications.add(notification);
    selectedList.add(false); // Initialize selected status to false
    notifyListeners();
  }

  void removeNotification(int index) {
    notifications.removeAt(index);
    selectedList.removeAt(index);
    notifyListeners();
  }

  void clearNotifications() {
    notifications.clear();
    selectedList.clear();
    notifyListeners();
  }

  void deleteSelected() {
    for (int i = selectedList.length - 1; i >= 0; i--) {
      if (selectedList[i]) {
        notifications.removeAt(i);
        selectedList.removeAt(i);
      }
    }
    _showCheckbox = false;
    notifyListeners();
  }

  void updateNotifications(List<String> newNotifications) {
    notifications = newNotifications;
    selectedList = List.generate(notifications.length, (index) => false);
    _showCheckbox = false;
    // notifications.clear();
    // selectedList.clear();

    // notifications.addAll(newNotifications);
    // selectedList.addAll(List.generate(newNotifications.length, (_) => false));

    notifyListeners();
  }

  void toggleSelectAll() {
    bool allSelected = selectedList.every((isSelected) => isSelected);
    selectedList = List.generate(notifications.length, (index) => !allSelected);
    _showCheckbox = true;
    notifyListeners();
  }

  Future<void> showTopNotification(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
      int id) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'top_notification_channel',
      'Top Notification Channel',
      priority: Priority.high,
      importance: Importance.max,
      showWhen: false,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      id,
      'Murphy\'s Technology',
      'Your email has been sent successfully',
      platformChannelSpecifics,
    );

    addNotification('Notification $id');
  }
}
