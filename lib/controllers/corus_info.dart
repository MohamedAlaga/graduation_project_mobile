import 'dart:convert';

import 'package:aabkr/views/data.dart';
import 'package:aabkr/views/video-card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VideoListScreen extends StatefulWidget {
  @override
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  final int ID_course = 1;

  final String token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNzE3OTE1Mzg2LCJleHAiOjE3MTc5MTg5ODYsIm5iZiI6MTcxNzkxNTM4NiwianRpIjoiekdselkzMUoySHd1MUtUbSIsInN1YiI6IjEiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.SPmNzQzsjTN__4hgA0aln7bMFGdEFB_8OMWeshao3uA"; // Replace with your actual token

  List<dynamic> videos = [];

  @override
  void initState() {
    super.initState();
    fetchVideos();
  }

  Future<void> fetchVideos() async {
    final url = 'http://10.0.2.2:8000/api/courses/$ID_course/videos';
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
          videos = data['data'][0];
        });
      } else {
        print('Error response: ${response.body}');
        throw Exception('Failed to load videos: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load videos');
    }
  }

  String extractVideoId(String url) {
    final Uri uri = Uri.parse(url);
    if (uri.queryParameters.containsKey('v')) {
      return uri.queryParameters['v']!;
    }
    return '';
  }

  String getThumbnailUrl(String videoId) {
    return 'https://img.youtube.com/vi/$videoId/0.jpg';
  }

  @override
  Widget build(BuildContext context) {
    return videos.isEmpty
        ? SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()))
        : SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final video = videos[index];
                final videoId = extractVideoId(video['url']);
                final thumbnailUrl = getThumbnailUrl(videoId);
                return videoCard(
                  video: Video(
                    id: videoId,
                    title: video['title'],
                    description: video['description'],
                    thumbnailUrl: thumbnailUrl,
                  ),
                  vindex: index,
                );
              },
              childCount: videos.length,
            ),
          );
  }
}
