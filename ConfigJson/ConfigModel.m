//
//  ConfigModel.m
//  ConfigJson
//
//  Created by yong on 28/10/15.
//  Copyright © 2015 yong. All rights reserved.
//

#import "ConfigModel.h"


@implementation RMTGameConfigModel
+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}

@end

@implementation RMTConfigComponent

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}


@end

@implementation RMTGameDesConfig

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}


@end

@implementation RMTGameInfoConfig

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}


@end