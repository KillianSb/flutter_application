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
        title: 'Flutter Demo 2',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const DemoFromWidget()
    );
  }
}

class DemoFromWidget extends StatefulWidget {
  const DemoFromWidget({super.key});
  @override
  State<DemoFromWidget> createState() => _DemoFromWidgetState();
}

class _DemoFromWidgetState extends State<DemoFromWidget> {
  final textControllerEmail = TextEditingController();
  bool remeberMe = false;
  final _fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _fromKey,
            child: Column(
              children: [
                TextFormField(
                  controller: textControllerEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration:  const InputDecoration(
                      labelText: 'Email',
                      hintText: "Entrez votre email"),
                    /*autovalidateMode: AutovalidateMode.onUserInteraction,*/
                    validator: (valueEmail){
                      if (valueEmail == null || valueEmail.isEmpty == true){
                        return "Merci de compléter votre email !";
                      }
                      if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(valueEmail)){
                        return "Veuillez entrer un email valide !";
                      }
                      return null;
                    }
                ),
                Switch(value: remeberMe, onChanged: (isEnabled) {
                  setState(() {
                    remeberMe = isEnabled;
                  });
                }),
                ElevatedButton(
                    onPressed: () {
                      if (_fromKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Email envoyé !")
                          )
                        );
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Email invalide !")
                            )
                        );
                      }
                    },
                    child: const Text("Envoyer")
                )
              ]
            )
          )
      )
    );
  }
}
