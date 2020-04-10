import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });
  
  // collection reference
  final CollectionReference noticeCollection = Firestore.instance.collection('notices');

  Future updateUserData(String name, String classrooms) async {
    return await noticeCollection.document(uid).setData({
      'name': name,
      'classrooms': classrooms,
    });
  }

  // get noties strem
  Stream<QuerySnapshot> get notices {
    return noticeCollection.snapshots();
  }
}