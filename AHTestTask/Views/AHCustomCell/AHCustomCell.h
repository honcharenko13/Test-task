//
//  AHCustomCell.h
//  AHTestTask
//
//  Created by Admin on 16.06.16.
//  Copyright © 2016 Aleksandr. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AHRepository;

@interface AHCustomCell : UITableViewCell

- (void)configureCellWithRepository:(AHRepository *)repository;

@end
