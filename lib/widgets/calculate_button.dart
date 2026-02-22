import 'package:bmi_calc/views/result_screen.dart';
import 'package:flutter/material.dart';

/// Button that needs the final values and navigates to the result screen.
class CalculateButton extends StatelessWidget {
  const CalculateButton({
    super.key,
    required this.age,
    required this.height,
    required this.weight,
    required this.isMale,
  });

  final int age;
  final double height;
  final double weight;
  final bool isMale;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 36, 57, 59),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ResultScreen(age: age, height: height, weight: weight),
                  ),
                );
              },
              child: Text("Calculate"),
            ),
          ),
        ),
      ],
    );
  }
}