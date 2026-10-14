import 'package:flutter/material.dart';

void main() {
  runApp(const GitHubLabApp());
}

class GitHubLabApp extends StatefulWidget {
  const GitHubLabApp({super.key});

  @override
  State<GitHubLabApp> createState() => _GitHubLabAppState();
}

class _GitHubLabAppState extends State<GitHubLabApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    const blue = Color(0xFF4263EB);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GitHub Lab',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F7FC),
        colorScheme: ColorScheme.fromSeed(seedColor: blue),
        fontFamily: 'Roboto',
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF101827),
        colorScheme: ColorScheme.fromSeed(
          seedColor: blue,
          brightness: Brightness.dark,
          surface: const Color(0xFF192437),
        ),
        fontFamily: 'Roboto',
      ),
      themeMode: _themeMode,
      home: MyPage(
        isDarkMode: _themeMode == ThemeMode.dark,
        onThemeToggle: _toggleTheme,
      ),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key, required this.isDarkMode, required this.onThemeToggle});

  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  bool hasPressed = false;

  @override
  Widget build(BuildContext context) {
    final ink = widget.isDarkMode
        ? const Color(0xFFF1F5FF)
        : const Color(0xFF192B4D);
    final muted = widget.isDarkMode
        ? const Color(0xFFACB8CC)
        : const Color(0xFF7B879D);
    const blue = Color(0xFF4263EB);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 46,
                        height: 46,
                        decoration: BoxDecoration(
                          color: ink,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(Icons.code_rounded,
                            color: Colors.white, size: 25),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('GITHUB LAB',
                              style: TextStyle(
                                  color: ink,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 1.2)),
                          SizedBox(height: 2),
                          Text('พื้นที่ทดลองไอเดียของคุณ',
                              style: TextStyle(color: muted, fontSize: 12)),
                        ],
                      ),
                      const Spacer(),
                      IconButton.filledTonal(
                        tooltip: widget.isDarkMode
                            ? 'เปลี่ยนเป็นธีมสว่าง'
                            : 'เปลี่ยนเป็นธีมมืด',
                        onPressed: widget.onThemeToggle,
                        icon: Icon(widget.isDarkMode
                            ? Icons.light_mode_rounded
                            : Icons.dark_mode_rounded),
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),
                  Text('พร้อมเริ่มต้น\nหรือยัง?',
                      style: TextStyle(
                          color: ink,
                          fontSize: 38,
                          height: 1.12,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -1.2)),
                  const SizedBox(height: 12),
                  Text(
                    'ลองกดปุ่มด้านล่าง แล้วดูว่าเกิดอะไรขึ้น',
                    style: TextStyle(color: muted, fontSize: 15, height: 1.5),
                  ),
                  const SizedBox(height: 28),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: widget.isDarkMode
                          ? const Color(0xFF192437)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(
                        color: widget.isDarkMode
                            ? const Color(0xFF2B3A52)
                            : const Color(0xFFE9EDF5),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x10192B4D),
                          blurRadius: 32,
                          offset: Offset(0, 14),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 58,
                          height: 58,
                          decoration: BoxDecoration(
                            color: hasPressed
                                ? const Color(0xFFE8F7EF)
                                : const Color(0xFFEEF1FF),
                            borderRadius: BorderRadius.circular(19),
                          ),
                          child: Icon(
                            hasPressed
                                ? Icons.check_rounded
                                : Icons.touch_app_rounded,
                            color: hasPressed
                                ? const Color(0xFF218653)
                                : blue,
                            size: 30,
                          ),
                        ),
                        const SizedBox(height: 22),
                        Text(
                          hasPressed ? 'เยี่ยมมาก! 🎉' : 'ลองทดสอบกัน',
                          style: TextStyle(
                              color: ink,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          hasPressed
                              ? 'คุณกดปุ่มแล้ว ทุกอย่างทำงานเรียบร้อย'
                              : 'การทดลองเล็ก ๆ ที่เริ่มต้นได้ด้วยการแตะเพียงครั้งเดียว',
                          style: TextStyle(
                              color: muted, fontSize: 14, height: 1.55),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          height: 54,
                          child: FilledButton.icon(
                            onPressed: () =>
                                setState(() => hasPressed = !hasPressed),
                            icon: Icon(hasPressed
                                ? Icons.replay_rounded
                                : Icons.bolt_rounded),
                            label: Text(hasPressed ? 'ลองอีกครั้ง' : 'เริ่มทดลอง'),
                            style: FilledButton.styleFrom(
                              backgroundColor: blue,
                              foregroundColor: Colors.white,
                              textStyle: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  Center(
                    child: Text('สร้างด้วยความตั้งใจ · GitHub Lab',
                        style: TextStyle(
                            color: muted.withValues(alpha: .8), fontSize: 12)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
