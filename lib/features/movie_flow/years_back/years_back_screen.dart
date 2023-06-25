import 'package:flutter/material.dart';
import 'package:movie_finder/core/widgets/primary_button.dart';
import 'package:movie_finder/features/movie_flow/result/result_screen.dart';

class YearsBackScreen extends StatefulWidget {
  const YearsBackScreen(
      {super.key, required this.nextPage, required this.previousPage});

  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  State<YearsBackScreen> createState() => _YearsBackScreenState();
}

class _YearsBackScreenState extends State<YearsBackScreen> {
  double yearsBack = 10;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: widget.previousPage,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'How many years back should we check for?',
              style: theme.textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${yearsBack.ceil()}',
                  style: theme.textTheme.headline2,
                ),
                Text(
                  'Years back',
                  style: theme.textTheme.headline4?.copyWith(
                    color: theme.textTheme.headline4?.color?.withOpacity(0.62),
                  ),
                )
              ],
            ),
            const Spacer(),
            Slider(
              value: yearsBack,
              onChanged: (value) {
                setState(() {
                  yearsBack = value;
                });
              },
              min: 0,
              max: 70,
              divisions: 70,
              label: '${yearsBack.ceil()}',
            ),
            const Spacer(),
            PrimaryButton(
                onPressed: () =>
                    Navigator.of(context).push(ResultScreen.route()),
                text: 'Continue'),
          ],
        ),
      ),
    );
  }
}
