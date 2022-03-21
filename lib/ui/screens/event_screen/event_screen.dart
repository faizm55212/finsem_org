import 'package:flutter/material.dart';
import 'package:finsem_org/ui/component/curved_appbar.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return const CurvedAppBar(
        title: 'Post Events',
        child: Center(
          child: Text("Event Screen"),
        ));
  }
}
