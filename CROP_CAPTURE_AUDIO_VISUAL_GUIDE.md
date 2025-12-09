# Crop Capture Audio Button - Visual Guide

## Screen Layout

### Before (Original)
```
┌─────────────────────────────────────┐
│ फसल की फोटो लें (AppBar)             │
└─────────────────────────────────────┘

  Location Info Card
  ┌─────────────────────────────────┐
  │ 📍 Location: City, State        │
  │    GPS: 28.123456, 77.123456    │
  └─────────────────────────────────┘

  Image Preview (300px height)

  ┌─────────────────────────────────┐
  │  [📷 कैमरा से फोटो लें]          │
  │  [🖼️ गैलरी से चुनें]             │
  └─────────────────────────────────┘

  Instructions Box
  ┌─────────────────────────────────┐
  │ ℹ️  महत्वपूर्ण निर्देश            │
  │   • AI आपकी फसल का विश्लेषण      │
  │   • नुकसान का पता लगाया जाएगा   │
  │   • GPS स्थान स्वतः सहेजा जाएगा  │
  └─────────────────────────────────┘
```

### After (With Audio Button)
```
┌─────────────────────────────────────┐
│ फसल की फोटो लें (AppBar)             │
└─────────────────────────────────────┘

  Location Info Card
  ┌─────────────────────────────────┐
  │ 📍 Location: City, State        │
  │    GPS: 28.123456, 77.123456    │
  └─────────────────────────────────┘

  Image Preview (300px height)

  ┌─────────────────────────────────┐
  │ [📷 फोटो लें]  [🎧 Audio]       │  ← NEW AUDIO BUTTON
  │     [🖼️ गैलरी से चुनें]         │
  └─────────────────────────────────┘

  Instructions Box
  ┌─────────────────────────────────┐
  │ ℹ️  महत्वपूर्ण निर्देश            │
  │   • AI आपकी फसल का विश्लेषण      │
  │   • नुकसान का पता लगाया जाएगा   │
  │   • GPS स्थान स्वतः सहेजा जाएगा  │
  └─────────────────────────────────┘
```

## Audio Button Design

### Button Properties
```
┌────────────────────┐
│      🎧 Audio      │  Icon: Icons.headphones (white)
│   (Blue Button)    │  Color: Colors.blue.shade600
│                    │  Size: 24px icon
│                    │  Background: Blue
│                    │  Tooltip: गाइडेंस सुनें
└────────────────────┘

Position: Next to Camera button in a Row
Width: Auto-sized
Height: Matches camera button
Border Radius: 12px
```

## Audio Player Dialog

### Full Dialog View
```
╔═════════════════════════════════════╗
║  🎵 फसल की गाइडेंस        [✕ Close]  ║  Header (Green)
╠═════════════════════════════════════╣
║                                     ║
║      ┌───────────────────────┐     ║
║      │   🎧                  │     ║  Audio Info Card
║      │ फसल की तस्वीर लेने   │     ║  (Green background)
║      │ दौरान सुनें           │     ║
║      │ Listen to guidance    │     ║
║      └───────────────────────┘     ║
║                                     ║
║      ┌───────────────────────┐     ║
║      │ ▶️  ⏸  ⏹ Controls     │     ║
║      │ Green Orange Red      │     ║
║      │                       │     ║
║      │ [═══●════════]        │     ║  Progress Slider
║      │ 0:15 / 3:45          │     ║
║      │                       │     ║
║      │ ▶️ अभी चल रहा है     │     ║  Status (Green)
║      └───────────────────────┘     ║
║                                     ║
║          [बंद करें (Close)]         ║
║                                     ║
╚═════════════════════════════════════╝
```

## Control Buttons Layout

```
┌─────────────────────────────────┐
│                                 │
│  [▶️ Play]  [⏸ Pause]  [⏹ Stop] │
│   Green     Orange      Red     │
│                                 │
└─────────────────────────────────┘
```

### Button Colors
- **Play (▶️):** Colors.green.shade700 - Start playback
- **Pause (⏸):** Colors.orange.shade700 - Pause playback
- **Stop (⏹):** Colors.red.shade700 - Stop and reset

## Progress Slider

```
Current Time          Total Duration
     ↓                      ↓
   0:15  [═══●════════════════]  3:45
         
         Current Position (●) can be dragged
         to any position in the audio
```

## Status Indicator

### Playing State
```
┌──────────────────────┐
│ ▶️ अभी चल रहा है      │  Background: Colors.green.shade100
│   (Now Playing)      │  Text Color: Colors.green.shade700
└──────────────────────┘
```

### Stopped State
```
┌──────────────────────┐
│ ⏹️ बंद (Stopped)     │  Background: Colors.grey.shade200
│                      │  Text Color: Colors.grey.shade700
└──────────────────────┘
```

## User Interaction Flow

### Step 1: View Screen
```
User opens Crop Monitoring
         ↓
    Click "Capture Image"
         ↓
    See capture screen with:
    - Camera button (left)
    - Audio button (right)  ← NEW
    - Gallery button (bottom)
```

### Step 2: Click Audio Button
```
User clicks 🎧 button
         ↓
    Audio player dialog opens
         ↓
    Shows:
    - Audio info card
    - Play/Pause/Stop buttons
    - Progress slider
    - Status indicator
```

### Step 3: Use Audio Controls
```
[Play Button]
    ↓ Click
Audio plays from current position
    ↓ Progress slider shows position
Progress bar moves as audio plays
    ↓
[Pause Button]
    ↓ Click
Audio pauses at current position
    ↓
[Resume by clicking Play again]
    ↓
[Stop Button]
    ↓ Click
Audio stops and resets to 0:00
```

### Step 4: Seek Audio
```
[Drag Progress Slider]
    ↓
Audio jumps to that position
    ↓
Time display updates
    ↓
User can resume from there
```

## Color Scheme

| Component | Color | Hex Code | Usage |
|-----------|-------|----------|-------|
| Dialog Background | White | #FFFFFF | Main container |
| Header Text | Green.shade700 | #2E7D32 | Title "फसल की गाइडेंस" |
| Info Card BG | Green.shade50 | #E8F5E9 | Audio info section |
| Info Card Border | Green.shade200 | #A5D6A7 | Card outline |
| Play Button | Green.shade700 | #2E7D32 | Play control |
| Pause Button | Orange.shade700 | #E65100 | Pause control |
| Stop Button | Red.shade700 | #C62828 | Stop control |
| Active Slider | Green.shade700 | #2E7D32 | Progress indicator |
| Inactive Slider | Grey.shade300 | #E0E0E0 | Remaining track |
| Playing Status BG | Green.shade100 | #C8E6C9 | When playing |
| Stopped Status BG | Grey.shade200 | #EEEEEE | When stopped |

## Responsive Design

```
Mobile (Small Screen)
┌─────────────┐
│ [📷] [🎧]   │
│ [🖼️ Choose] │
└─────────────┘

Tablet (Large Screen)
┌──────────────────────┐
│ [📷 Take]  [🎧 Audio] │
│ [🖼️ Choose Gallery]  │
└──────────────────────┘
```

## Icon Details

### Audio Button Icon
- **Icon:** Icons.headphones
- **Color:** Colors.white
- **Size:** 24px
- **Splash Radius:** 24

### Dialog Icons
- **Close Icon:** Icons.close (top-right)
- **Info Icons:** Icons.headphones (in audio card)
- **Control Icons:** Icons.play_arrow, Icons.pause, Icons.stop_circle

## Animation & Feedback

### Button Press Feedback
- **Ripple Effect:** 24px splash radius
- **Visual Feedback:** Color change on press
- **Haptic Feedback:** Standard Flutter behavior

### Dialog Transitions
- **Entrance:** Smooth fade-in
- **Background:** Dimmed with transparency
- **Exit:** Smooth fade-out

## Accessibility

- **Tooltip:** "गाइडेंस सुनें (Listen to Guidance)"
- **Semantics:** Proper labeling for screen readers
- **Touch Target:** Minimum 48x48 dp for touch
- **Colors:** High contrast for visibility

## Layout Code Structure

```dart
// Dialog Container
Dialog(
  backgroundColor: Colors.transparent,
  child: Container(
    // Header Row
    Row(
      children: [
        Text('🎵 फसल की गाइडेंस'),
        IconButton(Icons.close),
      ],
    ),
    // Audio Info Card
    Container(
      child: Column(
        children: [
          Icon(Icons.headphones),
          Text('फसल की तस्वीर लेने दौरान सुनें'),
        ],
      ),
    ),
    // Control Card
    Container(
      child: Column(
        children: [
          Row(
            children: [
              ElevatedButton(Icons.play_arrow, 'Play'),
              ElevatedButton(Icons.pause, 'Pause'),
              ElevatedButton(Icons.stop_circle, 'Stop'),
            ],
          ),
          Slider(...), // Progress slider
          Container(...), // Status indicator
        ],
      ),
    ),
    // Close Button
    ElevatedButton('बंद करें (Close)'),
  ),
)
```

---

**Note:** All colors and dimensions are flexible and can be adjusted based on design requirements.
