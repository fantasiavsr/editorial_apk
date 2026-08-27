import 'package:flutter/material.dart';
import '../main.dart';

class StudyCard extends StatelessWidget {
  final String co;
  final bool ready;
  const StudyCard({super.key, required this.co, required this.ready});
  @override
  Widget build(BuildContext context) {
    final dark = ThemeState.of(context).isDark;

    // ready card: light mode = black bg/white fg; dark mode = white bg/black fg
    // not-ready card: light = white bg / muted black; dark = dark card / muted white
    final Color bg;
    final Color border;
    final Color fg;
    final Color sub;
    if (ready) {
      bg = dark ? kWhite : kBlack;
      border = bg;
      fg = dark ? kBlack : kWhite;
      sub = dark ? kBlack.withValues(alpha: 0.7) : kWhite.withValues(alpha: 0.7);
    } else {
      bg = dark ? kDarkCard : kWhite;
      border = dark ? kWhite.withValues(alpha: 0.1) : kBlack.withValues(alpha: 0.1);
      fg = dark ? kWhite.withValues(alpha: 0.5) : kBlack.withValues(alpha: 0.5);
      sub = dark ? kWhite.withValues(alpha: 0.3) : kBlack.withValues(alpha: 0.3);
    }

    return Container(
      width: 160,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: bg, border: Border.all(color: border), borderRadius: BorderRadius.circular(16)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(co, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: fg)),
          Icon(Icons.arrow_outward, size: 16, color: fg.withValues(alpha: 0.6)),
        ]),
        const SizedBox(height: 12),
        Text(ready ? 'Available' : 'Coming soon',
            style: TextStyle(fontSize: 10, letterSpacing: 1.5, fontWeight: FontWeight.w500, color: sub)),
      ]),
    );
  }
}
