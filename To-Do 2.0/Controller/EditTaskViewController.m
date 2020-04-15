//
//  EditTaskViewController.m
//  To-Do 2.0
//
//  Created by ZeyadEl3ssal on 12/22/19.
//  Copyright © 2019 ZeyadEl3ssal. All rights reserved.
//

#import "EditTaskViewController.h"

@interface EditTaskViewController ()
{
    TaskManager *taskMgr ;
    Task *task ;
    NSArray *status;
}
@property (weak, nonatomic) IBOutlet UISegmentedControl *statusSgmControl;
@property (weak, nonatomic) IBOutlet UILabel *taskNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *taskDescLabel;
@property (weak, nonatomic) IBOutlet UILabel *taskPriorityLabel;
@property (weak, nonatomic) IBOutlet UIButton *editTaskBtn;

@end

@implementation EditTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    taskMgr = [TaskManager sharedInstance];
    task = [Task new];
    status = [[NSArray alloc] initWithObjects:@"ToDo",@"InProgress",@"Done", nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self getTaskDetails];
    [self checkDoneStatus];
}

-(void)getTaskDetails
{
    
    if ([_taskStatus isEqualToString:@"ToDo"])
    {
        _statusSgmControl.selectedSegmentIndex = 0 ;
        task = [[taskMgr getToDoTasks] objectAtIndex:_taskIndex];
    }
    else if([_taskStatus isEqualToString:@"InProgress"])
    {
        _statusSgmControl.selectedSegmentIndex = 1;
        task = [[taskMgr getInProgressTasks] objectAtIndex:_taskIndex];
    }
    else
    {
        _statusSgmControl.selectedSegmentIndex = 2 ;
        task = [[taskMgr getDoneTasks] objectAtIndex:_taskIndex];
    }
    
    _taskNameLabel.text = [task tName];
    _taskDescLabel.text = [task tDesc];
    _taskPriorityLabel.text = [task tPriority];

}
- (IBAction)editTaskPressed:(id)sender {
    if([self checkTaskNewStatus])
    {
        NSString *selectedStatus = [status objectAtIndex:_statusSgmControl.selectedSegmentIndex];
         task.tStatus = selectedStatus;
         [taskMgr EditTask:task :_taskIndex];
         [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        printf("Can't modify");
        //alert("Status Can't be modified")
    }
}

-(void)checkDoneStatus
{
    if ([_taskStatus isEqualToString:@"Done"])
       {
           _statusSgmControl.enabled = false ;
           _editTaskBtn.alpha = 0.5 ;
           _editTaskBtn.enabled = false;
           
       }
}

-(BOOL) checkTaskNewStatus
{
    BOOL check ;
    if ([_taskStatus isEqualToString:@"InProgress"] && (_statusSgmControl.selectedSegmentIndex == 0) )
    {
        check = NO;
    }
    else{
        check = YES ;
    }
    return check;
}



@end
