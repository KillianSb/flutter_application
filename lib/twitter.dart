import 'package:flutter/material.dart';

void main() => runApp(TwitterCloneApp());

class TwitterCloneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TwitterHomePage(),
    );
  }
}

class Tweet {
  final String avatarUrl;
  final String content;
  final String username;
  final String time;

  Tweet({
    required this.avatarUrl,
    required this.content,
    required this.username,
    required this.time,
  });
}

class TwitterHomePage extends StatefulWidget {
  @override
  _TwitterHomePageState createState() => _TwitterHomePageState();
}

class _TwitterHomePageState extends State<TwitterHomePage> {
  final List<Tweet> tweets = [
    // Vos tweets existants ici
  ];

  TextEditingController tweetController = TextEditingController();

  void _createTweet() {
    if (tweetController.text.isNotEmpty) {
      tweets.add(Tweet(
          avatarUrl: 'https://fastly.picsum.photos/id/320/200/200.jpg?hmac=Syj43GcEEip7sKg4XO0j94Ot5UbBIA84E_x2PzRo1ow', // URL de l'image de profil de l'utilisateur
          username: 'UtilisateurActuel', // Nom de l'utilisateur actuel
          content: tweetController.text,
          time: 'À l\'instant',
      ));
      tweetController.clear();
      setState(() {}); // Rafraîchir l'affichage des tweets
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Twitter Clone'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: tweetController,
              decoration: const InputDecoration(
                hintText: "Quoi de neuf ?",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _createTweet,
            child: const Text('Tweeter'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tweets.length,
              itemBuilder: (BuildContext context, int index) {
                final tweet = tweets[index];
                return Card(
                  margin: const EdgeInsets.all(10.0),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(tweet.avatarUrl),
                            ),
                            const SizedBox(width: 8.0),
                            Text(tweet.username),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          tweet.time,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          tweet.content,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    tweetController.dispose();
    super.dispose();
  }
}
