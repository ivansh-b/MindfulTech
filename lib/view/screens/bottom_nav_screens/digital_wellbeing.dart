import 'package:app_usage/app_usage.dart';
import 'package:flutter/material.dart';
import 'package:health_flutter_app/view/widgets/digital_wellbeing_single_item.dart';

class DigitalWellbeing extends StatefulWidget {
  const DigitalWellbeing({super.key});

  @override
  State<DigitalWellbeing> createState() => _DigitalWellbeingState();
}

class _DigitalWellbeingState extends State<DigitalWellbeing> {
  List<AppUsageInfo> _infos = [];
  Map<int, List<AppUsageInfo>> weekUsageInfo = Map();
  int maxIndex = -1, minIndex = -1;
  Duration maxDuration = Duration(), minDuration = Duration();
  Duration weekDuration = Duration(), dailyAverage = Duration();
  Duration todayDuration = Duration();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsageStats();
    getWeeklyUsageData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Container(
            //   height: MediaQuery.of(context).size.height * 0.7,
            //   child: ListView.builder(
            //       itemCount: _infos.length,
            //       itemBuilder: (BuildContext context, int index) {
            //         return ListTile(
            //           title: Text(_infos[index].appName),
            //           subtitle: Text(_infos[index].usage.toString()),
            //         );
            //       }),
            // ),
            Center(
                child: Text(
              'Digital Well-being',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(8),
              child: Column(
                children: [
                  Text('Today\'s screen time:',
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  SizedBox(
                    height: 8,
                  ),
                  Text(todayDuration.toString(),
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
            Divider(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DigitalWellbeingSingleItem(
                  name: 'Daily Average',
                  value: (dailyAverage).toString(),
                ),
                DigitalWellbeingSingleItem(
                  name: 'Weekly Total',
                  value: weekDuration.toString(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DigitalWellbeingSingleItem(
                  name: 'Shortest',
                  value: minDuration.toString(),
                ),
                DigitalWellbeingSingleItem(
                  name: 'Longest',
                  value: maxDuration.toString(),
                ),
              ],
            ),
            Divider(
              height: 30,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                child: _infos.isNotEmpty
                    ? ListView.builder(
                        itemCount: _infos.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(_infos[index].appName),
                            subtitle: Text(_infos[index].usage.toString()),
                          );
                        })
                    : Center(
                        child: Text(
                          'No data !',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
              ),
            ),
            Divider(
              height: 20,
            ),
            //Spacer(),
            Text(
              'About',
              style: TextStyle(color: Colors.black54),
            ),
            Text('The amount of time you spend on your phone.'),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }

  void getUsageStats() async {
    try {
      DateTime endDate = DateTime.now();
      DateTime startDate = endDate.subtract(Duration(days: 7));
      List<AppUsageInfo> infoList =
          await AppUsage().getAppUsage(startDate, endDate);
      setState(() {
        _infos = infoList;
      });
      for (var info in infoList) {
        print(info);
      }
    } on AppUsageException catch (exception) {
      print(exception);
    }
  }

  void getWeeklyUsageData() async {
    try {
      DateTime endDate = DateTime.now();
      // DateTime startDate = endDate.subtract(Duration(days: 1));
      // List<AppUsageInfo> infoList =
      //     await AppUsage().getAppUsage(startDate, endDate);
      // weekUsageInfo.update(2, (value) => infoList);

      for (int i = 1; i <= 7; i++) {
        DateTime startDate = endDate.subtract(Duration(days: 1));
        List<AppUsageInfo> _info =
            await AppUsage().getAppUsage(startDate, endDate);
        //weekUsageInfo.update(i, (value) => _info);
        weekUsageInfo[i] = _info;
        endDate = startDate;
      }
      setState(() {});
      findMaxandMin();
    } on AppUsageException catch (exception) {
      print(exception);
    }
  }

  void findMaxandMin() {
    if (weekUsageInfo.isEmpty) {
      return;
    }
    Duration _maxDuration = Duration();
    Duration _minDuration = Duration(days: 10);
    int _maxIndex = 0, _minIndex = 0;
    for (int i = 1; i <= weekUsageInfo.length; i++) {
      Duration _usageForTheDay = Duration();
      for (var info in weekUsageInfo[i]!) {
        _usageForTheDay += info.usage;
      }
      if (_usageForTheDay > _maxDuration) {
        _maxDuration = _usageForTheDay;
        _maxIndex = i;
      }
      if (_usageForTheDay < _minDuration) {
        _minDuration = _usageForTheDay;
        _minIndex = i;
      }
      weekDuration += _usageForTheDay;
      if (i == 1) {
        todayDuration = _usageForTheDay;
      }
    }
    Duration _dailyAverage =
        Duration(microseconds: (weekDuration.inMicroseconds / (7)).toInt());

    setState(() {
      maxIndex = _maxIndex;
      minIndex = _minIndex;
      maxDuration = _maxDuration;
      minDuration = _minDuration;
      dailyAverage = _dailyAverage;
    });
  }
}
