import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_diabetes/src/models/models.dart';
import 'package:my_diabetes/src/ui/widget/default_button.dart';

class AppointmentDetailScreen extends StatefulWidget {
  final HospitalModel hospitalModel;
  final DoctorModel doctorModel;

  const AppointmentDetailScreen({Key key, this.hospitalModel, this.doctorModel})
      : super(key: key);

  @override
  AppointmentDetailsState createState() {
    return AppointmentDetailsState(hospitalModel, doctorModel);
  }
}

class AppointmentDetailsState extends State<AppointmentDetailScreen> {
  final HospitalModel hospitalModel;
  final DoctorModel doctorModel;

  AppointmentDetailsState(this.hospitalModel, this.doctorModel);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double subTotal = 1000 +
        double.parse(doctorModel.chargePerChannel) +
        double.parse(hospitalModel.serviceCharge);
    double tax = subTotal / 100 * double.parse(hospitalModel.taxPercentage);
    double total = subTotal + tax;

    return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyText2,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    SizedBox(
                        height: 150.0,
                        child:
                            new Stack(fit: StackFit.expand, children: <Widget>[
                          new Container(
                            height: 120,
                            child: Row(children: [
                              Padding(
                                  padding: EdgeInsets.all(16),
                                  child: new Image.network(
                                    hospitalModel.logo,
                                    fit: BoxFit.cover,
                                    height: 100,
                                    width: 100,
                                    colorBlendMode: BlendMode.lighten,
                                    color: Colors.black87,
                                  )),
                              Flexible(
                                  //  padding: EdgeInsets.fromLTRB(0, 16, 4, 16),
                                  child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    hospitalModel.name,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    height: 6,
                                  ),
                                  Text(
                                    hospitalModel.address,
                                    textAlign: TextAlign.left,
                                    maxLines: 2,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.alternate_email_rounded,
                                              size: 14,
                                              color: Color.fromRGBO(
                                                  172, 8, 8, 0.9)),
                                          Container(
                                            margin: EdgeInsets.all(4),
                                          ),
                                          Text(hospitalModel.email,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12)),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.phone_android,
                                              size: 14,
                                              color: Color.fromRGBO(
                                                  172, 8, 8, 0.9)),
                                          Container(
                                            margin: EdgeInsets.all(4),
                                          ),
                                          Text(hospitalModel.phone,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12)),
                                        ],
                                      ))
                                ],
                              )),
                            ]),
                          ),
                        ])),
                    Padding(
                        padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                        child: Row(
                          children: [
                            Expanded(flex: 1, child: Text("Doctor Name")),
                            Expanded(
                                flex: 2,
                                child: Text(":  " + doctorModel.firstName)),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(16, 32, 16, 0),
                        child: Row(
                          children: [
                            Expanded(flex: 1, child: Text("Room No")),
                            Expanded(flex: 2, child: Text(":  03-A")),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(16, 32, 16, 0),
                        child: Row(
                          children: [
                            Expanded(flex: 1, child: Text("Time")),
                            Expanded(
                                flex: 2, child: Text(": 10:30 AM - 2:00 PM")),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(16, 32, 16, 0),
                        child: Row(
                          children: [
                            Expanded(flex: 1, child: Text("Day")),
                            Expanded(flex: 2, child: Text(":  Monday")),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(16, 64, 16, 0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Text(
                                  "Payment Details",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                )),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(16, 4, 16, 0),
                        child: Container(
                          height: 2,
                          color: Colors.black,
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(16, 32, 16, 0),
                        child: Row(
                          children: [
                            Expanded(flex: 1, child: Text("Channel Charge")),
                            Expanded(
                                flex: 2, child: Text(":  " + "1000" + " SLR")),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(16, 32, 16, 0),
                        child: Row(
                          children: [
                            Expanded(flex: 1, child: Text("Doctor Charge")),
                            Expanded(
                                flex: 2,
                                child: Text(":  " +
                                    doctorModel.chargePerChannel +
                                    " SLR")),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(16, 32, 16, 0),
                        child: Row(
                          children: [
                            Expanded(flex: 1, child: Text("TAX")),
                            Expanded(
                                flex: 2,
                                child: Text(":  " + tax.toString() + " SLR")),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(16, 32, 16, 0),
                        child: Row(
                          children: [
                            Expanded(flex: 1, child: Text("Service Charge")),
                            Expanded(
                                flex: 2,
                                child: Text(":  " +
                                    hospitalModel.serviceCharge +
                                    " SLR")),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(16, 32, 16, 0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Text(
                                  "TOTAL AMOUNT",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                            Expanded(
                                flex: 2,
                                child: Text(":  " + total.toString() + " SLR",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(16, 32, 16, 0),
                        child: DefaultButton("OK", () {
                          Navigator.pop(context);
                        }))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void showErrorMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
