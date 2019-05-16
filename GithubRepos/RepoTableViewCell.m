//
//  RepoTableViewCell.m
//  GithubRepos
//
//  Created by Dayson Dong on 2019-05-16.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import "RepoTableViewCell.h"

@implementation RepoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setRepo:(Repo *)repo {
    
    _repo = repo;
    self.nameLabel.text = repo.name;
    self.urlLabel.text = repo.url;
}

@end
