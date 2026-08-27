import 'package:flutter/material.dart';
import '../main.dart';

class FeaturedQuote extends StatelessWidget {
  const FeaturedQuote({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = ThemeState.of(context).isDark;
    final fg = dark ? kWhite : kBlack;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.symmetric(vertical: 32),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: fg.withValues(alpha: 0.1)), bottom: BorderSide(color: fg.withValues(alpha: 0.1))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('"AI is sparking a creative renaissance in design. With new instruments, it\'s our chance to compose wholly new music."',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, height: 1.2, color: fg)),
          const SizedBox(height: 16),
          Text('Katie Dill — Head of Design, Stripe', style: TextStyle(fontSize: 13, color: fg.withValues(alpha: 0.5))),
        ],
      ),
    );
  }
}
