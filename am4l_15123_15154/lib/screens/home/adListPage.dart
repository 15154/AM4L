
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdListPage extends StatefulWidget {
  @override 
  _AdListPageState createState() => _AdListPageState(); 
}

class _AdListPageState extends State<AdListPage> {

  @override
  void initState() {
    super.initState();
    // Provider.of<AdListViewModel>(context,listen: false).fetchAllAds();
  }

  // Widget _buildUI(AdListViewModel vm) {
  //   if(vm.ads == null) {
  //     return Align(child: CircularProgressIndicator());
  //   } else if(vm.ads.isEmpty) {
  //     return Align(child: Text("No ads found."));
  //   } else {
  //     return AdList(ads: vm.ads);
  //   }
  // }
 
  @override
  Widget build(BuildContext context) {

    // final vm =  Provider.of<AdListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Go back'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      )
    );
    
  }
}