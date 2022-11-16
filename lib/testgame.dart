import 'package:flipgame/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class testgame extends StatelessWidget {
  final flip_ctrl=Get.put(flipController());
  static List<String>imgList=[
    "img/f1.jpg",
    "img/f2.jpg",
    "img/f3.jpg",
    "img/f4.jpg",
    "img/f5.jpg",
    "img/f6.jpg",
    "img/f7.jpg",
    "img/f8.jpg",
    "img/f1.jpg",
    "img/f2.jpg",
    "img/f3.jpg",
    "img/f4.jpg",
    "img/f5.jpg",
    "img/f6.jpg",
    "img/f7.jpg",
    "img/f8.jpg",
  ];

  int t=1;
  int p1=0,p2=0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: GridView.builder(
        itemCount: testgame.imgList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4), itemBuilder: (context, index) {
        return InkWell(
            onTap: (){
              print(t);
              if(t==1)
              {

                flip_ctrl.isOpen[index]=true;
                p1=index;
                t=2;
              }
              else if(t==2)
              {

                p2=index;
                flip_ctrl.isOpen[index]=true;
                if(testgame.imgList[p1]!=testgame.imgList[p2])
                {
                  Future.delayed(Duration(milliseconds: 600));
                  flip_ctrl.isOpen[p1]=false;
                  flip_ctrl.isOpen[p2]=false;

                }
                else
                {
                  flip_ctrl.isOpen[p1]=true;
                  flip_ctrl.isOpen[p2]=true;

                  int cnt = 0;
                  flip_ctrl.isOpen.forEach((element) {
                    if (element == false) {
                      cnt++;
                    }
                  });
                  if (cnt == 0) {
                    showDialog(context: context, builder: (context) {
                      return AlertDialog(content: Text("You Are  Win"),);
                    },);
                  }
                }
                t=1;
              }
            },
            child:Obx(() => Visibility(
                visible:flip_ctrl.isOpen[index],
                replacement: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(border: Border.all(width: 4),borderRadius: BorderRadius.circular(10),color: Colors.green),
                ),
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(border: Border.all(width: 4),borderRadius: BorderRadius.circular(10),image: DecorationImage(image: AssetImage(testgame.imgList[index]))),

                )))
        );
      },),
    );
  }


}


