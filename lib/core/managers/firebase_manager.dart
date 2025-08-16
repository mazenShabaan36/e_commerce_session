import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseManager {
  static Future<void> initFirebaseManager() async {
    await Firebase.initializeApp();
    await FirebaseMessaging.instance.requestPermission();
  }

  Future<void> login({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {}
  }

  Future<void> addToCollection({required String collectionName, required Map<String, dynamic> data}) async {
    try {
      await FirebaseFirestore.instance.collection(collectionName).add(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> readFromCollection({required String collectionName}) async {
    try {
      FirebaseFirestore.instance.collection(collectionName).snapshots().listen((snapshot) {
        for (var doc in snapshot.docs) {
          print(doc.data());
        }
      });
    } catch (e) {}
  }

  Future<void> deleteFromCollection({required String collectionName, String? docId}) async {
    try {
      await FirebaseFirestore.instance.collection(collectionName).doc(docId).delete();
    } catch (e) {}
  }

  Future<void> recieveMessage() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {});
  }

  Future<void> logEvent({required String eventName, required Map<String, Object> data}) async {
    try {
      await FirebaseAnalytics.instance.logEvent(name: eventName, parameters: data);
    } catch (e) {}
  }
}
