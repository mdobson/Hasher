//
//  MSDViewController.h
//  Hasher
//
//  Created by Matthew Dobson on 5/16/14.
//  Copyright (c) 2014 Matthew Dobson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSDViewController : UIViewController

@property (nonatomic, retain) IBOutlet UITextField *source;
@property (nonatomic, retain) IBOutlet UILabel *target;

-(IBAction)performHash:(id)sender;

@end
