import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final Color backgroundColor;
  final Color textColor;
  final String imagePath;
  final IconData fallbackIcon;
  final VoidCallback onTap;

  const ActivityCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.backgroundColor,
    required this.textColor,
    required this.imagePath,
    required this.fallbackIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Top Indicator Dot
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: textColor.withValues(alpha: 0.35),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),

              const SizedBox(height: 4),

              // Main Illustration Asset Container (Renders directly without circular badge)
              SizedBox(
                height: 72,
                width: double.infinity,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    // Circle Badge Fallback strictly for missing image assets
                    return Center(
                      child: Container(
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.25),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          fallbackIcon,
                          size: 28,
                          color: textColor,
                        ),
                      ),
                    );
                  },
                ),
              ),

              const Spacer(),

              // Titles
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: textColor,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: textColor.withValues(alpha: 0.8),
                ),
              ),
              const SizedBox(height: 8),

              // Description Body
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w500,
                  color: textColor.withValues(alpha: 0.9),
                  height: 1.25,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}