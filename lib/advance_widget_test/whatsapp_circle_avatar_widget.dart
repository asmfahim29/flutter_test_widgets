import 'package:flutter/material.dart';

class WhatsAppCircleAvatarStatus extends StatelessWidget {
  final String imageUrl;
  final Color? statusColor;

  const WhatsAppCircleAvatarStatus({
    super.key,
    this.imageUrl = 'https://images.unsplash.com/photo-1731441363093-ddd9ed90fca5?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    this.statusColor = Colors.cyan,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(imageUrl),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 25,
              height: 22,
              decoration: BoxDecoration(
                color: statusColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
