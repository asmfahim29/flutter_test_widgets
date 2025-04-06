import 'package:flutter/material.dart';

class StarRatingWidget extends StatefulWidget {
  const StarRatingWidget({super.key});

  @override
  StarRatingWidgetState createState() => StarRatingWidgetState();
}

class StarRatingWidgetState extends State<StarRatingWidget>
    with SingleTickerProviderStateMixin {
  double _rating = 0;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: .8, end: 1.3).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _opacityAnimation = Tween<double>(begin: 0.8, end: .9).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) {
        final RenderBox renderBox = context.findRenderObject() as RenderBox;
        final Offset localOffset =
        renderBox.globalToLocal(details.globalPosition);
        const double starPadding = 8.0; // if each star has 8px padding on both sides
        final double actualStarWidth = (renderBox.size.width - (starPadding * 10)) / 5;

        final positionInStars = localOffset.dx / (actualStarWidth + starPadding * 2);

        final newRating = (positionInStars % 1) > 0.5
            ? positionInStars.ceilToDouble()
            : positionInStars.floorToDouble();

        print("Star Width : $actualStarWidth");
        print("New Positions : $positionInStars");
        print("New Rating : $newRating");
        print("Previous Rating : $_rating");


        if (newRating != _rating) {
          setState(() {
            _rating = newRating;
            _controller.forward(from: 0.0); // Start animation
          });
        }
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              bool isRated = _rating > index;
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: ScaleTransition(
                  scale: isRated
                      ? _scaleAnimation
                      : const AlwaysStoppedAnimation(1.0),
                  child: Opacity(
                    opacity: isRated ? _opacityAnimation.value : 1.0,
                    child: Transform.rotate(
                      angle: isRated ? _scaleAnimation.value * 0.1 : 0.0,
                      child: Icon(
                        Icons.star,
                        color: isRated ? Colors.amber : Colors.grey[400],
                        size:
                        MediaQuery.of(context).size.width / 5.8, // animation handled by ScaleTransition
                      ),
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
