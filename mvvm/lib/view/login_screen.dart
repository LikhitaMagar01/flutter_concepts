import 'package:flutter/material.dart';
import 'package:mvvm/res/round_button.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier(false);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // todo: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AuthViewMode = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            focusNode: emailFocusNode,
            decoration: const InputDecoration(
              hintText: 'Email',
              prefixIcon: Icon(Icons.alternate_email),
              label: Text('Email'),
            ),
            onFieldSubmitted: (value) {
              Utils.fieldFocusChange(
                  context, emailFocusNode, passwordFocusNode);
            },
          ),
          ValueListenableBuilder(
            valueListenable: _obsecurePassword,
            builder: (context, value, child) {
              return TextFormField(
                controller: _passwordController,
                obscureText: _obsecurePassword.value,
                obscuringCharacter: '*',
                focusNode: passwordFocusNode,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock_outline),
                  label: const Text('Password'),
                  suffixIcon: InkWell(
                    onTap: () {
                      _obsecurePassword.value = !_obsecurePassword.value;
                    },
                    child: Icon(_obsecurePassword.value
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: height * .05,
          ),
          RoundButton(
            title: 'Login',
            loading: AuthViewMode.loading,
            onPress: () {
              if (_emailController.text.isEmpty) {
                Utils.snackBar('Please enter your email', context);
              } else if (_passwordController.text.isEmpty) {
                Utils.snackBar('Please enter your password', context);
              } else if (_passwordController.text.length < 6) {
                Utils.snackBar(
                    'Please enter your password more than six digits', context);
              } else {
                Map data = {
                  'email': _emailController.text.toString(),
                  'password': _passwordController.text.toString()
                };
                AuthViewMode.loginApi(data, context);
              }
            },
          )
        ],
      )),
    );
  }
}
