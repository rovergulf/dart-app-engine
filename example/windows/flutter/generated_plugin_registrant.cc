//
//  Generated file. Do not edit.
//

#include "generated_plugin_registrant.h"

#include <battery_plus_windows/battery_plus_windows_plugin.h>
#include <connectivity_plus_windows/connectivity_plus_windows_plugin.h>
#include <dapp/dapp_plugin.h>
#include <url_launcher_windows/url_launcher_plugin.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  BatteryPlusWindowsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("BatteryPlusWindowsPlugin"));
  ConnectivityPlusWindowsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ConnectivityPlusWindowsPlugin"));
  DappPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("DappPlugin"));
  UrlLauncherPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("UrlLauncherPlugin"));
}
