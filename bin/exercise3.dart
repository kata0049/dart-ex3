import 'package:exercise3/exercise3.dart';
import 'dart:convert';

void main(List<String> arguments) {
  String json = """
  [
    {
      "first": "Steve",
      "last": "Griffith",
      "email": "griffis@algonquincollege.com"
    },
    {"first": "Adesh", "last": "Shah", "email": "shaha@algonquincollege.com"},
    {
      "first": "Tony",
      "last": "Davidson",
      "email": "davidst@algonquincollege.com"
    },
    {
      "first": "Adam",
      "last": "Robillard",
      "email": "robilla@algonquincollege.com"
    }
  ]
  """;

  final List<dynamic> decodedJson = jsonDecode(json);

  var decodedJsonMaps = List<Map<String, dynamic>>.from(decodedJson);

  List<Map<String, String>> data = [];

  for (var dynamicMap in decodedJsonMaps) {
    // create a new Map where the values are Strings
    Map<String, String> convertedMap =
        dynamicMap.map((key, value) => MapEntry(key, value.toString()));

    // save Map<String, String> inside the List data
    data.add(convertedMap);
  }

  var s1 = Student(data);
  s1.plus({"first": "Bob", "last": "Smith", "email": "bob@mail.com"});
  s1.sort("last");
  s1.remove(
      "{first: Adam, last: Robillard, email: robilla@algonquincollege.com}");
  s1.output();
}

class Student {
  late List<Map<String, String>> people;

  Student(this.people);

  void sort(String field) {
    people.sort((map1, map2) => (map1[field]?.toLowerCase() ?? "")
        .compareTo((map2[field]?.toLowerCase() ?? "")));
  }

  void output() {
    for (var element in people) {
      print(element);
    }
  }

  void plus(Map<String, String> person) {
    people.add(person);
  }

  void remove(String field) {
    people.removeWhere((element) => element.toString() == field);
  }
}
