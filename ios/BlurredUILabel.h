#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BlurredUILabel : UILabel

@property (nonatomic, readwrite) IBInspectable CGFloat blurRadius;
-(UIImage *)getBlurryImageText;
- (void)blurryText;
@end