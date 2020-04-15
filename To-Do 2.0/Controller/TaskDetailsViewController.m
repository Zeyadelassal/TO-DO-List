//
//  TaskDetailsViewController.m
//  To-Do 2.0
//
//  Created by ZeyadEl3ssal on 12/22/19.
//  Copyright © 2019 ZeyadEl3ssal. All rights reserved.
//

#import "TaskDetailsViewController.h"

@interface TaskDetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *taskNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *taskDescLabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end

@implementation TaskDetailsViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self showTaskDetails];
}

-(void)showTaskDetails
{
    _taskNameLabel.text = _task.tName;
    _taskDescLabel.text = _task.tDesc;
    _priorityLabel.text = _task.tPriority;
    _statusLabel.text = _task.tStatus;
}


@end
