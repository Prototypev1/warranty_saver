import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:logger_service/logger_service.dart';
import 'package:warranty_saver/di/di.dart';
import 'package:warranty_saver/core/presentation/navigation/router_configuration.dart';
import 'package:warranty_saver/firebase_options.dart';
import 'package:warranty_saver/gen/codegen_loader.g.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  _initLogger();

  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await EasyLocalization.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      await initDI();

      if (!kIsWeb) {
        FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
        Log.onError = (message, _, stackTrace) {
          FirebaseCrashlytics.instance.recordError(message, stackTrace);
        };
      }

      getIt.get<RouterConfiguration>().init();

      runApp(
        EasyLocalization(
          assetLoader: const CodegenLoader(),
          supportedLocales: const [Locale('en'), Locale('sr')],
          startLocale: const Locale('sr'),
          path: 'assets/localization',
          fallbackLocale: const Locale('sr'),
          child: await builder(),
          //saveLocale - remember the choice for the next launch
        ),
      );
    },
    (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      Log().e('Uncaught error in app', error, stackTrace);
      if (!kIsWeb) {
        FirebaseCrashlytics.instance.recordError(error, stackTrace);
      }
    },
  );
}

void _initLogger() {
  Log.tag = 'Warranty Saver';
}
