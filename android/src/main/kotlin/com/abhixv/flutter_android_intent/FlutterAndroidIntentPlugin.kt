package com.abhixv.flutter_android_intent

import android.app.Activity
import android.content.Intent
import android.net.Uri
import android.os.Build;
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class FlutterAndroidIntentPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    private lateinit var channel: MethodChannel
    private var activity: Activity? = null

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_android_intent")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            "getPlatformVersion" -> {
                result.success("Android " + Build.VERSION.RELEASE)
            }
            "launchUrl" -> {
                val url: String? = call.argument("url")
                if (url != null) {
                    val intent = Intent(Intent.ACTION_VIEW)
                    intent.data = Uri.parse(url)
                    activity?.startActivity(intent)
                    result.success(null)
                } else {
                    result.error("INVALID_ARGUMENT", "URL is required", null)
                }
            }
            "sendEmail" -> {
                val to: String? = call.argument("to")
                val subject: String? = call.argument("subject")
                val body: String? = call.argument("body")
                if (to != null) {
                    val intent = Intent(Intent.ACTION_SENDTO)
                    intent.data = Uri.parse("mailto:$to")
                    intent.putExtra(Intent.EXTRA_SUBJECT, subject)
                    intent.putExtra(Intent.EXTRA_TEXT, body)
                    activity?.startActivity(intent)
                    result.success(null)
                } else {
                    result.error("INVALID_ARGUMENT", "Email recipient is required", null)
                }
            }
            "openAppViaClassName" -> {
                val packageName: String? = call.argument("packageName")
                val className: String? = call.argument("className")
                if (className != null && packageName!=null) {
                    val intent = Intent()
                    intent.setClassName(packageName, className)
                    activity?.startActivity(intent)
                    result.success(null)
                } else {
                    result.error("INVALID_ARGUMENT", "Class name is required", null)
                }
            }

            else -> {
                result.notImplemented()
            }
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivity() {
        activity = null
    }
}
