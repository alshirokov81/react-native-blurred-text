package com.reactnativeblurredtext;

import android.graphics.Color;
import android.view.View;
import android.widget.TextView;

import androidx.annotation.NonNull;

import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.annotations.ReactProp;

public class BlurredTextViewManager extends SimpleViewManager<View> {
    public static final String REACT_CLASS = "BlurredTextView";

    @Override
    @NonNull
    public String getName() {
        return REACT_CLASS;
    }

    @Override
    @NonNull
    public View createViewInstance(ThemedReactContext reactContext) {
        return new BlurredTextView(reactContext);
    }

    @ReactProp(name="value")
    public void setText(BlurredTextView blurredTextView, String value){
      blurredTextView.setTextValue(value);
    }

    @ReactProp(name="color", customType = "Color")
    public void setTextColor(BlurredTextView blurredTextView, int color){
      blurredTextView.setTextColor(color);
    }

    @ReactProp(name="fontSize")
    public void setTextSize(BlurredTextView blurredTextView, int fontSize){
      blurredTextView.setTextSize(fontSize);
    }

    @ReactProp(name="fontFamily")
    public void setTextSize(BlurredTextView blurredTextView, String fontFamily){
      blurredTextView.setFontFamily(fontFamily);
    }

    @ReactProp(name="blurr")
    public void setBlurr(BlurredTextView blurredTextView, float blurr){
      blurredTextView.setBlurrRadius(blurr);
    }
}
