import 'package:flutter/widgets.dart';
import 'package:flutter_mobx_dio_boilerplate/common/l10n/en.dart' as en;
import 'package:flutter_mobx_dio_boilerplate/common/l10n/hi.dart' as hi;
import 'package:flutter_mobx_dio_boilerplate/common/l10n/l10n_helpers.dart';

class L10n {
  final Locale locale;

  Map<String, String>? localizedStrings;

  final Map<String, Map<String, String>> localizedStringsList = {
    'en': en.enLocaleHashMap,
    'hi': hi.hiLocaleHashMap,
  };

  static LocalizationsDelegate<L10n> delegate = _L10nDelegate();

  L10n(this.locale);

  // Helper method to keep the code in the widgets concise
  // Localizations are accessed using an InheritedWidget "of" syntax
  static L10n? of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  Future<bool> load() async {
    localizedStrings = localizedStringsList[locale.languageCode];

    return true;
  }

  // This method will be called from every widget which needs a localized text
  String? translate(String key) {
    return localizedStrings![key];
  }
}

// LocalizationsDelegate is a factory for a set of localized resources
// In this case, the localized strings will be gotten in an L10n object
class _L10nDelegate extends LocalizationsDelegate<L10n> {
  // This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  _L10nDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return supportedL10nLocales.contains(locale.languageCode);
  }

  @override
  Future<L10n> load(Locale locale) async {
    final localizations = L10n(locale);

    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_L10nDelegate old) => false;
}
