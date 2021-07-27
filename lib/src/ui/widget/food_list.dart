import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
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
        child: Column(children: [
          SizedBox( height: 50 , width: double.maxFinite, child:
          StreamBuilder(
              stream: _bloc.sugars,
              builder:
                  (BuildContext context, AsyncSnapshot<double> calories) {
                if (calories.hasData) {
                  double calory = calories.data;
                  return Container( child:
                      Text(" Total Sugar " + calory.toStringAsFixed(2) + "g",
                        textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 18),),
                    height: 50,
                    alignment: AlignmentDirectional.center,
                    color: Theme.of(context).accentColor,
                  );
                } else {
                  return Container( child:
                  Text("Select a food to calculate sugar",
                    textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 18),),
                    height: 50,
                    alignment: AlignmentDirectional.center,
                    color: Theme.of(context).accentColor,
                  );
                }
              })),
          Expanded(child: StreamBuilder(
              stream: _bloc.getAllFood(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<FoodModel>> foods) {
                if (foods.hasData) {
                  List<FoodModel> foodData = foods.data;
                  if (foodData.isNotEmpty) {
                    return buildList(foodData);
                  } else {
                    return Text("No Food Found");
                  }
                } else {
                  return Padding(padding: EdgeInsets.all(20), child: Text("Fetching Food"));
                }
              }),
          )]));
  }

  ListView buildList(List<FoodModel> articles) {
    List<FoodModel> selectedFoods = [];
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
                        if(selectedFoods.contains(item)){
                          selectedFoods.remove(item)
                        } else {
                          selectedFoods.add(item)
                        },
                        _bloc.changeSelectedFood(selectedFoods)
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
                                    item.icon,
                                    fit: BoxFit.cover,
                                    height: 100,
                                    width: 100,
                                    colorBlendMode: BlendMode.lighten,
                                    color: Colors.black87,
                                  )),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 16, 4, 16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        item.name,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(width: 16),
                                      Text(
                                        item.sugarContent + "g",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(fontSize: 16),
                                      )
                                    ],
                                  )),
                            ]),
                          )))));
        });
  }
}
