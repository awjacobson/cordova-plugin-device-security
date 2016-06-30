#import "DeviceSecurity.h"
#import <Cordova/CDV.h>
#import <LocalAuthentication/LocalAuthentication.h>

@implementation DeviceSecurity

- (void)doesDeviceHaveSecuritySetup:(CDVInvokedUrlCommand*)command
{
    BOOL isSecuritySetup = false;

    if([LAContext class]) // iOS 9.0+
    {
        LAContext *context = [[LAContext alloc] init];
        isSecuritySetup = [context canEvaluatePolicy:LAPolicyDeviceOwnerAuthentication error:nil];
    }
    {
        NSData* secret = [@"Device has passcode set?" dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *attributes = @{ (__bridge id)kSecClass: (__bridge id)kSecClassGenericPassword,
            (__bridge id)kSecAttrService: @"LocalDeviceServices",
            (__bridge id)kSecAttrAccount: @"NoAccount",
            (__bridge id)kSecValueData: secret,
            (__bridge id)kSecAttrAccessible: (__bridge id)kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly };
        OSStatus status = SecItemAdd((__bridge CFDictionaryRef)attributes, NULL);
        if (status == errSecSuccess) { // item added okay, passcode has been set
            SecItemDelete((__bridge CFDictionaryRef)attributes);
            isSecuritySetup = true;
        }
    }

    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:isSecuritySetup];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
