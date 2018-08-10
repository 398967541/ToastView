//
//  ToastView.h
//  ToastViewApp
//
//  Created by Rahul Gupta on 25/04/15.
//  Copyright (c) 2015 iSync India. All rights reserved.
//

#import <UIKit/UIKit.h>
 
@interface ToastView : UIView

@property (nonatomic, strong) NSTimer *timerToast;
@property (nonatomic, strong) UILabel *toastLabel;
+ (ToastView *)getInstance;
- (void) displayToastWithMessage:(NSString *) message;
- (void) close;
@end

@interface NSString (StringToast)

- (CGRect)textRectWithFontSize:(CGFloat)size andMaxWidth:(CGFloat)maxWidth andMaxHeight:(CGFloat)maxHeight;

@end
