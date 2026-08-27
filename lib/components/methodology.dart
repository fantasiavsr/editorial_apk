import 'package:flutter/material.dart';
import '../main.dart';

class Methodology extends StatelessWidget {
  const Methodology({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = ThemeState.of(context).isDark;
    final fg = dark ? kWhite : kBlack;
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 48),
      decoration: BoxDecoration(border: Border(top: BorderSide(color: fg.withValues(alpha: 0.1)))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Methodology', style: TextStyle(fontSize: 12, letterSpacing: 2, color: fg.withValues(alpha: 0.5))),
        const SizedBox(height: 24),
        const _StatTile(stat: '500+', desc: 'Designers surveyed across 60+ countries. From startups to Fortune 500s.'),
        const SizedBox(height: 24),
        const _StatTile(stat: '120', desc: 'In-depth interviews with product, engineering, and design leaders.'),
        const SizedBox(height: 24),
        const _StatTile(stat: '60+', desc: 'Public sources, research papers, and open-source contributions analyzed.'),
      ]),
    );
  }
}

class _StatTile extends StatelessWidget {
  final String stat, desc;
  const _StatTile({required this.stat, required this.desc});
  @override
  Widget build(BuildContext context) {
    final dark = ThemeState.of(context).isDark;
    final fg = dark ? kWhite : kBlack;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(stat, style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: fg, height: 1)),
      const SizedBox(height: 8),
      Text(desc, style: TextStyle(fontSize: 13, color: fg.withValues(alpha: 0.5), height: 1.5)),
    ]);
  }
}
