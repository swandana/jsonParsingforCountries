//
//  ViewController.h
//  jsonParsingforCountries
//
//  Created by Target on 10/10/15.
//  Copyright (c) 2015 Target Soft Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>


@property (strong, nonatomic) IBOutlet UITableView *table;


@end

