import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:rehabilitation/models/rehabilitation.dart';

class ApiService {
  static const String baseUrl = "assets";

  static Future<List<Rehabilitation>> getRehabilitations() async {
    final String jsonString =
        await rootBundle.loadString('$baseUrl/data/rehabilitation_data.json');
    final data = json.decode(jsonString);
    final List<dynamic> jsonData = data['result'];
    final result =
        jsonData.map((json) => Rehabilitation.fromJson(json)).toList();
    return result;
  }
}
