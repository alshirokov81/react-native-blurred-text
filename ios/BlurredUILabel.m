#import "BlurredUILabel.h"

@implementation BlurredUILabel

- (void)blurryText {
    if (self.isDisplayed == false && self.initStarted == false) {
        self.initStarted = true;
        dispatch_async(dispatch_get_main_queue(), ^{
          [self setBlurryText];
        });
    } else if (self.isDisplayed == true && self.initStarted == true) {
        [self setBlurryText];
    }
}

- (void)setBlurryText {
    self.isDisplayed = true;
    self.text = self.textForBlur;
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [[UIScreen mainScreen] scale]);
    
    [self.layer renderInContext: UIGraphicsGetCurrentContext()];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CIFilter * gaussianBlurFilter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [gaussianBlurFilter setDefaults];
    CIImage * inputImage = [CIImage imageWithCGImage:[image CGImage]];
    [gaussianBlurFilter setValue:inputImage forKey:kCIInputImageKey];
    [gaussianBlurFilter setValue:@(self.blurRadius) forKey:kCIInputRadiusKey];
    CIImage * outputImage = [gaussianBlurFilter outputImage];
    CIContext * context = [CIContext contextWithOptions:nil];
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[inputImage extent]];
    [self.layer setContents:(__bridge id)cgimg];
    CGImageRelease(cgimg);
}
@end
