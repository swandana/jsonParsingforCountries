//
//  ViewController.m
//  jsonParsingforCountries
//
//  Created by Target on 10/10/15.
//  Copyright (c) 2015 Target Soft Systems. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    
    NSArray * jsonArray;
    
    NSMutableArray * array1;
    
    NSMutableArray * array2;
    
    NSMutableArray * array3;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSURL * url = [NSURL URLWithString:@"http://www.androidbegin.com/tutorial/jsonparsetutorial.txt"];
    
    NSURLRequest * urlReq = [NSURLRequest requestWithURL:url];
    
    NSError * error;
    
    NSData * data = [NSURLConnection sendSynchronousRequest:urlReq returningResponse:nil error:&error];
    
    NSDictionary * jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    NSLog(@"%@",jsonDict);
    
    jsonArray = [jsonDict objectForKey:@"worldpopulation"];
    
    NSLog(@"%@",jsonArray);
    
    array1 =[[NSMutableArray alloc]init];
    array2 = [[NSMutableArray alloc]init];
    array3 = [[NSMutableArray alloc]init];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return jsonArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"hello"];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"hello"];
    }
    
    for ( NSDictionary * dict in jsonArray) {
        
        NSString * country = [dict objectForKey:@"country"];
        
        [array1 addObject:country];
        
        NSString * population = [dict objectForKey:@"population"];
        
        [array2 addObject:population];
        
        NSString * flag = [dict objectForKey:@"flag"];
        
        [array3 addObject:flag];
    }
//    
//    NSDictionary * dict = [jsonArray objectAtIndex:indexPath.row];
//    
//    cell.textLabel.text = [NSString stringWithFormat:@"%@",[dict objectForKey:@"country"]] ;
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",[dict objectForKey:@"population"]];
    
    cell.textLabel.text = [array1 objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [array2 objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[array3 objectAtIndex:indexPath.row]]]];
//    
    
    return cell;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
