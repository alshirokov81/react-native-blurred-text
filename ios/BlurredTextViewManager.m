#import "BlurredUILabel.h"
#import <React/RCTViewManager.h>

@interface BlurredTextViewManager : RCTViewManager
@end

@implementation BlurredTextViewManager


RCT_EXPORT_MODULE(BlurredTextView)

- (UIView *)view
{
    return [[BlurredUIView alloc] init];
}

RCT_CUSTOM_VIEW_PROPERTY(value, NSString, BlurredUIView)
{
  view.textForBlur = json;
  [view blurryText];
}

RCT_CUSTOM_VIEW_PROPERTY(blurr, NSString, BlurredUIView)
{
  view.blurRadius = [json floatValue];
  [view blurryText];
}

RCT_CUSTOM_VIEW_PROPERTY(fontSize, NSString, BlurredUIView)
{
    view.fontSize = [json floatValue];
    [view blurryText];
}

RCT_CUSTOM_VIEW_PROPERTY(color, UIColor, BlurredUIView)
{
    view.textColor = json ? [RCTConvert UIColor:json] : defaultView.textColor;
    [view blurryText];
}

RCT_CUSTOM_VIEW_PROPERTY(fontFamily, NSString, BlurredUIView)
{
    view.fontFamily = json;
    [view blurryText];
}

@end
