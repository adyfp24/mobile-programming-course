import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_layout_navigation/models/news_model.dart';
import 'dart:convert';      
import 'package:http/http.dart' as http;

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const MyHomePage(title: 'Week 8'),
      },
      initialRoute: '/',
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

   @override
  State<MyHomePage> createState() => _MyHomePageState();
}

  class _MyHomePageState extends State<MyHomePage> {

  Future<List<NewsModel>> newsFuture = getNews();

  static Future<List<NewsModel>> getNews() async {
    var url = Uri.parse("https://api-berita-indonesia.vercel.app/tempo/nasional");
    final response = await http.get(url, headers: {"Content-Type": "application/json"});
    final List body = json.decode(response.body)["data"]["posts"];
    return body.map((e) => NewsModel.fromJson(e)).toList();
  }
  
  // build function
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("week 8"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        // FutureBuilder
        child: FutureBuilder<List<NewsModel>>(
          future: newsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              final news = snapshot.data!;
              return buildNews(news);
            } else {
              return const Text("No data available");
            }
          },
        ),
      ),
    );
  }

  Widget buildNews(List<NewsModel> allNews) {
    // ListView Builder to show data in a list
    return ListView.builder(
      itemCount: allNews.length,
      itemBuilder: (context, index) {
        final news = allNews[index];
        return Container(
          color: Colors.grey.shade300,
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          height: 100,
          width: double.maxFinite,
          child: Row(
            children: [
              Expanded(flex: 1, child: Image.network(news.thumbnail)),
              SizedBox(width: 10),
              Expanded(flex: 3, child: Text(news.title)),
            ],
          ),
        );
      },
    );
  }
}
