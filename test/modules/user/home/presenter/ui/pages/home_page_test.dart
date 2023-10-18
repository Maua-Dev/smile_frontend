import 'package:clean_flutter_template/app/modules/user/home/presenter/ui/pages/home_page.dart';
import 'package:clean_flutter_template/app/modules/user/home/presenter/ui/widgets/home_button_widget.dart';
import 'package:clean_flutter_template/generated/l10n.dart';
import 'package:clean_flutter_template/shared/widgets/footer_widget.dart';
import 'package:clean_flutter_template/shared/widgets/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  testWidgets('[TEST] - HomePage must show some widgets', (widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(localizationsDelegates: const [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ], supportedLocales: S.delegate.supportedLocales, home: const HomePage()));
    expect(find.byType(LogoWidget), findsOneWidget);
    expect(find.text(S.current.homePageTitle), findsOneWidget);
    expect(find.text(S.current.homePageSubtitle), findsOneWidget);
    expect(find.byType(HomeButtonWidget), findsNWidgets(4));
    expect(find.byType(FooterWidget), findsOneWidget);
  });
}
