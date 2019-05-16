//
//  ViewController.m
//  GithubRepos
//
//  Created by Dayson Dong on 2019-05-16.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import "ViewController.h"
#import "RepoTableViewCell.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic) NSMutableArray<Repo*> *repos;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.repos = [NSMutableArray array];

    NSURL *url = [NSURL URLWithString:@"https://api.github.com/users/daysond/repos"];
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"not gonna handle error %@",error);
            return ;
        }
        NSError *jsonError;
        
        NSArray *repos = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError) {
            NSLog(@"Not handling this error %@",jsonError);
        }
        
        for (NSDictionary* repoDict in repos ) {
            Repo* repo = [[Repo alloc]initWithRepoName:repoDict[@"name"] andURL:repoDict[@"html_url"]];
            NSLog(@"name: %@",repo.name);
            [self.repos addObject:repo];
        }
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.repoTableView reloadData];
        }];
    }];
    
    [dataTask resume];

}


- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    RepoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.repo = self.repos[indexPath.row];
    
    return  cell;
    
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.repos.count;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 87;
//}



@end
