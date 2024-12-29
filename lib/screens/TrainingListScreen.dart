import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../constant/colors.dart';
import '../models/training.dart';
import '../providers/FilterBottomSheet.dart';
import '../services/FirebaseService.dart';
import 'ReusableCard.dart';
import 'TrainingDetailsScreen.dart';

class TrainingListScreen extends StatefulWidget {
  @override
  _TrainingListScreenState createState() => _TrainingListScreenState();
}

class _TrainingListScreenState extends State<TrainingListScreen> {
  final FirebaseService _firebaseService = FirebaseService();
  List<String> selectedLocations = [];
  List<String> selectedTrainingNames = [];
  List<String> selectedTrainerNames = [];
  List<String> locations = [];
  List<String> trainingNames = [];
  List<String> trainerNames = [];
  List<Training> filteredList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Training>>(
        stream: _firebaseService.streamTrainings(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final trainingList = snapshot.data ?? [];

            // Extracting unique locations, training names, and trainer names
            locations = trainingList
                .map((training) => training.location)
                .toSet()
                .toList();
            trainingNames =
                trainingList.map((training) => training.title).toSet().toList();
            trainerNames = trainingList
                .map((training) => training.trainerName)
                .toSet()
                .toList();

            // Apply filters
            filteredList = trainingList.where((training) {
              final matchesLocation = selectedLocations.isEmpty ||
                  selectedLocations.contains(training.location);
              final matchesTrainingName = selectedTrainingNames.isEmpty ||
                  selectedTrainingNames.contains(training.title);
              final matchesTrainerName = selectedTrainerNames.isEmpty ||
                  selectedTrainerNames.contains(training.trainerName);
              return matchesLocation &&
                  matchesTrainingName &&
                  matchesTrainerName;
            }).toList();

            // Displaying a message if no data is found after applying filters
            if (filteredList.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('No trainings match the selected filters.'),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedLocations.clear();
                          selectedTrainingNames.clear();
                          selectedTrainerNames.clear();
                        });
                      },
                      child: Text('Clear Filters'),
                    ),
                  ],
                ),
              );
            }

            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: const Text(
                    "My Trainings", // The text you want to display
                    style: TextStyle(    // Correct syntax for the style property
                      color: Colors.white, // Correct color syntax
                        fontWeight: FontWeight.bold, // Font size of 12
                    ),
                  ),
                  floating: true,
                  expandedHeight: 50.0,
                  backgroundColor: primary,
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'HighLights', // Your heading text
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 250.0,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 16 / 9,
                          enableInfiniteScroll: true,
                          autoPlayInterval: Duration(seconds: 3),
                        ),
                        items: trainingList.map((training) {
                          return Container(
                            margin: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: NetworkImage(training.imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.black54,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    training.title,
                                    style:
                                    Theme.of(context).textTheme.headline6!.copyWith(
                                      color: textcolor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "${training.location} | ${training.time}",
                                    style:
                                    Theme.of(context).textTheme.subtitle2!.copyWith(
                                      color: textcolor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        "\$${825}",
                                        style:
                                        Theme.of(context).textTheme.subtitle2!.copyWith(
                                          color: primary,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => TrainingDetailsScreen(
                                                training: training,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          "View details",
                                          style:
                                          Theme.of(context).textTheme.subtitle2!.copyWith(
                                            color: primary,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 2, 15, 2),
                        child: Row(children: [
                          ElevatedButton.icon(
                            onPressed: () async {
                              // Show the filter bottom sheet
                              final result = await showModalBottomSheet<Map<String, List<String>>>(
                                context: context,
                                builder: (context) {
                                  return FilterBottomSheet(
                                    locations: locations,
                                    trainingNames: trainingNames,
                                    trainerNames: trainerNames,
                                    selectedLocations: selectedLocations,
                                    selectedTrainingNames: selectedTrainingNames,
                                    selectedTrainerNames: selectedTrainerNames,
                                  );
                                },
                              );

                              // Apply the selected filters
                              if (result != null) {
                                setState(() {
                                  selectedLocations = result['locations'] ?? [];
                                  selectedTrainingNames = result['trainingNames'] ?? [];
                                  selectedTrainerNames = result['trainerNames'] ?? [];
                                });
                              }
                            },
                            icon: Icon(Icons.filter_list),
                            label: Text("Filter Trainings"),
                          ),
                        ]),
                      )
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final training = filteredList[index];
                      return ReusableCard(
                        training: training,
                      );
                    },
                    childCount: filteredList.length,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
