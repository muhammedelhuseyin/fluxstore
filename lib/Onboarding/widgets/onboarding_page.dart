
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const OnboardingPage({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Stack(
      children: [
        Column(
          children: [
            // الجزء العلوي (أبيض)
            Expanded(
              flex: 60,
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Stack(
                  children: [
                    // أشكال ديكور على الحواف
                    Positioned(
                      top: 50,
                      left: -30,
                      child: Container(
                        width: 60, // أضفت width
                        height: 60, // أضفت height
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 100,
                      right: 20,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),

                    // المحتوى الرئيسي
                    SafeArea(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 60),
                        
                            // العنوان
                            Text(
                              title,
                              textAlign: TextAlign.center, // أضفت textAlign
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                letterSpacing: -0.5,
                              ),
                            ),
                        
                            SizedBox(height: 12),
                        
                            // النص الفرعي
                            Text(
                              subtitle,
                              textAlign: TextAlign.center, // أضفت textAlign
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // الجزء السفلي (رمادي غامق)
            Expanded(
              flex: 40, // زودته شوي
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF2C2C2E),
                ),
                child: Stack(
                  children: [
                    // دوائر ديكور
                    Positioned(
                      bottom: 30,
                      left: 20,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      right: 40,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.05),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        
        // الصورة فوق الكل (Positioned)
        Positioned(
          top: screenHeight * 0.22, // حسّنت النسبة
          left: 30,
          right: 30,
          height: screenHeight * 0.55, // استخدمت height بدل bottom (أفضل)
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 30,
                  spreadRadius: 5,
                  offset: Offset(0, 10),
                ),
              ],
              image: DecorationImage(
                image: AssetImage(image),
               
              ),
            ),
          ),
        ),
      ],
    );
  }
}
