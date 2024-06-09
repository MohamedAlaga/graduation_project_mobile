import 'dart:convert';

import 'package:aabkr/views/components/common/proggress_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProgressScreen extends StatefulWidget {
  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  final int ID_user = 1;
  final String token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNzE3OTE1Mzg2LCJleHAiOjE3MTc5MTg5ODYsIm5iZiI6MTcxNzkxNTM4NiwianRpIjoiekdselkzMUoySHd1MUtUbSIsInN1YiI6IjEiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.SPmNzQzsjTN__4hgA0aln7bMFGdEFB_8OMWeshao3uA"; // Replace with your actual token

  double progress = 0.0;

  @override
  void initState() {
    super.initState();
    fetchProgress();
  }

  Future<void> fetchProgress() async {
    final url = 'http://10.0.2.2:8000/api/progress/$ID_user';
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    print('Making request to: $url');
    print('Authorization header: ${headers['Authorization']}');

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          progress = data['data']['progress'];
        });
      } else {
        // Log the error response body
        print('Error response: ${response.body}');
        throw Exception('Failed to load progress: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load progress');
    }
  }

  @override
  Widget build(BuildContext context) {
    return progres_bar(
      percentage: progress,
    );
  }
}
