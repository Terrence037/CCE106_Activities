
import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'home_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService auth = AuthService();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();

  bool loading = false;

  @override
  void dispose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  void _snack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  void _forgotPassword() {
    final resetCtrl = TextEditingController(text: emailCtrl.text);

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text("Reset password"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Enter your email and we'll send you a reset link.",
            ),
            const SizedBox(height: 12),
            TextField(
              controller: resetCtrl,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.pop(dialogContext);
              resetCtrl.dispose();
            },
          ),
          ElevatedButton(
            child: const Text("Send link"),
            onPressed: () async {
              if (resetCtrl.text.trim().isEmpty) {
                _snack("Please enter your email.");
                return;
              }

              final error = await auth.sendPasswordReset(
                resetCtrl.text,
              );

              if (!mounted || !dialogContext.mounted) return;

              Navigator.pop(dialogContext);
              resetCtrl.dispose();

              _snack(
                error ?? "Password reset email sent. Check your inbox.",
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Congson"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: emailCtrl,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: passwordCtrl,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _forgotPassword,
                  child: const Text("Forgot password?"),
                ),
              ),
              ElevatedButton(
                onPressed: loading
                    ? null
                    : () async {
                        if (emailCtrl.text.isEmpty ||
                            passwordCtrl.text.isEmpty) {
                          return;
                        }

                        setState(() => loading = true);

                        final user = await auth.signInWithEmail(
                          emailCtrl.text.trim(),
                          passwordCtrl.text,
                        );

                        if (!mounted) return;

                        setState(() => loading = false);

                        if (user != null) {
                          if (!user.emailVerified) {
                            _snack(
                              "Please verify your email before logging in.",
                            );
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const HomePage(),
                              ),
                            );
                          }
                        } else {
                          _snack("Invalid email or password");
                        }
                      },
                child: loading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text("Login with Email"),
              ),
              const SizedBox(height: 24),
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text("OR"),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                icon: const Icon(Icons.login),
                label: const Text("Sign in with Google"),
                onPressed: loading
                    ? null
                    : () async {
                        setState(() => loading = true);

                        final user = await auth.signInWithGoogle();

                        if (!mounted) return;

                        setState(() => loading = false);

                        if (user != null) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const HomePage(),
                            ),
                          );
                        } else {
                          _snack("Google sign-in failed.");
                        }
                      },
              ),
              const SizedBox(height: 12),
              TextButton(
                child: const Text(
                  "Don't have an account? Register",
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const RegisterPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
