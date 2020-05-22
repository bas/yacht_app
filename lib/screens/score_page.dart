import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yacht_app/utilities/constants.dart';
import 'package:yacht_app/utilities/score_helper.dart';
import 'package:yacht_app/services/game_service.dart';
import 'package:yacht_app/components/bottom_navigation_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ScoreCardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<GameService>(builder: (context, game, child) {
      return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text(kAppTitle, style: kAppBarTitleTextStyle),
        ),
        body: Column(
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.lightBlueAccent),
              child: Center(
                child: DataTable(
                  showCheckboxColumn: false,
                  dataRowHeight: 30.0,
                  columns: [
                    DataColumn(
                      label: Text(''),
                    ),
                    DataColumn(
                        label: Text(
                      'Category',
                      style: kTableTextStyle,
                    )),
                    DataColumn(
                      label: Text('Score', style: kTableTextStyle),
                    ),
                  ],
                  rows: getDataRows(game),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationWidget(
          game: game,
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            game.nextRound();
          },
          label: Text('Save', style: kButtonTextStyle,),
          icon: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(FontAwesomeIcons.save),
          ),
          backgroundColor: game.turn > 0 ? Colors.pink : Colors.pink[200],
        ),
      );
    });
  }

  List getDataRows(GameService game) {
    List<DataRow> dataRows = List<DataRow>();

    dataRows.addAll(categories
        .map(
          (e) => DataRow(
            onSelectChanged: (bool selected) {
              if (selected) {
                game.addScore(e);
              }
            },
            cells: [
              DataCell(
                Icon(
                  game.hasScore(e)
                      ? Icons.check_box
                      : Icons.check_box_outline_blank,
                  color: Colors.white,
                ),
              ),
              DataCell(
                Text(e, style: kTableTextStyle),
              ),
              DataCell(
                Text(game.getScoreAsString(e), style: kTableTextStyle),
              ),
            ],
          ),
        )
        .toList());
    dataRows.add(
      DataRow(cells: [
        DataCell(Text('')),
        DataCell(Text(
          'Total',
          style: kTableTextStyle,
        )),
        DataCell(Text(
          '${game.totalScore()}',
          style: kTableTextStyle,
        )),
      ]),
    );
    return dataRows;
  }
}
