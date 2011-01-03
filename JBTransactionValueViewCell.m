//
//  JBTransactionValueViewCell.m
//  Balance Book
//
//  Created by Jason Brennan on 04/11/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//

#import "JBTransactionValueViewCell.h"


@implementation JBTransactionValueViewCell
@synthesize valueView;
@synthesize name;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // Initialization code
		name = [[UILabel alloc] initWithFrame:CGRectZero];
		name.text = @"Allo";
		name.backgroundColor = [UIColor clearColor];
		
		valueView = [[JBTransactionValueView alloc] initWithImageNamed:@"ValueViewIconYellowSmall.png" itemValue:@"50.99"];
		
		[self.contentView addSubview:name];
		[self.contentView addSubview:valueView];
    }
    return self;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	NSLog(@"Layout");
	CGRect baseRect = CGRectInset(self.contentView.bounds, 10, 10);
	CGRect rect = baseRect;
	
	name.frame = rect;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];
	
	

    // Configure the view for the selected state
}


- (void)dealloc {
	[valueView release];
	[name release];
    [super dealloc];
}


@end
