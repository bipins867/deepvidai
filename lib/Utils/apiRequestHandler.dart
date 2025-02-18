import 'dart:convert';
import 'dart:io';
import 'package:deepvidai/Utils/appConfig.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> apiRequest(
  String url, {
  Map<String, dynamic>? body,
  String? token,
  String requestType = "GET", // Default request type
}) async {
  url = AppConfig.baseUrl + url;

  // Define headers with optional token
  final headers = {
    "Content-Type": "application/json",
    if (token != null) "authorization": token, // Add token only if provided
  };

  // Choose the HTTP method dynamically
  late http.Response response;
  try {
    switch (requestType.toUpperCase()) {
      case "POST":
        response = await http.post(
          Uri.parse(url),
          headers: headers,
          body: jsonEncode(body ?? {}),
        );
        break;
      case "PUT":
        response = await http.put(
          Uri.parse(url),
          headers: headers,
          body: jsonEncode(body ?? {}),
        );
        break;
      case "DELETE":
        response = await http.delete(
          Uri.parse(url),
          headers: headers,
          body: body != null ? jsonEncode(body) : null,
        );
        break;
      case "GET":
      default:
        response = await http.get(
          Uri.parse(url),
          headers: headers,
        );
    }

    // Parse the response
    final bodyResponse = jsonDecode(response.body);
    return {"body": bodyResponse, "statusCode": response.statusCode};
  } catch (e) {
    return {
      "body": {"error": e.toString()},
      "statusCode": 500, // Internal error code
    };
  }
}

Future<Map<String, dynamic>> uploadImageHandler(
    String url, File imageFile, String token) async {
  try {
    // Construct the request URL
    String apiUrl = AppConfig.baseUrl + url;

    // Create a multipart request
    final request = http.MultipartRequest('POST', Uri.parse(apiUrl));

    // Add the image file to the request
    request.files
        .add(await http.MultipartFile.fromPath('file', imageFile.path));

    request.headers.addAll({
      "Authorization": token,
    });

    // Send the request
    final response = await request.send();

    // Read the response body
    final responseBody = await http.Response.fromStream(response);

    // Parse the response body
    dynamic bodyResponse = jsonDecode(responseBody.body);

    return {"body": bodyResponse, "statusCode": response.statusCode};
  } catch (e) {
    print(e);
    return {
      "body": {"error": e.toString()},
      "statusCode": 500, // Internal error code
    };
  }
}
