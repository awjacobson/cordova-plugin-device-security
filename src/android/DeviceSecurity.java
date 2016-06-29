package org.apache.cordova.devicesecurity;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.PluginResult;
import org.json.JSONArray;
import android.app.KeyguardManager;
import android.content.Context;

public class DeviceSecurity extends CordovaPlugin
{
	/**
     * Executes the request and returns PluginResult.
     *
     * @param action                The action to execute.
     * @param args          	    JSONArry of arguments for the plugin.
     * @param callbackS=Context     The callback id used when calling back into JavaScript.
     * @return              	    True if the action was valid.
     * @throws JSONException 
     */
	@Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException
    {
        if (action.equals("doesDeviceHaveSecuritySetup"))
        {
        	Context context = this.cordova.getActivity();
        	bool isSetup = this.doesDeviceHaveSecuritySetup(context);
        	callbackContext.success(message);
        	callbackContext.sendPluginResult(new PluginResult(PluginResult.Status.OK, isSetup));
        	return true;
        }
        return false; // Returning false results in a "MethodNotFound" error.
    }

	/**
	 * <p>Checks to see if the lock screen is set up with either a PIN / PASS / PATTERN</p>
	 *
	 * <p>For Api 16+</p>
	 *
	 * @return true if PIN, PASS or PATTERN set, false otherwise.
	 */
	public boolean doesDeviceHaveSecuritySetup(Context context)
	{
	    KeyguardManager keyguardManager = (KeyguardManager) context.getSystemService(Context.KEYGUARD_SERVICE); //api 16+

	    // https://developer.android.com/reference/android/app/KeyguardManager.html#isKeyguardSecure()
	    // http://stackoverflow.com/a/27801128
	    return keyguardManager.isKeyguardSecure();
	}
}