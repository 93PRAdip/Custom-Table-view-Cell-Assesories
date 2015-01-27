//
//  ViewController.m
//  CustomCellAccessories
//
//  Created by pradip on 1/27/15.
//  Copyright (c) 2015 pradip. All rights reserved.
//

#import "ViewController.h"
static NSString *TableViewCellIdentifier= @"MyCell";
@interface ViewController ()<UITableViewDataSource>
@property(nonatomic,strong) UITableView *myTableView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.myTableView =[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:TableViewCellIdentifier];
    self.myTableView.dataSource=self;
    self.myTableView.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.myTableView];
	
}
//option for tag a cell
-(UIView *)superViewOfType:(Class)paramSuperViewClass forView:(UIView *)paramView
{
    if(paramView.subviews !=nil)
    {
        if([paramView.superview isKindOfClass:paramSuperViewClass])
        {
            return paramView.superview;
            
        }
        else{
            return [self  superViewOfType:paramSuperViewClass forView:paramView.superview];
        }
    }
    return nil;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell  *cell=nil;
    cell=[tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier forIndexPath:indexPath];
    cell.textLabel.text=[NSString stringWithFormat:@"section %ld ,Cell %ld",(long)indexPath.section,(long)indexPath.row];
   //cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
    UIButton *button =[UIButton buttonWithType:UIButtonTypeSystem];
    button.frame=CGRectMake(0, 0, 15, 25);
    [button setTitle:@"Expand" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(performedExpand:) forControlEvents:UIControlEventTouchUpInside];
    cell.accessoryView=button;

    
    return cell;
}


- (void) performExpand:(UIButton *)paramSender{
    
    /* Handle the tap event of the button */
    __unused UITableViewCell *parentCell =(UITableViewCell *)[self superViewOfType:[UITableViewCell class] forView:paramSender];
    
    /* Now do something with the cell if you want to */
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
