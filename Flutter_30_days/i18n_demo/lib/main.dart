import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter_localizations/flutter_localizations.dart';


class DemoLocalizations {
  DemoLocalizations(this.locale);

  final Locale locale;

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en':{
      'title':'Translation Example',
      'statement':'I\'m in English',
      'language_button':'Change Language',
    },

    'ja':{
      'title':'国際化されたデモ',
      'statement':'使用中の日本語',
      'language_button':'日本語ボタン',
    },
//    'es':{
//      'title':'Ejemplo de traduccion',
//      'statement':'Estoy en espanol',
//      'language_button':'Cambiar idioma',
//    }
  };

  String get title{
    return _localizedValues[locale.languageCode]['title'];
  }

  String get statement {
    return _localizedValues[locale.languageCode]['statement'];
  }

  String get languageButton {
    return _localizedValues[locale.languageCode]['language_button'];
  }

}

class DemoLocalizationsDelegate extends LocalizationsDelegate<DemoLocalizations> {
  const DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en','ja'].contains(locale.languageCode);
  }

  @override
  bool shouldReload(LocalizationsDelegate<DemoLocalizations> old) {
    return false;
  }

  @override
  Future<DemoLocalizations> load(Locale locale) {
    return SynchronousFuture<DemoLocalizations>(DemoLocalizations(locale));
  }

}




class DemoAppPage extends StatelessWidget {

  DemoAppPage(Function changeLocale) : changeLocale = changeLocale;

  final changeLocale;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(DemoLocalizations.of(context).title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(DemoLocalizations.of(context).statement),
            RaisedButton(
              child: Text(DemoLocalizations.of(context).languageButton),
              onPressed: () {
                changeLocale();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DemoApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DemoAppState();
  }
}

class _DemoAppState extends State<DemoApp> {
  var _appLocale = const Locale('en','US');

  void _updateLocale (){
    setState(() {
      _appLocale = (_appLocale.languageCode == 'en') ? const Locale('ja','JP') : const Locale('en', 'US');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (BuildContext context) => DemoLocalizations.of(context).title,
      locale: _appLocale,
      localizationsDelegates: [
        const DemoLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en',''),
        const Locale('es',''),
      ],
      home: DemoAppPage(_updateLocale),
      localeResolutionCallback: (Locale locale, Iterable<Locale> supportedLocales) {
        return _appLocale;
      },
    );
  }
}

void main() => runApp(DemoApp());
