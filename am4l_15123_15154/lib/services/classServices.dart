import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:am4l_15123_15154/models/classLabel.dart';

class ClassService {
  final String uid;
  ClassService({this.uid});

  // collection reference
  final CollectionReference classCollection =
      Firestore.instance.collection('classes');

  Stream<List<ClassLabel>> get classes {
    return classCollection.snapshots().map(_classListFromSnapshot);
  }

  // convert classes list from snapshot
  List<ClassLabel> _classListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return ClassLabel(uid: doc.documentID);
    }).toList();
  }
}
