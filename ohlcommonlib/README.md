# ohlcommonlib for flutter

Flutter plugin for common lib used by MobTech SDK.

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

- Plugin Homepage：https://pub.dev/packages/ohlcommonlib
- Official Documentation：https://www.mob.com/wiki/list

## Integration

### 1.Add dependencies

Add dependency of ohlcommonlib into your project's pubspec.yaml

```
dependencies:
  flutter:
    sdk: flutter
  ohlcommonlib:  # 指定最低版本，不填也可
```

### 2.Get the libs from pub.dev

Invoke the following command to get the libs from `pub.dev`:

```
flutter pub get
```

### 3.Import lib

Import lib into the .dart file in which you want to use MobTech SDKs:

```
import 'package:ohlcommonlib/ohlcommonlib.dart';
```

## API Introduction

### 1.Privacy Grant

Before you use any feature of MobTech SDK(such as sharesdk, mobpus,etc), you must call the following method to grant privacy:

```dart
Future submitPolicyGrantResult(bool granted, Function(dynamic ret,Map? err)? result)
```

For example:

```
void showPrivacyAlert(String text, BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
          title: new Text("Privacy Policy"),
          content: new Text(text),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Agree"),
              onPressed: () {
                // Close dialog
                Navigator.of(context).pop();
                OHLcommonlib.submitPolicyGrantResult(true, null);
              },
            ),
            new FlatButton(
              child: new Text("Reject"),
              onPressed: () {
                Navigator.of(context).pop();
                OHLcommonlib.submitPolicyGrantResult(false, null);
              },
            )
          ]));
}
```

# Contact us

Any problems please contact us:

- Email: support@mob.com

- QQ：4006852216（Online time: Mon - Fri , 9:30-20:00）
- Other time:
  - Android: 18516641950
  - iOS：18516641951
