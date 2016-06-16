//
//  AHCustomCell.m
//  AHTestTask
//
//  Created by Admin on 16.06.16.
//  Copyright © 2016 Aleksandr. All rights reserved.
//

#import "AHCustomCell.h"
#import "AHRepository.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface AHCustomCell ()

@property (weak, nonatomic) IBOutlet UILabel *loginLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UIButton *htmlButton;
@property (weak, nonatomic) IBOutlet UILabel *htmlLabel;


@end

@implementation AHCustomCell

- (void)configureCellWithRepository:(AHRepository *)repository {
    
    self.loginLabel.text = repository.ownerLogin;
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:repository.ownerAvatarURL]];
    self.descriptionLabel.text = repository.descriptionRepository;
    self.htmlLabel.text = repository.htmlURL;
    
}

- (IBAction)htmlButtonTapped:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.htmlLabel.text]];
}

@end
