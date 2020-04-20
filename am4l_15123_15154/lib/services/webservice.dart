import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:am4l_15123_15154/models/ad.dart';

class Webservice {
  Future<List<Ad>> getAllAds() async {

    final response = await http.get("https://shrub-berry-jujube.glitch.me/ads");
    if(response.statusCode == 200) {

      Iterable json = jsonDecode(response.body);
      return json.map((ad) => Ad.fromJSON(ad)).toList();

    } else {
      throw Exception("Error fetching the ads...");
    }

    }
  }