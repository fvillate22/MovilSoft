import 'dart:async';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';





class FullScreenMap extends StatefulWidget {
  const FullScreenMap({super.key});

  @override
  State<FullScreenMap> createState() => _FullScreenMapState();
}

class _FullScreenMapState extends State<FullScreenMap> {
  Completer<GoogleMapController> _controller = Completer();

  static final  _kGooglePlex = CameraPosition(
    target: LatLng(6.220025, -75.179436),
    zoom:  14.4746
    );

    static final CameraPosition _KLake = CameraPosition(
      target: LatLng(6.220025, -75.179436),
      zoom:  14.4746
    );

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_KLake));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle Sitio Turistico Monserrate"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center (
        child: Image( image: AssetImage('assets/images/monserrate_img.png'),
      ),
      ),
     
     /* GoogleMap(
        mapType: MapType.hybrid,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
          }
        ),
        */
    
    );
  }
}