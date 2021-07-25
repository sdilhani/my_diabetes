import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_diabetes/src/blocs/doctor_bloc.dart';
import 'package:my_diabetes/src/blocs/doctor_bloc_provider.dart';
import 'package:my_diabetes/src/models/models.dart';

import '../doctor_detail_page.dart';

class ConsultantListScreen extends StatefulWidget {
  ConsultantListScreen();

  @override
  _ConsultantListState createState() {
    return _ConsultantListState();
  }
}

class _ConsultantListState extends State<ConsultantListScreen> {
  DoctorBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = DoctorBlocProvider.of(context);
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0.0, 0.0),
      child: StreamBuilder(
          stream: _bloc.getAllConsultants(),
          builder: (BuildContext context,
              AsyncSnapshot<List<DoctorModel>> doctors) {
            if (doctors.hasData) {
              List<DoctorModel> doctorData = doctors.data;
              if (doctorData.isNotEmpty) {
                return buildList(doctorData);
              } else {
                return Text("No Consultants Found");
              }
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }

  ListView buildList(List<DoctorModel> articles) {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final item = articles[index];
          return Padding(
              padding: const EdgeInsets.all(6.0),
              child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => DoctorDetailScreen(item)))
                  },
                  child: SizedBox(
                      height: 134.0,
                      child: Card(
                          color: Colors.white,
                          elevation: 5,
                          child: new Container(
                            height: 100,
                            child: Row(children: [
                              Padding(
                                  padding: EdgeInsets.all(16),
                                  child: new Image.network(
                                    item.image,
                                    fit: BoxFit.cover,
                                    height: 100,
                                    width: 100,
                                    colorBlendMode: BlendMode.lighten,
                                    color: Colors.black87,
                                  )),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 16, 4, 16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.firstName,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, ),
                                      ),
                                      Container(height: 6,),
                                      Text(
                                        item.designation,
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
                                              Text(item.email,
                                                  style:
                                                  TextStyle(color: Colors.black, fontSize: 16)),
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
                                              Text(item.phone,
                                                  style:
                                                  TextStyle(color: Colors.black, fontSize: 16)),
                                            ],
                                          ))
                                    ],
                                  )),
                            ]),
                          )))));
        });
  }
}
