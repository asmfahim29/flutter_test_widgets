import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeWidget extends StatelessWidget {
  final String userId;

  const QrCodeWidget({super.key, this.userId = '1103029'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: QrImageView(
        data: userId,
        version: QrVersions.auto,
        size: 200.0,
        backgroundColor: Colors.white,
      ),
    );
  }
}
