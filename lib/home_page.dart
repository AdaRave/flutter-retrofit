import 'dart:math';

import 'package:flutter/material.dart';
import 'package:retrofit_test_1/rest_client.dart';
import 'package:logger/logger.dart';
import 'feelings.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
/*  Feelings? feelings;
  var isLoad = false;*/

  /*@override
  void initState() {
    getData();
  }

  getData() async {
    final dio = Dio();
    final logger = Logger();

    final client = RestClient(dio);
    client.getTasks().then((value) => feelings = value);

    if (feelings != null) {
      logger.d("DATA_FEELINGS", feelings?.data.first.title);
      setState(() {
        isLoad = true;
      });
    }
  }*/


  FutureBuilder<Feelings> _buildBodyFeelings(BuildContext context) {
    final client = RestClient(Dio());

    return FutureBuilder <Feelings>
      (future: client.getTasks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final Feelings? feelings = snapshot.data;
            return _buildFuture(context, feelings!.data);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
    );
  }

  ListView _buildFuture(BuildContext context, List<Datum> data) {
    return ListView.builder(
      itemCount: data.length,
        padding: EdgeInsets.all(8),
        itemBuilder: (context, index){
          return Container(
            child: Text(data[index].title),
          );
        }
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Retrofit'),
        ),
        body: _buildBodyFeelings(context)
    );
  }


}

