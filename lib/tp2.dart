import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Ttweet',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Module5Page()
    );
  }
}
class Module5Page extends StatelessWidget {
  const Module5Page({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: const Text(
              'Ttweet',
              style: TextStyle(color: Colors.white
              )
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const HeaderWidget(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CardWidget(),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(20),
              child: const FooterWidget(),
            )
          ],
        ),
    );
  }
}

class FooterWidget extends StatelessWidget {
  const FooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
                foregroundColor: Colors.black38
            ),
            child: const Text('Fil')
        ),
        TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
                foregroundColor: Colors.black38
            ),
            child: const Text('Notifications')
        ),
        TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
                foregroundColor: Colors.black38
            ),
            child: const Text('Messages')
        ),
        TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
                foregroundColor: Colors.black38
            ),
            child: const Text('Moi')
        ),
      ],
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Color(0xffE0E0E0),
        borderRadius: BorderRadius.all(
          Radius.circular(10.0)
        ),
      ),
      child:  Column(
        children: [
          Row(
            children: [
              ClipRRect( // Ajustez le contour de l'image
                borderRadius: BorderRadius.circular(10.0), // Ajustez le rayon selon vos besoins
                child: const Image(image: AssetImage('assets/images/1.png')),
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 8,
                              bottom: 10,
                            ),
                            child: Text(
                              "LaCrevette@Chocolat",
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              )
                            ),
                          ),
                          Text(
                            "50s",
                            style: TextStyle(
                              fontStyle: FontStyle.italic
                            ),
                          )
                        ]
                      ),
                      Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.",
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                      ),
                    ],
                  ),
                ),
              )
            ]
          ),
          Container(
            padding: const EdgeInsets.all(1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black
                    ),
                    child: const Text('Répondre')
                ),
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black
                    ),
                    child: const Text('Retweet')
                ),
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black
                    ),
                    child: const Text('Favoris')
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff58B0F0),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white
              ),
              child: const Text('Nouveau')
          ),
          TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white
              ),
              child: const Text('Accueil')
          ),
          TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white
              ),
              child: const Text('Rechercher')
          ),
        ],
      ),
    );
  }
}