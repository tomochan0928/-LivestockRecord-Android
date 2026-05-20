# WebView rules
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}
-keepattributes JavascriptInterface
-keepattributes *Annotation*

# AppCompat
-keep class androidx.appcompat.** { *; }
-keep class com.google.android.material.** { *; }
