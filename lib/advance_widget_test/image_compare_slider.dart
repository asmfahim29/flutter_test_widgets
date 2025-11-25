import 'package:flutter/material.dart';
import 'package:widgets_test_screen/image_comparer_slider_package_code/image_comparer.dart';

class ImageCompareScreen extends StatefulWidget {
  const ImageCompareScreen({super.key});

  @override
  State<ImageCompareScreen> createState() => _ImageCompareScreenState();
}

class _ImageCompareScreenState extends State<ImageCompareScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Compare Slider"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ImageCompareSlider(
            itemOne: Image.asset('assets/product_images/day_light.jpg', height: 300,),
            itemTwo: Image.asset('assets/product_images/images.png', height: 300,),
            photoRadius: BorderRadius.circular(20),
            dividerColor: Colors.white,
            handleColor: Colors.black.withOpacity(0.6),
            handleOutlineColor: Colors.white,
            dividerWidth: 2.5,
            handleSize: const Size(30, 30),
            handleRadius: BorderRadius.circular(100),
            fillHandle: true,
            handleFollowsPosition: true,
            direction: SliderDirection.leftToRight,
          ),
        ),
      ),
    );
  }
}

class ImageSliderHandle extends StatelessWidget {
  const ImageSliderHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: double.infinity,
      child: CustomPaint(
        painter: ImageSliderPainter(),
      ),
    );
  }
}


class ImageSliderPainter extends CustomPainter {
  final Color lineColor;
  final Color circleColor;
  final double lineWidth;
  final double circleRadius;

  ImageSliderPainter({
    this.lineColor = Colors.white,
    this.circleColor = const Color.fromRGBO(0, 0, 0, 0.5),
    this.lineWidth = 3,
    this.circleRadius = 15,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paintLine = Paint()
      ..color = lineColor
      ..strokeWidth = lineWidth
      ..strokeCap = StrokeCap.round;

    final centerX = size.width / 2;
    final centerY = size.height / 2;

    // Draw top half of the line
    canvas.drawLine(
      Offset(centerX, 0),
      Offset(centerX, centerY - circleRadius),
      paintLine,
    );

    // Draw bottom half of the line
    canvas.drawLine(
      Offset(centerX, centerY + circleRadius),
      Offset(centerX, size.height),
      paintLine,
    );

    // Draw the circle
    final paintCircle = Paint()
      ..color = circleColor
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(centerX, centerY), circleRadius, paintCircle);

    final paintCircleBorder = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawCircle(Offset(centerX, centerY), circleRadius, paintCircleBorder);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

