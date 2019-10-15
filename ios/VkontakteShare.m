//
//  VkontakteShare.m
//  RNShare
//
//  Created by whoami on 15/10/2019.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "VkontakteShare.h"

@implementation VkontakteShare
RCT_EXPORT_MODULE();
- (void)shareSingle:(NSDictionary *)options
    failureCallback:(RCTResponseErrorBlock)failureCallback
    successCallback:(RCTResponseSenderBlock)successCallback {
    
    NSLog(@"Try open view");
    
    if ([options objectForKey:@"url"] && [options objectForKey:@"url"] != [NSNull null]) {
        NSString *url = [NSString stringWithFormat:@"https://vk.com/share.php?url=%@&title=%@&comment=%@", options[@"url"], options[@"title"], options[@"message"]];
        NSURL * vkURL = [NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        
        if ([[UIApplication sharedApplication] canOpenURL: vkURL]) {
            [[UIApplication sharedApplication] openURL:vkURL];
            successCallback(@[]);
        } else {
            // Cannot open vk
            NSLog(@"error web intent");
        }
    }
}


@end
