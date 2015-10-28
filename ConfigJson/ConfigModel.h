//
//  ConfigModel.h
//  ConfigJson
//
//  Created by yong on 28/10/15.
//  Copyright © 2015 yong. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JSONModel.h"

@interface ConfigModel : NSObject

@end

@interface RMTConfigComponent : JSONModel
@property (nonatomic, assign) BOOL show;
@property (nonatomic, assign) float centerX;
@property (nonatomic, assign) float centerY;
@property (nonatomic, assign) float sizeW;
@property (nonatomic, assign) float sizeH;
@property (nonatomic, strong) NSString *normollStr;
@property (nonatomic, strong) NSString *HeightStr;
@property (nonatomic, assign) float alpha;
@property (nonatomic, assign) BOOL sound;
@end
