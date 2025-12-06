import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;
    double heightDevice = MediaQuery.of(context).size.height;
    double paddingTop = MediaQuery.of(context).padding.top;
    double paddingBottom = MediaQuery.of(context).padding.bottom;

    AppBar myAppBar() {
      return AppBar(title: Text("HOME"));
    }

    double heightBody =
        heightDevice - myAppBar().preferredSize.height - paddingTop;

    return Scaffold(
      appBar: myAppBar(),

      //1.Penggunaan MediaQuery
      // body: Container(
      //   width: widthDevice * 0.5,
      //   height: heightBody,
      //   color: Colors.red,
      // ),

      //2.Flexible
      // body: Column(
      //   children: [
      //     Flexible(
      //       flex: 1,
      //       child: Container(width: widthDevice * 0.5, color: Colors.red),
      //     ),
      //     Flexible(
      //       flex: 1,
      //       child: Container(width: widthDevice * 0.5, color: Colors.amber),
      //     ),
      //     Flexible(
      //       flex: 1,
      //       child: Container(width: widthDevice * 0.5, color: Colors.green),
      //     ),
      //   ],
      // ),

      //3.Expanded
      // body: Column(
      //   children: [
      //     Row(
      //       children: [
      //         Container(height: 50, width: 50, color: Colors.green),
      //         Expanded(
      //           child: ListTile(
      //             tileColor: Colors.amber,
      //             leading: Icon(Icons.abc_sharp),
      //             title: Text("judul"),
      //           ),
      //         ),
      //         Container(height: 50, width: 50, color: Colors.red),
      //       ],
      //     ),
      //   ],
      // ),

      //4.FittedBox
      // body: Center(
      //   child: Container(
      //     width: 200,
      //     height: 100,
      //     color: Colors.amber,
      //     child: Center(
      //       child: FittedBox(
      //         child: Text(
      //           "HAOo00",
      //           style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),

      //5.Wrap
      body: Container(
        width: widthDevice,
        height: heightBody,
        child: Wrap(
          direction: Axis.vertical,
          spacing: 10,
          runSpacing: 10,
          children: List.generate(8, (index) {
            return Container(
              margin: EdgeInsets.all(10),
              width: widthDevice * 0.15,
              height: 35,
              color: Colors.amber,
            );
          }),
        ),
      ),
    );
  }
}
