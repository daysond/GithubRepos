//
//  Repo.h
//  GithubRepos
//
//  Created by Dayson Dong on 2019-05-16.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Repo : NSObject

@property (nonatomic) NSString* name;
@property (nonatomic) NSString* url;

- (instancetype)initWithRepoName: (NSString*) name andURL: (NSString*) url;
@end

NS_ASSUME_NONNULL_END
