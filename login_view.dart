import 'package:flutter/material.dart';
import 'package:toko_online/services/user.dart';
import 'package:toko_online/models/response_data_map.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool isLoading = false;
  bool showPass = true;
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    _buildTextField(email, "Email"),
                    const SizedBox(height: 16),
                    _buildPasswordField(),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (value) {
                            setState(() {
                              rememberMe = value!;
                            });
                          },
                        ),
                        const Text("Remember me"),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            // Forgot password action
                          },
                          child: const Text(
                            "Forgot password?",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });

                            final data = {
                              "email": email.text,
                              "password": password.text,
                            };

                            ResponseDataMap response = await UserService().loginUser(data);

                            setState(() {
                              isLoading = false;
                            });

                            if (response.status == true) {
                              Navigator.pushReplacementNamed(context, '/dashboard');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(response.message)),
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3B5BFE),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: isLoading
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text("Sign in"),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text("Sign in with"),
                    const SizedBox(height: 12),
                    _buildSocialLoginRow(),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don’t have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      children: [
        Container(
          height: 220,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF3B5BFE), Color(0xFF6F86FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
        ),
        Positioned(
          top: 40,
          left: 16,
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF1A3C7A),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        const Positioned(
          top: 90,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              "Welcome back",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 20,
          child: _buildCircle(50, Colors.white.withOpacity(0.15)),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: _buildCircle(60, Colors.white.withOpacity(0.15)),
        ),
      ],
    );
  }

  Widget _buildCircle(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: (value) => value!.isEmpty ? '$label harus diisi' : null,
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: password,
      obscureText: showPass,
      decoration: InputDecoration(
        labelText: "Password",
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        suffixIcon: IconButton(
          icon: Icon(showPass ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              showPass = !showPass;
            });
          },
        ),
      ),
      validator: (value) => value!.isEmpty ? 'Password harus diisi' : null,
    );
  }

  Widget _buildSocialLoginRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialIcon("assets/facebook.jpg"),
        const SizedBox(width: 12),
        _buildSocialIcon("assets/twitter.jpg"),
        const SizedBox(width: 12),
        _buildSocialIcon("assets/google.jpg"),
        const SizedBox(width: 12),
        _buildSocialIcon("assets/apple.jpg"),
      ],
    );
  }

  Widget _buildSocialIcon(String assetPath) {
    return GestureDetector(
      onTap: () {
        // Handle social login
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 5,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: Image.asset(assetPath, height: 24, width: 24),
      ),
    );
  }
}