import 'dart:convert';

import 'package:aabkr/env_globals.dart';
import 'package:aabkr/views/data.dart';
import 'package:aabkr/views/video-card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class VideoListScreen extends StatefulWidget {
  @override
  _VideoListScreenState createState() => _VideoListScreenState();
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
class _VideoListScreenState extends State<VideoListScreen> {
  final int ID_course = 1;
  int watched = 0;

  @override
  void initState() {
    super.initState();
    fetchVideos();
  }

  Future<void> fetchVideos() async {
    var prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final url = '$domainName/api/courses/$ID_course/videos';
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
          allSystemVideos = data['data'][0];
        });
        watched = data['data'][1].length;
        if (watched >= allSystemVideos.length) {
          isAllVideosWatched = true;
        }
        watched++;
      } else {
        throw Exception('Failed to load videos: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load videos');
    }
  }


  @override
  Widget build(BuildContext context) {
    return allSystemVideos.isEmpty
        ? SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()))
        : SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final video = allSystemVideos[index];
                final videoId = extractVideoId(video['url']);
                final thumbnailUrl = getThumbnailUrl(videoId);
                final isEnabled = index < watched;

                return videoCard(
                  video: Video(
                    id: videoId,
                    title: video['title'],
                    description: video['description'],
                    thumbnailUrl: thumbnailUrl,
                    dbId: video['id'].toString(),
                  ),
                  vindex: index,
                  isEnabled: isEnabled,
                );
              },
              childCount: allSystemVideos.length,
            ),
          );
  }
}