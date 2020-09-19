import 'package:flutter/cupertino.dart';

class ContentWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text("begin", style: TextStyle(fontSize: 50)),
                  SizedBox(
                    height: 200,
                  ),
                  Text("random text", style: TextStyle(fontSize: 50)),
                  SizedBox(
                    height: 200,
                  ),
                  Text("random text", style: TextStyle(fontSize: 50)),
                  SizedBox(
                    height: 200,
                  ),
                  Text("random text", style: TextStyle(fontSize: 50)),
                  SizedBox(
                    height: 200,
                  ),
                  Text("random text", style: TextStyle(fontSize: 50)),
                  SizedBox(
                    height: 200,
                  ),
                  Text("random text", style: TextStyle(fontSize: 50)),
                  SizedBox(
                    height: 200,
                  ),
                  Text("end", style: TextStyle(fontSize: 50)),
                  SizedBox(
                    height: 200,
                  ),
                ],
              ))),
    );
  }

}
