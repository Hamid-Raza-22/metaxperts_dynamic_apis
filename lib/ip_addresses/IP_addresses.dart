
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

 String IP_Address = "";
// String IP_Address2= "https://apex.oracle.com/pls/apex/metaxpertss";



Future<String> getIpAddress() async {
  const String server1 = "http://103.149.32.30:8080/ords/metaxperts";
  const String server2 = "https://apex.oracle.com/pls/apex/metaxpertss";

  try {
    final response1 = await http.get(Uri.parse(server1));
    if (response1.statusCode == 200) {
      return server1;
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error connecting to server1: $e');
    }
  }

  try {
    final response2 = await http.get(Uri.parse(server2));
    if (response2.statusCode == 200) {
      return server2;
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error connecting to server2: $e');
    }
  }

  throw Exception('Both servers are unavailable');
}
