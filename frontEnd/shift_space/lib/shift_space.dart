import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shift_space/routing/app_routes.dart';
import 'package:shift_space/ui/utils/theme/light_theme.dart';
// ✅ Adicione estes imports
import 'package:flutter_localizations/flutter_localizations.dart';

class ShiftSpaceApp extends ConsumerStatefulWidget {
  const ShiftSpaceApp({super.key});

  @override
  ConsumerState<ShiftSpaceApp> createState() => _ShiftSpaceAppState();
}

class _ShiftSpaceAppState extends ConsumerState<ShiftSpaceApp> {
  @override
  void initState() {
    //chamada de metodo pra caso precise inicializar
    //algo antes do app ser contruido
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final goRouter = ref.watch(appRouterProvider);
    
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
      theme: lightTheme,
      
      // ✅ Adicione estas configurações de localização
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
        Locale('en', 'US'),
      ],
      locale: const Locale('pt', 'BR'),
    );
  }
}
