import 'package:example_news/constants.dart';
import 'package:example_news/models/response_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class APIRepository {
  Future<ResponseNews?> getNews() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            '$kUrlServer/v2/everything?q=tesla&sortBy=publishedAt&apiKey=$kApiKey'));
    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        final String responseBody = await response.stream.bytesToString();
        final decodedData = json.decode(responseBody);
        final responseObj = ResponseNews.fromJson(decodedData);
        return responseObj;
      } else {
        print(response.reasonPhrase);
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
