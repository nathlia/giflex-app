// import 'package:flutter/material.dart';

// class LogInPage extends StatefulWidget {
//   const LogInPage({Key? key}) : super(key: key);

//   @override
//   State<LogInPage> createState() => _LogInPageState();
// }

// class _LogInPageState extends State<LogInPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocListener<AuthBloc, AuthState>(
//         listener: (context, state) {
//           if (state is LoggedInSuccessfully) {
//             context.read<HomeBloc>().add(LoadUserEvent());
//             Navigator.of(context).pushReplacement(
//               MaterialPageRoute(
//                 builder: (context) => const HomePage(),
//               ),
//             );
//           }
//           if (state is LoggedInFailed) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text(state.error),
//                 backgroundColor: Colors.red,
//               ),
//             );
//           }
//         },
//         child: BlocBuilder<AuthBloc, AuthState>(
//           builder: (context, state) {
//             if (state is Loading) {
//               // Showing the loading indicator while the user is signing in
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             if (state is NotLoggedIn) {
//               // Showing the sign in form if the user is not authenticated
//               return Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(18),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Interceptor',
//                           style: Theme.of(context)
//                               .textTheme
//                               .headline1
//                               ?.copyWith(fontSize: 32),
//                         ),
//                         const SizedBox(height: 40),
//                         Form(
//                           key: _formKey,
//                           child: Column(
//                             children: [
//                               TextFormField(
//                                 keyboardType: TextInputType.emailAddress,
//                                 controller: _emailController,
//                                 decoration: const InputDecoration(
//                                   hintText: 'Email',
//                                   border: OutlineInputBorder(),
//                                 ),
//                                 autovalidateMode:
//                                     AutovalidateMode.onUserInteraction,
//                                 validator: (value) {
//                                   return value != null &&
//                                           !EmailValidator.validate(value)
//                                       ? 'Enter a valid email'
//                                       : null;
//                                 },
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               TextFormField(
//                                 keyboardType: TextInputType.text,
//                                 controller: _passwordController,
//                                 decoration: const InputDecoration(
//                                   hintText: 'Password',
//                                   border: OutlineInputBorder(),
//                                 ),
//                                 autovalidateMode:
//                                     AutovalidateMode.onUserInteraction,
//                                 validator: (value) {
//                                   return value != null && value.length < 6
//                                       ? 'Enter min. 6 characters'
//                                       : null;
//                                 },
//                               ),
//                               const SizedBox(height: 40),
//                               GestureDetector(
//                                 onTap: () {
//                                   _authenticateWithEmailAndPassword(
//                                     context,
//                                   );
//                                 },
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8),
//                                   child: Container(
//                                     height: 50,
//                                     width:
//                                         MediaQuery.of(context).size.width * 0.7,
//                                     decoration: const BoxDecoration(
//                                       color: Colors.red,
//                                     ),
//                                     child: Center(
//                                       child: Text(
//                                         'Sign In',
//                                         style:
//                                             Theme.of(context).textTheme.button,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 40),
//                         Column(
//                           children: [
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             const Text("Don't have an account?"),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             OutlinedButton(
//                               style: OutlinedButton.styleFrom(
//                                 side: const BorderSide(
//                                   color: Colors.red,
//                                 ),
//                               ),
//                               onPressed: () {
//                                 context.read<AuthBloc>().add(
//                                       RegisterEvent(),
//                                     );
//                                 Navigator.of(context).push(
//                                   MaterialPageRoute(
//                                     builder: (context) => const RegisterPage(),
//                                   ),
//                                 );
//                               },
//                               child: Text(
//                                 'Sign Up',
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .button!
//                                     .copyWith(
//                                       color: Colors.orange,
//                                     ),
//                               ),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             }
//             return Container();
//           },
//         ),
//       ),
//     );
//   }

//   void _authenticateWithEmailAndPassword(BuildContext context) {
//     if (_formKey.currentState!.validate()) {
//       BlocProvider.of<AuthBloc>(context).add(
//         LogInRequested(_emailController.text, _passwordController.text),
//       );
//     }
//   }
// }

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:giflex_app/app-core/service/character_service.dart';
import 'package:giflex_app/app-core/service/login_service.dart';
import 'package:giflex_app/router.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();

  final _focusNodeUsername = FocusNode();
  final _focusNodePassword = FocusNode();

  // String username = '';
  // String password = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            brightness: Brightness.dark,
            primarySwatch: Palette.myColor,
          ).copyWith(
            primary: Palette.myColor[50],
            secondary: Palette.myColor[100],
          ),
          textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.white)),
        ),
        home: Scaffold(
            backgroundColor: Palette.myColor[400],
            appBar: AppBar(
              title: const Text('Login'),
              backgroundColor: Palette.myColor[300],
            ),
            body: SingleChildScrollView(
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: _username,
                          focusNode: _focusNodeUsername,
                          onTap: () => _focusNodeUsername.requestFocus(),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Insert a valid email';
                            }
                            log("username: $_username");
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _password,
                          focusNode: _focusNodePassword,
                          onTap: () => _focusNodePassword.requestFocus(),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Insert a valid password';
                            }
                            log('password:$_password');
                            return null;
                          },
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 56.0),
                          width: 200,
                          height: 160,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 5,
                            ),
                            onPressed: () {
                              log('Pressed');
                              bool ok = false;
                              UserAccountService()
                                  .login(username: "natty", password: "123")
                                  // username: "_username.text",
                                  // password: _password.text)
                                  .then((response) {
                                if (response) {
                                  ok = true;
                                  Modular.to.navigate('/home');
                                }
                                log(ok.toString());
                                if (ok == true) {}
                              });
                            },
                            child: const Text('Login'),
                          ),
                        )
                      ],
                    ),
                  ),
                  // Column(
                  //   children: <Widget>[
                  //     Container(
                  //         padding: const EdgeInsets.symmetric(vertical: 50.0),
                  //         width: double.infinity,
                  //         child: ElevatedButton(
                  //             style: ElevatedButton.styleFrom(
                  //               elevation: 5,
                  //             ),
                  //             onPressed: () {
                  //               //onClickLogin(context);
                  //               debugPrint('Pressed Login Simple');
                  //               Modular.to.navigate('/home');
                  //             },
                  //             child: const Text('Login Simple')))
                  //   ],
                  // )
                ],
              ),
            )));
  }
}
