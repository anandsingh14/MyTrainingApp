import 'package:cloud_firestore/cloud_firestore.dart';

class Training {
  final String id;
  final String title;
  final String description;
  final String location;
  final String trainerName;
  final String imageUrl;
  final String time;
  final String date;

  Training({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.trainerName,
    required this.imageUrl,
    required this.date,
    required this.time,
  });

  factory Training.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Training(
      id: doc.id,
      title: data['title'],
      description: data['description'],
      location: data['location'],
      trainerName: data['trainerName'],
      imageUrl: data['imageUrl'],
      date: data['date'],
      time: data['time'],
    );
  }
}
