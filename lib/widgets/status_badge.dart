import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  final String status;

  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color textColor;
    Color borderColor;

    switch (status) {
      case 'Active':
        textColor = Colors.green.shade600;
        borderColor = Colors.green.shade300;
        break;
      case 'Remote':
        textColor = Colors.blue.shade600;
        borderColor = Colors.blue.shade300;
        break;
      case 'On Leave':
        textColor = Colors.amber.shade600;
        borderColor = Colors.amber.shade300;
        break;
      default:
        textColor = Colors.grey.shade600;
        borderColor = Colors.grey.shade300;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontSize: 12,
          color: textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
