//
//  ViewController.h
//  DynamicHeightTableViewCell
//
//  Created by Maitrayee Ghosh on 31/08/15.
//  Copyright (c) 2015 Maitrayee Ghosh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"
@interface ViewController : UIViewController
{
    NSArray *tableDataArray;
}
@property (weak, nonatomic) IBOutlet UITableView *mTableView;


@end

