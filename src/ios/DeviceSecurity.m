#import "DeviceSecurity.h"
#import <Cordova/CDV.h>

@implementation DeviceSecurity

- (BOOL)doesDeviceHaveSecuritySetup:(CDVInvokedUrlCommand*)command
{
    BOOL isSecuritySetup = LAContext().canEvaluatePolicy(.DeviceOwnerAuthentication, error: nil)

    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:isSecuritySetup];;
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end