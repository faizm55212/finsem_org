import 'api.dart';
import 'package:finsem_org/model/event_model.dart';

class EventController {
  static final List<Event> _events = [];
  static List<Event> get events => _events;

  static Future<List<Event>> fetchEvents() async {
    var eventSnap = await Api.fetchEvents();
    for (var element in eventSnap) {
      _events.add(Event.fromMap(element.data()!));
    }
    return _events;
  }
}
