import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/navbar.dart';
import '../components/hero.dart';
import '../components/quote.dart';
import '../components/chapter_card.dart';
import '../components/study_card.dart';
import '../components/methodology.dart';
import '../components/footer.dart';
import '../main.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = ThemeState.of(context).isDark;
    final fg = dark ? kWhite : kBlack;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: dark
          ? SystemUiOverlayStyle.dark.copyWith(
              statusBarColor: Colors.black,
              statusBarIconBrightness: Brightness.light,
              systemNavigationBarColor: Colors.black,
              systemNavigationBarIconBrightness: Brightness.light,
            )
          : SystemUiOverlayStyle.light.copyWith(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: Colors.white,
              systemNavigationBarIconBrightness: Brightness.dark,
            ),
      child: SafeArea(
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                floating: false,
                backgroundColor: dark ? kDarkBg : kWhite,
                systemOverlayStyle: dark
                    ? SystemUiOverlayStyle.light
                    : SystemUiOverlayStyle.dark,
                automaticallyImplyLeading: false,
                toolbarHeight: 56,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    alignment: Alignment.topCenter,
                    child: Navbar(
                      title: 'State of AI Design',
                      links: const [
                        'Home',
                        'Report',
                        'Chapters',
                        'Teams',
                        'Products',
                        'Pricing',
                        'Services',
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(child: const HeroSection()),
              SliverToBoxAdapter(child: const FeaturedQuote()),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 32),
                      Text(
                        'Chapters',
                        style: TextStyle(
                          fontSize: 12,
                          letterSpacing: 2,
                          color: fg.withValues(alpha: 0.5),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const ChapterCard(
                        num: '01',
                        title: 'Tools',
                        desc:
                            'The instruments of the rebuild. How design systems, AI editors, and generative interfaces are reshaping the craft of making.',
                      ),
                      const SizedBox(height: 12),
                      const ChapterCard(
                        num: '02',
                        title: 'Craft',
                        desc:
                            'Quality at scale. From taste to taste-testing — how senior designers are defining what good looks like in a world of infinite drafts.',
                      ),
                      const SizedBox(height: 12),
                      const ChapterCard(
                        num: '03',
                        title: 'Teams',
                        desc:
                            'Structure meets speed. How design orgs are flattening hierarchies, merging disciplines, and redefining what a team does together.',
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Case Studies',
                        style: TextStyle(
                          fontSize: 12,
                          letterSpacing: 2,
                          color: fg.withValues(alpha: 0.5),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'How seven teams rebuilt.',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: fg,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 24),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          const spacing = 12.0;
                          final maxCols = ((constraints.maxWidth + spacing) / 200).floor().clamp(2, 4);
                          final cards = const [
                            StudyCard(co: 'Anthropic', ready: true),
                            StudyCard(co: 'Stripe', ready: true),
                            StudyCard(co: 'Sierra', ready: true),
                            StudyCard(co: 'Linear', ready: true),
                            StudyCard(co: 'Shopify', ready: false),
                            StudyCard(co: 'Figma', ready: false),
                            StudyCard(co: 'Notion', ready: false),
                          ];
                          final rows = <Widget>[];
                          for (var i = 0; i < cards.length; i += maxCols) {
                            final row = <Widget>[];
                            for (var j = 0; j < maxCols && i + j < cards.length; j++) {
                              row.add(Expanded(child: cards[i + j]));
                              if (j < maxCols - 1) row.add(const SizedBox(width: spacing));
                            }
                            rows.add(Row(children: row));
                            if (i + maxCols < cards.length) rows.add(const SizedBox(height: spacing));
                          }
                          return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: rows);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 32)),
              const SliverToBoxAdapter(child: Methodology()),
              const SliverToBoxAdapter(child: Footer()),
            ],
          ),
        ),
      ),
    );
  }
}
