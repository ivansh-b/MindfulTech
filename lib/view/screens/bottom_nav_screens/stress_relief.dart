import 'package:flutter/material.dart';
import 'package:health_flutter_app/view/screens/stress_relief_screens/breathing_exercise.dart';
import 'package:health_flutter_app/view/screens/stress_relief_screens/meditate.dart';
import 'package:health_flutter_app/view/screens/stress_relief_screens/music.dart';
import 'package:health_flutter_app/view/widgets/stress_relief_item.dart';

class StressReleif extends StatelessWidget {
  const StressReleif({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Column(
              children: [
                Container(
                  //height:
                  child: IconButton(
                    iconSize: 150,
                    icon: Image.asset('assets/images/meditation.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MeditateScreen()));
                    },
                  ),
                ),
                Text('Meditate'),
              ],
            )),
            Expanded(
                child: Column(
              children: [
                Container(
                  //height:
                  child: IconButton(
                    iconSize: 150,
                    icon: Image.asset('assets/images/music.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MusicScreen()));
                    },
                  ),
                ),
                Text('Listen to Music'),
              ],
            )),
            Expanded(
                child: Column(
              children: [
                Container(
                  //height: ,
                  child: IconButton(
                    iconSize: 150,
                    icon: Image.asset('assets/images/boxBreathing.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BreathingExerciseScreen()));
                    },
                  ),
                ),
                Text('Work Mode'),
              ],
            ))
          ],
        ),
        SizedBox(
          height: 16,
        ),
        StressReliefItem(
            title: 'Deep Breathing Exercise',
            desc:
                'Deep breathing can help lessen stress and anxiety. our breath is not just part of our body\'s stress response, it\'s key to it.',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BreathingExerciseScreen()));
            }),
        StressReliefItem(
            title: 'Meditation',
            desc:
                'Meditation offers time for relaxation and heightened awareness in a stressful world where our senses are often dulled.',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MeditateScreen()));
            }),
        StressReliefItem(
            title: 'Listen to relaxing music',
            desc:
                'Stress can be recuced and relaxation maximized with the use of music',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MusicScreen()));
            })
      ],
    ));
  }
}
