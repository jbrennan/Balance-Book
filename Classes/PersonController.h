//
//  PersonController.h
//  Balance Book
//
//  Created by Jason Brennan on 07/09/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"


@interface PersonController : NSObject {
	NSMutableArray *personList;
}
@property (nonatomic, retain) NSMutableArray *personList;

- (void)createDemoData;

@end
