import 'package:flutter/material.dart';
import '../main.dart';
import '../pages/product_page.dart';
import '../pages/main_page.dart';

class Navbar extends StatefulWidget {
  final String title;
  final List<String> links;
  const Navbar({super.key, required this.title, required this.links});
  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  bool _open = false;
  final _controller = OverlayPortalController();

  @override
  void initState() {
    super.initState();
    _controller.show();
  }

  @override
  void dispose() {
    _controller.hide();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dark = ThemeState.of(context).isDark;
    final bg = dark ? kDarkBg : kWhite;
    final fg = dark ? kWhite : kBlack;

    return Stack(
      children: [
        Container(
          height: 56,
          decoration: BoxDecoration(
            color: bg,
            border: Border(bottom: BorderSide(color: fg.withValues(alpha: 0.1))),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(child: Text(widget.title, overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: fg))),
              IconButton(
                icon: Icon(dark ? Icons.sunny : Icons.dark_mode, color: dark ? kOrange : fg, size: 22),
                onPressed: ThemeState.of(context).toggle,
              ),
              IconButton(
                icon: Icon(_open ? Icons.close : Icons.menu, color: fg, size: 22),
                onPressed: () => setState(() => _open = !_open),
              ),
            ],
          ),
        ),
        OverlayPortal(
          controller: _controller,
          overlayChildBuilder: (context) {
            if (!_open) return const SizedBox.shrink();
            return Positioned(
              top: 56,
              left: 0,
              right: 0,
              child: Material(
                elevation: 8,
                color: bg,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: widget.links.map((l) => ListTile(
                      title: Text(l, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: fg)),
                      dense: true, contentPadding: EdgeInsets.zero,
                      onTap: () {
                        setState(() => _open = false);
                        if (l == 'Home') {
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const MainPage()), (r) => false);
                        } else if (l == 'Products') {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const ProductPage()));
                        }
                      },
                    )).toList(),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
