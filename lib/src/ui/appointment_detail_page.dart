import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_diabetes/src/models/models.dart';
import 'package:my_diabetes/src/ui/widget/appointment_details.dart';

class AppointmentDetailPage extends StatelessWidget {
  final HospitalModel hospitalModel;
  final DoctorModel doctorModel;

  AppointmentDetailPage({Key key, this.hospitalModel, this.doctorModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Color.fromRGBO(172, 8, 8, 0.9),
            title: Text("Appointment Details", textAlign: TextAlign.center, style: TextStyle(color: Colors.white))
        ),
        body: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(color: Colors.white),
            alignment: Alignment(0.0, 0.0),
            child: AppointmentDetailScreen(hospitalModel: hospitalModel,doctorModel: doctorModel)));
  }
}
