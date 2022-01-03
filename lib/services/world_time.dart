import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time = 'Unknown';
  String flag;
  String url;
  bool isDaytime = false;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      DateTime now;

      // make the request
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      // get properties from json
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      now = DateTime.parse(datetime);

      //we do not get time for bhutan
      if (location == "Bhutan") {
        now = now.add(Duration(hours: (int.parse(offset) - 1)));
      } else {
        now = now.add(Duration(hours: int.parse(offset)));
      }

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = 'could not get time';
    }
  }
}
