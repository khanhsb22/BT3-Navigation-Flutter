import 'package:flutter/material.dart';
import 'hex_color.dart';

class MyList extends StatefulWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  State<MyList> createState() => _ListViewState();
}

class _ListViewState extends State<MyList> {
  Color purpleColor = HexColor("773FB2");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: purpleColor,
          title: Text("ListView"),
        ),
        body: BodyLayout());
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

Widget _myListView(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        ListView.separated(
          separatorBuilder: (BuildContext context, int index) => Divider(),
          shrinkWrap: true,
          physics: ScrollPhysics(parent: null),
          itemCount: 20,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () {
                  print("Item " + index.toString());
                },
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://www.gravatar.com/avatar/xxx?d=monsterid&f=y%22"),
                              fit: BoxFit.fill)),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Item #" + index.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Text(
                              "Item " + index.toString(),
                              style: TextStyle(color: Colors.black45),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.black45,
                        )
                      ],
                    )),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    ),
  );
}
