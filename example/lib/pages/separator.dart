import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/string_property.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SeparatorPage extends StatefulWidget {
  const SeparatorPage({super.key});

  @override
  State<SeparatorPage> createState() => _SeparatorPageState();
}

class _SeparatorPageState extends State<SeparatorPage> {
  int margin = 4;
  int thickness = 1;
  int radius = 0;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return BaseScaffold(
      appBarTitle: 'Separator',
      editable: [
        MyStringProperty(
          label: 'margin',
          initialValue: '$margin',
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onChanged: (value) {
            var maybe = int.tryParse(value);
            if (maybe != null) setState(() => margin = maybe);
          },
        ),
        MyStringProperty(
          label: 'thickness',
          initialValue: '$thickness',
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onChanged: (value) {
            var maybe = int.tryParse(value);
            if (maybe != null) setState(() => thickness = maybe);
          },
        ),
        MyStringProperty(
          label: 'radius',
          initialValue: '$radius',
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onChanged: (value) {
            var maybe = int.tryParse(value);
            if (maybe != null) setState(() => radius = maybe);
          },
        ),
      ],
      children: [
        Text('Horizontal', style: theme.textTheme.h4),
        ShadSeparator.horizontal(
          thickness: thickness.toDouble(),
          margin: EdgeInsets.all(margin.toDouble()),
          radius: BorderRadius.all(Radius.circular(radius.toDouble())),
        ),
        IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Vertical', style: theme.textTheme.h4),
              ShadSeparator.vertical(
                thickness: thickness.toDouble(),
                margin: EdgeInsets.all(margin.toDouble()),
                radius: BorderRadius.all(Radius.circular(radius.toDouble())),
              ),
              Text('divider', style: theme.textTheme.h4),
            ],
          ),
        )
      ],
    );
  }
}
