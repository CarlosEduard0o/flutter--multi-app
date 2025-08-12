import 'package:flutter/material.dart';
import 'package:multi_app/components/app_button.dart';
import 'package:multi_app/components/custom_snack_bar.dart';
import 'package:multi_app/components/custom_text_field.dart';
import 'package:multi_app/controllers/auth_controller.dart';
import 'package:multi_app/shared/app_constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      bool login = await AuthController.instance.login(
        _usernameController.text,
        _passwordController.text,
      );
      if (login) {
        //Navegação
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          customSnackBar(
            message: AppConstants.appLoginWrongCredentialsMessage,
            backgroundColor: Color(0xffff6b6b),
            icon: Icons.error_outline,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(AppConstants.appLoginMsg, textAlign: TextAlign.center),
              const SizedBox(height: 32.0),
              CustomTextField(
                label: AppConstants.appLoginUserInput,
                hint: AppConstants.appLoginTypeYourUser,
                controller: _usernameController,
                prefixIcon: Icon(Icons.person),
                validator: (username) {
                  if (username == null || username.isEmpty) {
                    return AppConstants.appLoginFillUserField;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              CustomTextField(
                label: AppConstants.appLoginUserPassword,
                hint: AppConstants.appLoginTypeYourPassword,
                controller: _passwordController,
                prefixIcon: Icon(Icons.lock_outline),
                obscureText: _obscureText,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
                validator: (password) {
                  if (password == null || password.isEmpty) {
                    return AppConstants.appLoginFillPasswordField;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              AppButton(
                text: AppConstants.appLoginUserEntry,
                onPressed: _login),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
