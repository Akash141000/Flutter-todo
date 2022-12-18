import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/api/client.dart';
import 'package:todo/models/auth/auth.model.dart';
import 'package:todo/models/bloc_observer/observer.bloc.dart';
import 'package:todo/models/todo/todo.bloc.dart';
import 'package:todo/routes/navigation.dart';
import 'package:todo/store/shared_preference.dart';

import 'models/auth/auth.bloc.dart';

void main() async {
  Bloc.observer = GlobalBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  ApiClient();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await UserSharedPreferences.init();
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    debugPrint("FLUTTER ERROR>> $details");
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    debugPrint("PLATFORM DISPATCHER ERROR>> $error");
    return true;
  };
  runApp(const MyApp());
}

const defaultRoute = '/';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc.authBlocInstance),
        BlocProvider(create: (context) => TodoBloc.todoBlocInstance),
      ],
      child: BlocBuilder<AuthBloc, Auth?>(
        builder: ((context, authState) => MaterialApp.router(
              title: 'My Todo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              routerConfig: router,
            )),
      ),
    );
  }
}
