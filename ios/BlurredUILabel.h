#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BlurredUILabel : UILabel
@property (nonatomic, readwrite) IBInspectable NSString * textForBlur;
@property (nonatomic, readwrite) IBInspectable BOOL isDisplayed;
@property (nonatomic, readwrite) IBInspectable BOOL initStarted;
@property (nonatomic, readwrite) IBInspectable CGFloat blurRadius;
- (void)blurryText;
@end
