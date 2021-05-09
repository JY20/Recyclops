import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;

class emailNotification {
  Future<String> apiRequest(String email) async {
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request =
        await httpClient.postUrl(Uri.parse('https://api.courier.com/send'));
    request.headers
        .set('Authorization', 'Bearer dk_prod_Q2JZ8079R94K0JK9QA90D7330DQA');

    request.add(utf8.encode(json.encode({
      'event': '7J196Z4J3E4DSYJF5R80BRVPWEB9',
      'recipient': '41b1e554-1d90-4ccf-abda-10c0c9bcbe6',
      'profile': {'email': email},
    })));

    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    httpClient.close();
    return reply;
  }
}

final emailNotification emailNot = emailNotification();
