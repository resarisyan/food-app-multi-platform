import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AniProps { width, height, color }

class FadeAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Specify your tween
    final TimelineTween<AniProps> _tween = TimelineTween<AniProps>()
      ..addScene(
              begin: const Duration(milliseconds: 0),
              end: const Duration(milliseconds: 1000))
          .animate(AniProps.width, tween: Tween(begin: 0.0, end: 100.0))
      ..addScene(
              begin: const Duration(milliseconds: 1000),
              end: const Duration(milliseconds: 1500))
          .animate(AniProps.width, tween: Tween(begin: 100.0, end: 200.0))
      ..addScene(
              begin: Duration.zero,
              duration: const Duration(milliseconds: 2500))
          .animate(AniProps.height, tween: Tween(begin: 0.0, end: 200.0))
      ..addScene(
              begin: Duration.zero,
              duration: const Duration(milliseconds: 3000))
          .animate(AniProps.color,
              tween: ColorTween(begin: Colors.red, end: Colors.blue));

    return PlayAnimation<TimelineValue<AniProps>>(
      tween: _tween, // Pass in tween
      duration: _tween.duration, // Obtain duration
      builder: (context, child, value) {
        return Container(
          width: value.get(AniProps.width), // Get animated value
          height: value.get(AniProps.height),
          color: value.get(AniProps.color),
        );
      },
    );
  }
}
