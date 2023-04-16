import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lettutor_app/presentation/base/base_screen.dart';
import 'package:lettutor_app/providers/bottom_bar_provider.dart';
import 'package:lettutor_app/resource/constants/local_string.dart';
import 'package:lettutor_app/routes/router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() {
  MyApp.initSystemDefault();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static void initSystemDefault() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.blue),
    );

    WidgetsFlutterBinding.ensureInitialized();
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => BottomBarProvider(),
          ),
        ],
        child: MaterialApp(
          locale: _locale,
          title: LocalString.appName,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          onGenerateRoute: MyRouter.generateRoute,
          home: const SafeArea(
            child: BaseScreen(),
          ),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
        ),
      ),
    );
  }
}
