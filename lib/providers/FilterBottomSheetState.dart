import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'FilterBottomSheet.dart';

class FilterBottomSheetState extends State<FilterBottomSheet> {
  late List<String> selectedLocations;
  late List<String> selectedTrainingNames;
  late List<String> selectedTrainerNames;

  @override
  void initState() {
    super.initState();
    selectedLocations = List.from(widget.selectedLocations);
    selectedTrainingNames = List.from(widget.selectedTrainingNames);
    selectedTrainerNames = List.from(widget.selectedTrainerNames);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Locations Filter
            ExpansionTile(
              title: Text('Locations'),
              children: widget.locations.map((location) {
                return CheckboxListTile(
                  title: Text(location),
                  value: selectedLocations.contains(location),
                  onChanged: (bool? selected) {
                    setState(() {
                      if (selected == true) {
                        selectedLocations.add(location);
                      } else {
                        selectedLocations.remove(location);
                      }
                    });
                  },
                );
              }).toList(),
            ),

            // Training Names Filter
            ExpansionTile(
              title: Text('Training Names'),
              children: widget.trainingNames.map((trainingName) {
                return CheckboxListTile(
                  title: Text(trainingName),
                  value: selectedTrainingNames.contains(trainingName),
                  onChanged: (bool? selected) {
                    setState(() {
                      if (selected == true) {
                        selectedTrainingNames.add(trainingName);
                      } else {
                        selectedTrainingNames.remove(trainingName);
                      }
                    });
                  },
                );
              }).toList(),
            ),
      
            // Trainer Names Filter
            ExpansionTile(
              title: Text('Trainer Names'),
              children: widget.trainerNames.map((trainerName) {
                return CheckboxListTile(
                  title: Text(trainerName),
                  value: selectedTrainerNames.contains(trainerName),
                  onChanged: (bool? selected) {
                    setState(() {
                      if (selected == true) {
                        selectedTrainerNames.add(trainerName);
                      } else {
                        selectedTrainerNames.remove(trainerName);
                      }
                    });
                  },
                );
              }).toList(),
            ),
      
            SizedBox(height: 20),
            Row(
              children: [
                // Clear Filters Button
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedLocations.clear();
                      selectedTrainingNames.clear();
                      selectedTrainerNames.clear();
                    });
                  },
                  child: Text('Clear All Filters'),
                ),
                Spacer(),
                // Apply Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, {
                      'locations': selectedLocations,
                      'trainingNames': selectedTrainingNames,
                      'trainerNames': selectedTrainerNames,
                    });
                  },
                  child: Text('Apply Filter'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}