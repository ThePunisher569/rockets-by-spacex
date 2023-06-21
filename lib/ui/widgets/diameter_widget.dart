import 'package:extraa_edge/models/rocket.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class DiameterWidget extends StatefulWidget {
  final Rocket rocket;

  const DiameterWidget({Key? key, required this.rocket}) : super(key: key);

  @override
  State<DiameterWidget> createState() => _DiameterWidgetState();
}

class _DiameterWidgetState extends State<DiameterWidget> {
  late bool changeDiameter;
  @override
  void initState() {
    changeDiameter=false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          changeDiameter
              ? 'Diameter : ${widget.rocket.diameter} meters'
              : 'Diameter : ${widget.rocket.diameterInFeet} feet',
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 8,
        ),
        ToggleSwitch(
          minWidth: 80.0,
          minHeight: 32,
          initialLabelIndex: !changeDiameter ? 1 : 0,
          cornerRadius: 20.0,
          activeFgColor: Colors.white,
          // inactiveBgColor: Colors.grey,
          // inactiveFgColor: Colors.white,
          totalSwitches: 2,
          centerText: true,
          customTextStyles: [Theme.of(context).textTheme.bodySmall],
          labels: const ['Meters', 'Feet'],
          activeBgColors: const [
            [Colors.deepPurpleAccent],
            [Colors.indigoAccent]
          ],
          changeOnTap: true,
          curve: Curves.fastEaseInToSlowEaseOut,
          onToggle: (index) {
            setState(() {
              changeDiameter = !changeDiameter;
            });
          },
        ),
      ],
    );
  }
}