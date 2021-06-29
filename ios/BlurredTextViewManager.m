#import "BlurredUILabel.h"
#import <React/RCTViewManager.h>

@interface BlurredTextViewManager : RCTViewManager
@end

@implementation BlurredTextViewManager


RCT_EXPORT_MODULE(BlurredTextView)
BlurredUILabel *label;
UIImageView *imageView;

- (UILabel *)view
{
    label = [[BlurredUILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [label blurryText];
    return label;
}

RCT_CUSTOM_VIEW_PROPERTY(value, NSString, UILabel)
{
  view.text = json;
  [label blurryText];
}

RCT_CUSTOM_VIEW_PROPERTY(blurr, NSString, BlurredUILabel)
{
  view.blurRadius = [json floatValue];
  [label blurryText];
}

RCT_CUSTOM_VIEW_PROPERTY(fontSize, NSString, UILabel)
{
    view.font = [UIFont systemFontOfSize:[json floatValue]];
    [label blurryText];
}

RCT_CUSTOM_VIEW_PROPERTY(color, UIColor, UILabel)
{
    view.textColor = json ? [RCTConvert UIColor:json] : defaultView.textColor;
    [label blurryText];
}

RCT_CUSTOM_VIEW_PROPERTY(fontFamily, NSString, UILabel)
{
    view.font = [UIFont fontWithName:json size:view.font.pointSize];
    [label blurryText];
}

@end
