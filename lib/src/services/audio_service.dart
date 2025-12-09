import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';

/// Simple Audio Service for Dashboard - Play/Stop Toggle
class AudioService extends ChangeNotifier {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  static const String audioFilePath = 'assets/audio/audio.mp3';

  bool get isPlaying => _isPlaying;

  AudioService() {
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
        debugPrint('⏹️ Audio stopped');
      } else {
        // Play if stopped
        await _audioPlayer.setAsset(audioFilePath);
        await _audioPlayer.play();
        _isPlaying = true;
        debugPrint('▶️ Audio playing from: $audioFilePath');
      }
      notifyListeners();
    } catch (e) {
      debugPrint('❌ Error toggling audio: $e');
      _isPlaying = false;
      notifyListeners();
      rethrow;
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
    _isPlaying = false;
    _currentPosition = Duration.zero;
    notifyListeners();
    debugPrint('⏹️ Audio stopped');
  }

  /// Pause audio playback
  void pauseAudio() {
    _isPlaying = false;
    notifyListeners();
    debugPrint('⏸️ Audio paused');
  }

  /// Resume audio playback
  void resumeAudio() {
    _isPlaying = true;
    notifyListeners();
    debugPrint('▶️ Audio resumed');
  }

  @override
  void dispose() {
    stopAudio();
    super.dispose();
  }
}
