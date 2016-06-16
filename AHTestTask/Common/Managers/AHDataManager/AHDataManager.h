//
//  AHDataManager.h
//  AHTestTask
//
//  Created by Admin on 16.06.16.
//  Copyright © 2016 Aleksandr. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^BlockSuccess)(NSArray *responseArray);
typedef void(^BlockError)(NSError *error);

@interface AHDataManager : NSObject

+ (instancetype)sharedManager;
- (void)loadDataFromServerOnSuccess:(BlockSuccess)blockArray onFailure:(BlockError)blockError;

@end
