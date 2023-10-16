import 'package:cashpago_test/resources/colors.dart';
import 'package:flutter/material.dart';

import '../../models/step_model.dart';

class StepProgressBar extends StatelessWidget {
  final List<StepModel> steps;
  final int currentStep;  // To highlight the current step in green

  const StepProgressBar({super.key, required this.steps, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                // Blue Line
                Positioned(
                  top: 8,
                  left: 64,  // half the width of a ball to start from the center of the first ball
                  right: 64,  // half the width of a ball to end at the center of the last ball
                  child: Container(
                    height: 5.0,  // Height of the line
                    color: Colors.blue,
                  ),
                ),
                // Circles
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: steps.asMap().entries.map((entry) {
                    int idx = entry.key;
                    return Expanded(
                      child: Center(
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: idx == currentStep ? Colors.green : Colors.grey,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            );
          },
        ),
        // Titles
        const SizedBox(height: 8),  // Some spacing between circles and titles
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: steps.map((step) => Expanded(
            child: Text(
              step.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: CPColors.primaryBlue,
                fontWeight: step.isEnabled ? FontWeight.bold : FontWeight.normal,
                fontSize: 12.0
              )
            ),
          )).toList(),
        ),
      ],
    );
  }
}
