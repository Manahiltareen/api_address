
import 'package:api_address/config/app_colors.dart';
import 'package:api_address/config/font_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class CustomAuthHeader extends StatelessWidget {
  final String title;
  final bool showBackButton;

  const CustomAuthHeader({
    super.key,
    required this.title,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClipper(),
      child: Container(
        height: 200, // Consistent height
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.primaryBlue, AppColors.accentBlue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            // Dominant, wide, and soft black shadow for the "lifted" and "thick bottom" effect
            BoxShadow(
              color: Colors.black.withOpacity(0.55), // Stronger black opacity
              offset: const Offset(0, 20), // Increased Y offset for maximum lift and depth
              blurRadius: 50, // Very high blur for extreme softness and spread
              spreadRadius: 8, // Increased spread for a truly thick shadow at the base
            ),
            // A secondary, subtle shadow that helps blend and add slight nuance (optional, adjust opacity)
            BoxShadow(
              color: AppColors.primaryBlue.withOpacity(0.3),
              offset: const Offset(0, 10),
              blurRadius: 25,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(-0.8, -0.2),
              child: Text(
                title,
                style: FontUtils.heading1.copyWith(color: AppColors.white),
              ),
            ),
            if (showBackButton)
              Positioned(
                top: 40,
                left: 10,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () {
                    Get.back;
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// Refined WaveClipper for a more flowing, elegant, and substantial wave shape
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.6);

    var controlPoint1 = Offset(size.width * 0.2, size.height * 0.85);
    var endPoint1 = Offset(size.width * 0.4, size.height * 0.7);
    path.quadraticBezierTo(
      controlPoint1.dx,
      controlPoint1.dy,
      endPoint1.dx,
      endPoint1.dy,
    );


    var controlPoint2 = Offset(size.width * 0.6, size.height * 1.0);
    var endPoint2 = Offset(size.width * 0.8, size.height * 0.8);
    path.quadraticBezierTo(
      controlPoint2.dx,
      controlPoint2.dy,
      endPoint2.dx,
      endPoint2.dy,
    );

    // Third curve: final gentle rise to the right edge
    var controlPoint3 = Offset(size.width * 0.9, size.height * 0.7);
    var endPoint3 = Offset(size.width, size.height * 0.75);
    path.quadraticBezierTo(
      controlPoint3.dx,
      controlPoint3.dy,
      endPoint3.dx,
      endPoint3.dy,
    );

    path.lineTo(size.width, 0); // Line to top right corner
    path.close(); // Close the path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}