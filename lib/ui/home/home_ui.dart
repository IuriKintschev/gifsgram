import 'package:flutter/material.dart';

class HomeUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            actions: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.star_half,
                  size: 30,
                  color: Colors.yellowAccent,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.white,
                ),
              )
            ],
            backgroundColor: Color(0xff8844dd),
            title: Container(
              height: 30,
              child: Image.asset("assets/giphy.png"),
            ),
          ),
        ],
      ),
    );
  }
}

//  GridView.builder(
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisSpacing: 4,
//         mainAxisSpacing: 4,
//         crossAxisCount: 2,
//       ),
//       itemCount: 5,
//       itemBuilder: (context, index) {
//         return Card();
//       },
//     );