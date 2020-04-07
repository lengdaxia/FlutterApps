#import "NativeHardwarePlugin.h"
#import <native_hardware/native_hardware-Swift.h>

@implementation NativeHardwarePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftNativeHardwarePlugin registerWithRegistrar:registrar];
}
@end
