package org.apache.cordova.devicesecurity

import org.apache.cordova.CordovaPlugin;
import android.app.KeyguardManager

public class DeviceSecurity extends CordovaPlugin
{
	/**
	 * <p>Checks to see if the lock screen is set up with either a PIN / PASS / PATTERN</p>
	 *
	 * <p>For Api 16+</p>
	 *
	 * @return true if PIN, PASS or PATTERN set, false otherwise.
	 */
	public static boolean doesDeviceHaveSecuritySetup(Context context)
	{
	    KeyguardManager keyguardManager = (KeyguardManager) context.getSystemService(Context.KEYGUARD_SERVICE); //api 16+

	    // https://developer.android.com/reference/android/app/KeyguardManager.html#isKeyguardSecure()
	    // http://stackoverflow.com/a/27801128
	    return keyguardManager.isKeyguardSecure();
	}
}