import 'package:flutter/material.dart';
import '../main.dart';

class ChapterCard extends StatelessWidget {
  final String num, title, desc;
  const ChapterCard({super.key, required this.num, required this.title, required this.desc});
  @override
  Widget build(BuildContext context) {
    final dark = ThemeState.of(context).isDark;
    final bg = dark ? kDarkCard : kWhite;
    final fg = dark ? kWhite : kBlack;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bg,
        border: Border.all(color: fg.withValues(alpha: 0.1)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(num, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: kOrange)),
        const SizedBox(height: 8),
        Text(title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: fg)),
        const SizedBox(height: 8),
        Text(desc, style: TextStyle(fontSize: 13, color: fg.withValues(alpha: 0.5), height: 1.5)),
      ]),
    );
  }
}
