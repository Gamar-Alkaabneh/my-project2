
import 'package:flutter/material.dart';


class LocationTab extends StatefulWidget {
  const LocationTab({super.key});

  @override
  State<LocationTab> createState() =>_LocationTabState();
}

class _LocationTabState extends State<LocationTab> {
  List<placeModel> _places = [];

  @override
  void initState() {
    _fillPlaces();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Column(children: [Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text("Popular",style:
        TextStyle(fontFamily: "Montserrat", fontSize: 18,color: Colors.black,fontWeight:FontWeight.w600)),
          Text("see all",style:
          TextStyle(fontFamily: "CircularXX", fontSize: 12,color: Colors.blue,fontWeight:FontWeight.w500),
          )])
          ,GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10.0),
              itemBuilder: (context,index){
                return _getPlaceCard(_places[index]);
              }),
          Text("Recommended",style:
          TextStyle(fontFamily: "Montserrat", fontSize: 18,color: Colors.black,fontWeight:FontWeight.w600)),
            

      ],)
    );


  }

  Widget _getPlaceCard(placeModel model) {
    return Stack(children: [Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(model.image), // Replace with your image path
          fit: BoxFit.cover,
        ),
      ),
    ),
    Positioned(child: Text(model.title,style:
    TextStyle(fontSize: 12,fontFamily: "CircularXX",backgroundColor: Colors.black54,color: Colors.black),)),
      Positioned(child:Image(image: AssetImage(model.stars),)),],);
  }

  void _fillPlaces() {
    _places.add(placeModel("assets/Alley.png", "Alley Palaces", "assets/stars1.png"));
    _places.add(placeModel("assets/couerdes.png", "Coeurdes Alpes", "assets/star2.png"));
  }
}
class placeModel{
  String image;
  String title;
  String stars;

  placeModel(this.image,this.title,this.stars);
}
