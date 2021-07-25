import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Color.fromRGBO(172, 8, 8, 0.9),
            title: Text("About Us",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white))),
        body: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(color: Colors.white),
            alignment: Alignment(0.0, 0.0),
            child: Column(
                //
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('Diabetes is considered a worldwide pandemic, and one third of patients are from developing countries, Sri Lanka also one of them. However, many researches proved that majority of death caused by diabetes is due to lack of knowledge of the disease and lack of helping hands. To overcome this barrier MyDiabetes application was created. MyDiabetes is a medical care mobile application which is developed for Android OS using Flutter framework. The primary objective of MyDiabeties is to spread awareness of diabetes and consult with specialists when patient needs any consultation. In addition, MyDiabetes emphasize ways and methods to control the sugar level in blood, such as providing information of foods should take and foods should avoid in the diet plan, along with sugar level calculator',
                        style: TextStyle(color: Colors.black, fontSize: 14)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text("Application Information",
                        style: TextStyle(color: Colors.black, fontSize: 18)),
                  ),Padding(
                    padding: EdgeInsets.fromLTRB(32,16,32,0),
                    child: Text("Application Name: My Diabetes",
                        style: TextStyle(color: Colors.black, fontSize: 14)),
                  ),Padding(
                    padding: EdgeInsets.fromLTRB(32,16,32,0),
                    child: Text("Version : 1.0.0.v",
                        style: TextStyle(color: Colors.black, fontSize: 14)),
                  ),Padding(
                    padding: EdgeInsets.fromLTRB(32,16,32,0),
                    child: Text("Developer Name : ",
                        style: TextStyle(color: Colors.black, fontSize: 14)),
                  ),Padding(
                    padding: EdgeInsets.fromLTRB(32,16,32,0),
                    child: Text("Student ID :",
                        style: TextStyle(color: Colors.black, fontSize: 14)),
                  ),Padding(
                    padding: EdgeInsets.fromLTRB(32,16,32,0),
                    child: Text("Module : Mobile Application Development",
                        style: TextStyle(color: Colors.black, fontSize: 14)),
                  ),Padding(
                    padding: EdgeInsets.fromLTRB(32,16,32,0),
                    child: Text("Code Number : EM6330",
                        style: TextStyle(color: Colors.black, fontSize: 14)),
                  ),Padding(
                    padding: EdgeInsets.fromLTRB(32,16,32,0),
                    child: Text("Date : <Submit Date>",
                        style: TextStyle(color: Colors.black, fontSize: 14)),
                  )
                ])));
  }
}
