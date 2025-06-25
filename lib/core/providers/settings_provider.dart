import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_constants.dart';

part 'settings_provider.g.dart';

@riverpod
class SettingsNotifier extends _$SettingsNotifier {
  late SharedPreferences _prefs;

  @override
  FutureOr<Map<String, dynamic>> build() async {
    _prefs = await SharedPreferences.getInstance();
    return {
      'isFirstLaunch': _prefs.getBool(AppConstants.keyFirstLaunch) ?? true,
      'themeMode': _prefs.getString(AppConstants.keyThemeMode) ?? 'system',
    };
  }

  Future<void> setFirstLaunchCompleted() async {
    await _prefs.setBool(AppConstants.keyFirstLaunch, false);
    state = AsyncValue.data({...state.value!, 'isFirstLaunch': false});
  }

  Future<void> setThemeMode(String mode) async {
    await _prefs.setString(AppConstants.keyThemeMode, mode);
    state = AsyncValue.data({...state.value!, 'themeMode': mode});
  }
}
