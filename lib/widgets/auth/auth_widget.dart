// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/app_button_style.dart';
import 'package:themoviedb/widgets/main_screen/main_screen_widget.dart';

class AuthWdget extends StatefulWidget {
  const AuthWdget({Key? key}) : super(key: key);

  @override
  _AuthWdgetState createState() => _AuthWdgetState();
}

class _AuthWdgetState extends State<AuthWdget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Залогінитися')),
      ),
      body: ListView(
        children: [_FormWidgetState(), _HeaderWidget()],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 16,
      color: Colors.black,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25),
          Text(
              'In order to use the editing and rating capabilities of TMDB, as well as get personal recommendations you will need to login to your account. If you do not have an account, registering for an account is free and simple.',
              style: textStyle),
          SizedBox(height: 5),
          TextButton(
            onPressed: () {},
            style: AppButtonStyle.linkButton,
            child: Text('Register'),
          ),
          SizedBox(height: 25),
          Text(
              'Якщо ви зареєструвалися, але не отримали електронний лист із підтвердженням.',
              style: textStyle),
          SizedBox(height: 5),
          TextButton(
            onPressed: () {},
            style: AppButtonStyle.linkButton,
            child: Text('Verify email'),
          )
        ],
      ),
    );
  }
}

class _FormWidgetState extends StatefulWidget {
  const _FormWidgetState({Key? key}) : super(key: key);

  @override
  __FormWidgetStateState createState() => __FormWidgetStateState();
}

class __FormWidgetStateState extends State<_FormWidgetState> {
  final _loginTextController = TextEditingController(text: 'admin');
  final _passwordTextController = TextEditingController(text: 'admin');
  String? errorText = null;

  void _auth() {
    var login = _loginTextController.text;
    var password = _passwordTextController.text;

    if (login == 'admin' && password == 'admin') {
      errorText = null;
      Navigator.of(context).pushReplacementNamed('/main_screen');
    } else {
      errorText = 'Не правильний логін, або пароль';
    }
    setState(() {});
  }

  void _resetPassword() {
    print('reset password');
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 16,
      color: Color(0xFF212529),
    );
    const textFieldDecorator = InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        isCollapsed: true);
    const color = Color(0xFF01B4E4);
    String? errorText = this.errorText;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (errorText != null) ...[
            SizedBox(height: 20),
            Text(
              errorText,
              style: TextStyle(fontSize: 17, color: Colors.red),
            ),
          ],
          SizedBox(height: 25),
          Text(
            'Username',
            style: textStyle,
          ),
          SizedBox(height: 5),
          TextField(
            controller: _loginTextController,
            decoration: textFieldDecorator,
          ),
          SizedBox(height: 25),
          Text(
            'Password',
            style: textStyle,
          ),
          SizedBox(height: 5),
          TextField(
            controller: _passwordTextController,
            decoration: textFieldDecorator,
            obscureText: true,
          ),
          SizedBox(height: 25),
          Row(children: [
            ElevatedButton(
                onPressed: _auth,
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(color),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    textStyle: MaterialStateProperty.all(
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 15, vertical: 8))),
                child: Text('Login')),
            SizedBox(width: 30),
            TextButton(
                onPressed: _resetPassword,
                style: AppButtonStyle.linkButton,
                child: Text('Reset password'))
          ])
        ],
      ),
    );
  }
}
