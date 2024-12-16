import 'package:flutter/material.dart';
import 'package:movepage_app/page2.dart';
import 'package:movepage_app/page3.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Navigation'),
    centerTitle: true,
    backgroundColor: Colors.blueGrey,
    foregroundColor: Colors.deepPurple,
    ),
    body:  Center(
      child: Column(
        children: [
          const SizedBox(height: 30,),
          const Text('Homepage'),
          const SizedBox(height: 30,),
          btnPage2(context),
          btnPage3(context),
        ],
      ),
    ),
  );

  Widget btnPage2(BuildContext ctx) => TextButton(
    onPressed: () => Navigator.push(
      ctx,
      MaterialPageRoute(builder: (ctx) => Page2(id: 662,))).then((values){
        var val = values ??[0,'zero'];
        var v1 = val[0];
        var v2 = val[1];
        myAlert(ctx, 'ข้อมูลที่ส่งกลับ\n$v1, $v2');
      },),
    child: const Text('Go to page2'));

  Widget btnPage3(BuildContext ctx) => TextButton(
    onPressed: () => Navigator.push(
      ctx,
      MaterialPageRoute(builder: (ctx) => Page3(
        num: 1000000,text: 'One Million',boolean: true,
        )
      )), 
    child: const Text('Go to page3'));

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