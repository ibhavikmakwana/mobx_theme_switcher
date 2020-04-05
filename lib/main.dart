import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobxthemeswitcher/store/album/fetch_album_store.dart';
import 'package:mobxthemeswitcher/store/theme/theme_store.dart';
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
    ThemeStore _themeStore = Provider.of<ThemeStore>(context);
    return Observer(
      name: 'theme_store_observer',
      builder: (BuildContext context) => MaterialApp(
        title: 'Flutter MobX',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: _themeStore.themeMode,
        home: Provider(
          create: (_) => FetchAlbumStore(),
          child: MyHomePage(title: 'Flutter Theme Changer'),
        ),
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
  ThemeStore _themeStore;
  FetchAlbumStore _albumStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _themeStore ??= Provider.of<ThemeStore>(context);
    _albumStore ??= Provider.of<FetchAlbumStore>(context);
    _albumStore.fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.lightbulb_outline),
            onPressed: () {
              openBottomSheet(context, _themeStore);
            },
          )
        ],
      ),
      body: Center(
        child: Observer(
          builder: (_) {
            switch (_albumStore.state) {
              case NetworkState.initial:
                return Container();
                break;
              case NetworkState.loading:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case NetworkState.completed:
                return ListView.builder(
                  itemBuilder: (_, index) => ListTile(
                    title: Text(_albumStore.album[index].title),
                  ),
                  itemCount: _albumStore.album.length,
                );
                break;
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }

  void openBottomSheet(BuildContext context, ThemeStore _themeStore) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text('Light'),
              onTap: () => changeTheme(_themeStore, context, ThemeMode.light),
            ),
            ListTile(
              title: Text('Dark'),
              onTap: () => changeTheme(_themeStore, context, ThemeMode.dark),
            ),
            ListTile(
              title: Text('System'),
              onTap: () => changeTheme(_themeStore, context, ThemeMode.system),
            ),
          ],
        );
      },
    );
  }

  void changeTheme(
      ThemeStore _themeStore, BuildContext context, ThemeMode mode) {
    _themeStore.switchTheme(mode);
    Navigator.of(context).pop();
  }
}
//We need to run the app again as we have added Provider on the Top of the MyApp.
