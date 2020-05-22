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
          title: Text('Yacht Dice Game'),
        ),
        body: Column(
          children: <Widget>[
            DataTable(
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
              rows: categories
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
                          Text(game.getScoreAsString(e),
                              style: kTableTextStyle),
                        ),
                      ],
                    ),
                  )
                  .toList(),
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
          label: Text('Next Round'),
          icon: Icon(FontAwesomeIcons.dice),
          backgroundColor: Colors.pink,
        ),
      );
    });
  }
}
