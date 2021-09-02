import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/provider/persons_provider.dart';
import 'package:whatsapp/widgets/status_item.dart';
import '../helpers/colors.dart';
import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    final persons = Provider.of<PersonsProvider>(context);
    final personsWithRecentStatus = persons.recentStatus;
    final personsWithViewedStatus = persons.viewedStatus;
    final personsWithMutedStatus = persons.mutedStatus;
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
          if (personsWithRecentStatus.isNotEmpty)
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
          if (personsWithRecentStatus.isNotEmpty)
            ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 0),
                shrinkWrap: true,
                itemCount: personsWithRecentStatus.length,
                itemBuilder: (ctx, idx) =>
                    StatusItem(personsWithRecentStatus[idx])),
          if (personsWithViewedStatus.isNotEmpty)
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
          if (personsWithViewedStatus.isNotEmpty)
            ListView.builder(
                itemCount: personsWithViewedStatus.length,
                shrinkWrap: true,
                itemBuilder: (ctx, idx) =>
                    StatusItem(personsWithViewedStatus[idx])),
          if (personsWithMutedStatus.isNotEmpty)
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
                  ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 0),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (ctx, idx) {
                        return StatusItem(personsWithMutedStatus[idx]);
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
