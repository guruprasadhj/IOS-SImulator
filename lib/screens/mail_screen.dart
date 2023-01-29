import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MailScreen extends StatefulWidget {
  const MailScreen({Key? key}) : super(key: key);

  @override
  State<MailScreen> createState() => _MailScreenState();
}

class _MailScreenState extends State<MailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mail"),
      ),
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Image.asset("assets/images/love.png",width: 200,height: 200,),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text("Mail me at GuruPrasadh.here@gmail.com",style: Theme.of(context).textTheme.titleLarge,),
           )
         ],
       ),
     ),
    );
  }
}
