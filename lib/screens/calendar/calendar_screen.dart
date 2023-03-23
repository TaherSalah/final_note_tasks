import 'package:flutter/material.dart';

import '../../shard/components/calender.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();

}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
   

    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.black,
          title: const Text('Calender'),
          titleTextStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: Colors.amber,
              fontFamily: 'cairo',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              letterSpacing: 2)),
      body:DefCalender()
    );
  }
}

