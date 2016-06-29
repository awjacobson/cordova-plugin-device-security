# Device Security Cordova Plugin

This plugin defines a global `deviceSecurity` object whic
Although the object is in the global scope, it is not available until after the `deviceready` event.

```js
document.addEventListener("deviceready", onDeviceReady, false);
function onDeviceReady() {
    deviceSecurity.doesHaveSecuritySetup(
        function(data) { console.log(`Success: ${data}`); },
        function(error) { console.log(`Failed: ${error}`); });
}
```

## Installation

    cordova plugin add https://github.com/awjacobson/cordova-plugin-device-security.git

### Supported Platforms

- Android API 16
- iOS 8