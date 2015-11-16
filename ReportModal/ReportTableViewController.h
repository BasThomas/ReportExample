//
//  ReportTableViewController.h
//  ReportModal
//
//  Created by Bas Broek on 11/16/15.
//  Copyright © 2015 Bas Broek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReportTableViewController : UITableViewController <UITextViewDelegate>

// Please make sure all cells have a selection of None.

@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@property (weak, nonatomic) IBOutlet UILabel *articleTitle;

@property (weak, nonatomic) IBOutlet UILabel *messageRequiredLabel;
@property (weak, nonatomic) IBOutlet UITextView *messageTextView;

@property (weak, nonatomic) IBOutlet UILabel *surnameLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *surnameWidthConstraint;
// Please make sure the surnameTextField has a capitalization type of Words.
@property (weak, nonatomic) IBOutlet UITextField *surnameTextField;

@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lastNameWidthConstraint;
// Please make sure the lastNameTextField has a capitalization type of Words.
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;

@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *emailWidthConstraint;
// Please make sure the emailTextField has a keyboard of type E-mail.
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

@property (weak, nonatomic) IBOutlet UISwitch *rememberSwitch;

- (void)setupSpacing;
- (void)setup;
- (void)save;
- (void)report;

@end