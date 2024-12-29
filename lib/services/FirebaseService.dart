import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/training.dart';

class FirebaseService {
  final CollectionReference _trainingsCollection =
      FirebaseFirestore.instance.collection('trainings');

  Future<List<Training>> fetchTrainings() async {
    QuerySnapshot snapshot = await _trainingsCollection.get();
    return snapshot.docs.map((doc) => Training.fromFirestore(doc)).toList();
  }

  Stream<List<Training>> streamTrainings() {
    return _trainingsCollection.snapshots().map(
          (snapshot) => snapshot.docs.map((doc) => Training.fromFirestore(doc)).toList(),
        );
  }
}
