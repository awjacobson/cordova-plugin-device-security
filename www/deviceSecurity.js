var exec = require('cordova/exec'),
	deviceSecurity = {
		/**
		 * Checks to see if the lock screen is setup with PIN, password, etc.
		 *
		 * @param {Function} successCallback The function to call when security data is available
		 * @param {Function} errorCallback The function to call when there is an error getting the security data. (OPTIONAL)
		 */
		doesHaveSecuritySetup:function(successCallback, errorCallback) {
			exec(successCallback, errorCallback, "DeviceSecurity", "doesDeviceHaveSecuritySetup", []);
		}
	}
module.exports = deviceSecurity;