import 'dart:async';
import 'package:flutter/material.dart';

class ReadingGuardWrapper extends StatefulWidget {
  final Widget child;
  final double currentProgress;
  final ValueChanged<double> onProgressUpdated;
  
  /// Speed threshold in pixels per second (Default: 2800 px/s)
  final double maxScrollVelocity;

  /// Max distance allowed in a 300ms window (Default: 750 px)
  final double maxWindowDistance;
  
  /// Lock duration in seconds when fast scroll is detected
  final int cooldownSeconds;

  const ReadingGuardWrapper({
    super.key,
    required this.child,
    required this.currentProgress,
    required this.onProgressUpdated,
    this.maxScrollVelocity = 25000.0,
    this.maxWindowDistance = 11000.0,
    this.cooldownSeconds = 3,
  });

  @override
  State<ReadingGuardWrapper> createState() => _ReadingGuardWrapperState();
}

class _ReadingGuardWrapperState extends State<ReadingGuardWrapper> {
  bool _isWarningActive = false;
  late int _remainingSeconds;
  Timer? _cooldownTimer;

  // Velocity Calculation State
  double _lastPixels = 0.0;
  DateTime _lastTimestamp = DateTime.now();

  // Rolling Window State (300ms)
  double _windowDistance = 0.0;
  DateTime _windowStartTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.cooldownSeconds;
  }

  @override
  void dispose() {
    _cooldownTimer?.cancel();
    super.dispose();
  }

  void _triggerLock() {
    if (_isWarningActive) return;

    setState(() {
      _isWarningActive = true;
      _remainingSeconds = widget.cooldownSeconds;
    });

    _cooldownTimer?.cancel();
    _cooldownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 1) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _cooldownTimer?.cancel();
        setState(() {
          _isWarningActive = false;
          _windowDistance = 0.0;
        });
      }
    });
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    // 1. DISREGARD CHECKER: If lesson is already 100% finished, bypass completely
    if (widget.currentProgress >= 1.0) {
      if (_isWarningActive) {
        _cooldownTimer?.cancel();
        setState(() {
          _isWarningActive = false;
        });
      }
      return false;
    }

    if (notification is ScrollUpdateNotification) {
      final double scrollDelta = notification.scrollDelta ?? 0.0;
      final double currentPixels = notification.metrics.pixels;
      final double maxExtent = notification.metrics.maxScrollExtent;
      final DateTime now = DateTime.now();

      // Downward scrolling check
      if (scrollDelta > 0) {
        final int frameTimeMs = now.difference(_lastTimestamp).inMilliseconds;

        if (frameTimeMs > 0) {
          final double velocity = (scrollDelta / frameTimeMs) * 1000.0;

          if (now.difference(_windowStartTime).inMilliseconds > 300) {
            _windowDistance = 0.0;
            _windowStartTime = now;
          }
          _windowDistance += scrollDelta;

          // Only trigger lock if the lesson is not yet completed
          if (velocity > widget.maxScrollVelocity ||
              _windowDistance > widget.maxWindowDistance) {
            _triggerLock();
          }
        }

        // Update progress when not locked
        if (!_isWarningActive && maxExtent > 0) {
          final double calculatedProgress =
              (currentPixels / maxExtent).clamp(0.05, 1.0);
          if (calculatedProgress > widget.currentProgress) {
            widget.onProgressUpdated(calculatedProgress);
          }
        }
      }

      _lastPixels = currentPixels;
      _lastTimestamp = now;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        NotificationListener<ScrollNotification>(
          onNotification: _handleScrollNotification,
          child: AbsorbPointer(
            // Lock touch interaction only if warning is active AND lesson isn't completed
            absorbing: _isWarningActive && widget.currentProgress < 1.0,
            child: widget.child,
          ),
        ),

        // Floating Warning Banner
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutBack,
          left: 16,
          right: 16,
          bottom: (_isWarningActive && widget.currentProgress < 1.0) ? 24 : -120,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: (_isWarningActive && widget.currentProgress < 1.0) ? 1.0 : 0.0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFFC86D51),
                  width: 1.8,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x40000000),
                    blurRadius: 16,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFC86D51).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.warning_rounded,
                      color: Color(0xFFC86D51),
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Masyadong mabilis ang pag-scroll!',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Naka-lock ang screen. Maghintay ng $_remainingSeconds segundo...',
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF94A3B8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFC86D51),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.timer_outlined,
                          color: Colors.white,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${_remainingSeconds}s',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}