import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(SpinWheelApp());
}

class SpinWheelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SpinWheel(),
    );
  }
}

class SpinWheel extends StatefulWidget {
  @override
  _SpinWheelState createState() => _SpinWheelState();
}

class _SpinWheelState extends State<SpinWheel>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _angle = 0;
  int _numSections = 8; // default number of sections
  final _sectionController = TextEditingController();
  int _selectedSection = 0;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
  }

  void _spinWheel() {
    _angle = Random().nextDouble() * 2 * pi; // Random angle
    for (int i = 0; i < 100; i++) {
      _controller.forward(from: 0).then((_) => _controller.reset());
      _angle += 2 * pi; // Increment angle by 2*pi for each rotation
    }
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _selectedSection =
            (_angle / (2 * pi) * _numSections).toInt() % _numSections;
      });
    });
  }

  void _updateNumSections() {
    setState(() {
      _numSections = int.parse(_sectionController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Spin the Wheel')),
      backgroundColor: Colors.brown[300],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              TextField(
                controller: _sectionController,
                decoration: InputDecoration(
                  labelText: 'Number of tickets',
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 26,
              ),
              ElevatedButton(
                onPressed: _updateNumSections,
                child: Text('Update Section'),
              ),
              SizedBox(
                height: 26,
              ),
              Stack(
                children: [
                  GestureDetector(
                    onTap: _spinWheel,
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: _angle + (_controller.value * 2 * pi),
                          child: CustomPaint(
                            size: Size(300, 300),
                            painter: WheelPainter(
                              numSections: _numSections,
                              selectedSection: _selectedSection,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          width: 20,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 37, 1, 17),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: 26,
              ),
              Text(
                'Selected Number: ${_selectedSection + 1}',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class WheelPainter extends CustomPainter {
  final int numSections;
  final int selectedSection;

  WheelPainter({required this.numSections, required this.selectedSection});
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..style = PaintingStyle.fill;
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radius = min(centerX, centerY);

    final double arcAngle =
        2 * pi / numSections; // Calculate the arc angle for each section

    for (int i = 0; i < numSections; i++) {
      paint.color = Colors.primaries[i % Colors.primaries.length];
      canvas.drawArc(
          Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
          (i * arcAngle),
          arcAngle,
          true,
          paint);
    }
    final TextPainter textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    for (int i = 0; i < numSections; i++) {
      textPainter.text = TextSpan(
        text: '${i + 1}',
        style: const TextStyle(
          fontSize: 12,
          color: Colors.black,
        ),
      );
      textPainter.layout();
      final Offset textOffset = Offset(
        centerX + radius * 0.8 * cos(i * arcAngle + arcAngle / 2),
        centerY + radius * 0.8 * sin(i * arcAngle + arcAngle / 2),
      );

      textPainter.paint(canvas, textOffset);
    }
    final Paint selectedPaint = Paint()..color = Colors.transparent;
    final double selectedRadius = radius * 0.1;
    final Offset selectedOffset = Offset(
      centerX + radius * 0.8 * cos(selectedSection * arcAngle + arcAngle / 2),
      centerY + radius * 0.8 * sin(selectedSection * arcAngle + arcAngle / 2),
    );
    canvas.drawCircle(selectedOffset, selectedRadius, selectedPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
