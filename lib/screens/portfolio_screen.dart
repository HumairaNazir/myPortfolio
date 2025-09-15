import 'package:flutter/material.dart';
import 'package:portfolio/reuseable_widgets/about_section_widget.dart';
import 'package:portfolio/reuseable_widgets/contact_section_widget.dart';
import 'package:portfolio/reuseable_widgets/cv_download_button.dart';
import 'package:portfolio/reuseable_widgets/hero_section_widget.dart';
import 'package:portfolio/reuseable_widgets/portfolio_section_widget.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(5, (index) => GlobalKey());

  void onNavMenuTap(int index) {
    final keyContext = navbarKeys[index].currentContext;
    if (keyContext != null) {
      Scrollable.ensureVisible(
        keyContext,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      // close drawer after navigation (on mobile)
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:
            const Text('My Portfolio', style: TextStyle(color: Colors.amber)),
        actions: isDesktop
            ? [
                // ✅ Desktop/Tablet menu
                TextButton(
                  onPressed: () => onNavMenuTap(0),
                  child:
                      const Text('Home', style: TextStyle(color: Colors.amber)),
                ),
                TextButton(
                  onPressed: () => onNavMenuTap(1),
                  child: const Text('About',
                      style: TextStyle(color: Colors.amber)),
                ),
                TextButton(
                  onPressed: () => onNavMenuTap(2),
                  child: const Text('Portfolio',
                      style: TextStyle(color: Colors.amber)),
                ),
                TextButton(
                  onPressed: () => onNavMenuTap(3),
                  child:
                      const Text('CV', style: TextStyle(color: Colors.amber)),
                ),
                TextButton(
                  onPressed: () => onNavMenuTap(4),
                  child: const Text('Contact',
                      style: TextStyle(color: Colors.amber)),
                ),
              ]
            : [
                // ✅ Mobile hamburger menu only
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.amber),
                  onPressed: () {
                    scaffoldKey.currentState
                        ?.openEndDrawer(); // open RIGHT SIDE drawer
                  },
                ),
              ],
      ),
      // ✅ Show Drawer only for mobile
      endDrawer: isDesktop
          ? null
          : Drawer(
              backgroundColor: Colors.black87,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(color: Colors.amber),
                    child: Text(
                      "Humaira's Portfolio",
                      style: TextStyle(color: Colors.black, fontSize: 24),
                    ),
                  ),
                  ListTile(
                    title: const Text('Home',
                        style: TextStyle(color: Colors.white)),
                    onTap: () => onNavMenuTap(0),
                  ),
                  ListTile(
                    title: const Text('About',
                        style: TextStyle(color: Colors.white)),
                    onTap: () => onNavMenuTap(1),
                  ),
                  ListTile(
                    title: const Text('Portfolio',
                        style: TextStyle(color: Colors.white)),
                    onTap: () => onNavMenuTap(2),
                  ),
                  ListTile(
                    title:
                        const Text('CV', style: TextStyle(color: Colors.white)),
                    onTap: () => onNavMenuTap(3),
                  ),
                  ListTile(
                    title: const Text('Contact',
                        style: TextStyle(color: Colors.white)),
                    onTap: () => onNavMenuTap(4),
                  ),
                ],
              ),
            ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            HeroSectionWidget(key: navbarKeys.first),
            AboutSectionWidget(key: navbarKeys[1]),
            PortfolioSectionWidget(key: navbarKeys[2]),
            ContactSectionWidget(key: navbarKeys[4]),
            const SizedBox(height: 20),
            CvDownloadButton(key: navbarKeys[3]),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
