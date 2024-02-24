import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DynamicDayOfWeek extends StatelessWidget {
  const DynamicDayOfWeek({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final String dayOfWeek =
        DateFormat('EEEE', Localizations.localeOf(context).toString())
            .format(now);

    return Center(
      child: Text(
        dayOfWeek,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
