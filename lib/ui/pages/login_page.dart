import 'package:flutter/material.dart';
import 'package:inventory_app/providers/auth_providers.dart';
import 'package:inventory_app/ui/pages/home_page.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProviders>(builder: (context, provider, _) {
      return ModalProgressHUD(
        inAsyncCall: provider.isLoading,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: provider.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Flexible(
                    child: SizedBox(
                      height: 200.0,
                      child: Image.network(
                        'https://github.com/tbadhit/MovieCatalogue-iOS/assets/75456232/01a33156-ef88-49be-9afb-d93e8a8e136b',
                        color: Colors.red,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: 'Enter your email..',
                        hintStyle: const TextStyle(color: Colors.grey),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.red, width: 1.0),
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.red, width: 2.0),
                            borderRadius: BorderRadius.circular(32.0))),
                    validator: validator,
                    onChanged: (newValue) {
                      provider.email = newValue;
                    },
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    obscureText: true,
                    style: const TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: 'Enter your password..',
                        hintStyle: const TextStyle(color: Colors.grey),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.red, width: 1.0),
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.red, width: 2.0),
                            borderRadius: BorderRadius.circular(32.0))),
                    validator: validator,
                    onChanged: (newValue) {
                      provider.password = newValue;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Material(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30),
                      elevation: 5.0,
                      child: MaterialButton(
                        onPressed: () async {
                          final isLoginSuccess = await provider.login();
                          if (isLoginSuccess) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Login Failed"),
                              ),
                            );
                          }
                        },
                        minWidth: 200.0,
                        height: 42,
                        child: const Text(
                          'Log In',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            "Register",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  String? validator(String? value) =>
      value!.isEmpty ? "Please enter field" : null;
}
