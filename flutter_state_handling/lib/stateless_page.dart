import 'package:flutter/material.dart';

class StatelessPage extends StatelessWidget {
  const StatelessPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> soccerTeam = [
      {'name': 'Emyu', 'description': 'badut manchester'},
      {'name': 'Barca', 'description': 'badut la liga'},
      {'name': 'Madrid', 'description': 'tim dari kota madrid'},
      {'name': 'Arsenal', 'description': 'tim paling jago'},
    ];

    return Scaffold(
        appBar: AppBar(
          title: const Text('Daftar Tim Bola', style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.deepPurple,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: soccerTeam.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text(soccerTeam[index]['name']!),
                        subtitle: Text(soccerTeam[index]['description']!),
                        leading: const Icon(Icons.sports_soccer),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
    );
  }
}
