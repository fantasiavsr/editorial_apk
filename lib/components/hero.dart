import 'package:flutter/material.dart';
import '../main.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = ThemeState.of(context).isDark;
    /* final bg = dark ? kDarkBg : kWhite; */
    final fg = dark ? kWhite : kBlack;
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 48, 24, 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '2026 Annual Report',
            style: TextStyle(
              fontSize: 12,
              letterSpacing: 2,
              color: fg.withValues(alpha: 0.5),
            ),
          ),
          const SizedBox(height: 16),
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: fg,
                height: 1.0,
                fontSize: 42,
                fontWeight: FontWeight.bold,
              ),
              children: [
                const TextSpan(text: 'AI in Design.\n'),
                const TextSpan(
                  text: 'The Rebuild.',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,
                    color: kOrange,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'From experimentation to infrastructure. How design teams are restructuring craft, tools, and culture.',
            style: TextStyle(
              fontSize: 18,
              color: fg.withValues(alpha: 0.6),
              height: 1.4,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: kOrange,
              foregroundColor: kWhite,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: const StadiumBorder(),
              elevation: 0,
            ),
            child: const Text('Read the report'),
          ),
        ],
      ),
    );
  }
}
