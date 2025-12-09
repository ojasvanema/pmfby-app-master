import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';

/// Simple Audio Service - Play/Stop Toggle
/// Just click to play, click again to stop
class CropCaptureAudioService extends ChangeNotifier {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  static const String audioFilePath = 'assets/audio/crop_capture_audio.mp3';

  bool get isPlaying => _isPlaying;

  CropCaptureAudioService() {
    _audioPlayer = AudioPlayer();
    _setupListeners();
  }

  void _setupListeners() {
    _audioPlayer.playerStateStream.listen((playerState) {
      _isPlaying = playerState.playing;
      notifyListeners();
    });
  }

  /// Toggle: Click to play, click again to stop
  Future<void> toggleAudio() async {
    try {
      if (_isPlaying) {
        // Stop if playing
        await _audioPlayer.stop();
        _isPlaying = false;
      } else {
        // Play if stopped
        await _audioPlayer.setAsset(audioFilePath);
        await _audioPlayer.play();
        _isPlaying = true;
      }
      notifyListeners();
    } catch (e) {
      debugPrint('Error toggling audio: $e');
      rethrow;
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
