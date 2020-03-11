import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobxthemeswitcher/theme_store.dart';
import 'package:provider/provider.dart';

//Wrap MyApp with Provider
void main() => runApp(
      Provider(
        create: (BuildContext context) => ThemeStore(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Now get our ThemeStore over here.
    ThemeStore themeStore = Provider.of<ThemeStore>(context);

    //Wrap MaterialApp with the [Observer] widget
    return Observer(
      name:
          'theme_store_observer', // a name to identify observer if anything goes wrong.
      builder: (BuildContext context) => MaterialApp(
        title: 'Flutter MobX',
        theme: themeStore.themeStore,
        home: MyHomePage(title: 'Flutter Theme Changer'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    ThemeStore themeStore = Provider.of<ThemeStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemBuilder: (_, index) => ListTile(
          title: Text('Index $index'),
        ),
      ),
      //let's add FAB button to change theme
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          themeStore.switchTheme();
        },
      ),
    );
  }
}
//We need to run the app again as we have added Provider on the Top of the MyApp.
