 //import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class Channel {
  final String channelName;
  final String channelImageUrl;

  const Channel({
    required this.channelName,
    required this.channelImageUrl,
  });
}

const Channel channel = Channel(
  channelName: 'Code With Ammar',
  channelImageUrl:
      'https://yt3.ggpht.com/ytc/AKedOLSIvDOv8HrJ5sBczgJadyqVZUYqtbOHotgew67D=s900-c-k-c0x00ffffff-no-rj',
);

class Video {
  final String id;
  final Channel channel;
  final String title;
  final String thumbnailUrl;
  final String duration;
  final DateTime timestamp;
  final String viewCount;

  const Video({
    required this.id,
    required this.channel,
    required this.title,
    required this.thumbnailUrl,
    required this.duration,
    required this.timestamp,
    required this.viewCount,
  });
}

final List<Video> videos = [
  Video(
      id: 'EAYjbQXXmrc',
      channel: channel,
      title: 'لعبة بسيطة للأطفال - Flutter - Drag and Drop Game',
      thumbnailUrl: 'https://img.youtube.com/vi/EAYjbQXXmrc/0.jpg',
      duration: '25:20',
      timestamp: DateTime(2021, 8, 20),
      viewCount: '2K'),
  Video(
    channel: channel,
    id: '2fcivytKaNY',
    title: 'كيفية حل مكعب روبك بثماني خطوات فقط وبالتفصيل',
    thumbnailUrl: 'https://img.youtube.com/vi/2fcivytKaNY/0.jpg',
    duration: '22:06',
    timestamp: DateTime(2021, 10, 26),
    viewCount: '1K',
  ),
  Video(
    id: '5wn7iDRUYgU',
    channel: channel,
    title: 'Push Notification-OneSignal-Flutter ارسال الإشعارات',
    thumbnailUrl: 'https://img.youtube.com/vi/5wn7iDRUYgU/0.jpg',
    duration: '10:53',
    timestamp: DateTime(2020, 9, 12),
    viewCount: '3K',
  ),
  Video(
    id: '2CMXn76PMt4',
    channel: channel,
    title: 'Admob with Flutter - اضافة الاعلانات للتطبيق',
    thumbnailUrl: 'https://img.youtube.com/vi/2CMXn76PMt4/0.jpg',
    duration: '10:53',
    timestamp: DateTime(2020, 9, 12),
    viewCount: '3K',
  ),
  Video(
    id: 'NzuynlVCsfs',
    channel: channel,
    title: 'رفع التطبيق للمتجر - Upload Flutter App To Store',
    thumbnailUrl: 'https://img.youtube.com/vi/NzuynlVCsfs/0.jpg',
    duration: '10:53',
    timestamp: DateTime(2020, 9, 12),
    viewCount: '3K',
  ),
];
