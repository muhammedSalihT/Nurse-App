import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    /// if you want configuration for web from here
    /// and fill your data from web's google-services.json file ///
    // if (KIsWeb) {
    //  // web
    // return const FirebaseOptions(
    // apiKey:'',
    // authDomain:'',
    // databaseURL:'',
    // projectId:'',
    // storageBucket:'',
    // messagingSenderId:'',
    // appId:'',
    // measurementId:''
    // );

    /// also if you want configuration forIOS from here
    /// and fill your data from IOS's google-service.json file ///
    // } else if (Platform.isIOS || Platform.isMacOS) {
    //  // ios and isMacOS
    // return const FirebaseOptions(
    // apiKey:'',
    // authDomain:'',
    // databaseURL:'',
    // projectId:'',
    // storageBucket:'',
    // messagingSenderId:'',
    // appId:'',
    // measurementId:'',
    // );
    // } else {
    // // Android
    /// To do change your data from google-services.json file///
    /// in this configuration we work for android only ///
    return const FirebaseOptions(
        appId: "1:763315227949:android:9fe1fd5c37f70b3fff17a4",
        apiKey: "AIzaSyCkJrOSpYzYUd1vnv4EgbWhKBDxysVOgkY",
        projectId: "unaproject-c1958",
        androidClientId:
            "763315227949-t9dsj34qusdsmvcgqc7e30a9o0u8d11e.apps.googleusercontent.com",
        messagingSenderId: "763315227949",
        authDomain: "unaproject-c1958.firebaseapp.com	");
    //}
  }
}
