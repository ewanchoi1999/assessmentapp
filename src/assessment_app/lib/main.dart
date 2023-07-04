import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:assessment_app/screens/home.dart';

void main() {
  runApp(const AssessmentApp());
}

class AssessmentApp extends StatelessWidget {
  const AssessmentApp({super.key});

  static const String appTitle = 'Assessment';
  static const String appBarTitle = '沙田公立學校 言語治療組 粵語語法測試';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text(appBarTitle)),
        body: const Login(),
      ),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool enable = false;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        onChanged: () => setState(() => _formKey.currentState!.validate()),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      alignment: FractionalOffset.center,
                      image: AssetImage('assets/images/school_logo.jpg'),
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      '歡迎',
                      style: TextStyle(fontSize: 22),
                    )),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: nameController,
                onChanged: (data) {
                  if (nameController.text.isEmpty) {
                    enable = false;
                  } else {
                    enable = true;
                  }
                  setState(() {});
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "*Required";
                  }
                  return null;
                },
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                  LengthLimitingTextInputFormatter(8)
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(70.0),
                  ),
                  labelText: '學生姓名',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
              child: TextFormField(
                onChanged: (data) {
                  if (passwordController.text.isEmpty) {
                    enable = false;
                  } else {
                    enable = true;
                  }
                  setState(() {});
                },
                obscureText: true,
                validator: (value) {
                  // ignore: unnecessary_null_comparison
                  if (value!.isEmpty || value == null) {
                    return "*Required";
                  }
                  return null;
                },
                controller: passwordController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(4),
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(70.0),
                  ),
                  labelText: '學生編號',
                ),
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ))),
                  onPressed: enable
                      ? () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                duration: Duration(seconds: 2),
                                content: Text('登入成功!')),
                          );
                        }
                      : null,
                  child: const Text('登入'),
                )),
          ],
        ));
  }
}
