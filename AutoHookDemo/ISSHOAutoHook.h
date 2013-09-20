//
//  ISSHOAutoHook.h
//
//
//  Created by ISSHO on 2013/08/06.
//  Copyright (c) 2013年 ISSHO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ISSHOAutoHook : NSObject
@end

@interface NSObject(ISSHOAutoHook)
-(void)awakeFromNibWithAutoHook;
@end