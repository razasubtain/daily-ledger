import 'package:flutter_test/flutter_test.dart';
import 'package:digi_app/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  // HomeViewModel _getModel() => HomeViewModel();

  group('HomeViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    // group('incrementCounter -', () {
    //   test('When called once should return  Counter is: 1', () {
    //     final model = _getModel();
    //     model.incrementCounter();
    //     expect(model.counterLabel, 'Counter is: 1');
    //   });
    // });

    // group('showBottomSheet -', () {
    //   test('When called, should show custom bottom sheet using notice variant',
    //       () {
    //     final bottomSheetService = getAndRegisterBottomSheetService();

    //     final model = _getModel();
    //     model.showBottomSheet();
    //     verify(bottomSheetService.showCustomSheet(
    //       variant: BottomSheetType.notice,
    //       title: ksHomeBottomSheetTitle,
    //       description: ksHomeBottomSheetDescription,
    //     ));
    //   });
    // });
  });
}
