import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const TwitterPage());
  }
}

class TwitterPage extends StatelessWidget {
  const TwitterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text("Twitter",style: TextStyle(color: Colors.white),),
        //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor:Colors.lightBlue,
      ),
      body:  Column(
        children: [
          const TopNavigationTwitter(),
          const FormWidget(),
          FutureBuilder<String>(
              future: Future.delayed(const Duration(seconds: 1),()=> ""),
              builder: (context, snapshot) {
                switch(snapshot.connectionState){
                  case ConnectionState.done:
                    return Expanded(
                        child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context,index)=>const TweetWithButtons())
                    );
                  default : return const CircularProgressIndicator();
                }

              }
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigationTwitter(),
    );
  }
}

class TweetWithButtons extends StatelessWidget {
  const TweetWithButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          Tweet(DateTime(2023,12,3,12,50,12)),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: ButtonTweetBar(),
          )
        ],
      ),
    );
  }
}

class Tweet extends StatelessWidget {
  final DateTime dateTime;
  Tweet(this.dateTime,{
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        children:[
          Image.network("https://picsum.photos/150",width: 125,height: 125,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("LaCrevette@Chocolate",
                          style: Theme.of(context).textTheme.titleSmall),
                      Text("${dateTime.minute}m",
                        style: const TextStyle(color: Colors.grey),),
                    ],
                  ),
                  const SizedBox(height: 8,),
                  const Text("latine euismod nulla mauris corrumpit scripserit unum causae justo pellentesque scripta justo ius elitr orci")
                ],
              ),
            ),
          )
        ]
    );
  }
}

class ButtonTweetBar extends StatefulWidget {
  const ButtonTweetBar({
    super.key,
  });

  @override
  State<ButtonTweetBar> createState() => _ButtonTweetBarState();
}

class _ButtonTweetBarState extends State<ButtonTweetBar> {
  var isLiked = false;
  var isRetweet = false;
  var isResponse = false;
  void _likeTweet() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  void _isRetweet() {
    setState(() {
      isRetweet = !isRetweet;
    });
  }

  void _isResponse() {
    setState(() {
      isResponse = !isResponse;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: isResponse
              ? const Icon(Icons.done_all, color: Colors.blue)
              : const Icon(Icons.question_answer, color: Colors.black),
          onPressed: () {
            setState(() {
              isResponse = true;
            });

            Future.delayed(const Duration(seconds: 1), () {
              setState(() {
                isResponse = false;
              });
            });
          },
        ),
        IconButton(
          icon: isRetweet ? const Icon(Icons.loop, color: Colors.green) : const Icon(Icons.loop_outlined, color: Colors.black),
          onPressed: (){
            setState(() {
              _isRetweet ();
            });
          },
        ),
        IconButton(
          icon: isLiked ? const Icon(Icons.favorite, color: Colors.red) : const Icon(Icons.heart_broken_outlined, color: Colors.black),
          onPressed: (){
            setState(() {
              _likeTweet ();
            });
          },
        ),
      ],
    );
  }
}

class TopNavigationTwitter extends StatelessWidget {
  const TopNavigationTwitter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(0xFF,0x58,0xB0,0xF0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed:  (){}, icon: const Icon(Icons.edit), color: Colors.white),
            TextButton(onPressed: (){}, child: const Text("Accueil",
              style: TextStyle(color: Colors.white),)),
            IconButton(onPressed:  (){}, icon: const Icon(Icons.search), color: Colors.white),
          ],),
      ),
    );
  }
}

class BottomNavigationTwitter extends StatelessWidget {
  const BottomNavigationTwitter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(onPressed: (){}, child: const Text("Fil",
          style: TextStyle(color: Colors.blue),)),
        TextButton(onPressed: (){}, child: const Text("Notification",
          style: TextStyle(color: Colors.grey),)),
        TextButton(onPressed: (){}, child: const Text("Messages",
          style: TextStyle(color: Colors.grey),)),
        TextButton(onPressed: (){}, child: const Text("Moi",
          style: TextStyle(color: Colors.grey),)),
      ],
    );
  }
}

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});
  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final textControllerIdentifiant = TextEditingController();
  final textControllerMdp = TextEditingController();
  bool remeberMe = false;
  final _fromKey = GlobalKey<FormState>();
  @override
Widget build(BuildContext context) {
      return SafeArea(
          child: Column(
            children: [
              const Text("Connexion a Twitter"),
              Form(
                  key: _fromKey,
                  child: Column(
                      children: [
                        TextFormField(
                            controller: textControllerIdentifiant,
                            keyboardType: TextInputType.name,
                            decoration:  const InputDecoration(
                                labelText: 'Identifiant',
                                hintText: "Entrez votre Identifiant"),
                            /*autovalidateMode: AutovalidateMode.onUserInteraction,*/
                            validator: (valueIdentifiant){
                              if (valueIdentifiant == null || valueIdentifiant.isEmpty == true){
                                return "Merci de compléter votre Identifiant !";
                              }
                              if (!RegExp(r"([a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})").hasMatch(valueIdentifiant)){
                                return "Veuillez entrer un Identifiant valide !";
                              }
                              return null;
                            }
                        ),
                        TextFormField(
                            controller: textControllerMdp,
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            decoration:  const InputDecoration(
                                labelText: 'Mots de passe',
                                hintText: "Entrez votre Mots de passe"),
                            /*autovalidateMode: AutovalidateMode.onUserInteraction,*/
                            validator: (valueMdp){
                              if (valueMdp == null || valueMdp.isEmpty == true){
                                return "Merci de compléter votre Mots de passe !";
                              }
                              if (!RegExp(r"^((?=\S*?[A-Z])(?=\S*?[a-z])(?=\S*?[0-9]).{6,})\S").hasMatch(valueMdp)){
                                return "Veuillez entrer un Mots de passe valide !";
                              }
                              return null;
                            }
                        ),
                        Row(
                          children: [
                            Switch(
                                value: remeberMe,
                                onChanged: (isEnabled) {
                              setState(() {
                                remeberMe = isEnabled;
                              });
                            }),
                            const Text("Memoriser mes informations"),
                          ],
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (_fromKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Connecté !")
                                    )
                                );
                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Identifiant ou Mots de passe incorrect !")
                                    )
                                );
                              }
                            },
                            child: const Text("Connexion")
                        )
                      ]
                  )
              ),
            ],
          )
      );
  }
}