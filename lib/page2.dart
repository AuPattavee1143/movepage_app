import 'package:flutter/material.dart';
import 'package:movepage_app/page3.dart';

// ignore: must_be_immutable
class Page2 extends StatelessWidget {
  int id;

  Page2({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navigation'),
    centerTitle: true,
    backgroundColor: Colors.blueGrey,
    foregroundColor: Colors.deepPurple,
    ),
    body: Center(
      child: Column(
        children: [
          const SizedBox(height: 30,),
          Text('P A G E \nPage id: $id'),
          const SizedBox(height: 30,),
          btnPage3(context),
          btnBack(context),
        ],
      ),
    ),
    );
  }

  Widget btnPage3(BuildContext ctx) => TextButton(
    onPressed: () => Navigator.push(ctx,
      MaterialPageRoute(
        builder: (ctx)=> Page3(
        num: 1000000,
        text: 'One Million',
        boolean: true,))).
        then((values) => myAlert(ctx,'ข้อมูลที่ส่งกลับคือ: $values',)),
    child: const Text('Go to Page3'));

  Widget btnBack(BuildContext ctx) => TextButton(
    onPressed: () => Navigator.pop(ctx, [456, 'four-five-six']), 
    child: const Text('Back'));

  void myAlert(BuildContext ctx ,String msg){
    showDialog(
      context: ctx, 
      builder: (ctx) => AlertDialog(
        actions: [
          TextButton(
            onPressed: ()=>Navigator.of(ctx).pop(), 
            child: const Text('OK'))
        ],
        content: Text(msg),
      ));
  }
}