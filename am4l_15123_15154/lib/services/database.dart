import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:am4l_15123_15154/models/notice.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });
  
  // collection reference
  final CollectionReference noticeCollection = Firestore.instance.collection('notices');

  Future updateUserData(String name, String value) async {
    return await noticeCollection.document(uid).setData({
      'name': name,
      'value': value,
    });
  }

  // notice liste from snapshot
  List<Notice> _noticeListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return Notice(
        name: doc.data['name'] ?? '',
        //value: doc.data['value'] ?? '',
      );
    }).toList();
  }

  // get notices stre m
  Stream<List<Notice>> get notices {
    return noticeCollection.snapshots()
      .map(_noticeListFromSnapshot);
  }
}