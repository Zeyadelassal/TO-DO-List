//
//  TaskManager.m
//  To-Do 2.0
//
//  Created by ZeyadEl3ssal on 12/22/19.
//  Copyright © 2019 ZeyadEl3ssal. All rights reserved.
//

#import "TaskManager.h"

@implementation TaskManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        allTasks = [NSMutableArray new];
        highTasks = [NSMutableArray new];
        medTasks = [NSMutableArray new];
        lowTasks = [NSMutableArray new];
        toDoTasks = [NSMutableArray new];
        inProgressTasks = [NSMutableArray new];
        doneTasks = [NSMutableArray new];
        defaults = [NSUserDefaults standardUserDefaults];
        tasksData = [NSData new];
    }
    return self;
}

- (void)addTask:(Task *)task
{
    [allTasks addObject:task];
    [self saveToUserDefaults];
}
      


- (void)EditTask:(Task *)task : (int)index
{
    [allTasks replaceObjectAtIndex:index withObject:task];
    [self saveToUserDefaults];
}

- (void)deleteTask:(Task *)task
{
    [allTasks removeObject:task];
    [self saveToUserDefaults];
}


- (NSMutableArray*)getAllTasks
{
    return allTasks ;
}


- (NSMutableArray*)getHighTasks
{
    highTasks = [self getArray:highTasks Condition:@"High" Type:0];
    return  highTasks ;
}

- (NSMutableArray*)getMediumTasks
{
    medTasks = [self getArray:medTasks Condition:@"Medium" Type:0];
    return  medTasks ;
}

- (NSMutableArray*)getLowTasks
{
    lowTasks = [self getArray:lowTasks Condition:@"Low" Type:0];
    return  lowTasks ;
}

- (NSMutableArray*)getToDoTasks
{
    toDoTasks = [self getArray:toDoTasks Condition:@"ToDo" Type:1];
    return  toDoTasks ;
}

- (NSMutableArray *)getInProgressTasks
{
    inProgressTasks = [self getArray:inProgressTasks Condition:@"InProgress" Type:1];
    return inProgressTasks;
}

- (NSMutableArray *)getDoneTasks
{
    doneTasks = [self getArray:doneTasks Condition:@"Done" Type:1];
    return doneTasks;
}


- (NSMutableArray *)getArray:(NSMutableArray *)taskArr Condition:(NSString *)condition Type:(int)type
{
    if (taskArr.count > 0)
    {
        [taskArr removeAllObjects];
    }
    
    switch (type) {
        //Priority
        case 0:
             for(int i = 0 ; i < [allTasks count] ; i++)
               {
                   if ([[[allTasks objectAtIndex:i] tPriority] isEqualToString:condition])
                   {
                       [taskArr addObject:[allTasks objectAtIndex:i]];
                   }
               }
            break;
        //Status
        case 1:
            for(int i = 0 ; i < [allTasks count] ; i++)
            {
                if ([[[allTasks objectAtIndex:i] tStatus] isEqualToString:condition])
                {
                    [taskArr addObject:[allTasks objectAtIndex:i]];
                }
            }
        default:
            break;
    }
    return taskArr ;
}

-(void)saveToUserDefaults
{
    tasksData = [NSKeyedArchiver archivedDataWithRootObject: allTasks];
    [defaults setObject:tasksData forKey: @"allTasks"];
}

- (void)getFromUserDefaults
{
    tasksData = [defaults objectForKey:@"allTasks"];
    if(tasksData != nil){
        NSMutableArray *retTasks = [NSKeyedUnarchiver unarchiveObjectWithData:tasksData];
          if (retTasks != nil){
              allTasks = retTasks;
            [defaults synchronize];
          }
    }
}
+ (id)sharedInstance {
    static TaskManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
    }

@end
