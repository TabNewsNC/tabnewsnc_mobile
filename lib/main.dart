import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tabnewsnc/core/bindings/initial_binding.dart';
import 'package:tabnewsnc/core/drivers/storage_driver.dart';
import 'package:tabnewsnc/core/routes/app_pages.dart';
import 'package:tabnewsnc/core/routes/app_routes.dart';
import 'package:tabnewsnc_ui/tabnewsnc_ui.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([_setupChrome(), _setupStorage()]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

final class _MyAppState extends State<MyApp> {
  late final DefaultAppTheme _theme;

  @override
  void initState() {
    super.initState();
    _theme = const DefaultAppTheme();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TabNews',
      initialBinding: InitialBinding(),
      initialRoute: AppRoutes.initial,
      getPages: AppPages.pages,
      theme: _theme.light,
      darkTheme: _theme.dark,
      debugShowCheckedModeBanner: false,
      locale: const Locale('pt', 'BR'),
      builder: (context, child) {
        _setSystemUI(context);
        return child ?? const SizedBox.shrink();
      },
    );
  }
}

Future<void> _setupChrome() async {
  await Future.wait([
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge),
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
  ]);

  _setSystemUI();
}

void _setSystemUI([BuildContext? context]) {
  final theme = context?.theme;
  Brightness? brightness;
  switch (theme?.brightness) {
    case .light:
      brightness = .dark;
    case .dark:
      brightness = .light;
    case null:
      brightness = null;
  }

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: brightness,
      systemStatusBarContrastEnforced: false,
      systemNavigationBarContrastEnforced: false,
      systemNavigationBarIconBrightness: brightness,
      systemNavigationBarColor: Colors.transparent,
    ),
  );
}

Future<void> _setupStorage() async {
  final directory = await getApplicationDocumentsDirectory();
  final path = directory.path;

  Hive.init(path);
  final driver = await StorageDriverImpl.initialize(
    'TabNews',
    {'theme', 'favorites'},
    path: path,
  );

  Get.lazyPut<StorageDriver>(() => driver, fenix: true);
}
