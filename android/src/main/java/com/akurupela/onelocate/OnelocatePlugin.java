package com.akurupela.onelocate;

import android.content.Context;
import android.os.Handler;
import android.os.StrictMode;

import androidx.annotation.NonNull;

import org.json.JSONObject;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** OnelocatePlugin */
public class OnelocatePlugin  implements FlutterPlugin, MethodCallHandler , ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;

  private ActivityPluginBinding activityBinding;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "onelocate");
    channel.setMethodCallHandler(this);
  }


  @Override
  public void  onDetachedFromActivity() {}

  @Override
  public void  onReattachedToActivityForConfigChanges(ActivityPluginBinding binding) {}

  @Override
  public void  onAttachedToActivity(ActivityPluginBinding binding) {
    activityBinding = binding;
  }

  @Override
  public void  onDetachedFromActivityForConfigChanges() {}

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (android.os.Build.VERSION.SDK_INT > 9) {
      StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
      StrictMode.setThreadPolicy(policy);
    }
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } if (call.method.equals("getLocation")) {
      Map<String, String> retMap = new HashMap<String, String>();
      Handler handler = new Handler();
      handler.post(new Runnable() {
        public void run() {
          try{
          URL url = null;
          try {
            url = new URL("http://ip-api.com/json");
          } catch (MalformedURLException e) {
            throw new RuntimeException(e);
          }
          HttpURLConnection urlConnection = null;
          try {
            urlConnection = (HttpURLConnection) url.openConnection();
          } catch (IOException e) {
            throw new RuntimeException(e);
          }
          try {
              InputStream in = new BufferedInputStream(urlConnection.getInputStream());
              BufferedReader rd = new BufferedReader(new InputStreamReader(in));
              String content = "", line;
              while ((line = rd.readLine()) != null) {
                content += line + "\n";
              }
              JSONObject obj = new JSONObject(content);
              retMap.put("country",obj.getString("country"));
              retMap.put("countryCode",obj.getString("countryCode"));
              retMap.put("city",obj.getString("city"));
              retMap.put("zip",obj.getString("zip"));
              retMap.put("lat",obj.getString("lat"));
              retMap.put("lon",obj.getString("lon"));
              result.success(retMap);
            } catch (Exception e){
              result.success(null);
            }
            finally {
              urlConnection.disconnect();
            }
          }catch (Exception e){}
        }});

    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
