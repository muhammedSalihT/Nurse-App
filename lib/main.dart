import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_una/model/calendar_events_model_hive.dart';
import 'package:project_una/utils/navigationhelper.dart';
import 'package:project_una/view/splashscreen.dart';
import 'package:project_una/view_model/account_screen_viewmodel.dart';
import 'package:project_una/view/Notification/firebase_config.dart';
import 'package:project_una/view/Notification/hexcolor.dart';
import 'package:project_una/view/Notification/notification_details.dart';
import 'package:project_una/view_model/authentication_screen_viewmodel.dart';
import 'package:project_una/view_model/notification_viewmodel.dart';
import 'package:project_una/view_model/about_provider.dart';
import 'package:project_una/model/notification_model.dart';
import 'package:project_una/view_model/nurses_registration_screen_viewmodel.dart';
import 'package:project_una/view_model/payment_screen_viewmodal.dart';
import 'package:project_una/view_model/service_provider.dart';
import 'package:project_una/view_model/signin_viewmodel.dart';
import 'package:project_una/view_model/students_registration_screen_viewmodel.dart';
import 'package:project_una/view_model/transaction_screen_viewmodel.dart';
import 'package:provider/provider.dart';
import 'view_model/calendar_view_model.dart';
import 'view_model/faculty_registration_screen_viewmodel.dart';
import 'view_model/other_healthcare_workers_screen_viewmodel.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp(options: DefaultFirebaseConfig.platformOptions);
  log('Handling a background message ${message.messageId}');
}

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await Hive.initFlutter();
  Hive.registerAdapter(CalnderModelAdapter());
  await Firebase.initializeApp(
    /// ToDO change yo  qAAAur data ///
    options: const FirebaseOptions(
      apiKey: "AIzaSyCkJrOSpYzYUd1vnv4EgbWhKBDxysVOgkY",
      appId: "1:763315227949:android:9fe1fd5c37f70b3fff17a4",
      messagingSenderId: "763315227949",
      projectId: "unaproject-c1958",
    ),
  );
  // Set the background messaging   handler early  on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      // 'This channel is used for important notifications.', // description
      importance: Importance.high,
    );
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AuthenticationViewModel()),
    ChangeNotifierProvider(create: (_) => TransactionViewModal()),
    ChangeNotifierProvider(create: (_) => PaymentScreenViewModal()),
    ChangeNotifierProvider(create: (_) => AccountScreenViewModel()),
    ChangeNotifierProvider(create: (_) => AboutProvider()),
    ChangeNotifierProvider(create: (_) => FacultyRegistrationViewModel()),
    ChangeNotifierProvider(create: (_) => NursesRegistrationViewModel()),
    ChangeNotifierProvider(create: (_) => StudentRegistrationViewModel()),
    ChangeNotifierProvider(create: (_) => OtherHealthCareWorkersViewModel()),
    ChangeNotifierProvider(create: (_) => ServiceProvider()),
    ChangeNotifierProvider(create: (_) => NotificationProvider()),
    ChangeNotifierProvider(create: (_) => SignInViewModel()),
  ], child: const MyAPP()));
}

class MyAPP extends StatefulWidget {
  const MyAPP({super.key});
  @override
  State<MyAPP> createState() => _MyAPPState();
}

class _MyAPPState extends State<MyAPP> {
  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey(debugLabel: "Main Navigator");

  @override
  void initState() {
    super.initState();
    final notificationProvider =
        Provider.of<NotificationProvider>(context, listen: false);

    notificationProvider.getNotificationList();
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        Future.delayed(const Duration(milliseconds: 2000), () {
          navigatorKey.currentState!.pushNamed(
            // context,
            '/message',
            arguments: MessageArguments(message, true),
          );
// Here you can write your code
        });
        // Navigator.pushNamed(
        //   context,
        //   '/message',
        //   arguments: MessageArguments(message, true),
        // );
      }
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        log("notification comes");
        final notificationProvider =
            Provider.of<NotificationProvider>(context, listen: false);
        final notificationModel = NotificationModel(
            notificationProvider.notificationList.length + 1,
            message.notification?.android!.imageUrl,
            message.notification!.title,
            message.notification!.body,
            message.data["Link"].toString(),
            message.sentTime.toString());
        await notificationProvider.saveNotification(notificationModel);
        await notificationProvider.getNotificationList();
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          payload: message.data["Link"].toString(),
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              icon: 'launch_background',
            ),
          ),
        );
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('A new onMessageOpenedApp event was published!');
      Future.delayed(const Duration(milliseconds: 2000), () {
        navigatorKey.currentState!.pushNamed(
          // context,
          '/message',
          arguments: MessageArguments(message, true),
        );
// Here you can write your code
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    NavigationHelper.context = context;
    Color primaryColor = HexColor('#BFE2FE');
    Color accentColor = HexColor('#E6F4FF');
    ClanderViewModel.getallEvant();
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
          theme: ThemeData(
            fontFamily: "Hellix",
            primaryColor: primaryColor,
            textTheme: TextTheme(labelLarge: TextStyle(fontSize: 15.sp)),
            scaffoldBackgroundColor: Colors.grey.shade100,
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: accentColor),
          ),
        );
      },
    );
  }
}
