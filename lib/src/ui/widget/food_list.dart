import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_diabetes/src/blocs/doctor_bloc.dart';
import 'package:my_diabetes/src/blocs/doctor_bloc_provider.dart';
import 'package:my_diabetes/src/blocs/food_bloc.dart';
import 'package:my_diabetes/src/blocs/food_bloc_provider.dart';
import 'package:my_diabetes/src/models/models.dart';

class FoodListScreen extends StatefulWidget {
  FoodListScreen();

  @override
  _FoodListState createState() {
    return _FoodListState();
  }
}

class _FoodListState extends State<FoodListScreen> {
  FoodBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = FoodBlocProvider.of(context);
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
          stream: _bloc.getAllFood(),
          builder: (BuildContext context,
              AsyncSnapshot<List<FoodModel>> foods) {
            if (foods.hasData) {
              List<FoodModel> foodData = foods.data;
              if (foodData.isNotEmpty) {
                return buildList(foodData);
              } else {
                return Text("No Articles Found");
              }
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }

  ListView buildList(List<FoodModel> articles) {
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
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (_) => new MaterialApp(
                        //           routes: {
                        //             "/": (_) => new WebviewScaffold(
                        //                   url: item.url,
                        //                   appBar: new AppBar(
                        //                     backgroundColor: Color.fromRGBO(172, 8, 8, 0.9),
                        //                     title: new Text("Widget webview"),
                        //                   ),
                        //                 ),
                        //           },
                        //         )))
                      },
                  child: SizedBox(
                      height: 184.0,
                      child: Card(
                          color: Colors.white,
                          elevation: 5,
                          child: new Stack(fit: StackFit.expand, children: <
                              Widget>[
                            new Container(
                                height: 150,
                                child: new Image.network(
                                  item.icon,
                                  fit: BoxFit.cover,
                                  colorBlendMode: BlendMode.lighten,
                                  color: Colors.black87,
                                )),
                            Positioned(
                                bottom: 0.0,
                                right: 0.0,
                                left: 0.0,
                                child: Container(
                                    color: Color.fromRGBO(95, 183, 148, 0.9),
                                    child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          item.name,
                                          style: new TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ))))
                          ])))));
        });
  }
}
