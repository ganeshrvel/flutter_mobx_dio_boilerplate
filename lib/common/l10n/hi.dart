import 'package:flutter_mobx_dio_boilerplate/features/app/ui/l10n/hi.dart';
import 'package:flutter_mobx_dio_boilerplate/features/home/ui/l10n/hi.dart';
import 'package:flutter_mobx_dio_boilerplate/features/login/ui/l10n/hi.dart';
import 'package:flutter_mobx_dio_boilerplate/features/page_not_found/ui/l10n/hi.dart';

final Map<String, String> hiLocaleHashMap = {
  ...appHiLocaleHashMap,
  ...loginHiLocaleHashMap,
  ...homeHiLocaleHashMap,
  ...pageNotFoundHiLocaleHashMap
};
