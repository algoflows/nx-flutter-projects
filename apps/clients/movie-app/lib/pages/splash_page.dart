import 'dart:convert';

import 'package:clients_movie_app/models/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import "package:get_it/get_it.dart";

class SplashPage extends StatefulWidget {
  final VoidCallback onInitializationComplete;

  const SplashPage({required Key key, required this.onInitializationComplete})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then(
      (_) => _setup(context).then(
        (_) => widget.onInitializationComplete(),
      ),
    );
  }

  Future<void> _setup(BuildContext context) async {
    final getIt = GetIt.instance;
    final configFile = await rootBundle.loadString('assets/config/main.json');
    final config = json.decode(configFile);

    getIt.registerSingleton<AppConfig>(AppConfig(
      apiImageUrl: config['API_IMAGE_URL'],
      apiBaseUrl: config['API_BASE_URL'],
      // get api key from environment
      apiKey: dotenv.env['API_KEY'] ?? 'API_KEY not found!',
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flickd',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage('assets/images/logo.png'),
            ),
          ),
        ),
      ),
    );
  }
}
