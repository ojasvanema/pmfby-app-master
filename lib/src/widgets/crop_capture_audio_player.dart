import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/crop_capture_audio_service.dart';

/// Simple Audio Player - Just Play/Stop Toggle
class CropCaptureAudioPlayer extends StatefulWidget {
  final CropCaptureAudioService audioService;

  const CropCaptureAudioPlayer({
    super.key,
    required this.audioService,
  });

  @override
  State<CropCaptureAudioPlayer> createState() => _CropCaptureAudioPlayerState();
}

class _CropCaptureAudioPlayerState extends State<CropCaptureAudioPlayer> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '🎵 गाइडेंस सुनें',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade700,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                  splashRadius: 20,
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Play/Stop Button - Large and Clear
            ElevatedButton.icon(
              onPressed: () async {
                await widget.audioService.toggleAudio();
                setState(() {});
              },
              icon: Icon(
                widget.audioService.isPlaying ? Icons.stop_circle : Icons.play_arrow,
                size: 32,
              ),
              label: Text(
                widget.audioService.isPlaying ? 'रोकें (Stop)' : 'सुनें (Play)',
                style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.audioService.isPlaying
                    ? Colors.red.shade600
                    : Colors.green.shade600,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Status Text
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: widget.audioService.isPlaying
                    ? Colors.green.shade100
                    : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                widget.audioService.isPlaying
                    ? '▶️ अभी चल रहा है (Playing)'
                    : '⏹️ बंद (Stopped)',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: widget.audioService.isPlaying
                      ? Colors.green.shade700
                      : Colors.grey.shade700,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Close Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade600,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text('बंद करें (Close)'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
