#import "DeviceSecurity.h"
#import <Cordova/CDV.h>
#import <LocalAuthentication/LocalAuthentication.h>

@implementation DeviceSecurity

- (void)doesDeviceHaveSecuritySetup:(CDVInvokedUrlCommand*)command
{
    LAContext *context = [[LAContext alloc] init];
    BOOL isSecuritySetup = [context canEvaluatePolicy:DeviceOwnerAuthentication error:nil];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:isSecuritySetup];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
