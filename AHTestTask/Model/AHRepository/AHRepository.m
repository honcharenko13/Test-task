//
//  AHRepository.m
//  AHTestTask
//
//  Created by Admin on 16.06.16.
//  Copyright © 2016 Aleksandr. All rights reserved.
//

#import "AHRepository.h"

@implementation AHRepository

- (instancetype)initWithServerResponse:(NSDictionary*) responseObject {
    self = [super init];
    if (self) {
        self.ownerLogin = [[responseObject objectForKey:@"owner"]objectForKey:@"login"];
        self.ownerAvatarURL = [[responseObject objectForKey:@"owner"]objectForKey:@"avatar_url"];
        self.descriptionRepository = [responseObject objectForKey:@"description"];
        self.htmlURL = [responseObject objectForKey:@"html_url"];
    }
    return self;
}

@end
