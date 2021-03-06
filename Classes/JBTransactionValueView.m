//
//  TransactionValueView.m
//  SimpleEditing
//
//  Created by Jason Brennan on 28/08/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//

#import "JBTransactionValueView.h"


@implementation JBTransactionValueView
@synthesize valueIcon, value;


- (id)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		//
	}
	return self;
}

- (id)initWithImageNamed:(NSString *)imageName itemValue:(NSString *)itemValue {
	if (self = [super init]){
		UIImage *image;
		if (image = [UIImage imageNamed:imageName]) {
			
			CGRect frame = CGRectMake(0, 0, image.size.width, image.size.height);
			if (self = [super initWithFrame:frame]) {
				self.opaque = NO;
				self.valueIcon = image;
				
				self.value = itemValue;
				[self setupValueDisplay];
			}
		}
	}
	return self;
}


- (void)drawRect:(CGRect)rect {
	// Drawing code
	[valueIcon drawAtPoint:(CGPointMake(0, 0))];
	
	CGFloat x = self.bounds.size.width/2 - textSize.width/2;
	CGFloat y = self.bounds.size.height/2 - textSize.height/2;
	CGPoint point;
	
	fontSize = 16;
	UIFont *font = [UIFont systemFontOfSize:fontSize];
	
	[[UIColor blackColor] set];
	point = CGPointMake(x-8.8, y-3);
	
	[value drawAtPoint:point 
			  forWidth:(self.bounds.size.width) 
			  withFont:font fontSize:fontSize 
		 lineBreakMode:UILineBreakModeMiddleTruncation 
	baselineAdjustment:UIBaselineAdjustmentAlignBaselines];
	
	
	
}

- (void)setupValueDisplay {
	UIFont *font = [UIFont systemFontOfSize:9];
	
	textSize = [value sizeWithFont:font];
	
	[self setNeedsDisplay];
}

- (void)dealloc {
	[valueIcon release];
	[value release];
	[super dealloc];
}


@end
