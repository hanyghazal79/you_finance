import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:you_finance/static_members/instances.dart';
import 'package:you_finance/viewmodels/welcomeuser_viewmodel.dart';
import 'package:you_finance/views/dashboard.dart';
import 'package:you_finance/views/home.dart';

class WelcomeUser extends StatefulWidget {
  const WelcomeUser({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<WelcomeUser> createState() => _WelcomeUserState();
}

class _WelcomeUserState extends State<WelcomeUser> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  late String _buttonText, _convertButtonText, _leadText;
  late WelcomeUserViewModel _viewModel;
  late List<Map<String, Object?>>? _list;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _buttonText = (widget.title == "Sign Up") ? "Sign Up" : "Login";
    _convertButtonText = (widget.title == "Sign Up") ? "Login" : "Sign Up";
    _leadText = (widget.title == "Login")
        ? "If you do not have an account, please "
        : "Already a member? ";
    _viewModel = Provider.of<WelcomeUserViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        width: MediaQuery.of(context).size.width / 4,
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                widget.title,
                style: const TextStyle(
                    fontFamily: "ARIAL BLACK",
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: "Email",
                    hintStyle: const TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.grey)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: "Password",
                    hintStyle: const TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.grey)),
              ),
            ),
            Visibility(
              visible: (widget.title == "Sign Up") ? true : false,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Password",
                      hintStyle: const TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.grey)),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 15,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: ElevatedButton(
                onPressed: () {
                  (widget.title == "Sign Up") ? signUp() : login();
                },
                child: Text(_buttonText),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                      child: Text(
                    _leadText,
                    textAlign: TextAlign.right,
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        (widget.title == "Sign Up")
                            ? goToLogIn()
                            : goToSignUp();
                      },
                      child: Text(_convertButtonText))
                ],
              ),
            ),
            // RichText(text: _list.f)
          ],
        ),
      ),
    );
  }

  signUp() async {
    await _viewModel.signUp(
        email: _emailController.value.text,
        password: _passwordController.value.text,
        passwordConfirm: _confirmPasswordController.value.text);
    (_viewModel.message == "You have signed up successfully")
        ? goToLogIn()
        : ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(_viewModel.message)));
  }

  login() async {
    await _viewModel.signIn(
        email: _emailController.value.text,
        password: _passwordController.value.text);
    (_viewModel.message == "You have signed in successfully")
        ? goToDashboard()
        : ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(_viewModel.message)));
  }

  goToSignUp() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                Home(body: const WelcomeUser(title: "Sign Up"))));
  }

  goToLogIn() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                Home(body: const WelcomeUser(title: "Login"))));
  }

  goToDashboard() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => Home(body: const Dashboard())));
  }
}
