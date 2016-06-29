#import <Cordova/CDV.h>

@interface DeviceSecurity :CDVPlugin

- (void)doesDeviceHaveSecuritySetup : (CDVInvokedUrlCommand*)command;

@end