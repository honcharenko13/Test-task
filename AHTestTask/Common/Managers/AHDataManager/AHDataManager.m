//
//  AHDataManager.m
//  AHTestTask
//
//  Created by Admin on 16.06.16.
//  Copyright © 2016 Aleksandr. All rights reserved.
//

#import "AHDataManager.h"
#import "AFNetworking.h"
#import "AHRepository.h"

static NSString *const stringURL = @"https://api.github.com/search/repositories?q=swift&sort=stars&order=desc";

@implementation AHDataManager

#pragma mark - Lifecycle

+ (instancetype)sharedManager {
    static id sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

#pragma mark - Loading data from sever

- (void)loadDataFromServerOnSuccess:(BlockSuccess)blockArray onFailure:(BlockError)blockError {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:stringURL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        NSMutableArray *arrayParsedRepositories = [NSMutableArray array];
        NSArray *itemsArray = responseObject[@"items"];
        
        for(NSDictionary *dictionary in itemsArray) {
            AHRepository *repository = [[AHRepository alloc] initWithServerResponse:dictionary];
            [arrayParsedRepositories addObject:repository];
        }
        
        blockArray(arrayParsedRepositories);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        blockError(error);
    }];
}

@end
