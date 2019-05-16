//
//  RepoTableViewCell.h
//  GithubRepos
//
//  Created by Dayson Dong on 2019-05-16.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Repo.h"

NS_ASSUME_NONNULL_BEGIN

@interface RepoTableViewCell : UITableViewCell

@property (nonatomic) Repo *repo;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *urlLabel;

@end

NS_ASSUME_NONNULL_END
