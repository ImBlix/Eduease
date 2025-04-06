import 'package:flutter/material.dart';
import '../constants/colors.dart';

class EduEaseLogo extends StatelessWidget {
  final double size;

  const EduEaseLogo({Key? key, this.size = 150.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Book icon
          Container(
            width: size * 0.5,
            height: size * 0.5,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Book pages
                Positioned(
                  left: 0,
                  child: Container(
                    width: size * 0.1,
                    height: size * 0.4,
                    color: AppColors.primary,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 2,
                          width: size * 0.06,
                          color: Colors.white,
                        ),
                        Container(
                          height: 2,
                          width: size * 0.06,
                          color: Colors.white,
                        ),
                        Container(
                          height: 2,
                          width: size * 0.06,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),

                // Book spine
                Positioned(
                  right: 0,
                  child: Container(
                    width: size * 0.02,
                    height: size * 0.5,
                    color: AppColors.primary,
                  ),
                ),

                // Book inner page
                Container(
                  width: size * 0.3,
                  height: size * 0.3,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Logo text
          Text(
            'EDUEASE',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: size * 0.16,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
