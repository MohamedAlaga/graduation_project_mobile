import 'package:aabkr/env_globals.dart';
import 'package:aabkr/views/data.dart';

getNextVideoIndex(String videoId) {
  for(var vid in allSystemVideos)
  {
    if(vid["id"].toString() == videoId)
    {
      print("\n\n\n\n\n\n\n\n\n\n");
      print(vid["id"]);
      print("\n\n\n\n\n\n\n\n\n\n");
      int index = allSystemVideos.indexOf(vid);
      if(index == allSystemVideos.length - 1)
      {
        return 0;
      }
      else
      {
        return index + 1;
      }
    }
  }
}