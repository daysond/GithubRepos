//
//  Repo.m
//  GithubRepos
//
//  Created by Dayson Dong on 2019-05-16.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import "Repo.h"

@implementation Repo

- (instancetype)initWithRepoName: (NSString*) name andURL: (NSString*) url
{
    self = [super init];
    if (self) {
        _name = name;
        _url = url;
    }
    return self;
}

@end
