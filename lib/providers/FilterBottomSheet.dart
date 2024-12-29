import 'package:flutter/material.dart';

import 'FilterBottomSheetState.dart';

class FilterBottomSheet extends StatefulWidget {
  final List<String> locations;
  final List<String> trainingNames;
  final List<String> trainerNames;
  final List<String> selectedLocations;
  final List<String> selectedTrainingNames;
  final List<String> selectedTrainerNames;

  FilterBottomSheet({
    required this.locations,
    required this.trainingNames,
    required this.trainerNames,
    required this.selectedLocations,
    required this.selectedTrainingNames,
    required this.selectedTrainerNames,
  });

  @override
  FilterBottomSheetState createState() => FilterBottomSheetState();
}
