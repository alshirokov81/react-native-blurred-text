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

    @ReactProp(name="textVal")
    public void setText(BlurredTextView blurredTextView, String textVal){
      blurredTextView.setTextValue(textVal);
    }

    @ReactProp(name="textColor", customType = "Color")
    public void setTextColor(BlurredTextView blurredTextView, int color){
      blurredTextView.setTextColor(color);
    }

    @ReactProp(name="textSize")
    public void setTextSize(BlurredTextView blurredTextView, int textSize){
      blurredTextView.setTextSize(textSize);
    }

    @ReactProp(name="blurrVal")
    public void setBlurr(BlurredTextView blurredTextView, float blurrVal){
      blurredTextView.setBlurrRadius(blurrVal);
    }
}
