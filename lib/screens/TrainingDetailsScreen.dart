import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/training.dart';

class TrainingDetailsScreen extends StatelessWidget {
  final Training training;
  TrainingDetailsScreen({required this.training});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(training.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(training.imageUrl),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(training.title, style: TextStyle(fontSize: 24)),
                  SizedBox(height: 10),
                  Text("Trainer: ${training.trainerName}"),
                  SizedBox(height: 10),
                  Text("Location: ${training.location}"),
                  SizedBox(height: 10),
                  Text("Description:"),
                  Text(training.description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
