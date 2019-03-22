import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Widget> pages = [
    Center(child: Text("Home")),
    Center(child: Text("Favoritos")),
    Center(child: Text("Perfil")),
    Center(child: Text("Página 4")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Page View"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.keyboard_arrow_left),
              onPressed: () {
                controller.previousPage(
                    curve: Curves.easeInOutBack,
                    duration: Duration(milliseconds: 900));
              },
            ),
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                controller.jumpToPage(0);
              },
            ),
            IconButton(
              icon: Icon(Icons.keyboard_arrow_right),
              onPressed: () {
                controller.nextPage(
                    curve: Curves.easeInOutBack,
                    duration: Duration(milliseconds: 900));
              },
            ),
          ],
        ),
        body: PageView.builder(
          controller: controller,
          itemCount: pages.length,
          itemBuilder: (BuildContext context, int index) {
            return pages[index];
          },
        ),
        bottomNavigationBar: AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget child) {
            return BottomNavigationBar(
              currentIndex: controller.page.round(),
              onTap: (index) {
                controller.animateToPage(index,
                    curve: Curves.easeInOutBack,
                    duration: Duration(microseconds: 400));
              },
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    title: Text("Home"), icon: Icon(Icons.home)),
                BottomNavigationBarItem(
                    title: Text("Fav"), icon: Icon(Icons.favorite)),
                BottomNavigationBarItem(
                    title: Text("Perfil"), icon: Icon(Icons.account_circle)),
              ],
            );
          },
        ));
  }
}
