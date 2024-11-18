import 'package:flutter/material.dart';

class OverViewPage extends StatefulWidget {
  const OverViewPage({super.key});

  @override
  State<OverViewPage> createState() => _OverViewPageState();
}

class _OverViewPageState extends State<OverViewPage> {
  @override
  Widget build(BuildContext context) {
    const int days = 180;
    const double spacing = 4.0;
    int gridSize = MediaQuery.of(context).size.width ~/ (14 + spacing);

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 25, bottom: 10),
          child: Row(
            children: [
              Text(
                '最近$days天概览',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Spacer(),
              Row(
                children: [
                  ColorBox(intensity: 0.2, label: '较低'),
                  SizedBox(width: 3),
                  ColorBox(intensity: 0.4, label: '较少'),
                  SizedBox(width: 3),
                  ColorBox(intensity: 0.6, label: '一般'),
                  SizedBox(width: 3),
                  ColorBox(intensity: 0.8, label: '较高'),
                  SizedBox(width: 3),
                  ColorBox(intensity: 1.0, label: '很高'),
                ],
              ),
            ],
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.only(bottom: 15),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: gridSize,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
          ),
          itemCount: days,
          itemBuilder: (context, index) {
            double intensity = (index % 5 + 1) / 5.0;
            return Container(
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(intensity),
                borderRadius: BorderRadius.circular(2),
              ),
            );
          },
        )
      ],
    );
  }
}

class ColorBox extends StatelessWidget {
  final double intensity;
  final String label;

  const ColorBox({
    super.key,
    required this.intensity,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(intensity),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(fontSize: 9, color: Colors.grey),
        ),
      ],
    );
  }
}
