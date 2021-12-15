import 'package:flutter/cupertino.dart';

class Request {
  final int Price;
  final int id;

  final String InstrumentName;
  final String TechnicalProcessName;
  final String MoreInformation;
  final String ImageUrl;
  Request({
    required this.Price,
    required this.id,
    required this.InstrumentName,
    required this.TechnicalProcessName,
    required this.MoreInformation,
    required this.ImageUrl,
  });

  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
      Price: json['Price'],
      id: json['id'],
      InstrumentName: json['InstrumentName'],
      TechnicalProcessName: json['TechnicalProcessName'],
      MoreInformation: json['MoreInformation'],
      ImageUrl: json['ImageUrl'],
    );
  }
}
