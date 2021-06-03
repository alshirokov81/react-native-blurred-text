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

RCT_CUSTOM_VIEW_PROPERTY(textVal, NSString, UILabel)
{
  view.text = json;
}

RCT_CUSTOM_VIEW_PROPERTY(blurrVal, NSString, BlurredUILabel)
{
  //view.text = json;
  //view.blur(radius: 9)
  view.blurRadius = [json floatValue];
}

RCT_CUSTOM_VIEW_PROPERTY(textSize, NSString, UILabel)
{
    view.font = [UIFont systemFontOfSize:[json floatValue]];
}

RCT_CUSTOM_VIEW_PROPERTY(textColor, UIColor, UILabel)
{
    view.textColor = json ? [RCTConvert UIColor:json] : defaultView.textColor;
}

@end
