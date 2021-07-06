#import "BlurredUILabel.h"
#import <React/RCTViewManager.h>

@interface BlurredTextViewManager : RCTViewManager
@end

@implementation BlurredTextViewManager


RCT_EXPORT_MODULE(BlurredTextView)

- (UILabel *)view
{
    return [[BlurredUILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
}

RCT_CUSTOM_VIEW_PROPERTY(value, NSString, BlurredUILabel)
{
  //view.text = json;
  view.textForBlur = json;
  [view blurryText];
}

RCT_CUSTOM_VIEW_PROPERTY(blurr, NSString, BlurredUILabel)
{
  view.blurRadius = [json floatValue];
  [view blurryText];
}

RCT_CUSTOM_VIEW_PROPERTY(fontSize, NSString, BlurredUILabel)
{
    view.font = [UIFont systemFontOfSize:[json floatValue]];
    [view blurryText];
}

RCT_CUSTOM_VIEW_PROPERTY(color, UIColor, BlurredUILabel)
{
    view.textColor = json ? [RCTConvert UIColor:json] : defaultView.textColor;
    [view blurryText];
}

RCT_CUSTOM_VIEW_PROPERTY(fontFamily, NSString, BlurredUILabel)
{
    view.font = [UIFont fontWithName:json size:view.font.pointSize];
    [view blurryText];
}

@end
