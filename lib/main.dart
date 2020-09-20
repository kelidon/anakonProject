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
        ),
        home: ApplicationPage(),
      ),
    );
  }
}

class ApplicationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerWidget(),
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.indigo.withOpacity(1),
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
          title: Text("Anakon", style: TextStyle(fontSize: 24),),
          centerTitle: true,
        ),
        body: ContentWidget());
  }
}
