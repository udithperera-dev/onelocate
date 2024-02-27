# <kbd><img src="https://raw.githubusercontent.com/udithperera-dev/onelocate/d26d4a2a6694ae40eb7dbdf17d903f6f8cb42f9f/logo.png" width="50px" alt="logo" align="center" style="border-radius:50%"></kbd> onelocate

Introducing our innovative geo locate detection plugin called OneLocate, a powerful tool that allows you to check current location coordinates without GPS, Only need internet access only.

## Features

- GRS not required
- Only internet


## Getting started

To use this package, add oneroot as a dependency in your pubspec.yaml file.

## Usage

- On pubspeck.yaml

```yaml
onelocate: ^0.0.3
```

- On Dart Import

```dart
import 'package:onelocate/onelocate.dart';
```

- On implementation of OneLocate

```dart
//init plugin object
final _onelocatePlugin = Onelocate();

//Method will return location info as a dynamic map value.
//This is a set of properties that can access, 

{
"country": "",
"countryCode": "",
"city": "",
"zip": "",
"lat": "",
"lon": "",
}

var platformRootStatus = await _onerootPlugin.getLocation();

//Method will return the OS version.
String platformVersion = await _onerootPlugin.getPlatformVersion();
```

- Platform configs

<table>
  <tr>
    <td>Android - AndroidManifest</td>
    <td>IOS - info.plist</td>
  </tr>
  <tr>
    <td width="30%" style="text-align: left;" align="left" valign="top">
      
↑ Blank line!
```xml
   <manifest xmlns:android="http://schemas.android.com/apk/res/android"
  package="com.akurupela.onelocate">
<uses-permission android:name="android.permission.INTERNET" />
</manifest>
```
↓ Blank line!
    </td>
    <td width="30%" style="text-align: center;" align="left" valign="top">
↑ Blank line!
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
     <key>NSAllowsArbitraryLoads</key>
     <true/>
  </dict>
</plist>
```
↓ Blank line!         
    </td>
  </tr>
 </table>

<table>
  <tr>
    <td>One Locate - Android</td>
    <td>One Locate - IOS</td>
  </tr>
  <tr>
    <td width="30%" style="text-align: center;" align="left" valign="top"><img src="https://raw.githubusercontent.com/udithperera-dev/onelocate/cf07b7fd61202b061d65d9d2844c21737dfea9a0/on_android.png" alt="root" style="width:250px;"/></td>
    <td width="30%" style="text-align: center;" align="left" valign="top"><img src="https://raw.githubusercontent.com/udithperera-dev/onelocate/cf07b7fd61202b061d65d9d2844c21737dfea9a0/on_ios.png" alt="root" style="width:250px;"/></td>
  </tr>
 </table>

- See also from Developer

    - [Akurupela Applications](https://akurupela.com)

<p align="center">
      <kbd><img src="https://raw.githubusercontent.com/udithperera-dev/onelocate/d26d4a2a6694ae40eb7dbdf17d903f6f8cb42f9f/logo.png" width="25px" alt="logo" align="center"></kbd>
      <kbd><img src="https://www.akurupela.com/assets/images/images_info/ap_logo.png" width="25px" alt="logo" align="center"></kbd>
      <img src="https://storage.googleapis.com/cms-storage-bucket/6a07d8a62f4308d2b854.svg" width="100px" alt="logo" align="center">
      &nbsp;
      <img src="https://pub.dev/static/hash-tihrt5d6/img/pub-dev-logo.svg" width="100px" alt="logo" align="center">
</p>

