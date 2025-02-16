// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:at_app_create/at_app_create.dart';

import 'at_location_flutter_bundle.dart';

class AtLocationFlutterTemplateBundle extends AtTemplateBundle<AtTemplateVars> {
  AtLocationFlutterTemplateBundle() : super(atLocationFlutterBundle);
}

final AtTemplateVars _vars = AtTemplateVars(
  includeBundles: {'at_location_flutter'},
  dependencies: [
    "cupertino_icons: ^1.0.5",
    "at_app_flutter: ^5.0.1",
    "at_onboarding_flutter: ^5.0.3",
    "at_location_flutter: ^3.1.7",
    "latlong2: ^0.8.1",
    "biometric_storage: ^4.1.3"
  ],
  flutterConfig: ["assets:", "  - .env"],
);

final AtAppTemplate atLocationFlutterTemplate = AtAppTemplate(
  name: 'at_location_flutter',
  description: 'A sample of how to use the at_location_flutter package',
  vars: _vars,
  overrideEnv: true,
  env: {"NAMESPACE": "productive2227", "API_KEY": "477b-876u-bcez-c42z-6a3d"},
  bundles: [
    BaseTemplateBundle(),
    AndroidTemplateBundle(),
    IosTemplateBundle(),
    AtLocationFlutterTemplateBundle(),
  ],
);
