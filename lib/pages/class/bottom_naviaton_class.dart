import 'package:flutter/material.dart';
import 'package:google_classroom/pages/class/class_page.dart';
import 'package:google_classroom/pages/class/classwork_page.dart';
import 'package:google_classroom/pages/class/people_page.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BottomNavPageClass extends StatefulWidget {
  final snap;
  const BottomNavPageClass({Key? key, this.snap}) : super(key: key);

  @override
  _BottomNavPageClassstate createState() => _BottomNavPageClassstate();
}

class _BottomNavPageClassstate extends State<BottomNavPageClass> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Navigator(key: _navigatorKey, onGenerateRoute: generateRoute),
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(MdiIcons.commentMultipleOutline),
          label: "Stream",
        ),
        BottomNavigationBarItem(
            icon: Icon(MdiIcons.clipboardTextOutline), label: "Classwork"),
        BottomNavigationBarItem(
          icon: Icon(Icons.people_outline),
          label: "People",
        )
      ],
      onTap: _onTap,
      currentIndex: _currentTabIndex,
      selectedItemColor: const Color.fromARGB(255, 3, 112, 202),
    );
  }

  _onTap(int tabIndex) {
    switch (tabIndex) {
      case 0:
        _navigatorKey.currentState!.pushReplacementNamed("Stream");
        break;
      case 1:
        _navigatorKey.currentState!.pushReplacementNamed("Classwork");
        break;
      case 2:
        _navigatorKey.currentState!.pushReplacementNamed("People");
        break;
    }
    setState(() {
      _currentTabIndex = tabIndex;
    });
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "Classwork":
        return MaterialPageRoute(builder: (context) =>  ClassworkPage(title: widget.snap['name'],));
      case "People":
        return MaterialPageRoute(builder: (context) => PeoplePage(title: widget.snap['name'],));
      default:
        return MaterialPageRoute(
            builder: (context) => ClassPage(snap: widget.snap));
    }
  }
}
