import 'package:flutter/material.dart';
import '../main.dart';
import '../components/navbar.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = ThemeState.of(context).isDark;
    final fg = dark ? kWhite : kBlack;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: dark ? kDarkBg : kWhite,
            toolbarHeight: 56,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                alignment: Alignment.topCenter,
                child: Navbar(title: 'Products', links: const ['Home','Pricing','Services','Products']),
              ),
            ),
          ),
          SliverToBoxAdapter(child: Padding(
            padding: const EdgeInsets.fromLTRB(24,48,24,24),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Layout Patterns', style: TextStyle(fontSize:12, letterSpacing:2, color: fg.withValues(alpha:0.5))),
              const SizedBox(height:16),
              Text('Product\nShowcase.', style: TextStyle(fontSize:42, fontWeight:FontWeight.bold, color: fg, height:1.1)),
              const SizedBox(height:24),
              Text('Seven layout patterns from grids to carousels.', style: TextStyle(fontSize:18, color: fg.withValues(alpha:0.6))),
            ]),
          )),
          SliverToBoxAdapter(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:24),
            child: GridView.count(
              shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12,
              childAspectRatio: 1.2,
              children: ['Aero Headphones','Pixel Watch','Studio Mic','Slate Pad'].map((n) => Card(
                color: dark ? kDarkCard : kWhite,
                child: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(n, style: TextStyle(fontWeight:FontWeight.bold, fontSize:16, color: fg)),
                  const SizedBox(height:4),
                  Text('Sample product description.', style: TextStyle(fontSize:12, color: fg.withValues(alpha:0.6))),
                ])),
              )).toList(),
            ),
          )),
          SliverToBoxAdapter(child: SizedBox(height:24)),
        ],
      ),
    );
  }
}
