import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Tasbih(title: 'المسبحة الإلكترونية'),
    );
  }
}

class Tasbih extends StatefulWidget {
  const Tasbih({super.key, required this.title});

  final String title;

  @override
  State<Tasbih> createState() => _TasbihState();
}

class _TasbihState extends State<Tasbih> {
  String currentName = "ابدأ الذكر بالضغط على زر";
  int counter1 = 0;
  int counter2 = 0;
  int counter3 = 0;

  int currentCount = 0;

  void updateCounter(String name) {
    setState(() {
      currentName = name;

      if (name == "سبحان الله") {
        counter1 += 1;
        currentCount = counter1;
      } else if (name == "الحمد لله") {
        counter2 += 1;
        currentCount = counter2;
      } else if (name == "الله أكبر") {
        counter3 += 1;
        currentCount = counter3;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              currentName,
              style: const TextStyle(
                fontSize: 50,
                color: Colors.pinkAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
             Text(
              '$currentCount',
              style: const TextStyle(
                fontSize: 50,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => updateCounter("سبحان الله"),
                      child: const Text(
                        "سبحان الله",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => updateCounter("الحمد لله"),
                      child: const Text(
                        "الحمد لله",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => updateCounter("الله أكبر"),
                      child: const Text(
                        "الله أكبر",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
