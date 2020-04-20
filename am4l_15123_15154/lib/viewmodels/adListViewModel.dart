import 'package:am4l_15123_15154/models/ad.dart';
import 'package:am4l_15123_15154/services/webservice.dart';
import 'package:flutter/cupertino.dart';


//represent a screen that will display all the ads
class AdListViewModel extends ChangeNotifier{

  List<AdViewModel> ads; 

  Future<void> fetchAllAds() async {

    final ads = await Webservice().getAllAds();     //await to make sure to evaluate the Future List in the webservice
    this.ads = ads.map((ad) => AdViewModel(ad: ad)).toList();   //makes ads iterable
    notifyListeners();    //whoever listens to the changes from AdListViewModel
  }

}

//represent individual ad
class AdViewModel {

  final Ad ad; 

  AdViewModel({this.ad});

  String get concerned {
    return this.ad.concerned; 
  }
  String get date {
    return this.ad.date; 
  }
  String get title {
    return this.ad.title; 
  }
  String get description {
    return this.ad.description; 
  }
}