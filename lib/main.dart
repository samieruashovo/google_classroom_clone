import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_classroom/login/auth_repository.dart';
import 'package:google_classroom/login/bloc/auth_bloc.dart';
import 'package:google_classroom/pages/home_page.dart';
import 'package:google_classroom/pages/login_page.dart';
import 'package:google_classroom/pages/create_post_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(
            authRepository: RepositoryProvider.of<AuthRepository>(context)),
        child: MaterialApp(

          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'RobotoMono'),
          home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const HomePage();
              }
              return const LoginPage();
            },
          ),
        ),
      ),
    );
  }
}
