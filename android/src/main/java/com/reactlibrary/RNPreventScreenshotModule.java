
package com.reactlibrary;

import android.app.Activity;
import android.view.WindowManager;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Promise;

public class RNPreventScreenshotModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;
    private final String ERROR_CODE_PREVENTION = "ERR_SCREEN_CAPTURE_PREVENTION";

    public RNPreventScreenshotModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "RNPreventScreenshot";
    }

    @ReactMethod
    public void preventScreenCapture(final Promise promise) {
        Activity activity = getCurrentActivity();
        activity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                try{
                    activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_SECURE);
                }
                catch(Exception exception){
                    promise.reject(ERROR_CODE_PREVENTION, "Failed to prevent screen capture: " + exception);
                }
                promise.resolve(null);
            }
        });
    }

    @ReactMethod
    public void enableScreenCapture(final Promise promise) {
        Activity activity = getCurrentActivity();
        activity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                try{
                    activity.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_SECURE);
                }
                catch(Exception exception){
                    promise.reject(ERROR_CODE_PREVENTION, "Failed to enable screen capture: " + exception);
                }
                promise.resolve(null);
            }
        });
    }

}