import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guessing_repository/guessing_repository.dart';
import 'package:incode/app/app.dart';
import 'package:incode/guessing/guessing.dart';

class App extends StatefulWidget {
  const App({super.key, required this.guessingRepository});

  final GuessingRepository guessingRepository;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    widget.guessingRepository.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: widget.guessingRepository,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AppBloc(),
            ),
            BlocProvider(
              create: (context) => GuessingBloc(
                guessingRepository: widget.guessingRepository,
              )..add(GuessingSubscribed())..add(GuessingCharacterSet(character: null)),
            ),
          ],
          child: const AppView()
        ),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  static const List<Widget> _screens = <Widget>[
    HomePage(),
    ListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Scaffold(
          body: _screens.elementAt(state.index),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.black, width: 3))),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  label: 'List',
                ),
              ],
              currentIndex: state.index,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.black,
              onTap: (index) {
                context.read<AppBloc>().add(AppIndexChanged(index: index));
              },
            ),
          ),
        );
      },
    );
  }
}