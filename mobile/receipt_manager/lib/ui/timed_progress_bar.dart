import 'package:flutter/material.dart';

class TimedProgressBar extends StatefulWidget {
  final Duration duration;
  final List<TimedMessage> messages;
  final bool done; // ⏳ externally controlled

  const TimedProgressBar({
    Key? key,
    required this.duration,
    required this.messages,
    required this.done,
  }) : super(key: key);

  @override
  _TimedProgressBarState createState() => _TimedProgressBarState();
}

class _TimedProgressBarState extends State<TimedProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  String? _currentMessage;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..addListener(_updateState);

    _controller.forward();
  }

  @override
  void didUpdateWidget(TimedProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.done && !_controller.isCompleted) {
      _controller.forward();
    }
  }

  void _updateState() {
    final elapsed = widget.duration * _controller.value;

    setState(() {
      for (final msg in widget.messages) {
        if (elapsed >= msg.time) {
          _currentMessage = msg.text;
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double get _effectiveProgress {
    if (_controller.isCompleted && !widget.done) {
      return 0.9;
    }
    return _controller.value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize:  MainAxisSize.min,
      children: [
        if (_currentMessage != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(
              _currentMessage!,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
        ClipRRect(borderRadius:BorderRadiusGeometry.circular(20), child: LinearProgressIndicator(value: _effectiveProgress)),
      ],
    );
  }
}

class TimedMessage {
  final Duration time;
  final String text;

  TimedMessage(this.time, this.text);
}
