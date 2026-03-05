package com.ohaola.sdk.flutter.ohlcommonlib;

import com.ohaola.sdk.tool.wrapper.MobSDK;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/**
 * MobcommonlibPlugin
 */
public class OHLcommonlibPlugin implements FlutterPlugin, MethodCallHandler {

	private MethodChannel channel;

	@Override
	public void onAttachedToEngine(FlutterPluginBinding flutterPluginBinding) {
		channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "com.ohaola.sdk.ohlcommonlib");
		channel.setMethodCallHandler(this);
	}

	@Override
	public void onMethodCall(MethodCall call, Result result) {
		if (call.method.equals("getPlatformVersion")) {
			result.success("Android " + android.os.Build.VERSION.RELEASE);
		} else if (call.method.equals("submitPolicyGrantResult")) {
			boolean granted = call.argument("granted");
			OHLCommonLog.d("granted: " + granted);
			MobSDK.submitPolicyGrantResult(granted);
		} else {
			result.notImplemented();
		}
	}

	@Override
	public void onDetachedFromEngine(FlutterPluginBinding binding) {
		channel.setMethodCallHandler(null);
	}
}
