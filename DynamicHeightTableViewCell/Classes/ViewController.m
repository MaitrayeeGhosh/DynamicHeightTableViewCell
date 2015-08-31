//
//  ViewController.m
//  DynamicHeightTableViewCell
//
//  Created by Maitrayee Ghosh on 31/08/15.
//  Copyright (c) 2015 Maitrayee Ghosh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    tableDataArray=[[NSArray alloc]initWithObjects:
                    
                   @"To implement this above functionality, first create a Xcode project. After that add a custom UITableViewCell class in your project. Right click of ViewController.m file and select New File.Please refer the following screen shots",
                     @"Hello World",
                    @"If you have found this tutorial as helpful, then please share it with your friends using the social sharing button available below. You can also subscribe to this blog to get the email notification of other iOS tutorial",
                    @"Now set the identifier for your custom tableViewCell as DynamicHeightCell",
                    @"Select Source just bellow iOS and after that select Cocoa Touch Class. Then tap next button.",
                    @"Now create a reference outlet for your UITableView object in your ViewController.h class, and name it as mTableView. Take an NSArray and name it as tableDataArray. This array will be used to populate the data in your table",
                    @"Now your CustomCell.h class should look like the following screen shot",
                    nil];
    
    _mTableView.delegate=(id)self;
    _mTableView.dataSource=(id)self;
    
}


#pragma mark - UITableView Delegate and DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableDataArray count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellid=@"DynamicHeightCell";
    CustomCell *cell=[tableView dequeueReusableCellWithIdentifier:cellid];
    if (cell==nil) {
        cell=[[CustomCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellid];
    }
    cell.dataLabel.text=[tableDataArray objectAtIndex:indexPath.row];
    CGRect labelRect = [[tableDataArray objectAtIndex:indexPath.row]
                        boundingRectWithSize:CGSizeMake(tableView.frame.size.width-16, 0)
                        options:NSStringDrawingUsesLineFragmentOrigin
                        attributes:@{
                                     NSFontAttributeName : [UIFont systemFontOfSize:14]
                                     }
                        context:nil];
    cell.dataLabel.frame=CGRectMake(cell.dataLabel.frame.origin.x, cell.dataLabel.frame.origin.y, cell.dataLabel.frame.size.width, labelRect.size.height+5);
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

#pragma mark - Calculate Height Of Cell

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float height=265;// y value of dataLabel
    CGRect labelRect = [[tableDataArray objectAtIndex:indexPath.row]
                        boundingRectWithSize:CGSizeMake(tableView.frame.size.width-16, 0)
                        options:NSStringDrawingUsesLineFragmentOrigin
                        attributes:@{
                                     NSFontAttributeName : [UIFont systemFontOfSize:14]
                                     }
                        context:nil];
  
    height=height+labelRect.size.height+30;
 
    return height;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
