import 'package:flipgame/testgame.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

main()
{
  runApp(GetMaterialApp(
    theme: ThemeData(),
    color: Color(0xFF2D9648),
    initialRoute: "/",
    getPages: [
      GetPage(name: "/", page:()=> homepage()),
      GetPage(name: "/sec", page:()=> testgame())
    ],
    home: homepage(),)
  );
}
class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2D9648),
        title: Text("Selecte mode"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.volume_mute)),
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_outlined)),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("img/back.jpg"),fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          UnconstrainedBox(
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height*0.35,
              width: MediaQuery.of(context).size.width*0.5,

              decoration: BoxDecoration(  color: Color(0xFFB0E882),borderRadius: BorderRadius.circular(10),border: Border.all(color: Color(0xFF2D9648),width: 5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                ElevatedButton(onPressed: (){
                 Get.toNamed("sec");
                }, child: Text("NO Time Limit"),style:ElevatedButton.styleFrom(primary: Color(0xFF2D9648),minimumSize: Size(MediaQuery.of(context).size.width*0.4, MediaQuery.of(context).size.height*0.08)),),
                ElevatedButton(onPressed: (){}, child: Text("Normal"),style:ElevatedButton.styleFrom(primary: Color(0xFF2D9648),minimumSize: Size(MediaQuery.of(context).size.width*0.4, MediaQuery.of(context).size.height*0.08)),),
                ElevatedButton(onPressed: (){}, child: Text("Hard"),style:ElevatedButton.styleFrom(primary: Color(0xFF2D9648),minimumSize: Size(MediaQuery.of(context).size.width*0.4, MediaQuery.of(context).size.height*0.08))),
              ],),
            ),
          )
        ],),
      ),
    );
  }
}
