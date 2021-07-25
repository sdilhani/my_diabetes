import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_diabetes/src/blocs/hospital_bloc_provider.dart';
import 'package:my_diabetes/src/models/models.dart';
import 'package:my_diabetes/src/ui/widget/hospital_list.dart';

class DoctorDetailScreen extends StatelessWidget {
  final DoctorModel doctorModel;

  DoctorDetailScreen(this.doctorModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Color.fromRGBO(172, 8, 8, 0.9),
            title: Text("Doctor Details",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white))),
        body: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(color: Colors.white),
            alignment: Alignment(0.0, 0.0),
            child: Column(
             // mainAxisSize: MainAxisSize.min,
              children: [
                new Container(
                  height: 160,
                  child: Row(children: [
                    Padding(
                        padding: EdgeInsets.all(0),
                        child: new Image.network(doctorModel.image,
                            fit: BoxFit.cover,
                            height: 110,
                            width: 110,
                            colorBlendMode: BlendMode.lighten)),
                    Padding(
                        padding: EdgeInsets.fromLTRB(8, 16, 4, 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              doctorModel.firstName,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              height: 6,
                            ),
                            Text(
                              doctorModel.designation,
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 16),
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.alternate_email_rounded,
                                        size: 16,
                                        color: Color.fromRGBO(172, 8, 8, 0.9)),
                                    Container(
                                      margin: EdgeInsets.all(4),
                                    ),
                                    Text(doctorModel.email,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 16)),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.phone_android,
                                        size: 16,
                                        color: Color.fromRGBO(172, 8, 8, 0.9)),
                                    Container(
                                      margin: EdgeInsets.all(4),
                                    ),
                                    Text(doctorModel.phone,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 16)),
                                  ],
                                ))
                          ],
                        )),
                  ]),
                ),

            HospitalBlocProvider(
                        child: HospitalListScreen(doctorModel.hospitals))

            ])));
  }
}
