import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_gen/gen_l10n/dapp_localizations.dart';

void showAboutDialog({
  @required BuildContext context,
}) {
  assert(context != null);
  showDialog<void>(
    context: context,
    builder: (context) {
      return _AboutDialog();
    },
  );
}

Future<String> getVersionNumber() async {
  final packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.version;
}

class _AboutDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final bodyTextStyle =
        textTheme.bodyText1.apply(color: colorScheme.onPrimary);

    final name = 'Dapp Example'; // Don't need to localize.
    final legalese = '© 2021 Rovergulf Engineers'; // Don't need to localize.
    final repoText = AppLocalizations.of(context).githubRepo(name);
    final seeSource =
        AppLocalizations.of(context).aboutDialogDescription(repoText);
    final repoLinkIndex = seeSource.indexOf(repoText);
    final repoLinkIndexEnd = repoLinkIndex + repoText.length;
    final seeSourceFirst = seeSource.substring(0, repoLinkIndex);
    final seeSourceSecond = seeSource.substring(repoLinkIndexEnd);

    return AlertDialog(
      backgroundColor: colorScheme.background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            FutureBuilder(
              future: getVersionNumber(),
              builder: (context, snapshot) => Text(
                snapshot.hasData ? '$name ${snapshot.data}' : '$name',
                style: textTheme.headline4.apply(color: colorScheme.onPrimary),
              ),
            ),
            const SizedBox(height: 24),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    style: bodyTextStyle,
                    text: seeSourceFirst,
                  ),
                  TextSpan(
                    style: bodyTextStyle.copyWith(
                      color: colorScheme.primary,
                    ),
                    text: repoText,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        final url = 'https://github.com/rovergulf/dapp/';
                        if (await canLaunch(url)) {
                          await launch(
                            url,
                            forceSafariVC: false,
                          );
                        }
                      },
                  ),
                  TextSpan(
                    style: bodyTextStyle,
                    text: seeSourceSecond,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Text(
              legalese,
              style: bodyTextStyle,
            ),
          ],
        ),
      ),
      actions: [
        // TextButton(
        //   child: Text(
        //     MaterialLocalizations.of(context).viewLicensesButtonLabel,
        //   ),
        //   onPressed: () {
        //     Navigator.of(context).push(MaterialPageRoute<void>(
        //       builder: (context) => Theme(
        //         data: Theme.of(context).copyWith(
        //           textTheme: Typography.material2018(
        //             platform: Theme.of(context).platform,
        //           ).black,
        //           scaffoldBackgroundColor: Colors.white,
        //         ),
        //         child: LicensePage(
        //           applicationName: name,
        //           applicationLegalese: legalese,
        //         ),
        //       ),
        //     ));
        //   },
        // ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(MaterialLocalizations.of(context).closeButtonLabel),
        ),
      ],
    );
  }
}
