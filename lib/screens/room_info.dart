import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:retina/models/room.dart';
import 'package:retina/widgets/card_tile.dart';

class RoomScreen extends StatefulWidget {
  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  @override
  Widget build(BuildContext context) {
    final room_model = Provider.of<RoomModel>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            semanticLabel: "Back to the previous screen",
            size: 35.0,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "Room ${room_model.room.name}",
          semanticsLabel: "Room ${room_model.room.name}",
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.home,
              semanticLabel: "Go back to the main screen",
              size: 35.0,
            ),
            onPressed: () => Get.close(2),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 0.0),
        children: <Widget>[
          CardTile(
            titleText:
                "${room_model.room.info == null ? "No Information Available" : room_model.room.info}", // TODO: Rooms with no information should be handled elsewhere
          ),
          CardTile(
            titleText: "Navigate to Room ${room_model.room.name}",
            textStyle: TextStyle(fontWeight: FontWeight.bold),
            onTap: () => Get.toNamed("/navigation"),
          )
        ],
      ),
    );
  }
}
