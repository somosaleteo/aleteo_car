import 'dart:async';

class GeneralAnimationController {
  GeneralAnimationController(bool isPlaying) {
    _playControllerStream.add(isPlaying);
    _isPlaying = isPlaying;
  }
  bool _isPlaying = false;

  final StreamController<bool> _playControllerStream =
      StreamController.broadcast();
  final StreamController<Map<String, double>>
      _controllerPositionValuesReported = StreamController.broadcast();
  Stream<bool> get isPlayingStream => _playControllerStream.stream;
  Stream<Map<String, double>> get controllerPositionValuesReportedStream =>
      _controllerPositionValuesReported.stream;

  final Map<String, double> _mapControllerValues = <String, double>{};

  void setNewController(
      {required String controllerKeyName, required double value}) {
    _mapControllerValues[controllerKeyName] = value;
    _controllerPositionValuesReported.add(_mapControllerValues);
  }

  double getControllerValue(String key) {
    return _mapControllerValues[key] ?? 0.0;
  }

  bool get isPlaying => _isPlaying;
  void setIsPlaying(bool isPlayingValue) {
    _playControllerStream.add(isPlayingValue);
    _isPlaying = isPlayingValue;
  }

  void togglePlayPause() {
    setIsPlaying(!_isPlaying);
  }
}

final GeneralAnimationController generalAnimationController =
    GeneralAnimationController(true);
