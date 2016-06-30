#import "DeviceSecurity.h"
#import <Cordova/CDV.h>
#import <LocalAuthentication/LocalAuthentication.h>

@implementation DeviceSecurity

- (void)doesDeviceHaveSecuritySetup:(CDVInvokedUrlCommand*)command
{
    NSLog(@"DeviceSecurity - entering %s", __PRETTY_FUNCTION__);

    BOOL isSecuritySetup = false;
    [[[UIDevice currentDevice] systemVersion] floatValue];
    NSLog(@"DeviceSecurity - determining for iOS version %f", systemVersion);

    if(systemVersion >= 9.0)
    {
        LAContext *context = [[LAContext alloc] init];
        isSecuritySetup = [context canEvaluatePolicy:LAPolicyDeviceOwnerAuthentication error:nil];
    }
    else
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

    NSLog(@"DeviceSecurity - isSecuritySetup=%d", isSecuritySetup);
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:isSecuritySetup];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
