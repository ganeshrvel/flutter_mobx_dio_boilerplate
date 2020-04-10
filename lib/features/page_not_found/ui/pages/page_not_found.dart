import 'package:flutter/material.dart';
import 'package:flutter_mobx_dio_boilerplate/common/l10n/l10n_helpers.dart';

class PageNotFoundScreen extends StatelessWidget {
  final String routeName;

  const PageNotFoundScreen(this.routeName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ln(context, 'pnf_page_title'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              child: Text(
                ln(context, 'pnf_body_text'),
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
