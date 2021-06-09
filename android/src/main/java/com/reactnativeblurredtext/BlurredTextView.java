package com.reactnativeblurredtext;

import android.content.Context;
import android.graphics.BlurMaskFilter;
import android.graphics.Typeface;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.MaskFilterSpan;

public class BlurredTextView extends androidx.appcompat.widget.AppCompatTextView {
    private Float blurrRadius = 1f;
    private String textValue = "";

    public BlurredTextView(Context context) {
        super(context);
    }

    public void setBlurrRadius(Float radius){
        blurrRadius = radius;
        setBlurredText();
    }

    public void setTextValue(String textVal){
        textValue = textVal;
        setBlurredText();
    }

    public void setTextColor(Integer textColor){
        setTextColor(textColor);
    }

    public void setTextSize(Integer textSize){
        setTextSize(textSize);
    }

    public void setFontFamily(String fontFamily){
        Typeface typeface = Typeface.create(fontFamily, 0);
        setTypeface(typeface);
    }

    public void setBlurredText(){
        SpannableStringBuilder mSSBuilder;
        mSSBuilder = new SpannableStringBuilder(textValue);
        BlurMaskFilter blurMaskFilter = new BlurMaskFilter(
                blurrRadius,
                BlurMaskFilter.Blur.NORMAL
        );
        MaskFilterSpan blurMaskFilterSpan = new MaskFilterSpan(blurMaskFilter);
        mSSBuilder.setSpan(
                blurMaskFilterSpan,
                0,
                textValue.length(),
                Spanned.SPAN_EXCLUSIVE_EXCLUSIVE
        );
        setText(mSSBuilder);
    }

}
