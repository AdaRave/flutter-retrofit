

import 'dart:convert';

Feelings feelingsFromJson(String str) => Feelings.fromJson(json.decode(str));

String feelingsToJson(Feelings data) => json.encode(data.toJson());

class Feelings {
  Feelings({
    required this.success,
    required this.data,
  });

  bool success;
  List<Datum> data;

  factory Feelings.fromJson(Map<String, dynamic> json) => Feelings(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.title,
    required this.position,
    required this.image,
  });

  int id;
  String title;
  int position;
  String image;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        position: json["position"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "position": position,
        "image": image,
      };
}
