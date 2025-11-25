import 'dart:async';
import 'package:flutter/material.dart';

class VideoProgressBar extends StatefulWidget {
  const VideoProgressBar({super.key});


  @override
  _VideoProgressBarState createState() => _VideoProgressBarState();
}

class _VideoProgressBarState extends State<VideoProgressBar> {
  bool isPlaying = false;
  double progress = 0.0;
  Timer? _timer;

  static const int totalSeconds = 25;
  static const double updateInterval = 0.1; // every 0.1 of progress
  static const Duration tickDuration = Duration(milliseconds: 250); // 0.25s * 10 = 2.5s total

  void _startTimer() {
    _timer = Timer.periodic(tickDuration, (timer) {
      if (isPlaying) {
        setState(() {
          progress += updateInterval;
          if (progress >= 1.0) {
            progress = 1.0;
            isPlaying = false;
            _timer?.cancel();
            // Reset the timer after a small delay or instantly
            Future.delayed(const Duration(milliseconds: 300), () {
              setState(() {
                progress = 0.0;
              });
            });
          }
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _getFormattedTime(double progress) {
    final currentSeconds = (progress * totalSeconds).floor();
    final minutes = currentSeconds ~/ 60;
    final seconds = currentSeconds % 60;
    return '${minutes}:${seconds.toString().padLeft(2, '0')} / 0:25';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Colors.black12,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isPlaying = !isPlaying;
                    if (isPlaying && (_timer == null || !_timer!.isActive)) {
                      _startTimer();
                    }
                  });
                },
                icon: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  color: isPlaying ? Colors.black : null,
                  size: 18,
                ),
              ),
              Text(
                _getFormattedTime(progress),
                style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    decoration: TextDecoration.none),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: LinearProgressIndicator(
                  value: progress,
                  borderRadius: BorderRadius.circular(10),
                  valueColor: const AlwaysStoppedAnimation(Colors.black),
                  backgroundColor: Colors.black26,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    progress = 0.0;
                    isPlaying = false;
                  });
                },
                icon: const Icon(Icons.more_vert, size: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
