import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/pages/coming_soon_page.dart';
import 'package:netflix_clone/presentation/pages/download_page.dart';
import 'package:netflix_clone/presentation/pages/home_page.dart';
import 'package:netflix_clone/presentation/pages/more_page.dart';
import 'package:netflix_clone/presentation/pages/search_page.dart';
import 'package:netflix_clone/presentation/screens/router/router_screen_stacks.dart';

enum BottomNavMenu { Home, Search, ComingSoon, Downloads, More }

extension Page on BottomNavMenu {
  String get name => describeEnum(this);

  Widget get page {
    switch (this) {
      case BottomNavMenu.Home:
        return HomePage();
      case BottomNavMenu.ComingSoon:
        return ComingSoonPage();
      case BottomNavMenu.Search:
        return SearchPage();
      case BottomNavMenu.Downloads:
        return DownloadPage();
      case BottomNavMenu.More:
        return MorePage();
    }
  }
}

class BottomNavWidget extends StatefulWidget {
  final BottomNavMenu menu;

  const BottomNavWidget({required this.menu});

  @override
  State<BottomNavWidget> createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
  final List<String> bottomMenus = [
    "Home",
    "Search",
    "Coming Soon",
    "Downloads",
    "More"
  ];

  final List<IconData> icons = [
    Icons.home_outlined,
    Icons.search_outlined,
    Icons.play_arrow_outlined,
    Icons.download_sharp,
    Icons.more_horiz_outlined
  ];

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    this.selectedIndex = widget.menu.index;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        _makeButtons(btnIndex: 0),
        _makeButtons(btnIndex: 1),
        _makeButtons(btnIndex: 2),
        _makeButtons(btnIndex: 3),
        _makeButtons(btnIndex: 4)
      ]),
    );
  }

  Widget _makeButtons({required int btnIndex}) {
    Color? selectedColor =
        widget.menu.index == btnIndex ? Colors.white : Colors.grey[600];
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = btnIndex;
          var nextMenu = BottomNavMenu.values[selectedIndex];
          if (selectedIndex != widget.menu.index) {

            var prevMenu = RouterScreenStacks.getPreviousStack();
            if(prevMenu != null && prevMenu == nextMenu){
              Navigator.pop(context);
              return;
            }

            Navigator.push(
                context, MaterialPageRoute(builder: (_) => nextMenu.page));

            RouterScreenStacks.addStack(widget.menu);
          }
        });
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icons[btnIndex],
              color: selectedColor,
            ),
            Text(
              bottomMenus[btnIndex],
              style: TextStyle(color: selectedColor, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
