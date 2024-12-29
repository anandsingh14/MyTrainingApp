import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/training.dart';
import '../services/FirebaseService.dart';

class SwipeCarousel extends StatelessWidget {
  final FirebaseService _firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Training>>(
      stream: _firebaseService.streamTrainings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final trainingList = snapshot.data ?? [];
          return CarouselSlider(
            options: CarouselOptions(height: 200.0, autoPlay: true),
            items: trainingList.map((training) {
              return Builder(
                builder: (BuildContext context) {
                  return Card(
                    child: Column(
                      children: [
                        Image.network(training.imageUrl),
                        Text(training.title),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          );
        }
      },
    );
  }
}
