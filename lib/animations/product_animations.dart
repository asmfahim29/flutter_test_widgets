import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProductDetailAnimation extends StatefulWidget {
  const ProductDetailAnimation({
    super.key,
  });

  @override
  State<ProductDetailAnimation> createState() => _ProductDetailAnimationState();
}

class _ProductDetailAnimationState extends State<ProductDetailAnimation>
    with SingleTickerProviderStateMixin {
  bool up = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
      reverseDuration: const Duration(milliseconds: 2300),
    )..addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) controller.reverse();
      if (status == AnimationStatus.dismissed) controller.forward();
    });

    controller.forward();
  }

  @override
  void dispose() {
    // Dispose of the AnimationController
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35),
      child: SizedBox(
          height: 150,
          width: double.infinity,
          child: SlideTransition(
              position: Tween<Offset>(
                  begin: const Offset(0, -0.1), end: const Offset(0, 0.24))
                  .animate(controller),
              child: Image.asset('assets/product_images/headphone.webp'))),
    );
  }
}
