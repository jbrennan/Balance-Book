//
//  JBDetailCell.m
//  Balance Book
//
//  Created by Jason Brennan on 29/10/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//

#import "JBDetailCell.h"


@implementation JBDetailCell
@synthesize type;
@synthesize name;

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
        // Initialization code
		type = [[UILabel alloc] initWithFrame:CGRectZero];
		type.font = [UIFont boldSystemFontOfSize:12];
		type.textColor =[UIColor darkGrayColor];
		type.textAlignment = UITextAlignmentRight;
		type.backgroundColor = [UIColor clearColor];
		
		name = [[UILabel alloc] initWithFrame:CGRectZero];
		name.font = [UIFont boldSystemFontOfSize:14];
		name.backgroundColor = [UIColor clearColor];
		
		[self.contentView addSubview:type];
		[self.contentView addSubview:name];
		
    }
    return self;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	CGRect baseRect = CGRectInset(self.contentView.bounds, 10, 10);
	CGRect rect = baseRect;
	//rect.origin.x += 15;
	
	rect.size.width = 60;
    type.frame = rect;
    rect.origin.x += 70;
    rect.size.width = baseRect.size.width - 70;
    name.frame = rect;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];
	if (selected) {
		name.textColor = [UIColor whiteColor];
		type.textColor = [UIColor whiteColor];
	} else {
		name.textColor = [UIColor blackColor];
		type.textColor = [UIColor darkGrayColor];
	}

    // Configure the view for the selected state
}


- (void)dealloc {
	[type release];
	[name release];
    [super dealloc];
}


@end
