package jp.packages.native_webview

import android.content.Context
import android.view.View
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class FlutterWebViewFactory(
    private val messenger: BinaryMessenger
) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context, viewId: Int, args: Any): PlatformView {
        val channel = MethodChannel(messenger, "packages.jp/native_webview_$viewId")

        return FlutterWebViewController(
            context,
            channel,
            args as Map<String, Any>
        )
    }
}