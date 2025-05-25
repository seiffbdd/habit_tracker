import 'package:flutter/material.dart';

class WeekdaySelector extends StatefulWidget {
  const WeekdaySelector({super.key});

  @override
  State<WeekdaySelector> createState() => _WeekdaySelectorState();
}

class _WeekdaySelectorState extends State<WeekdaySelector> {
  List<bool> selectedDays = List.generate(7, (_) => true);

  final List<String> dayLabels = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2F38), // Dark background
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title row with checkmark
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Specific days in week',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Icon(Icons.check_circle, color: Colors.green),
            ],
          ),
          const SizedBox(height: 8),

          /// Subtitle
          const Text('Everyday', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 12),

          /// Days selector
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(7, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedDays[index] = !selectedDays[index];
                  });
                },
                child: Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color:
                        selectedDays[index]
                            ? const Color(0xFF3E82FF)
                            : Colors.grey.shade700,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    dayLabels[index],
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
