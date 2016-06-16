//
//  AHRepository.h
//  AHTestTask
//
//  Created by Admin on 16.06.16.
//  Copyright © 2016 Aleksandr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AHRepository : NSObject

@property (strong, nonatomic) NSString *ownerLogin;
@property (strong, nonatomic) NSString *ownerAvatarURL;
@property (strong, nonatomic) NSString *descriptionRepository;
@property (strong, nonatomic) NSString *htmlURL;

- (id)initWithServerResponse:(NSDictionary*) responseObject;

@end
