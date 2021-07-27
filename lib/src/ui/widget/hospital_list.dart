import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:my_diabetes/src/blocs/hospital_bloc.dart';
import 'package:my_diabetes/src/blocs/hospital_bloc_provider.dart';
import 'package:my_diabetes/src/models/models.dart';

import '../appointment_detail_page.dart';

class HospitalListScreen extends StatefulWidget {
  final List<String> hospitals;
  final DoctorModel doctorModel;

  HospitalListScreen(this.hospitals, this.doctorModel);

  @override
  _HospitalListState createState() {
    return _HospitalListState(hospitals, doctorModel);
  }
}

class _HospitalListState extends State<HospitalListScreen> {
  HospitalBloc _bloc;
  final List<String> hospitals;
  final DoctorModel doctorModel;

  _HospitalListState(this.hospitals, this.doctorModel );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = HospitalBlocProvider.of(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      //alignment: Alignment(0.0, 0.0),
      child: StreamBuilder(
          stream: _bloc.getHospitalsByIds(hospitals),
          builder: (BuildContext context,
              AsyncSnapshot<List<HospitalModel>> hospitals) {
            if (hospitals.hasData) {
              List<HospitalModel> hospitalData = hospitals.data;
              if (hospitalData.isNotEmpty) {
                return buildList(hospitalData);
              } else {
                return Text("No Hospitals Found");
              }
            } else {
              return SizedBox( width: 50, height: 50, child: CircularProgressIndicator());
            }
          }),
    );
  }

  ListView buildList(List<HospitalModel> hospitals) {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: hospitals.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final item = hospitals[index];
          return Padding(
              padding: const EdgeInsets.all(6.0),
              child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => AppointmentDetailPage(hospitalModel: item, doctorModel: doctorModel,)))
                  },
                  child: SizedBox(
                      height: 150.0,
                      child: Card(
                          color: Colors.white,
                          elevation: 5,
                          child: new Stack(fit: StackFit.expand, children: <
                              Widget>[
                            new Container(
                              height: 120,
                              child: Row(children: [
                                Padding(
                                    padding: EdgeInsets.all(16),
                                    child: new Image.network(
                                      item.logo,
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
                                      item.name,
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
                                      item.address,
                                      textAlign: TextAlign.left,
                                      maxLines: 2,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 8, 0, 0),
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
                                            Text(item.email,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12)),
                                          ],
                                        )),
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 2, 0, 0),
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
                                            Text(item.phone,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12)),
                                          ],
                                        ))
                                  ],
                                )),
                              ]),
                            )
                          ])))));
        });
  }
}
