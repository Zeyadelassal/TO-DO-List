//
//  ToDoViewController.m
//  To-Do 2.0
//
//  Created by ZeyadEl3ssal on 12/25/19.
//  Copyright © 2019 ZeyadEl3ssal. All rights reserved.
//

#import "ToDoViewController.h"


@interface ToDoViewController ()
{
    TaskManager *taskMgr ;
    NSMutableArray *todoTasks ;
    AddTaskViewController *addTaskVC;
    EditTaskViewController *editTaskVC;
    TaskDetailsViewController *taskDetailsVC;
}

@property (weak, nonatomic) IBOutlet UITableView *todoTableView;
@property (weak, nonatomic) IBOutlet UISearchBar *todoSearchBar;

@end

@implementation ToDoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    taskMgr = [TaskManager sharedInstance];
    todoTasks = [NSMutableArray new];
    addTaskVC = [self.storyboard instantiateViewControllerWithIdentifier:@"AddTaskVC"];
    editTaskVC = [self.storyboard instantiateViewControllerWithIdentifier:@"EditTaskVC"];
    taskDetailsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"TaskDetailsVC"];
    [taskMgr getFromUserDefaults];
    todoTasks = [taskMgr getToDoTasks];
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addTask)];
    [self.navigationItem setRightBarButtonItem:addBtn];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    todoTasks = [taskMgr getToDoTasks];
    [self.todoTableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   return [todoTasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Task *task = [todoTasks objectAtIndex:indexPath.row];
    cell.textLabel.text = [task tName];
    cell.detailTextLabel.text = [task tDesc];
    NSString *imageName = [task tPriorityImage];
    cell.imageView.image = [UIImage imageNamed:imageName];
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;

    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"To-Do Tasks";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    editTaskVC.taskIndex = indexPath.row;
    editTaskVC.taskStatus = @"ToDo";
    [self.navigationController pushViewController:editTaskVC animated:YES];
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    taskDetailsVC.task = [[taskMgr getToDoTasks] objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:taskDetailsVC animated:YES];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        Task *task = [todoTasks objectAtIndex:indexPath.row];
        [taskMgr deleteTask:task];
        todoTasks = [taskMgr getToDoTasks];
        printf("%d",[todoTasks count]);
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    [tableView reloadData];
}


- (void)addTask
{
    [self.navigationController pushViewController:addTaskVC animated:YES];
}

@end
