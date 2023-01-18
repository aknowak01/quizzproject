import 'package:flutter/cupertino.dart';

class TimerWidget extends StatefulWidget {
  final ValueNotifier<int> timerNotifier;
  final Widget Function(int remainingTime) builder;
  final int duration;
  final VoidCallback onTimeEnd;

  TimerWidget({
    required this.builder,
    required this.duration,
    required this.onTimeEnd,
    ValueNotifier<int>? timerNotifier,
    Key? key,
  })  : timerNotifier = timerNotifier ?? ValueNotifier(100),
        super(key: key);

  @override
  State<StatefulWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.timerNotifier.value = widget.duration;
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.timerNotifier,
      builder: (BuildContext context, int value, Widget? child) {
        return widget.builder(value);
      },
    );
  }

  void _startTimer() {
    Future<void>.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          widget.timerNotifier.value = widget.timerNotifier.value - 1;
          if (widget.timerNotifier.value > 0) {
            _startTimer();
          } else {
            widget.onTimeEnd();
          }
        });
      }
    });
  }
}
