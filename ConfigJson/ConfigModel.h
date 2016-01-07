//
//  ConfigModel.h
//  ConfigJson
//
//  Created by yong on 28/10/15.
//  Copyright © 2015 yong. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JSONModel.h"

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

@protocol RMTConfigComponent <NSObject>
@end
@interface RMTGameDesConfig : JSONModel
@property (nonatomic, strong) RMTConfigComponent *aBt;
@property (nonatomic, strong) RMTConfigComponent *bBt;
@property (nonatomic, strong) RMTConfigComponent *cBt;
@property (nonatomic, strong) RMTConfigComponent *dBt;
@property (nonatomic, strong) RMTConfigComponent *eBt;
@property (nonatomic, strong) RMTConfigComponent *fBt;
@property (nonatomic, strong) RMTConfigComponent *gBt;
@property (nonatomic, strong) RMTConfigComponent *hBt;

@property (nonatomic, strong) RMTConfigComponent *iBt;
@property (nonatomic, strong) RMTConfigComponent *jBt;
@property (nonatomic, strong) RMTConfigComponent *kBt;
@property (nonatomic, strong) RMTConfigComponent *lBt;
@property (nonatomic, strong) RMTConfigComponent *mBt;
@property (nonatomic, strong) RMTConfigComponent *nBt;
@property (nonatomic, strong) RMTConfigComponent *oBt;
@property (nonatomic, strong) RMTConfigComponent *pBt;





@property (nonatomic, strong) RMTConfigComponent *archeryView;
@property (nonatomic, strong) RMTConfigComponent *padControll;
@property (nonatomic, strong) RMTConfigComponent *backgroundImageView;
@property (nonatomic, strong) RMTConfigComponent *angryBotsLeftView;
@property (nonatomic, strong) RMTConfigComponent *angryBotsRightView;
@property (nonatomic, strong) RMTConfigComponent *leftOneBt;
@property (nonatomic, strong) RMTConfigComponent *leftTwoBt;
@property (nonatomic, strong) RMTConfigComponent *controlDirectionImage;
@end

@protocol RMTGameDesConfig <NSObject>
@end
@interface RMTGameInfoConfig : JSONModel
@property (nonatomic, strong) NSString *packageName;
@property (nonatomic, assign) BOOL gyroscopeEnabled;
@property (nonatomic, assign) BOOL accelerometerEnabled;
@property (nonatomic, assign) BOOL bluetoothEnabled;
@property (nonatomic, strong) RMTGameDesConfig *infoConfig;
@end

@protocol RMTGameInfoConfig <NSObject>
@end
@interface RMTGameConfigModel : JSONModel
@property (nonatomic, assign) int errCode;
@property (nonatomic, strong) NSString *errMsg;
@property (nonatomic, assign) int version;
@property (nonatomic, strong) NSArray <RMTGameInfoConfig, Optional> *config;
@end
