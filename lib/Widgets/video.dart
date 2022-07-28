import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:my_project/models/meals.dart';

// class VideoScreen extends StatefulWidget {
//   VideoScreen({Key? key}) : super(key: key);

//   @override
//   State<VideoScreen> createState() => _VideoScreenState();
// }

// class _VideoScreenState extends State<VideoScreen> {
//   late YoutubePlayerController controller;

//   @override
//   void initState() {
//     super.initState();

//     const url = 'https://www.youtube.com/watch?v=8jwFwVHTgZc';

//     controller = YoutubePlayerController(
//       initialVideoId: YoutubePlayer.convertUrlToId(url)!,
//       flags: const YoutubePlayerFlags(
//         mute: false,
//         loop: true,
//         autoPlay: false,
//       ),
//     );
//   }

//   @override
//   void deactivate() {
//     controller.pause();
//     super.deactivate();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   Widget build(BuildContext context) => YoutubePlayerBuilder(
//         player: YoutubePlayer(
//           controller: controller,
//           showVideoProgressIndicator: true,
//           progressIndicatorColor: Colors.amber,
//           progressColors: ProgressBarColors(
//             playedColor: Colors.amber,
//             handleColor: Colors.amberAccent,
//           ),
//           onReady: () {
//             controller.addListener(() {});
//           },
//         ),
//         builder: (context, player) => player,
//       );
// }

class Video extends StatefulWidget {
  final Meal meal;
  Video({
    Key? key,
    required this.meal,
  }) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // final List<String> url = [
    //   'https://www.youtube.com/watch?v=8jwFwVHTgZc&t=1s',
    //   'https://www.youtube.com/watch?v=ldAINdBOjQY',
    //   'https://www.youtube.com/watch?v=rHJJ_gnZMos',
    // ];

    // const url = "https://www.youtube.com/watch?v=8jwFwVHTgZc&t=1s";

    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.meal.url)!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    );
    log(widget.meal.url);
  }

  @override
  Widget build(BuildContext context) {
    print(widget.meal.url);
    return Scaffold(
      backgroundColor: Color(0xFFE9E9E9),
      body: Container(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.amber,
          progressColors: ProgressBarColors(
            playedColor: Colors.amber,
            handleColor: Colors.amberAccent,
          ),
          onReady: () {
            _controller.addListener(() {});
          },
        ),
      ),
    );
  }
}
