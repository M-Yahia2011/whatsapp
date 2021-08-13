import 'package:flutter/material.dart';
import 'package:whatsapp/widgets/status_item.dart';
import '../helpers/colors.dart';
import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  bool _expanded = false;

  /// should be a list --> if(_mutedList.isNotEmpty)
  bool _mutedPersonsExist = true;

  ///
  bool _viewedIsNotEmpty = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            // height: 60,
            child: ListTile(
              leading: Stack(children: [
                Icon(
                  Icons.account_circle,
                  size: 60,
                  color: MyColors.whatsapp[100],
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Icon(
                    Icons.add_circle,
                    color: MyColors.whatsapp[300],
                  ),
                )
              ]),
              title: Text("My Status"),
              subtitle: Text("Tap to add status update"),
            ),
          ),
          Container(
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            width: double.infinity,
            color: MyColors.whatsapp[700],
            child: Text(
              "Recent updates",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          RecentUpdate(),
          if (_viewedIsNotEmpty)
            Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              width: double.infinity,
              color: MyColors.whatsapp[700],
              child: Text(
                "Viewed updates",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          if (_mutedPersonsExist)
            Container(
              color: MyColors.whatsapp[700],
              child: ConfigurableExpansionTile(
                expandedBackgroundColor: Colors.white,
                header: Container(
                  alignment: Alignment.center,
                  height: 40,
                  margin: EdgeInsets.only(right: 254),
                  child: Text(
                    "Muted updates",
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                animatedWidgetFollowingHeader: Icon(
                  Icons.expand_more,
                  color: MyColors.whatsapp[300],
                ),
                children: [
                  //
                  ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 0),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (ctx, idx) {
                        return StatusItem();
                      }),
                ],
              ),
            ),

          // if (_expanded)
          //   Expanded(
          //     child:
          //   )
        ],
      ),
    );
  }
}

class RecentUpdate extends StatefulWidget {
  const RecentUpdate({Key? key}) : super(key: key);

  @override
  _RecentUpdateState createState() => _RecentUpdateState();
}

class _RecentUpdateState extends State<RecentUpdate> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 0),
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (ctx, idx) => StatusItem());
  }
}
