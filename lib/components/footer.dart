import 'package:flutter/material.dart';
import '../main.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = ThemeState.of(context).isDark;
    final fg = dark ? kWhite : kBlack;
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(border: Border(top: BorderSide(color: fg.withValues(alpha: 0.1)))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('State of AI Design', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: fg)),
            const SizedBox(height: 4),
            Text('A research initiative on the future of design and technology.', style: TextStyle(fontSize: 12, color: fg.withValues(alpha: 0.5))),
          ])),
          Wrap(spacing: 24, children: [
            Text('About', style: TextStyle(fontSize: 13, color: fg.withValues(alpha: 0.6))),
            Text('Subscribe', style: TextStyle(fontSize: 13, color: fg.withValues(alpha: 0.6))),
            Text('Made in Framer', style: TextStyle(fontSize: 13, color: fg.withValues(alpha: 0.6))),
          ]),
        ]),
        const SizedBox(height: 32),
        Text('© 2026 State of AI Design. All rights reserved.', style: TextStyle(fontSize: 11, color: fg.withValues(alpha: 0.3))),
      ]),
    );
  }
}
