//
//  ISSHOAutoGuide.m
//
//
//  Created by ISSHO on 2013/08/06.
//  Copyright (c) 2013年 ISSHO. All rights reserved.
//

#import "ISSHOAutoHook.h"
#import "MethodSwizzling.h"
#import "TouchDownGestureRecognizer.h"
#import "AppDelegate.h"

#import <objc/runtime.h>

@implementation ISSHOAutoHook

// loadメソッドを自動差し替えする
// Override load method
+(void)load {
    Method awakeFromNibWithAutoHook = class_getInstanceMethod([NSObject class], @selector(awakeFromNibWithAutoHook));
    Method awakeFromNib = class_getInstanceMethod([NSObject class], @selector(awakeFromNib));
    method_exchangeImplementations(awakeFromNib, awakeFromNibWithAutoHook);
}

@end

@implementation NSObject(ISSHOAutoHook)

-(void)awakeFromNibWithAutoHook
{
    if( [self isKindOfClass:[UIControl class]] == YES ){
        //LOG(@"CLASS:[%@] SUPERCLASS:[%@]",className, superClassName);
        const UIControl* control = (UIControl*)self;

		TouchDownGestureRecognizer *touchDownGesture = [[TouchDownGestureRecognizer alloc]
											  initWithTarget:self action:@selector(touchDownGesture:)];
		touchDownGesture.cancelsTouchesInView = NO;
        [control addGestureRecognizer:touchDownGesture];

    }
}

-(void)touchDownGesture:(UITapGestureRecognizer*)sender
{
	if( sender.state == UIGestureRecognizerStateRecognized){
		[self interceptAction:sender];
	}
}

// Replace touch method of the UIControl
// UIControlのタッチメソッド直前に処理を差し込む
-(void)interceptAction:(id)sender
{
	id senderView = ((UIGestureRecognizer*)sender).view;
	
	// Excluded other class than a derivation type of UIControl.
    // UIControlの派生型以外は除外する
    if( [senderView isKindOfClass:[UIControl class]] == NO ){
        return;
    }

    const UIControl* control = (UIControl*)self;
    if( [control respondsToSelector:NSSelectorFromString(@"allTargets")] == YES ){
        NSSet* targetSet = [control allTargets];
		id tracker = [GAI sharedInstance].defaultTracker;
		
        for(id target in targetSet){
            UIControlEvents fetchEvent = UIControlEventTouchCancel;
            while( fetchEvent != 0 ){
                NSArray *selectors = [control actionsForTarget:target forControlEvent:fetchEvent];
                for(NSString* selector in selectors ){
                    NSString* keyName = [NSString stringWithFormat:@"%@.%@",
                                         NSStringFromClass([target class]), selector];

					// Send Google Analytics event.
					// Google Analyticsのイベント送信
                    LOG(@"Send action:[%@]",keyName);
					[tracker sendEventWithCategory:NSStringFromClass([target class])
										   withAction:selector
										 withLabel:NSStringFromClass([control class])
										 withValue:[NSNumber numberWithInt:0]];
                }
				
				// Handled by from UIControlEventTouchCancel to UIControlEventTouchDown with bit shift.
                // 1bitずつビットシフトしてUIControlEventTouchCancelからUIControlEventTouchDownまでを処理する
                fetchEvent >>= 1;
            }
        }
    }
}
@end
