//
//  AddTaskViewController.m
//  To-Do 2.0
//
//  Created by ZeyadEl3ssal on 12/22/19.
//  Copyright © 2019 ZeyadEl3ssal. All rights reserved.
//

#import "AddTaskViewController.h"

@interface AddTaskViewController ()
{
    TaskManager *taskMgr ;
    NSArray *priorties , *status;
}
@property (weak, nonatomic) IBOutlet UITextField *taskNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *taskDescTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *prioritySegControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *statusSegControl;


@end

@implementation AddTaskViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    taskMgr = [TaskManager sharedInstance];
    priorties = [[NSArray alloc] initWithObjects:@"Low",@"Medium",@"High",nil];
    status = [[NSArray alloc] initWithObjects:@"ToDo",@"InProgress",@"Done", nil];
}

- (IBAction)addTaskPressed:(id)sender
{
    [taskMgr addTask:[self createTask]];
    [self.navigationController popViewControllerAnimated:YES];
}

-(Task*)createTask
{
    Task *task = [Task new];
    task.tName = _taskNameTextField.text;
    task.tDesc = _taskDescTextField.text;
    NSString *selectedPriority = [priorties objectAtIndex:_prioritySegControl.selectedSegmentIndex];
    task.tPriority = selectedPriority;
    NSString *selectedStatus = [status objectAtIndex:_statusSegControl.selectedSegmentIndex];
    task.tStatus = selectedStatus;
    task.tPriorityImage = [self setTaskImage:selectedPriority];
    return task;
}

-(NSString*)setTaskImage : (NSString *)priority
{
    NSString *taskImage ;
    if ([priority isEqualToString:@"Low"])
    {
        taskImage = priority;
    }
    else if ([priority isEqualToString:@"Medium"])
    {
        taskImage = priority;
    }
    else
    {
        taskImage = priority;
    }
    return taskImage;
}
@end
