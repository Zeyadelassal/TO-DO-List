//
//  Task.m
//  To-Do 2.0
//
//  Created by ZeyadEl3ssal on 12/22/19.
//  Copyright © 2019 ZeyadEl3ssal. All rights reserved.
//

#import "Task.h"

@implementation Task


- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.tName forKey:@"tName"];
    [encoder encodeObject:self.tDesc forKey:@"tDesc"];
    [encoder encodeObject:self.tPriority forKey:@"tPriority"];
    [encoder encodeObject:self.tStatus forKey:@"tStatus"];
    [encoder encodeObject:self.tPriorityImage forKey:@"taskPriorityImage"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)coder {
    if((self = [super init]))
    {
    self.tName = [coder decodeObjectForKey:@"tName"];
    self.tDesc = [coder decodeObjectForKey:@"tDesc"];
    self.tPriority = [coder decodeObjectForKey:@"tPriority"];
    self.tStatus = [coder decodeObjectForKey:@"tStatus"];
    self.tPriorityImage = [coder decodeObjectForKey:@"taskPriorityImage"];
    }
    return self;
}

@end
