//
//  ConfigView.m
//  ConfigJson
//
//  Created by yong on 29/10/15.
//  Copyright © 2015 yong. All rights reserved.
//

#import "ConfigView.h"
#import "ConfigModel.h"
//#import "ViewController.h"

@interface ConfigView () <NSOpenSavePanelDelegate,NSTextFieldDelegate>
@property (weak) IBOutlet NSButton *checkoutModel;
@property (weak) IBOutlet NSButton *checkoutShow;

@property (weak) IBOutlet NSTextField *centerX;
@property (weak) IBOutlet NSTextField *centerY;
@property (weak) IBOutlet NSTextField *sizeW;
@property (weak) IBOutlet NSTextField *sizeY;

@property (weak) IBOutlet NSTextField *alpha;
@property (weak) IBOutlet NSButton *soundCheck;
@property (weak) IBOutlet NSPathControl *heightPath;
@property (weak) IBOutlet NSPathControl *normollPath;
@property (nonatomic, strong) NSString *heightStr;
@property (nonatomic, strong) NSString *normollStr;

@property (weak) IBOutlet NSTextField *normolTextField;
@property (weak) IBOutlet NSTextField *heightTextField;
@property (nonatomic, assign) NSInteger stateIndex;
@property (weak) IBOutlet NSView *MoreView;
@property (weak) IBOutlet NSTextField *tips;

@end

@implementation ConfigView

- (instancetype)initWithTag:(int)tag withTitle:(NSString *)str withCheckout:(NSInteger)index withData:(RMTConfigComponent *)model
{
    if (self = [super init]) {
        self.tag = tag;
        self.title = str;
        _stateIndex = index;
        _currentModel = model;
    }
    return self;
}

- (void)hideCommand
{
    _MoreView.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
      [_checkoutShow setState:_stateIndex];
    NSLog(@"log");
    
    _heightTextField.delegate = self;
  
    _normolTextField.delegate = self;
    if (_tag == 11 || _tag == 12) {
        float x = (_currentModel.centerX * 1102);
        float y = (_currentModel.centerY * 621);
        _centerX.stringValue = [NSString stringWithFormat:@"%.1f",x];
        _centerY.stringValue = [NSString stringWithFormat:@"%.1f",y];
        [self hideCommand];
    } else{
        _centerX.stringValue = [NSString stringWithFormat:@"%.1f",_currentModel.centerX ];
        _centerY.stringValue = [NSString stringWithFormat:@"%.1f",_currentModel.centerY ];
    }
   
    _sizeW.stringValue =  [NSString stringWithFormat:@"%.1f",_currentModel.sizeW];
    if (_currentModel.sizeH > 0) {
             _sizeY.stringValue =  [NSString stringWithFormat:@"%.1f",_currentModel.sizeW/_currentModel.sizeH];
    } else {
        _sizeY.stringValue = @"0";
    }

    _heightTextField.stringValue = [NSString stringWithFormat:@"%@",_currentModel.HeightStr];
    _normolTextField.stringValue = [NSString stringWithFormat:@"%@",_currentModel.normollStr];
    
    if (_currentModel == nil) {
        _heightTextField.stringValue = @"b_160_n.png";
        _normolTextField.stringValue = @"b_160_h.png";
        _sizeW.stringValue =  @"140";
        _sizeY.stringValue = @"140";
    }
    // Do view setup here.
}

- (IBAction)doubleClick:(id)sender {
        NSLog(@"doubleClick");
    

}

- (BOOL)textShouldEndEditing:(NSText *)textObject;
{
    NSLog(@"nslog %@",textObject);
    return true;
}

- (void)textDidEndEditing:(NSNotification *)notification
{
    NSLog(@"textDidEndEditing %@",notification.object);
    
}

- (IBAction)saveClick:(id)sender {
    if (_checkoutShow.integerValue != 1) {
        if ([_delegate respondsToSelector:@selector(postConfigData:withTag:)]) {
            [_delegate postConfigData:[[RMTConfigComponent alloc] init] withTag:_tag];
            return;
        }
    }
    RMTConfigComponent *data = [[RMTConfigComponent alloc] init];
    data.centerX = [[_centerX stringValue] floatValue];
    data.centerY = [[_centerY stringValue] floatValue];
    if (data.centerX <= 0 || data.centerX >= 2208) {
        _tips.stringValue = @"x 有误";
        return;
    }
    
    if (data.centerX <= 0 || data.centerX >= 2208) {
        _tips.stringValue = @"y 有误";
         return;
    }
    
   
    
    if (_tag == 11 || _tag == 12) {
        data.centerX =  data.centerX / 2204.0f * 2;
        data.centerY = data.centerY / 1242.0f *2;
    }
    data.show     = _checkoutShow.state == 1;
    
    data.alpha = [[_alpha stringValue] floatValue];
    data.sound = _soundCheck.state == 1;
    data.HeightStr = [_heightTextField stringValue];
    data.normollStr = [_normolTextField stringValue];
    if ([[_sizeW stringValue] floatValue] > 0) {
        data.sizeW = [[_sizeY stringValue] floatValue];
        data.sizeH =  [[_sizeW stringValue] floatValue]  / [[_sizeY stringValue] floatValue] ;
    }
    
    if (data.sizeW != data.sizeH) {
        _tips.stringValue = @"宽高不等";
    }
    NSLog(@"modle %@,",data);
    if ([_delegate respondsToSelector:@selector(postConfigData:withTag:)]) {
        [_delegate postConfigData:data withTag:_tag];
        [self dismissController:self];
    }
}

- (IBAction)rectChekcout:(id)sender {
    _heightTextField.stringValue = @"rect.png";
    [_normolTextField setStringValue:@"rect_down.png"];
}


- (IBAction)checkout:(id)sender {
    _sizeY.stringValue = _sizeW.stringValue;
    
    if ([_sizeW.stringValue isEqualToString:_sizeY.stringValue]) {
        if ([_sizeW.stringValue floatValue] > 260) {
            _heightTextField.stringValue = @"b_260_n.png";
            [_normolTextField setStringValue:@"b_260_h.png"];
        } else if ( [_sizeW.stringValue floatValue] > 200 && [_sizeW.stringValue floatValue] < 260){
            _heightTextField.stringValue = @"b_244_n.png";
            [_normolTextField setStringValue:@"b_244_h.png"];
        } else {
            _heightTextField.stringValue = @"b_160_n.png";
            [_normolTextField setStringValue:@"b_160_h.png"];
        }
    } else {
         _heightTextField.stringValue = @"rect.png";
         [_normolTextField setStringValue:@"rect_down.png"];
    }
}

- (IBAction)backClick:(id)sender {
    [self dismissController:self];
}


- (IBAction)heightClick:(id)sender {
  [self handleSelect:^(NSURL *url) {
      [self.heightPath setURL:url];
      [_heightTextField setStringValue:[url lastPathComponent]];
      if ([[_heightTextField stringValue] isEqualToString:@"b_160_n.png"]) {
          [_normolTextField setStringValue:@"b_160_h.png"];
      }
      
      if ([[_heightTextField stringValue] isEqualToString:@"b_244_n.png"]) {
          [_normolTextField setStringValue:@"b_244_h.png"];
      }
      
      if ([[_heightTextField stringValue] isEqualToString:@"b_260_n.png"]) {
          [_normolTextField setStringValue:@"b_260_h.png"];
      }
      
      if ([[_heightTextField stringValue] isEqualToString:@"rect.png"]) {
          [_normolTextField setStringValue:@"rect_down.png"];
      }
      
      if (![_sizeW.stringValue isEqualToString:_sizeY.stringValue]) {
          _tips.stringValue = @"宽高不等";
      }
  }];
}

- (void)handleSelect:(void(^)(NSURL *url))onComplete{
    NSOpenPanel *panel = [NSOpenPanel openPanel];
    [panel setCanChooseFiles: YES]; //是否能选择文件
    [panel setCanCreateDirectories: NO]; // 是否创建文件夹
    [panel setCanChooseDirectories: NO]; // 是否能选择文件夹
    [panel setAllowedFileTypes:@[@"png"]];
    [panel beginSheetModalForWindow: [[self view] window] completionHandler: ^(NSInteger result) {
        if (result == NSFileHandlingPanelOKButton) {
            onComplete([panel URLs][0]);
        }
    }];
}

- (IBAction)normollClick:(id)sender {
        NSLog(@"normollClick");
    [self handleSelect:^(NSURL *url) {
        [self.normollPath setURL:url];
        [_normolTextField setStringValue:[url lastPathComponent]];
      
        
    }];
}
- (void)setDraggingSourceOperationMask:(NSDragOperation)mask
                              forLocal:(BOOL)isLocal
{
        NSLog(@"isLocal %@",isLocal);
}
- (BOOL)panel:(id)sender validateURL:(NSURL *)url error:(NSError **)outError
{
    NSLog(@"validateURL");
    return YES;
}

- (void)pathControl:(NSPathControl *)pathControl willDisplayOpenPanel:(NSOpenPanel *)openPanel
{
    NSLog(@"openPanel %@",openPanel);
    [openPanel setDelegate:self];
    [openPanel setCanChooseDirectories:YES];
    [openPanel setCanCreateDirectories:YES];
    [openPanel setCanChooseFiles:NO];
    [openPanel setPrompt:@"Choose"];
}
@end
