//
//  OdnoklassnikiShare
//  RNShare
//
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "OdnoklassnikiShare.h"

@implementation OdnoklassnikiShare
RCT_EXPORT_MODULE();
- (void)shareSingle:(NSDictionary *)options
    failureCallback:(RCTResponseErrorBlock)failureCallback
    successCallback:(RCTResponseSenderBlock)successCallback {
    
    NSLog(@"Try open view");
    
    if ([options objectForKey:@"url"] && [options objectForKey:@"url"] != [NSNull null]) {
        NSString *url = [NSString stringWithFormat:@"https://connect.ok.ru/offer?url=%@", options[@"url"]];
        NSURL *gplusURL = [NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        
        if ([[UIApplication sharedApplication] canOpenURL: gplusURL]) {
            [[UIApplication sharedApplication] openURL:gplusURL];
            successCallback(@[]);
        } else {
            // Cannot open gplus
            NSLog(@"error web intent");
        }
    }
}


@end
