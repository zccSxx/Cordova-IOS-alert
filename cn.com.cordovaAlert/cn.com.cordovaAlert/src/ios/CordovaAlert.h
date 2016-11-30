//
//  Created by zc on 16/06/14.
//

#import <Cordova/CDV.h>

@interface AlertPlugin : CDVPlugin<UIAlertViewDelegate>{
    NSString *alertId;
    NSString *confirmId;
}

- (void)startAlert:(CDVInvokedUrlCommand*)command;
- (void)startConfirm:(CDVInvokedUrlCommand*)command;

@end