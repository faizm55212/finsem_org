class Event {
  final String name;
  final String desc;
  Event({required this.name, required this.desc});

  factory Event.fromMap(Map<String, dynamic> eventSnap) {
    return Event(
      name: eventSnap['name'],
      desc: eventSnap['desc'],
    );
  }
}
