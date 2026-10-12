import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'اپ ساده',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

// صفحه ورود (لاگین)
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // کنترلرها برای خواندن متن داخل فیلدها
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    // یک بررسی ساده: اگر فیلدها خالی نباشند
    if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      // رفتن به صفحه بعدی
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const WelcomePage()),
      );
    } else {
      // اگر خالی بود، پیام خطا نشان بده
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('لطفا ایمیل و رمز عبور را وارد کنید')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ورود به برنامه')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'خوش آمدید',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            // فیلد ایمیل
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'ایمیل',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            // فیلد رمز عبور
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'رمز عبور',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true, // مخفی کردن رمز
            ),
            const SizedBox(height: 30),
            // دکمه ورود
            ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50), // تمام عرض
              ),
              child: const Text('ورود', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}

// صفحه خوش‌آمدگویی
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('صفحه اصلی')),
      body: const Center(
        child: Text(
          'سلام خوش آمدید به اپلیکیشن ما',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }
}