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

@interface ConfigView () <NSOpenSavePanelDelegate>
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

@end

@implementation ConfigView

- (instancetype)initWithTag:(int)tag withTitle:(NSString *)str withCheckout:(NSInteger)index
{
    if (self = [super init]) {
        self.tag = tag;
        self.title = str;
        _stateIndex = index;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
      [_checkoutShow setState:_stateIndex];
    // Do view setup here.
}

- (IBAction)doubleClick:(id)sender {
        NSLog(@"doubleClick");
    

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
    if (_tag == 11 || _tag == 12) {
        data.centerX =  data.centerX / 2204.0f * 2;
        data.centerY = data.centerY / 1242.0f * 2;
    }
    data.show     = _checkoutShow.state == 1;
    
    data.alpha = [[_alpha stringValue] floatValue];
    data.sound = _soundCheck.state == 1;
    data.HeightStr = [_heightTextField stringValue];
    data.normollStr = [_normolTextField stringValue];
    if ([[_sizeW stringValue] floatValue] > 0) {
        data.sizeW = [[_sizeW stringValue] floatValue];
        data.sizeH = [[_sizeY stringValue] floatValue] / data.sizeW ;
    }

    NSLog(@"modle %@,",data);
    if ([_delegate respondsToSelector:@selector(postConfigData:withTag:)]) {
        [_delegate postConfigData:data withTag:_tag];
    }
}

- (IBAction)backClick:(id)sender {
    [self dismissController:self];
}
- (IBAction)heightClick:(id)sender {
  [self handleSelect:^(NSURL *url) {
      [self.heightPath setURL:url];
      [_heightTextField setStringValue:[url lastPathComponent]];
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
