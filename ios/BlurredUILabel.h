#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BlurEffectWithAmount.h"

@interface BlurredUIView : UIView
@property (nonatomic, readwrite) IBInspectable NSString *textForBlur;
@property (nonatomic, readwrite) IBInspectable UIColor *textColor;
@property (nonatomic, readwrite) IBInspectable CGFloat blurRadius;
@property (nonatomic, readwrite) IBInspectable NSString *fontFamily;
@property (nonatomic, readwrite) IBInspectable CGFloat fontSize;
@property (nonatomic, strong, nullable) BlurEffectWithAmount *blurEffect;
@property (nonatomic, strong, nullable) UIView *reducedTransparencyFallbackView;
@property (nonatomic, strong, nullable) UIVisualEffectView *blurEffectView;
@property (nonatomic, copy, nullable) NSNumber *blurAmount;
@property (nonatomic, copy, nullable) NSString *blurType;
@property (nonatomic, copy, nullable) UILabel *textLabel;

- (void)updateBlurEffect;
- (BOOL)useReduceTransparencyFallback;
- (void)blurryText;
@end
