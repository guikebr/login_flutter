import 'package:shared_preferences/shared_preferences.dart';

enum Themes { DARK, LIGHT }

class PrefsTheme {
  static const Map<Themes, String> themes = {
    Themes.DARK: "Dark",
    Themes.LIGHT: "Light"
  };

  Map<String, List<PrefsListener>> _listeners;

  factory PrefsTheme.singleton() {
    return _instance;
  }

  static final PrefsTheme _instance = PrefsTheme._internal();

  SharedPreferences _prefs;
  bool _initialized = false;

  static const String THEME_PREF = "AppTheme";

  PrefsTheme._internal() {
    _listeners = Map<String, List<PrefsListener>>();
    _getPrefs().then((prefs) {
      _initialized = true;
      for (String key in _listeners.keys) {
        List<PrefsListener> listeners = _listeners[key];
        if (listeners != null && listeners.isNotEmpty) {
          Object value = prefs.get(key);
          for (PrefsListener listener in listeners) {
            listener(key, value);
          }
        }
      }
    });
  }

  void addListenerForPref(String key, PrefsListener listener) {
    List<PrefsListener> list = _listeners[key];
    if (list == null) {
      list = List<PrefsListener>();
      _listeners[key] = list;
    }
    list.add(listener);
  }

  Future<SharedPreferences> _getPrefs() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
    return _prefs;
  }

  String getTheme() {
    if (_initialized) {
      String theme = _prefs.getString(THEME_PREF);
      if (theme != null) {
        return theme;
      } else {
        _prefs.setString(THEME_PREF, themes[Themes.LIGHT]); //ok not to wait
        return themes[Themes.LIGHT];
      }
    } else {
      return themes[Themes.LIGHT];
    }
  }

  //called when the user updates the operating system theme
  //(by choosing light or dark mode)
  void systemThemeUpdated() {
    String theme = getTheme();

    List<PrefsListener> listenerList = _listeners[THEME_PREF];
    if (listenerList != null) {
      for (PrefsListener listener in listenerList) {
        listener(THEME_PREF, theme);
      }
    }
  }

  ///set the app's theme preference from the
  ///app's own UI
  void setTheme(String theme) {
    _getPrefs().then((prefs) {
      prefs.setString(THEME_PREF, theme);
    });
    List<PrefsListener> listenerList = _listeners[THEME_PREF];
    if (listenerList != null) {
      for (PrefsListener listener in listenerList) {
        listener(THEME_PREF, theme);
      }
    }
  }
}

typedef PrefsListener(String key, Object value);
