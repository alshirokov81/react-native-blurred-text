#import "BlurredUILabel.h"
#import <React/RCTViewManager.h>

@interface BlurredTextViewManager : RCTViewManager
@end

@implementation BlurredTextViewManager


RCT_EXPORT_MODULE(BlurredTextView)

- (UILabel *)view
{
    BlurredUILabel *label = [[BlurredUILabel alloc] init];
    
    return label;
}

RCT_CUSTOM_VIEW_PROPERTY(value, NSString, UILabel)
{
  view.text = json;
}

RCT_CUSTOM_VIEW_PROPERTY(blurr, NSString, BlurredUILabel)
{
  view.blurRadius = [json floatValue];
}

RCT_CUSTOM_VIEW_PROPERTY(fontSize, NSString, UILabel)
{
    view.font = [UIFont systemFontOfSize:[json floatValue]];
    [UIFont fontWithName:view.font.fontName size:[json floatValue]];
}

RCT_CUSTOM_VIEW_PROPERTY(color, UIColor, UILabel)
{
    view.textColor = json ? [RCTConvert UIColor:json] : defaultView.textColor;
}

RCT_CUSTOM_VIEW_PROPERTY(fontFamily, NSString, UILabel)
{
    view.font = [UIFont fontWithName:json size:view.font.pointSize];
}

@end
