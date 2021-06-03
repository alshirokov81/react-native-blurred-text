#import "BlurredUILabel.h"

@implementation BlurredUILabel

- (void)setText:(NSString *)text {
    super.text = text;
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [[UIScreen mainScreen] scale]);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CIFilter *blurFilter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [blurFilter setDefaults];
    
    CIImage *imageToBlur = [CIImage imageWithCGImage: image.CGImage];
    
    [blurFilter setValue:imageToBlur forKey:kCIInputImageKey];
    [blurFilter setValue:@(self.blurRadius) forKey:@"inputRadius"];

    CIImage *outputImage = blurFilter.outputImage;
    CIContext *context = [CIContext contextWithOptions:nil];
    CGRect cropRect2 = CGRectMake(0, 0, self.bounds.size.width*3, self.bounds.size.height * 2);
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:cropRect2];

    [self.layer setContents:(__bridge id)cgimg];
    CGImageRelease(cgimg);
}

@end
