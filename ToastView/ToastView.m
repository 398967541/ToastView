//
//  ToastView.m
//  ToastViewApp
//
//  Created by Rahul Gupta on 25/04/15.
//  Copyright (c) 2015 Sync India. All rights reserved.
//

#define ToastPadding    20
#define ToastMaxHeight   ([UIScreen mainScreen].bounds.size.height)/2
#define ToastMaxWidth   ([UIScreen mainScreen].bounds.size.width) - (ToastPadding * 2)
#define ToastMinHeight  30.0
 //([UIScreen mainScreen].applicationFrame.size.height)/2
#define ToastDelayTime  4.0
#define ToastFontSize   16.0
#define ToastTextFont   [UIFont systemFontOfSize:16.0]
#define ToastTextcolor   [UIColor whiteColor]
#define ToastBackgroundColor    [UIColor darkGrayColor]

#import "ToastView.h"
//#import <QuartzCore/QuartzCore.h>
 @implementation ToastView
@synthesize timerToast;
@synthesize toastLabel;

static ToastView *toast = nil;

+ (ToastView *) getInstance
{
    
    
    
    static ToastView *tostview = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        tostview = [[self alloc]init];
        [tostview initToast];

    });
    return tostview;
    

}

- (void) initToast
{
    [self createLabelForToast];
    [self addSubview:toastLabel];
}

- (void) displayToastWithMessage:(NSString *) message
{
    
    if ([UserDefautManager gettostID]) {
        
        [UserDefautManager savetostID:NO];
        
        if (!message || ([message isEqualToString:@""])||([message isEqual:[NSNull null]]))
        {
            message = @"Invalid Message For Toast";
        }
        CGRect rect = [message textRectWithFontSize:ToastFontSize andMaxWidth:ToastMaxWidth andMaxHeight:ToastMaxHeight];
        CGFloat width = rect.size.width + ToastPadding;
        CGFloat height = rect.size.height + ToastPadding;
        CGRect aRect = CGRectMake(0, 0, width, height);
        self.frame = CGRectMake((([UIScreen mainScreen].bounds.size.width)-width)/2, (([UIScreen mainScreen].bounds.size.height)-height)/2, width, height);
        self.userInteractionEnabled = NO;
        toastLabel.frame = aRect;
        toastLabel.text = message;
        
        [self fadeIn];
        [self performSelector:@selector(close) withObject:self afterDelay:1.8];
        
        //    timerToast = [NSTimer scheduledTimerWithTimeInterval:ToastDelayTime target:self selector:@selector(close) userInfo:nil repeats:NO];
    }else{
        
    }
    

 
 
}
 

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    [self close];
}

-(void) fadeOut
{
    
    [UIView animateWithDuration:1.0 animations:^{
        self.alpha = 0.0;
    }completion:^(BOOL finished){
        [self removeFromSuperview];
        [UserDefautManager savetostID:YES];

    }];
}
-(void)removetost
{
    [self removeFromSuperview];

}
-(void) fadeIn
{
    [self setAlpha:0.0];
    UIWindow *window = [UIApplication sharedApplication].windows.firstObject;
    [window addSubview:self];
    [window bringSubviewToFront:self];
    
    [UIView beginAnimations: @"Fade In" context:nil];
    // wait for time before begin
    [UIView setAnimationDelay:0];
    // druation of animation
    [UIView setAnimationDuration:0.5];
    self.alpha = 1;
    [UIView commitAnimations];
}

- (void) createLabelForToast
{
	toastLabel = [[UILabel alloc] init];
    toastLabel.userInteractionEnabled = NO;
    toastLabel.alpha = 0.9;
    [toastLabel setText:@""];
    [toastLabel setFont:ToastTextFont];
    [toastLabel setTextColor:ToastTextcolor];
    [toastLabel setBackgroundColor:ToastBackgroundColor];
    [toastLabel setAdjustsFontSizeToFitWidth:NO];
    [toastLabel setNumberOfLines:50];
	[toastLabel setTextAlignment:NSTextAlignmentCenter];
    [toastLabel.layer setBorderColor: ToastBackgroundColor.CGColor];
    [toastLabel.layer setBorderWidth: 0.4];
    [toastLabel.layer setMasksToBounds:YES];
    [toastLabel.layer setCornerRadius:4.0];
}

- (void) close
{
    [self.timerToast invalidate];
    self.timerToast = nil;
    [self fadeOut];
}

@end

@implementation NSString (StringToast)

#pragma mark - For Text Rect
- (CGRect)textRectWithFontSize:(CGFloat)size andMaxWidth:(CGFloat)maxWidth andMaxHeight:(CGFloat)maxHeight
{
	CGSize maximumLabelSize = CGSizeMake(maxWidth, maxHeight);
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont fontWithName:@"Helvetica Neue" size:size]};
    CGRect expectedLabelSize = [self boundingRectWithSize:maximumLabelSize options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:attributes context:nil];
    return expectedLabelSize;
}

@end
