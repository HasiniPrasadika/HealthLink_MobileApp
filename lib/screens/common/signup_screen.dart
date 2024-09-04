import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:health_link/const/colors.dart';
import 'package:health_link/screens/common/login_screen.dart';
import 'package:health_link/widgets/password_field.dart';
import 'package:health_link/widgets/text_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  Future<void> _signup() async {
    if (!_formKey.currentState!.validate()) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("You have successfully Signed Up!"),
        backgroundColor: BlueGrotto,
      ),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.06,
                ),
                Image.asset(
                  'assets/images/logo.png',
                  width: size.width * 0.2,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome to ",
                      style: TextStyle(
                          fontSize: size.width * 0.07,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "HealthLink",
                      style: TextStyle(
                          fontSize: size.width * 0.07,
                          color: BlueGrotto,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.all(size.width * 0.05),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Custom_Text_Field(
                          icon: Icons.person,
                          label: 'Full Name',
                          controller: _nameController,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Please enter your name'
                              : null,
                        ),
                        Custom_Text_Field(
                          icon: Icons.phone,
                          label: 'Phone Number',
                          controller: _phoneController,
                          keyboard: true,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Please enter your phone number'
                              : null,
                        ),
                        Custom_Text_Field(
                          icon: Icons.email,
                          label: 'User Email',
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(
                                    r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) return 'Invalid email format';
                            return null;
                          },
                        ),
                        Password_Field(
                          icon: Icons.lock,
                          label: 'Password',
                          controller: _passwordController,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Please enter your password'
                              : null,
                        ),
                        Password_Field(
                          icon: Icons.lock,
                          label: 'Confirm Password',
                          controller: _confirmPasswordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value != _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: ElevatedButton(
                    onPressed: () {
                      _signup();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: NavyBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      fixedSize: Size(size.width, 40),
                    ),
                    child: const Text(
                      "SIGNUP",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                const Text(
                  "OR",
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/images/google.svg',
                        width: size.width * 0.05,
                      ),
                      label: const Text(
                        'Sign-Up With Google',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an Account?",
                      style: TextStyle(fontSize: size.width * 0.035),
                    ),
                    TextButton(
                      onPressed: () {
                        const CircularProgressIndicator();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(color: BlueGrotto),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
