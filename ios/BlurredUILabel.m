#import "BlurredUILabel.h"
#import "BlurEffectWithAmount.h"
#import "React/UIView+React.h"

@implementation BlurredUIView

- (void)reactSetFrame:(CGRect)frame {
    [super reactSetFrame: frame];
    
    CGRect newFrame = self.subviews[0].frame;
    newFrame.size.width = frame.size.width;
    newFrame.size.height = frame.size.height;
    [self.subviews[0] setFrame:newFrame];
    /* everytime content size changes, you will get its frame here. */
}

- (void)blurryText {
    
    [self.subviews[0] setText: self.textForBlur];
    [self.subviews[0] setColor: self.textColor];
    [self.subviews[0] setFont:[UIFont fontWithName:self.fontFamily size:self.fontSize]];
    
    CGRect newFrame = self.subviews[0].frame;
    newFrame.size.width = self.bounds.size.width;
    newFrame.size.height = self.bounds.size.height;
    [self.subviews[0] setFrame:newFrame];
    
    CGRect newFrame2 = self.subviews[1].frame;
    [self.blurEffectView removeFromSuperview];
    self.blurEffectView = [[UIVisualEffectView alloc] init];
    self.blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.blurEffectView.frame = newFrame2;

    self.reducedTransparencyFallbackView = [[UIView alloc] init];
    self.reducedTransparencyFallbackView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.reducedTransparencyFallbackView.frame = newFrame2;
      
    
    self.blurAmount = @(self.blurRadius);
    [self updateBlurEffect];
    self.clipsToBounds = true;
    [self updateFallbackView];
    [self addSubview:self.blurEffectView];
}

- (void)updateFallbackView
{

    if ([self.subviews containsObject:self.reducedTransparencyFallbackView]) {
      [self.reducedTransparencyFallbackView removeFromSuperview];
    }

    if (![self.subviews containsObject:self.blurEffectView]) {
      [self insertSubview:self.blurEffectView atIndex:0];
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    UILabel *yourLabel = [[UILabel alloc] init];
    [self addSubview:yourLabel];

      
    self.blurEffectView = [[UIVisualEffectView alloc] init];
    self.blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.blurEffectView.frame = frame;

    self.reducedTransparencyFallbackView = [[UIView alloc] init];
    self.reducedTransparencyFallbackView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.reducedTransparencyFallbackView.frame = frame;
      
    self.blurAmount = @(self.blurRadius);
    [self updateBlurEffect];
    [self updateFallbackView];

    self.clipsToBounds = true;
    [self addSubview:self.blurEffectView];

  }
  return self;
}

- (void)updateBlurEffect
{
  UIBlurEffectStyle style = UIBlurEffectStyleLight;
  self.blurEffect = [BlurEffectWithAmount effectWithStyle:style andBlurAmount:self.blurAmount];
  self.blurEffectView.effect = self.blurEffect;
}

@end
