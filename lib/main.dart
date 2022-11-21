import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/api/client.dart';
import 'package:todo/models/auth/auth.model.dart';
import 'package:todo/models/bloc_observer/observer.bloc.dart';
import 'package:todo/routes/navigation.dart';
import 'package:todo/store/shared_preference.dart';

import 'models/auth/auth.bloc.dart';

void main() async {
  Bloc.observer = GlobalBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  ApiClient();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await UserSharedPreferences.init();
  runApp(const MyApp());
}

const defaultRoute = '/';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
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
