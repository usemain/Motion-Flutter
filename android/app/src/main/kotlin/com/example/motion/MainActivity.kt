package com.example.motion

import android.app.Activity
import android.os.Bundle
import android.view.WindowManager
import androidx.core.view.WindowCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val Name: String = "motion/messageChannel"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // 确保APP窗口区域延伸到屏幕底部
        window.setFlags(
            WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS,
            WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS
        )
        // 设置透明状态栏和导航栏
        this.transparentStatusAndNavigation()
    }

    // 返回
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger, Name
        ).setMethodCallHandler { call, result ->
            if (call.method == "backDesktop") {
                moveTaskToBack(false)
                result.success(null)
            } else {
                result.notImplemented()
            }
        }
    }
}

fun Activity.transparentStatusAndNavigation() {
    WindowCompat.getInsetsController(window, window.decorView)?.let { controller ->
        controller.isAppearanceLightStatusBars = true
        controller.isAppearanceLightNavigationBars = true
    }
}
