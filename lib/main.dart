import 'package:camera/camera.dart';
import 'package:dogandcatprenktranlsator/Resources/ColorResources.dart';
import 'package:dogandcatprenktranlsator/UI/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp( MyApp());
}

RewardedInterstitialAd? rewardeInterstitialdAd;
class MyApp extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  // @override
  // void didChangeDependencies() {
  //   getLocale().then((locale) => {setLocale(locale)});
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        navigatorKey: MyApp.navigatorKey,
        title: 'Flutter Demo',
        theme: ThemeData(fontFamily: "TT Wellingtons Trial",
          colorScheme: ColorScheme.fromSeed(seedColor: blackColor),
          useMaterial3: true,
        ),
        // supportedLocales: AppLocalizations.supportedLocales,
        // localizationsDelegates: AppLocalizations.localizationsDelegates,
         home:   const SplashScreen(),
        // home:    RandomCatScreen(),
        locale: _locale,
        // SplashScreen(),
      );
    });
  }
}
 List<CameraDescription>? cameras;