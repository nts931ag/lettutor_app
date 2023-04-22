import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor_app/config/router/router.dart';
import 'package:lettutor_app/domain/repositories/api_repository.dart';
import 'package:lettutor_app/locator.dart';
import 'package:lettutor_app/presentation/cubits/authentication_cubit.dart';
import 'package:lettutor_app/presentation/views/base_screen.dart';
import 'package:lettutor_app/presentation/views/login_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  MyApp.initSystemDefault();
  await initializeDependencies();
  runApp(const MyApp());
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
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthenticationCubit(
              locator<ApiRepository>(),
            ),
          )
        ],
        child: MaterialApp(
          locale: _locale,
          title: "Lettutor",
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          onGenerateRoute: MyRouter.generateRoute,
          home: BlocBuilder<AuthenticationCubit, AuthenticationState>(
            buildWhen: (preState, curState) {
              return preState.authState != curState.authState;
            },
            builder: (context, state) {
              switch (state.runtimeType) {
                case AuthenticationUnknown:
                  return const SafeArea(child: LoginScreen());
                case AuthenticationSuccess:
                  return const SafeArea(child: BaseScreen());
                case AuthenticationFailed:
                  return const SafeArea(child: LoginScreen());
                default:
                  return const SizedBox();
              }
            },
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
