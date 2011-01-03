//
//  TransactionValueView.h
//  SimpleEditing
//
//  Created by Jason Brennan on 28/08/08.
//  Copyright 2008 Jason Brennan. All rights reserved.
//
//  Used in table cells to display money values.

#import <UIKit/UIKit.h>


@interface JBTransactionValueView : UIView {
	UIImage *valueIcon;
	NSString *value;
	
	CGFloat fontSize;
	CGSize textSize;
}
@property (nonatomic, retain) UIImage *valueIcon;
@property (nonatomic, retain) NSString *value;

- (id)initWithImageNamed:(NSString *)imageName itemValue:(NSString *)itemValue;
- (void)setupValueDisplay;

@end
