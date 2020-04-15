//
//  PriorityFilterViewController.m
//  To-Do 2.0
//
//  Created by ZeyadEl3ssal on 12/25/19.
//  Copyright © 2019 ZeyadEl3ssal. All rights reserved.
//

#import "PriorityFilterViewController.h"

@interface PriorityFilterViewController ()
{
    TaskManager *taskMgr;
    NSMutableArray *filteredTasks;
    int filterFlag ;
}
@property (weak, nonatomic) IBOutlet UITableView *priorityFilterTableView;

@end

@implementation PriorityFilterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    taskMgr = [TaskManager sharedInstance];
    filteredTasks = [NSMutableArray new];
    filteredTasks = [taskMgr getAllTasks];
    filterFlag = 0 ;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    filterFlag = 0 ;
    filteredTasks = [taskMgr getAllTasks];
    [self.priorityFilterTableView reloadData];
}
- (IBAction)highPrioirtyPressed:(id)sender {
    filteredTasks = [taskMgr getHighTasks];
    filterFlag = 1 ;
    [self.priorityFilterTableView reloadData];
}
- (IBAction)mediumPriorityPressed:(id)sender {
    filteredTasks = [taskMgr getMediumTasks];
    filterFlag = 2 ;
    [self.priorityFilterTableView reloadData];
}
- (IBAction)lowPriorityPressed:(id)sender {
    filteredTasks = [taskMgr getLowTasks];
    filterFlag = 3 ;
    [self.priorityFilterTableView reloadData];
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.priorityFilterTableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Task *task = [filteredTasks objectAtIndex:indexPath.row];
    cell.textLabel.text = [task tName];
    cell.detailTextLabel.text = [task tDesc];
    NSString *imageName = [task tPriorityImage];
    cell.imageView.image = [UIImage imageNamed:imageName];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [filteredTasks count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *secTitle = @"All Tasks";
    switch (filterFlag) {
        case 1:
            secTitle = @"High Priority Tasks";
            break;
        case 2:
            secTitle = @"Medium Priority Tasks";
            break;
        case 3:
            secTitle = @"Low Priority Tasks";
            break;
        default:
            break;
    }
    return secTitle;
}

@end
