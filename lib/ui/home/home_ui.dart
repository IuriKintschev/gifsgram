import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:gifsgram/blocs/gifs_bloc.dart';
import 'package:gifsgram/ui/home/widgets/gif_tile.dart';
import 'package:gifsgram/ui/home/widgets/search_home.dart';

class HomeUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff8844dd),
        title: Container(
          height: 30,
          child: Image.asset("assets/giphy.png"),
        ),
        actions: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              "0",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.star_half,
              size: 30,
              color: Colors.yellowAccent,
            ),
          ),
          IconButton(
            onPressed: () async {
              String result = await showSearch(
                  context: context, delegate: DataSearch()); //*datasearch
              if (result != null) {
                BlocProvider.getBloc<GifsBloc>().inSearch.add(result);
              }
            },
            icon: Icon(
              Icons.search,
              size: 30,
              color: Colors.white,
            ),
          )
        ],
      ),
      backgroundColor: Colors.black45,
      body: StreamBuilder(
        stream: BlocProvider.getBloc<GifsBloc>().outGifs,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length + 1,
              itemBuilder: (context, index) {
                if (index < snapshot.data.length) {
                  return GifsTile(snapshot.data[index]);
                } else {
                  BlocProvider.getBloc<GifsBloc>().inSearch.add(null);
                  return Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.bottomCenter,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  );
                }
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
