
import 'dart:async';

import 'package:flutter/material.dart';

const String studentName = 'AHSEN';
const String rollNo = '04072312012';

// ===== Seeded settings (generated from YOUR roll number). Do not edit. =====
final int seed = int.parse(rollNo.substring(rollNo.length - 2));
final int t = seed ~/ 10;
final int u = seed % 10;

const List<String> courses = [
  'Mobile Dev',
  'Data Structures',
  'Operating Systems',
  'Databases',
  'Networks',
  'Software Eng',
  'AI',
  'Web Engineering',
  'Graphics',
  'Security',
];

const List<String> names = ['Ali', 'Sara', 'Omar', 'Hina', 'Zain', 'Maya'];
const List<String> mains = [
  'start',
  'center',
  'end',
  'spaceBetween',
  'spaceAround',
  'spaceEvenly',
];
const List<String> crosses = ['start', 'center', 'end'];
const List<String> hues = ['teal', 'indigo', 'orange', 'pink', 'green'];

const Map<String, MaterialColor> swatches = {
  'teal': Colors.teal,
  'indigo': Colors.indigo,
  'orange': Colors.orange,
  'pink': Colors.pink,
  'green': Colors.green,
};

final String course = courses[u];

// Steps 1-2: the clock
final int startSec = 5 * (1 + t % 5);
final int tick = 1 + u % 3;
final int ticks = 4 + u % 4;
final int stopAt = startSec + ticks * tick;

// Steps 4-5: the tiles
final String tileA = names[u % 6];
final String tileB = names[(u + 2) % 6];
final String tileC = names[(u + 4) % 6];
final int tapsToMake = 2 + t % 3;

// Step 6: axes
final String mainName = mains[u % 6];
final String crossName = crosses[t % 3];

// Step 8: Expanded and Flexible
final double fixedW = 70.0 + 10 * u;
final int flexA = 1 + t % 3;
final int flexB = 1 + u % 2;

// Step 9: Container
final double boxMargin = 4.0 + 2 * (t % 5);
final double boxPad = 8.0 + 2 * (u % 5);
final double boxRadius = 4.0 * (1 + (t + u) % 4);
final double boxBorder = 1.0 + t % 3;
final String hue = hues[(t + u) % 5];

// Step 10: Stack
final double dotTop = 4.0 + 4 * (t % 4);
final double dotRight = 4.0 + 4 * (u % 4);
final double dotBottom = 4.0 + 4 * ((t + u) % 4);
final double dotLeft = 4.0 + 4 * ((t + 2 * u) % 4);

// Step 2: lifecycle log
final List<String> lifecycleLog = <String>[];

void main() => runApp(const LabApp());

class LabApp extends StatelessWidget {
  const LabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Team Board',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Team Board: $course')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        Column(
  
children: [
  const SettingsCard(),
  const SizedBox(height: 12),
  const Welcome(),
  const SizedBox(height: 12),
  const Clock(),
  const SizedBox(height: 12),
  const SwapBoard(),
  const SizedBox(height: 12),
  const SummaryRow(),
  const SizedBox(height: 12),
  const ShareRow(),
  const SizedBox(height: 12),
  const InfoBox(),
  const SizedBox(height: 12),
  const StampStack(),

],

      vsr tiles = [
        Tile(tileA),
        Tile(tileB),
        Tile(tileC),
      ],
    ),
  ],
)
      ),
    );
  }
}


// Clock: Steps 1 and 2
class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  late Timer _timer;
  int _seconds = startSec;
  int _builds = 0;

  @override
  void initState() {
    super.initState();
    lifecycleLog.add('initState');

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds >= stopAt) {
        timer.cancel();
        return;
      }

      setState(() {
        _seconds += tick;
        if (_seconds >= stopAt) {
          _seconds = stopAt;
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    lifecycleLog.add('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _builds++;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Session: $_seconds s',
          key: const Key('clock'),
        ),
        Text(
          'Builds: $_builds',
          key: const Key('builds'),
        ),
        Probe(seconds: _seconds),
      ],
    );
  }
}

// Step 3: BuildContext, Widget and Element
class Probe extends StatelessWidget {
  final int seconds;

  const Probe({super.key, required this.seconds});

  @override
  Widget build(BuildContext context) {
    final above =
        context.findAncestorWidgetOfExactType<Scaffold>() != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Seen at: $seconds s',
          key: const Key('probe-seen'),
        ),
        Text(
          'Widget #${identityHashCode(this)}',
          key: const Key('probe-widget'),
        ),
        Text(
          'Element #${identityHashCode(context)}',
          key: const Key('probe-element'),
        ),
        Text(
          'Context belongs to: ${context.widget.runtimeType}',
          key: const Key('probe-context'),
        ),
        Text(
          'Scaffold above me: $above',
          key: const Key('probe-above'),
        ),
      ],
    );
  }
}

// Provided settings display
class SettingsCard extends StatelessWidget {
  const SettingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'YOUR SETTINGS (seed $seed)\n'
      'clock: start $startSec, tick $tick, stop at $stopAt\n'
      'tiles: $tileA, $tileB, $tileC '
      '(taps for the Step 5 experiment: $tapsToMake)\n'
      'row main axis: $mainName | column cross axis: $crossName\n'
      'flex: $flexA and $flexB | fixed width: ${fixedW.toStringAsFixed(0)}\n'
      'box: margin $boxMargin, padding $boxPad, radius $boxRadius, '
      'border $boxBorder, colour $hue\n'
      'stamp: top $dotTop, right $dotRight, bottom $dotBottom, left $dotLeft',
      key: const Key('settings'),
      style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
    );
  }
}

// Provided for Step 7: this row intentionally overflows until Step 7.
class SummaryRow extends StatelessWidget {
  const SummaryRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Part A: read the widget tree of the $course board from top to bottom.',
          key: const Key('sum-a'),
        ),
        Text(
          'Part B: build each box from small widgets and never extend a built-in class.',
          key: const Key('sum-b'),
        ),
        Text(
          'Part C: break the layout on purpose, then fix it with Expanded or Wrap.',
          key: const Key('sum-c'),
        ),
      ],
    );
  }
  
class SummaryRow extends StatelessWidget {
  const SummaryRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            'Part A: read the widget tree of the $course board from top to bottom.',
            key: const Key('sum-a'),
          ),
        ),
        Expanded(
          child: Text(
            'Part B: build each box from small widgets and never extend a built-in class.',
            key: const Key('sum-b'),
          ),
        ),
        Expanded(
          child: Text(
            'Part C: break the layout on purpose, then fix it with Expanded or Wrap.',
            key: const Key('sum-c'),
          ),
        ),
      ],
    );
  }
}

// Think: Constraints go down, sizes go up.
// Expanded gives each Text a share of the available Row width.
// The Text receives a limited width, so it wraps its words onto multiple lines.

}

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Welcome, $studentName',
        key: const Key('welcome'),
      ),
    );
  }
}

class Tile extends StatefulWidget {
  const Tile(this.label, {super.key});

  final String label;

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  int taps = 0;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() => taps++);
      },
      child: Text('${widget.label}: $taps'),
    );
  }
}

// Widget is a configuration; Element connects it to the tree and
// retains State for StatefulWidget instances. RenderObject handles layout
// and painting. Probe lets us observe widget and element identities.
//step4
// This style is called composition.
// Flutter prefers composition because small, reusable widgets can be
// combined to build complex interfaces. Each Tile manages its own
// state, making the code easier to reuse, test, and maintain.

class SwapBoard extends StatefulWidget {
  const SwapBoard({super.key});

  @override
  State<SwapBoard> createState() => _SwapBoardState();
}

class _SwapBoardState extends State<SwapBoard> {
  var tiles = [
    Tile(tileA, key: ValueKey(tileA)),
    Tile(tileB, key: ValueKey(tileB)),
    Tile(tileC, key: ValueKey(tileC)),
  ];

  void swap() => setState(() => tiles = tiles.reversed.toList());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: tiles),
        ElevatedButton(
          key: const Key('swap'),
          onPressed: swap,
          child: const Text('Swap'),
        ),
      ],
    );
  }
}

// step 5
// Without keys, Flutter matches widgets mainly by type and position.
// When the tiles are reversed, the existing Element objects can be
// reused at their old positions. Each Element retains its State,
// so the counter may remain on the left even though the label changes.
// ValueKey identifies each tile by its label, allowing Flutter to match
// the widget with the correct Element and preserve its State.



class InfoPanel extends StatelessWidget {
  const InfoPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          key: const Key('info-row'),
          mainAxisAlignment: rowMainAxis,
          children: [
            Text(
              'Start: $startSec s',
              key: const Key('row-a'),
            ),
            Text(
              'Tick: $tick s',
              key: const Key('row-b'),
            ),
            Text(
              'Stop: $stopAt s',
              key: const Key('row-c'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Column(
          key: const Key('info-col'),
          crossAxisAlignment: columnCrossAxis,
          children: [
            Text(
              'Name: $studentName',
              key: const Key('col-a'),
            ),
            Text(
              'Roll no: $rollNo',
              key: const Key('col-b'),
            ),
            Text(
              'Course: $course',
              key: const Key('col-c'),
            ),
          ],
        ),
      ],
    );
  }
}


//step6

// In a Column, the main axis is vertical because its children are
// arranged from top to bottom.
//
// The cross axis is horizontal. Therefore, setting
// crossAxisAlignment to CrossAxisAlignment.center centers the
// children horizontally, moving their positions left or right
// rather than moving them up or down.


class ShareRow extends StatelessWidget {
  const ShareRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      key: const Key('share-row'),
      children: [
        SizedBox(
          key: const Key('fixed'),
          width: fixedW,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('F'),
          ),
        ),
        Expanded(
          flex: flexA,
          child: ElevatedButton(
            key: const Key('exp'),
            onPressed: () {},
            child: const Text('Exp'),
          ),
        ),
        Flexible(
          flex: flexB,
          child: ElevatedButton(
            key: const Key('flex'),
            onPressed: () {},
            child: const Text('Flex'),
          ),
        ),
      ],
    );
  }
}

// Think: Expanded is Flexible with fit: FlexFit.tight.
// Expanded must fill its allocated share. Flexible can keep its child
// at its natural size. If we swap them, Exp may stay smaller and Flex
// will fill its allocated share instead.

class InfoBox extends StatelessWidget {
  const InfoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key('info-box'),
      margin: EdgeInsets.all(boxMargin),
      padding: EdgeInsets.all(boxPad),
      decoration: BoxDecoration(
        color: swatches[hue]!.shade100,
        borderRadius: BorderRadius.circular(boxRadius),
        border: Border.all(width: boxBorder),
      ),
      child: Text(
        'Course: $course',
        key: const Key('box-text'),
      ),
    );
  }
}

// Think:
// Padding is inside the border; margin is outside the border.
// Use Padding when you only need inner space around a child.
// Use SizedBox when you need a fixed size or a simple gap.
// Use Container when you need decoration, a background, a border,
// or a combination of layout and styling.



class StampStack extends StatelessWidget {
  const StampStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      key: const Key('stack'),
      children: [
        Container(
          key: const Key('layer-base'),
          width: 300,
          height: 120,
          color: Colors.grey.shade300,
        ),
        Positioned(
          top: dotTop,
          right: dotRight,
          child: const Icon(
            Icons.star,
            key: Key('dot-top'),
          ),
        ),
        Positioned(
          bottom: dotBottom,
          left: dotLeft,
          child: const Icon(
            Icons.circle,
            key: Key('dot-bottom'),
          ),
        ),
      ],
    );
  }
}

// Think:
// The Stack's size is determined by its non-positioned child (the grey Container)
// when it has a fixed width and height.
// The first child is painted at the bottom, and later children appear above it.
// If the Icons came first and the grey Container last, the grey Container
// would paint over the Icons and hide them.
