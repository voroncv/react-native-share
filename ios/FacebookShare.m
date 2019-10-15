//
//  FacebookShare.m
//  RNShare
//
//  Created by whoami on 15/10/2019.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "FacebookShare.h"

@implementation FacebookShare
    RCT_EXPORT_MODULE();
- (void)shareSingle:(NSDictionary *)options
    failureCallback:(RCTResponseErrorBlock)failureCallback
    successCallback:(RCTResponseSenderBlock)successCallback {
    
    NSLog(@"Try open view");
    
    if ([options objectForKey:@"url"] && [options objectForKey:@"url"] != [NSNull null]) {
        NSString *url = [NSString stringWithFormat:@"https://www.facebook.com/sharer/sharer.php?u=%@&title=%@&description=%@", options[@"url"], options[@"title"], options[@"message"]];
        
        NSURL *fbURL = [NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        
        if ([[UIApplication sharedApplication] canOpenURL: fbURL]) {
            [[UIApplication sharedApplication] openURL:fbURL];
            successCallback(@[]);
        } else {
            // Cannot open gplus
            NSLog(@"error web intent");
        }
    }
}


@end
