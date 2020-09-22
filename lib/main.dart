import 'package:anakonProject/bloc/drawer/drawer_bloc.dart';
import 'package:anakonProject/widgets/app_bar/drawer_widget.dart';
import 'package:anakonProject/widgets/content/content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DrawerBloc>(
          create: (_) => DrawerBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Anakon',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Poppins'
        ),
        home: ApplicationPage(),
      ),
    );
  }
}

class ApplicationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  ScrollController _mainController;
  ScrollController _blurController;
  ScrollController _towerController;

  _mainScrollListener() {
    _towerController.jumpTo(_mainController.offset * 0.1);
    _blurController.jumpTo(_mainController.offset * 0.03);
  }

  @override
  void initState() {
    _mainController = ScrollController();
    _mainController.addListener(_mainScrollListener);
    _towerController = ScrollController();
    _blurController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        onNotification: (v) {
          if (v is ScrollUpdateNotification) {}
          return true;
        },
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: _towerController,
              child: Container(
                child: Image.asset(
                  "assets/images/tower.jpg",
                ),
              ),
            ),
            SingleChildScrollView(
              controller: _blurController,
              child: Container(
                alignment: Alignment.topRight,
                child: Image.asset("assets/images/blur.jpg"),
              ),
            ),
            Scaffold(
                backgroundColor: Colors.transparent,
                drawer: DrawerWidget(),
                appBar: AppBar(
                  backgroundColor: Colors.black.withOpacity(0.7),
                  elevation: 0.0,
                  toolbarHeight: 70,
                  leading: Builder(builder: (context) {
                    return IconButton(
                      icon: Icon(
                        Icons.menu,
                        size: 30,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        if (Scaffold.of(context).isDrawerOpen) {
                          Scaffold.of(context).openEndDrawer();
                        } else {
                          Scaffold.of(context).openDrawer();
                        }
                      },
                    );
                  }),
                  actions: [
                    Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("+375 (33) 354-76-45"),
                            Text("anakon@gmail.com")
                          ],
                        ))
                  ],
                  title: Text(
                    "ANAKON",
                    style: TextStyle(fontSize: 24),
                  ),
                  centerTitle: true,
                ),
                body: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _mainController,
                    child: ContentWidget())),
          ],
        ),
      ),
    );
  }
}
