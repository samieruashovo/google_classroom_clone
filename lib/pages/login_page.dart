import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_classroom/login/bloc/auth_bloc.dart';
import 'package:google_classroom/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomePage()));
        }
        if (state is AuthError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        if (state is Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UnAuthenticated) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 90,
                      width: 90,
                      child: Image.asset('assets/classroom_01.jpg')),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Google ',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                        Text(
                          ' Classroom',
                          style: TextStyle(fontSize: 20, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                        'Helping educators and students communicate, \n \t\t\t\t\t\t\t\t\t\t\t\t\t save time, and stay organized.'),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 16, 97, 236))),
                      onPressed: () {
                        _authenticateWithGoogle(context);
                      },
                      child: const Text('Get Started')),
                  const SizedBox(
                    height: 80,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 180),
                    child: const Text(
                        'By joining, you agree to share contact information \n with people in your class. Learn more'),
                  )
                ],
              ),
            ),
          );
        }
        return Container();
      },
    ));
  }
}

void _authenticateWithGoogle(context) {
  BlocProvider.of<AuthBloc>(context).add(
    GoogleSignInRequested(),
  );
}

/* Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 200.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 90,
                  width: 90,
                  child: Image.asset('assets/classroom_01.jpg')),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Google ',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                    Text(
                      ' Classroom',
                      style: TextStyle(fontSize: 20, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                    'Helping educators and students communicate, \n \t\t\t\t\t\t\t\t\t\t\t\t\t save time, and stay organized.'),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 16, 97, 236))),
                  onPressed: () {},
                  child: const Text('Get Started')),
              const SizedBox(
                height: 80,
              ),
              Container(
                margin: const EdgeInsets.only(top: 180),
                child: const Text(
                    'By joining, you agree to share contact information \n with people in your class. Learn more'),
              )
            ],
          ),
        ),
      ),
      */
