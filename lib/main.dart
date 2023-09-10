import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sandbox/album_screen.dart';
import 'package:flutter_sandbox/cart/shopper_main.dart';
import 'package:flutter_sandbox/drawer.dart';
import 'package:flutter_sandbox/layout.dart';
import 'package:flutter_sandbox/navigation.dart';
import 'package:flutter_sandbox/persist_counter2.dart';
import 'package:flutter_sandbox/persist_countet.dart';
import 'package:flutter_sandbox/photo_screen.dart';
import 'package:flutter_sandbox/selection.dart';
import 'package:flutter_sandbox/todo.dart';
import 'package:flutter_sandbox/web_view.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import 'dog/model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database =
      openDatabase(
          join(await getDatabasesPath(), 'doggie_database.db'),
          onCreate: (db, version) {
            return db.execute('CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)');
          },
          version: 1
      );

  Future<void> insertDog(Dog dog) async {
    final db = await database;
    await db.insert('dogs', dog.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Dog>> dogs() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('dogs');

    return List.generate(maps.length, (index) {
      return Dog(
          id: maps[index]['id'],
          name: maps[index]['name'],
          age: maps[index]['age']
      );
    });
  }

  await insertDog(Dog(id: 1, name: 'taro', age: 10));
  final dogList = await dogs();
  print('${dogList.length}, ${dogList[0].name}');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // アプリ全体にstateを提供する
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
    // return MaterialApp(
    //     title: 'Namer App',
    //     theme: ThemeData(
    //       useMaterial3: true,
    //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
    //     ),
    //     home: ProviderScope(child: MyHelloWorld()),
    //   );
  }
}

// ChangeNotifier: 自身の変更に関する通知を行える
class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var favorites = <WordPair>[];

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = FavoritesPage();
        break;
      case 2:
        page = TextExample();
        break;
      case 3:
        page = MyWebView();
        break;
      case 4:
        page = MyNavigation();
        break;
      case 5:
        final todos = List.generate(
            20, (index) => Todo('TODO $index', 'description of $index'));
        page = TodoScreen(todos: todos);
        break;
      case 6:
        page = MySelectionScreen();
        break;
      case 7:
        page = MyDrawer();
        break;
      case 8:
        page = MyShopper();
        break;
      case 9:
        // page = ProviderScope(child: MyHelloWorld());
        page = MyShopper();
        break;
      case 10:
        page = MyAlbum();
        break;
      case 11:
        page = MyPhoto();
      case 12:
        // page = PersistCounter();
        page = PersistCounter2(
          storage: CounterStorage(),
        );
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 600,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(key: Key('favorite_menu_icon'), Icons.favorite),
                    label: Text('Favorites'),
                  ),
                  NavigationRailDestination(
                      icon: Icon(Icons.edit), label: Text('Text Example')),
                  NavigationRailDestination(
                      icon: Icon(key: Key('webview_menu_icon'), Icons.web),
                      label: Text('Web View')),
                  NavigationRailDestination(
                      icon: Icon(Icons.navigation), label: Text('Navigation')),
                  NavigationRailDestination(
                      icon: Icon(Icons.list), label: Text('Todo List')),
                  NavigationRailDestination(
                      icon: Icon(Icons.select_all),
                      label: Text('Select option')),
                  NavigationRailDestination(
                      icon: Icon(Icons.menu), label: Text('Drawer')),
                  NavigationRailDestination(
                      icon: Icon(Icons.add_shopping_cart),
                      label: Text('shopper')),
                  NavigationRailDestination(
                      icon: Icon(Icons.podcasts), label: Text('riverpod')),
                  NavigationRailDestination(
                      icon: Icon(Icons.album), label: Text('Album')),
                  NavigationRailDestination(
                      icon: Icon(Icons.photo), label: Text('Photo')),
                  NavigationRailDestination(
                      icon: Icon(Icons.countertops),
                      label: Text('Persist Counter')),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    // stderr.writeln('GeneratorPage#build');
    // debugPrint('debug print');
    // developer.log('developer log', name: 'my.app.category');
    // developer.log('log', name: 'my.app', error: jsonEncode({'myError': 'error has occurred'}));

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                key: Key('like_button'),
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favorites = appState.favorites;

    if (favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have ${favorites.length} favorites'),
        ),
        // for(var pair in favorites) ListTile(title: Text(pair.asLowerCase)),
        ...favorites
            .map(
              (pair) => ListTile(
                  title: Text(pair.asLowerCase), leading: Icon(Icons.favorite)),
            )
            .toList()
      ],
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!
        .copyWith(color: theme.colorScheme.onPrimary);

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          pair.asLowerCase,
          style: style,
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}
