import 'package:flutter/material.dart';
import 'package:lwtecnologia/triggers/auth.dart';
import 'package:lwtecnologia/ui/account_screen.dart';
import 'package:lwtecnologia/ui/login_screen.dart';
import 'package:lwtecnologia/ui/search_screen.dart';
import 'package:lwtecnologia/utils/icon_badge.dart';

class MainPages extends StatefulWidget {
  static String id = 'main_pages';

  @override
  _MainPagesState createState() => _MainPagesState();
}

class _MainPagesState extends State<MainPages> with WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  PageController _pageController = PageController(
    initialPage: 1,
  );
  int _page = 0;
  String namePage = 'Principal';

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {}

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _pageController = new PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget barIcon(
      {IconData icon = Icons.home, int page = 0, bool badge = false}) {
    return new IconButton(
      icon: badge ? IconBadge(icon: icon, size: 24) : Icon(icon, size: 24),
      color: _page == page
          ? Theme.of(context).accentColor
          : Theme.of(context).disabledColor,
      onPressed: () {
        if (page == 0) {
          setState(() {
            namePage = 'Principal';
          });
        } else if (page == 1) {
          setState(() {
            namePage = 'Perfil';
          });
        }
        navigationTapped(page);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0.5,
        title: Text(
          namePage,
          style: TextStyle(
            fontFamily: 'Roboto Regular',
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: [
          SearchScreen(),
          AccountScreen(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(),
            barIcon(icon: Icons.directions_car, page: 0),
            SizedBox(),
            barIcon(icon: Icons.person, page: 1),
            SizedBox(),
          ],
        ),
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
