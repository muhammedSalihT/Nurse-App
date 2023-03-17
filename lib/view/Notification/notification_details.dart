// ignore_for_file: require_trailing_commas

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:project_una/view_model/notification_viewmodel.dart';
import 'package:project_una/widgets/appbar.dart';
import 'package:project_una/widgets/navbar.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

/// Message route arguments.
class MessageArguments {
  /// The RemoteMessage
  final RemoteMessage message;

  /// Whether this message caused the application to open.
  final bool openedApplication;

  // ignore: public_member_api_docs
  MessageArguments(this.message, this.openedApplication);
}

/// Displays information about a [RemoteMessage].
class MessageView extends StatelessWidget {
  const MessageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // late MessageArguments? args;
    // late RemoteMessage? message;
    // late RemoteNotification? notification;
    // if (ModalRoute.of(context)?.settings.arguments != null) {
    //   args = ModalRoute.of(context)?.settings.arguments as MessageArguments;
    //   message = args.message;
    //   notification = message.notification;
    // } else {
    //   message = null;
    //   notification = null;
    // }

    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBarWidget(text: "Notifications"),
      body: Consumer<NotificationProvider>(
        builder: (context, notificationProvider, _) {
          if (notificationProvider.notificationList.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'images/99955-empty-notifications.json',
                      width: 200.0,
                      height: 200.0,
                      fit: BoxFit.contain,
                      repeat: true,
                      alignment: Alignment.center,
                    ),
                    const Text("Nothing to found")
                  ],
                ),
              ),
            );
          } else {
            return ListView.builder(
              padding: EdgeInsets.only(top: 15.h),
              itemBuilder: (context, index) {
                final notificationList = notificationProvider.notificationList;
                final notification = notificationList[index];
                return Padding(
                  padding: EdgeInsets.only(
                    left: 10.w,
                    bottom: 20.h,
                    right: 10.w,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 4,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xffD8EDFF)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        children: [
                          notification.notificationImage != null
                              ? CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      notification.notificationImage!),
                                  radius: 50,
                                )
                              : const CircleAvatar(
                                  backgroundImage:
                                      AssetImage("images/una Logo1 1.png"),
                                  radius: 50,
                                ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Notification Info:',
                                style: TextStyle(fontSize: 18.sp),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: SizedBox(
                                  width: 200.sp,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        notification.notificationBody!,
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          print("object");
                                          final url = Uri.parse(
                                              notification.notificationaLink!);
                                          if (await launchUrl(url)) {
                                          } else {
                                            throw 'Could not launch $url';
                                          }
                                        },
                                        child: Text(
                                          notification.notificationaLink!,
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue[900]),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Text(notification.notificationTime!)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: notificationProvider.notificationList.length,
            );
          }
        },
      ),
      // SingleChildScrollView(
      //     child: Padding(
      //   padding: const EdgeInsets.all(8),
      //   child: Column(
      //     children: [
      //       if (notification != null) ...[
      //         Padding(
      //           padding: EdgeInsets.only(top: 16.h),
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               img(
      //                 notification.android!.imageUrl,
      //               ),
      //               Text(
      //                 'Notification Inf:',
      //                 style: TextStyle(fontSize: 18.sp),
      //               ),
      //               viewData(
      //                 'Title',
      //                 notification.title,
      //               ),
      //               viewData("Link", message!.data["Link"].toString()),
      //               viewData(
      //                 'Body',
      //                 notification.body,
      //               ),
      //               viewData(
      //                   'Sent Time',
      //                   message.sentTime != null
      //                       ? message.sentTime.toString()
      //                       : "Time"),
      //             ],
      //           ),
      //         )
      //       ],
      //     ],
      //   ),
      // )),
    );
  }

  /// A single data row.
  Widget viewData(String title, String? value) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$title: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(
              value ?? 'N/A',
            ),
          ),
        ],
      ),
    );
  }

  Widget img(String? value) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4.0,
        child: Center(
          child: Image.network(
            value ??
                'https://img.icons8.com/bubbles/2x/appointment-reminders.png',
            height: 200.h,
            width: 200.w,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget appbar(String? value) {
    return Text(
      value ?? 'N/A',
      style: TextStyle(fontSize: 16.sp),
    );
  }
}
// TODO Implement this library.


