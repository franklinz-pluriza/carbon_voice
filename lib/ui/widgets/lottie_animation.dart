import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class LottieAnimation extends StatefulWidget {
  final String asset;
  final Duration duration;
  final bool loop;
  final double? width, height;
  final dynamic Function()? whenComplete;

  const LottieAnimation(
      {Key? key,
      required this.asset,
      required this.duration,
      this.loop = false,
      this.width,
      this.height,
      this.whenComplete})
      : super(key: key);

  @override
  State<LottieAnimation> createState() => _State();
}

class _State extends State<LottieAnimation> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      widget.asset,
      controller: _controller,
      width: widget.width,
      height: widget.height,
      animate: true,
      onLoaded: (composition) {
        _controller.duration = composition.duration;
        if (widget.loop) {
          _controller.repeat();
        } else {
          final ticker = _controller.forward();
          if (widget.whenComplete != null) {
            ticker.whenComplete(widget.whenComplete!);
          }
        }
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
