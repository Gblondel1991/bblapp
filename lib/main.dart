import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // var localizationDelegate = LocalizedApp.of(context).delegate;
    return MaterialApp(
      title: 'Welcome to Flutter',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('fr', ''),
      theme: ThemeData(
        brightness: Brightness.light,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark,
      /* ThemeMode.system to follow system theme, 
         ThemeMode.light for light theme, 
         ThemeMode.dark for dark theme
      */
      debugShowCheckedModeBanner: false,
      home: const MyHomePage()
      );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.appName),
        ),
        body: const Center(
          child: ListAction()
        ),
    );
  }
}

class ListAction extends StatefulWidget {
  const ListAction({Key? key}) : super(key: key);

  @override
  _ListActionState createState() => _ListActionState();
}

class _ListActionState extends State<ListAction> {
  @override
  Widget build(BuildContext context) {
    final _listAction = [
      (AppLocalizations.of(context)!.actionActualities),
      (AppLocalizations.of(context)!.actionBook),
      (AppLocalizations.of(context)!.actionPrices)
    ];
    const _biggerFont = TextStyle(fontSize: 18);
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      padding: const EdgeInsets.all(16.0),
      itemCount: _listAction.length,
      itemBuilder: (BuildContext context, int i) {
        return Container(
          child: Center(child: Text(_listAction[i], style: _biggerFont)),
        );
      },
    );
  }
}