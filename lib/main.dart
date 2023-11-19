import 'package:easy_localization/easy_localization.dart';
import 'package:fast_app_base/hive/view_model/ranking_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'common/data/preference/app_preferences.dart';

void main() async {
  await Hive.initFlutter();
  await RankingViewModel.initializeHive();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await AppPreferences.init();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ko')],
      fallbackLocale: const Locale('en'),
      path: 'assets/translations',
      useOnlyLangCode: true,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => RankingViewModel()),
        ],
        child: const App(),
      ),
    ),
  );
}
