import 'package:am4l_15123_15154/viewmodels/adListViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AdList extends StatelessWidget {

  List<AdViewModel> ads; 

  AdList({this.ads});

  @override
  Widget build(BuildContext context) {
   return ListView.builder(
      itemCount: this.ads.length,
      itemBuilder: (BuildContext context, int index) {

        final ad = this.ads[index];

        return ListTile(
          title: Text(ad.title),
          
        );
      },
    ); 
  }

}