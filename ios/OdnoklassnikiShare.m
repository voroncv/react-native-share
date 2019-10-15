//
//  OdnoklassnikiShare.m
//  RNShare
//
//  Created by whoami on 15/10/2019.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "OdnoklassnikiShare.h"

@implementation OdnoklassnikiShare
RCT_EXPORT_MODULE();
- (void)shareSingle:(NSDictionary *)options
    failureCallback:(RCTResponseErrorBlock)failureCallback
    successCallback:(RCTResponseSenderBlock)successCallback {
    
    NSLog(@"Try open view");
    
     if ([options objectForKey:@"url"] && [options objectForKey:@"url"] != [NSNull null]) {
        NSString *url = [NSString stringWithFormat:@"https://connect.ok.ru/offer?url=%@&title=%@&description=%@", options[@"url"], options[@"title"], options[@"message"]];
        
        NSURL *okURL = [NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        
         if ([[UIApplication sharedApplication] canOpenURL: okURL]) {
             [[UIApplication sharedApplication] openURL:okURL];
             successCallback(@[]);
         } else {
             // Cannot open ok
             NSLog(@"error web intent");
         }
    }
}


@end
