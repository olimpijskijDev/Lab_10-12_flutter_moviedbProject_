import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kinoapp/widget/main_screen/main_screen_widget.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('Login to your account')),
        body: ListView(
          children: [_HeaderWidget()],
        ),
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({super.key});

  final textStyle = const TextStyle(fontSize: 16, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 25),
          Text(
            'Чтобы пользоваться правкой и возможностями рейтинга TMDB, а также получить персональные рекомендации, необходимо войти в свою учётную запись. Если у вас нет учётной записи, её регистрация является бесплатной и простой. Нажмите здесь, чтобы начать.',
            style: textStyle,
          ),
          SizedBox(height: 25),
          Text(
              'Если Вы зарегистрировались, но не получили письмо для подтверждения, нажмите здесь, чтобы отправить письмо повторно.',
              style: textStyle),
          SizedBox(height: 25),
          _FormWidget(),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({super.key});

  @override
  State<_FormWidget> createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _authString = TextEditingController(text: 'admin');
  final _passwordString = TextEditingController(text: 'admin');
  String? errorText = null;

  void _Auth() {
    final _login = _authString.text;
    final _password = _passwordString.text;
    if (_login == 'admin' && _password == 'admin') {
      errorText = null;
      Navigator.of(context).pushReplacementNamed('/second_screen');
    } else {
      errorText = 'Неверный логин или пароль!';
    }

    setState(() {});
  }

  void _ResetPassword() {}

  @override
  Widget build(BuildContext context) {
    final textStyleForm = const TextStyle(fontSize: 16, color: Colors.black);
    // final colorBorder = const Color(0xFF01B4E4);
    final decoration = InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF01B4E4))),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        isCollapsed: true);
    final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Username', style: textStyleForm),
        SizedBox(height: 5),
        TextField(
            controller: _authString,
            decoration: decoration,
            cursorColor: Colors.black,
            cursorWidth: 1),
        SizedBox(height: 20),
        Text('Password', style: textStyleForm),
        SizedBox(height: 5),
        TextField(
            controller: _passwordString,
            obscureText: true,
            decoration: decoration,
            cursorColor: Colors.black,
            cursorWidth: 1),
        SizedBox(height: 20),
        if (errorText != null) ...[
          Text(
            errorText,
            style: TextStyle(fontSize: 17, color: Colors.red),
          ),
          SizedBox(height: 10)
        ],
        Row(
          children: [
            ElevatedButton(
                onPressed: _Auth,
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color(0xFF01B4E4),
                    ),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 8, horizontal: 15)),
                    textStyle: MaterialStateProperty.all(
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w700))),
                child: Text('Login')),
            SizedBox(width: 30),
            TextButton(
              onPressed: _ResetPassword,
              child: Text('Reset password'),
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w400))),
            )
          ],
        )
      ],
    );
  }
}
