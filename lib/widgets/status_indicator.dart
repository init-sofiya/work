import 'package:flutter/material.dart';

class StatusIndicator extends StatelessWidget {
  final String status;

  const StatusIndicator({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;

    switch (status) {
      case 'Active':
        color = Colors.green.shade500;
        break;
      case 'Remote':
        color = Colors.blue.shade500;
        break;
      case 'On Leave':
        color = Colors.amber.shade500;
        break;
      default:
        color = Colors.grey.shade500;
    }

    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
