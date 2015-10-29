//
//  ConfigView.h
//  ConfigJson
//
//  Created by yong on 29/10/15.
//  Copyright © 2015 yong. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ConfigModel.h"

@protocol RMTConfigDataDelegate <NSObject>

- (void)postConfigData:(RMTConfigComponent*)data withTag:(int)tag;

@end

@interface ConfigView : NSViewController

@property (nonatomic, assign) id<RMTConfigDataDelegate>delegate;
@property (nonatomic, assign) int tag;

- (instancetype)initWithTag:(int)tag;

@end
