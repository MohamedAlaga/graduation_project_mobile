import 'dart:convert';
import 'package:aabkr/env_globals.dart';
import 'package:aabkr/views/components/common/proggress_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProgressScreen extends StatefulWidget {
  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  final int idUser = 1;
  double progress = 0.0;

  @override
  void initState() {
    super.initState();
    fetchProgress();
  }

  Future<void> fetchProgress() async {
    var prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final url = '$domainName/api/progress/$idUser';
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: headers,
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          progress = double.parse(data['data']['progress'].toString());
        });
      } else {
        throw Exception('Failed to load progress: ${response.statusCode}');
      }
    } catch (e) {
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
