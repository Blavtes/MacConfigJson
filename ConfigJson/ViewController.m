//
//  ViewController.m
//  ConfigJson
//
//  Created by yong on 28/10/15.
//  Copyright © 2015 yong. All rights reserved.
//

#import "ViewController.h"
#import "ConfigView.h"


@interface ViewController()<RMTConfigDataDelegate>

@property (weak) IBOutlet NSTextField *packageName;

@property (weak) IBOutlet NSButton *gyroscopeEnabled;
@property (weak) IBOutlet NSButton *accelerometerEnabled;
@property (weak) IBOutlet NSButton *bluetoothEnabled;

@property (weak) IBOutlet NSTextField *version;
@property (weak) IBOutlet NSTextField *actionArgs;

@property (weak) IBOutlet NSButton *rockA;
@property (weak) IBOutlet NSButton *rockB;

@property (weak) IBOutlet NSButton *btnA;
@property (weak) IBOutlet NSButton *btnB;
@property (weak) IBOutlet NSButton *btnC;
@property (weak) IBOutlet NSButton *btnD;
@property (weak) IBOutlet NSButton *btnE;

@property (weak) IBOutlet NSButton *btnF;
@property (weak) IBOutlet NSButton *btnG;
@property (weak) IBOutlet NSButton *btnH;
@property (weak) IBOutlet NSButton *btni;
@property (weak) IBOutlet NSButton *btnj;
@property (weak) IBOutlet NSButton *btnk;
@property (weak) IBOutlet NSButton *btnl;
@property (weak) IBOutlet NSButton *btnm;
@property (weak) IBOutlet NSButton *btnn;
@property (weak) IBOutlet NSButton *btno;
@property (weak) IBOutlet NSButton *btnp;

@property (weak) IBOutlet NSButton *imageA;
@property (weak) IBOutlet NSButton *imageB;

@property (nonatomic, strong) NSMutableDictionary *map;
@property (nonatomic, strong) NSMutableDictionary *data;
@property (nonatomic, strong) RMTGameDesConfig *infoConfig;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _infoConfig = [[RMTGameDesConfig alloc] init];
    
    _map = [NSMutableDictionary dictionaryWithCapacity:0];
//    [_map setObject:@"packageName" forKey:[NSNumber numberWithInt:RMTPackage]];
//    [_map setObject:@"gyroscopeEnabled" forKey:[NSNumber numberWithInt:RMTTgyroscope]];
//     [_map setObject:@"accelerometerEnabled" forKey:[NSNumber numberWithInt:RMTacceleromete]];
//     [_map setObject:@"bluetoothEnabled" forKey:[NSNumber numberWithInt:RMTbluetooth]];
    
    [_map setObject:@"padControll" forKey:[NSNumber numberWithInt:RMTRockA]];
    [_map setObject:@"controlDirectionImage" forKey:[NSNumber numberWithInt:RMTRockB]];
    [_map setObject:@"angryBotsLeftView" forKey:[NSNumber numberWithInt:RMTImageA]];
    [_map setObject:@"angryBotsRightView" forKey:[NSNumber numberWithInt:RMTImageB]];
//    
    [_map setObject:@"aBt" forKey:[NSNumber numberWithInt:RMTBtnA]];
    [_map setObject:@"bBt" forKey:[NSNumber numberWithInt:RMTBtnB]];
    [_map setObject:@"cBt" forKey:[NSNumber numberWithInt:RMTBtnC]];
    [_map setObject:@"dBt" forKey:[NSNumber numberWithInt:RMTBtnD]];
    [_map setObject:@"eBt" forKey:[NSNumber numberWithInt:RMTBtnE]];
    [_map setObject:@"fBt" forKey:[NSNumber numberWithInt:RMTBtnF]];
    [_map setObject:@"gBt" forKey:[NSNumber numberWithInt:RMTBtnG]];
    [_map setObject:@"hBt" forKey:[NSNumber numberWithInt:RMTBtnH]];
    [_map setObject:@"jBt" forKey:[NSNumber numberWithInt:RMTBtnI]];
    [_map setObject:@"kBt" forKey:[NSNumber numberWithInt:RMTBtnJ]];
    [_map setObject:@"lBt" forKey:[NSNumber numberWithInt:RMTBtnK]];
    [_map setObject:@"mBt" forKey:[NSNumber numberWithInt:RMTBtnL]];
    [_map setObject:@"nBt" forKey:[NSNumber numberWithInt:RMTBtnM]];
    [_map setObject:@"iBt" forKey:[NSNumber numberWithInt:RMTBtnN]];
    [_map setObject:@"oBt" forKey:[NSNumber numberWithInt:RMTBtnO]];
    [_map setObject:@"pBt" forKey:[NSNumber numberWithInt:RMTBtnP]];
//    [_map setObject:@"aBt" forKey:[NSNumber numberWithInt:RMTBtnA]];
//    [_map setObject:@"aBt" forKey:[NSNumber numberWithInt:RMTBtnA]];
    // Do any additional setup after loading the view.
    _data = [NSMutableDictionary dictionaryWithCapacity:0];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (void)postConfigData:(RMTConfigComponent *)data withTag:(int)tag
{
    
    NSLog(@"data %@  \ntag %d",data,tag);
     [_data setObject:data forKey:[NSNumber numberWithInt:tag]];
}


- (IBAction)saveClick:(id)sender {
    if ([_packageName.stringValue isEqualToString:@""]) {
        NSLog(@"package is null");
    }
    
    RMTGameInfoConfig *info = [[RMTGameInfoConfig alloc] init];
    NSMutableDictionary *dicton = [NSMutableDictionary dictionaryWithCapacity:0];
    for (NSNumber *number in _data.allKeys) {
         RMTConfigComponent *datas =   [_data objectForKey:number];
        switch ([number intValue]) {
            case RMTRockA:
                info.infoConfig.padControll = datas;
                if (_rockA.state == 1) {
                      [dicton setObject:[datas toDictionary] forKey:@"padControll"];
                }
              

                break;
            case RMTRockB:
                info.infoConfig.controlDirectionImage = datas;
                   if (_rockB.state == 1) {
                       [dicton setObject:[datas toDictionary] forKey:@"controlDirectionImage"];
                   }
                break;
            case RMTBtnA:
                info.infoConfig.aBt = datas;
                   if (_btnA.state == 1) {
                      [dicton setObject:[datas toDictionary] forKey:@"aBt"];
                   }
                break;
            case RMTBtnB:
                info.infoConfig.bBt = datas;
                 if (_btnB.state == 1) {
                      [dicton setObject:[datas toDictionary] forKey:@"bBt"];
                 }
                break;
            case RMTBtnC:
                info.infoConfig.cBt = datas;
                 if (_btnC.state == 1) {
                      [dicton setObject:[datas toDictionary] forKey:@"cBt"];
                 }
                break;
            case RMTBtnD:
                info.infoConfig.dBt = datas;
                 if (_btnD.state == 1) {
                     [dicton setObject:[datas toDictionary] forKey:@"dBt"];
                 }
                break;
            case RMTBtnE:
                info.infoConfig.eBt = datas;
                 if (_btnE.state == 1) {
                      [dicton setObject:[datas toDictionary] forKey:@"eBt"];
                 }
                break;
            case RMTBtnF:
                info.infoConfig.fBt = datas;
                 if (_btnF.state == 1) {
                      [dicton setObject:[datas toDictionary] forKey:@"fBt"];
                 }
                break;
            case RMTBtnG:
                info.infoConfig.gBt = datas;
                 if (_btnG.state == 1) {
                     [dicton setObject:[datas toDictionary] forKey:@"gBt"];
                 }
                break;
            case RMTBtnH:
                 if (_btnH.state == 1) {
                      [dicton setObject:[datas toDictionary] forKey:@"hBt"];
                 }
                info.infoConfig.hBt = datas;
                break;
            case RMTBtnI:
                 if (_btni.state == 1) {
                     [dicton setObject:[datas toDictionary] forKey:@"iBt"];
                 }
                info.infoConfig.iBt = datas;
                break;
            case RMTBtnJ:
                 if (_btnj.state == 1) {
                     [dicton setObject:[datas toDictionary] forKey:@"jBt"];
                 }
                info.infoConfig.jBt = datas;
                break;
            case RMTBtnK:
                 if (_btnk.state == 1) {
                     [dicton setObject:[datas toDictionary] forKey:@"kBt"];
                 }
                info.infoConfig.kBt = datas;
                break;
            case RMTBtnL:
                 if (_btnl.state == 1) {
                     [dicton setObject:[datas toDictionary] forKey:@"lBt"];
                 }
                info.infoConfig.lBt = datas;
                break;
            case RMTBtnM:
                 if (_btnm.state == 1) {
                     [dicton setObject:[datas toDictionary] forKey:@"mBt"];
                 }
                info.infoConfig.mBt = datas;
                break;
            case RMTBtnN:
                 if (_btnn.state == 1) {
                     [dicton setObject:[datas toDictionary] forKey:@"nBt"];
                 }
                info.infoConfig.nBt = datas;
                break;
            case RMTBtnO:
                 if (_btno.state == 1) {
                     [dicton setObject:[datas toDictionary] forKey:@"oBt"];
                 }
                info.infoConfig.oBt = datas;
                break;
            case RMTBtnP:
                 if (_btnp.state == 1) {
                     [dicton setObject:[datas toDictionary] forKey:@"pBt"];
                 }
                info.infoConfig.pBt = datas;
                break;
            case RMTImageA:
                 if (_imageA.state == 1) {
                     [dicton setObject:[datas toDictionary] forKey:@"angryBotsLeftView"];
                 }
                info.infoConfig.angryBotsLeftView = datas;
                break;
            case RMTImageB:
                 if (_imageB.state == 1) {
                     [dicton setObject:[datas toDictionary] forKey:@"angryBotsRightView"];
                 }
                info.infoConfig.angryBotsRightView = datas;
                break;
            default:
                break;
        }
        
    }
     NSMutableDictionary *config = [NSMutableDictionary dictionaryWithCapacity:0];
    if (dicton) {
         [config setObject:dicton forKey:@"infoConfig"]; 
    }
  
    if (_gyroscopeEnabled.state == 1) {
        [config setObject:@(true) forKey:@"gyroscopeEnabled"];
    }
    if (_accelerometerEnabled.state == 1) {
          [config setObject:@(true) forKey:@"accelerometerEnabled"];
    }
    if (_bluetoothEnabled.state == 1) {
         [config setObject:@(true) forKey:@"bluetoothEnabled"];
    }
    NSString *actionargs = _actionArgs.stringValue;
    if ([actionargs intValue] > 0) {
        [config setObject:@([actionargs intValue] ) forKey:@"actionArgs"];
    }
    [config setObject:[_packageName stringValue] forKey:@"packageName"];
    NSLog(@"map %@",_data);
    NSLog(@"info  %@",info);
   
    RMTGameInfoConfig *modle =    [[RMTGameInfoConfig alloc] initWithDictionary:config error:nil];
    NSLog(@"dicton %@ \n%@ \n %@",config,modle, [modle toJSONString]);
    
    NSMutableDictionary *endModle = [NSMutableDictionary dictionaryWithCapacity:0];
    [endModle setObject:@"OK" forKey:@"errMsg"];
    [endModle setObject:@(0) forKey:@"errCode"];
    [endModle setObject:@([_version.stringValue floatValue]) forKey:@"version"];
    [endModle setObject:@[config] forKey:@"config"];
    
    RMTGameConfigModel *end = [[RMTGameConfigModel alloc] initWithDictionary:endModle error:nil];
    
    NSLog(@"confg %@\n%@",end,[end toJSONString]);
    
    [self handleSelectWithData:[end toJSONString] handle:^(NSString *datas) {
        
    }];
     
    
}


- (void)handleSelectWithData:(NSString*)da  handle:(void(^)(NSString *datas))onComplete{
    NSSavePanel*    panel = [NSSavePanel savePanel];
    [panel setNameFieldStringValue:@"gameConfig.json"];
    [panel setMessage:@"Choose the path to save the document"];
    [panel setAllowsOtherFileTypes:NO];
    [panel setAllowedFileTypes:@[@"json"]];
    [panel setExtensionHidden:YES];
    [panel setCanCreateDirectories:YES];
    [panel beginWithCompletionHandler:^(NSInteger result){
        if (result == NSFileHandlingPanelOKButton)
        {
            NSString *path = [[panel URL] path];
            [da writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
        }
    }];
    
  
}

- (IBAction)btnClick:(id)sender {
    NSButton *btn = (NSButton*)sender;

    RMTConfigComponent *data =   [_data objectForKey:[NSNumber numberWithInt:(int)btn.tag]];
    
//    if (btn.state == 1) {
        ConfigView *vc = [[ConfigView alloc] initWithTag:(int)btn.tag withTitle:[btn title] withCheckout:btn.state withData:data];
        vc.delegate = self;
        [self presentViewControllerAsModalWindow:vc];
//    }

}
@end
