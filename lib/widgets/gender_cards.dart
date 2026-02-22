import 'package:flutter/material.dart';

/// Stateless UI that shows male/female cards and reports selection via
/// [onChanged].
class GenderCards extends StatelessWidget {
  const GenderCards({super.key, required this.isMale, required this.onChanged});

  final bool isMale;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () => onChanged(true),
              child: Container(
                //Male Container
                height: 160,
                width: 130,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blue,
                  border: isMale ? Border.all(color: Colors.black, width: 3) : null,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.male, color: Colors.white, size: 40),
                    Text("Male", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),

          Expanded(flex: 1, child: SizedBox(width: 20)),

          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () => onChanged(false),
              child: Container(
                //Female Container
                height: 160,
                width: 130,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.pink,
                  border: !isMale ? Border.all(color: Colors.black, width: 3) : null,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.female, color: Colors.white, size: 40),
                    Text(
                      "Female",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}