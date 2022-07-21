import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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

class AAAAA extends StatefulWidget {
  AAAAA({Key? key}) : super(key: key);

  @override
  State<AAAAA> createState() => _AAAAAState();
}

class _AAAAAState extends State<AAAAA> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: '-BYWbosiYlw',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
