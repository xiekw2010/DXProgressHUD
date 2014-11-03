//
//  SVProgressHUD.h
//
//  Created by Sam Vermette on 27.03.11.
//  Copyright 2011 Sam Vermette. All rights reserved.
//
//  https://github.com/samvermette/SVProgressHUD
//

#import <UIKit/UIKit.h>
#import <AvailabilityMacros.h>

extern NSString * const DXProgressHUDDidReceiveTouchEventNotification;
extern NSString * const DXProgressHUDWillDisappearNotification;
extern NSString * const DXProgressHUDDidDisappearNotification;
extern NSString * const DXProgressHUDWillAppearNotification;
extern NSString * const DXProgressHUDDidAppearNotification;

extern NSString * const DXProgressHUDStatusUserInfoKey;

enum {
    DXProgressHUDMaskTypeNone = 1, // allow user interactions while HUD is displayed
    DXProgressHUDMaskTypeClear, // don't allow
    DXProgressHUDMaskTypeBlack, // don't allow and dim the UI in the back of the HUD
    DXProgressHUDMaskTypeGradient // don't allow and dim the UI with a a-la-alert-view bg gradient
};

typedef NSUInteger DXProgressHUDMaskType;

typedef NS_ENUM(NSUInteger, DXProgressTranslucentStyle) {
    DXProgressTranslucentStyleWhite, //means background color white, and anything black
    DXProgressTranslucentStyleBlack, //means background color black, and anything white
};


@interface DXProgressHUD : UIView

#pragma mark - Customization

+ (void)setTranslucentStyle:(DXProgressTranslucentStyle)style;

+ (void)setRingThickness:(CGFloat)width; // default is 4 pt
+ (void)setFont:(UIFont*)font; // default is [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline]
+ (void)setSuccessImage:(UIImage*)image; // default is bundled success image from Glyphish
+ (void)setErrorImage:(UIImage*)image; // default is bundled error image from Glyphish

#pragma mark - Show Methods

+ (void)show;
+ (void)showWithMaskType:(DXProgressHUDMaskType)maskType;
+ (void)showWithStatus:(NSString*)status;
+ (void)showWithStatus:(NSString*)status maskType:(DXProgressHUDMaskType)maskType;

+ (void)showProgress:(float)progress;
+ (void)showProgress:(float)progress status:(NSString*)status;
+ (void)showProgress:(float)progress status:(NSString*)status maskType:(DXProgressHUDMaskType)maskType;

+ (void)setStatus:(NSString*)string; // change the HUD loading status while it's showing

// stops the activity indicator, shows a glyph + status, and dismisses HUD 1s later
+ (void)showSuccessWithStatus:(NSString*)string;
+ (void)showErrorWithStatus:(NSString *)string;
+ (void)showImage:(UIImage*)image status:(NSString*)status; // use 28x28 white pngs
+ (void)showImage:(UIImage *)image status:(NSString *)string duration:(NSTimeInterval)duration;
+ (void)setOffsetFromCenter:(UIOffset)offset;
+ (void)resetOffsetFromCenter;

+ (void)popActivity;
+ (void)dismiss;

+ (BOOL)isVisible;

@end
