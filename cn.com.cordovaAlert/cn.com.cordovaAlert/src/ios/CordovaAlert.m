//
//  Created by zc on 16/06/14.
//

#import "CordovaAlert.h"

@implementation AlertPlugin

- (void)startAlert:(CDVInvokedUrlCommand*)command {
    
    CDVPluginResult* pluginResult = nil;
    //获取标题
    NSString *alertTitle = [command argumentAtIndex:0];
    //获取具体内容
    NSString *alertMessage = [command argumentAtIndex:1];
    //获取alert按钮显示内容
    NSString *buttonContent = [command argumentAtIndex:2];
    //初始化
    if(alertTitle == nil){
        alertTitle = @"提示";
    }
    if(alertMessage == nil){
        alertTitle = @"";
    }
    if(buttonContent == nil){
        buttonContent = @"好的";
    }
    alertId = command.callbackId;
    //打开弹框
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:alertTitle message:alertMessage delegate:self cancelButtonTitle:buttonContent otherButtonTitles:nil, nil];
    [alert show];
    
}

- (void)startConfirm:(CDVInvokedUrlCommand*)command {
    
    CDVPluginResult* pluginResult = nil;
    //获取标题
    NSString *confirmTitle = [command argumentAtIndex:0];
    //获取具体内容
    NSString *confirmMessage = [command argumentAtIndex:1];
    //获取成功按钮显示内容
    NSString *successButtonContent = [command argumentAtIndex:2];
    //获取失败按钮显示内容
    NSString *cancelButtonContent = [command argumentAtIndex:3];
    
    //初始化
    if(confirmTitle == nil){
        confirmTitle = @"提示";
    }
    if(confirmMessage == nil){
        confirmMessage = @"";
    }
    if(successButtonContent == nil){
        successButtonContent = @"确认";
    }
    if(cancelButtonContent == nil){
        cancelButtonContent = @"取消";
    }
    
    confirmId = command.callbackId;
    //打开弹框
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:confirmTitle message:confirmMessage delegate:self cancelButtonTitle:successButtonContent otherButtonTitles:cancelButtonContent, nil];
    [alert show];
    
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    CDVPluginResult* pluginResult = nil;
    if(buttonIndex == 0){
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        NSLog(@"cancel");
        
    } else{
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        NSLog(@"success");
    }
    if(alertId != nil){
        [self.commandDelegate sendPluginResult:pluginResult callbackId:alertId];
        alertId = nil;
    }
    if(confirmId != nil){
        [self.commandDelegate sendPluginResult:pluginResult callbackId:confirmId];
        confirmId = nil;
    }
}



@end