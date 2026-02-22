import 'package:bmi_calc/constants/colors.dart';
import 'package:flutter/material.dart';

class HeightCard extends StatelessWidget {
  const HeightCard({super.key, required this.height, required this.onChanged});

  final double height;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 200,
                decoration: BoxDecoration(
                  color: heightColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Height",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "${height.toStringAsFixed(1)} cm",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    Slider(
                      min: 1,
                      max: 200,
                      value: height,
                      onChanged: onChanged,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
