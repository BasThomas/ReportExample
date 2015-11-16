//
//  ReportTableViewController.m
//  ReportModal
//
//  Created by Bas Broek on 11/16/15.
//  Copyright © 2015 Bas Broek. All rights reserved.
//

#import "ReportTableViewController.h"
#import "Article.h"

int const DetailSection = 2;

int const SurnameRow = 0;
int const LastNameRow = 1;
int const EmailRow = 2;

NSString *const kSurnameKey = @"surname";
NSString *const kLastNameKey = @"lastName";
NSString *const kEmailKey = @"email";
NSString *const kRememberKey = @"remember_details";

@interface ReportTableViewController ()

@property (nonatomic, strong) Article *article;

@end

@implementation ReportTableViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Create an article. Normally, you provide this when preparing for the segue.
  _article = [[Article alloc] initWithID: 1
                                   title: @"How to reset Apple Watch"
                               reportURL: [NSURL URLWithString:@"reportURL.com/report/1"]];
  
  // The `done` button should only be enabled if the message, surname, last name and email
  // have all been filled in. For brevity, this has been left out of this example.
  // You can use `- textFieldChanged` for the text fields and `- textViewDidChange` for the text view.
  [_doneButton setEnabled:YES];
  [self setup];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

#pragma mark - Actions
- (IBAction)cancel:(id)sender {
  // Dismiss the modal, without doing anything else.
  [self dismissViewControllerAnimated:YES
                           completion:nil];
}

- (IBAction)done:(id)sender {
  // Dismiss the modal, but first save the content.
  // Saving also takes care of reporting the article.
  [self save];
  
  [self dismissViewControllerAnimated:YES
                           completion:nil];
}

#pragma mark - UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView {
  // As a textView does not support placeholders, add one
  // manually. Remove or add it here if needed.
  if (textView.text.length == 0) {
    _messageRequiredLabel.hidden = NO;
  } else {
    _messageRequiredLabel.hidden = YES;
  }
}

#pragma mark - Setup
- (void)setup {
  [self setupSpacing];
  
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  NSString *surname = [defaults stringForKey: kSurnameKey];
  NSString *lastName = [defaults stringForKey: kLastNameKey];
  NSString *email = [defaults stringForKey: kEmailKey];
  BOOL rememberedDetails = [defaults boolForKey: kRememberKey];
  
  _articleTitle.text = _article.title;
  
  [_messageTextView becomeFirstResponder];
  
  _surnameTextField.text = surname;
  _lastNameTextField.text = lastName;
  _emailTextField.text = email;
  
  _rememberSwitch.on = rememberedDetails;
}

- (void)setupSpacing {
  // Sets up equal widths for the labels next to the text fields here,
  // as this can't be done in Interface Builder.
  // This means all text fields align vertically.
  NSArray *labels = [NSArray arrayWithObjects: _surnameLabel, _lastNameLabel, _emailLabel, nil];
  CGFloat maxLabelWidth = 0.0;
  
  for (UILabel *label in labels) {
    CGFloat currentWidth = label.intrinsicContentSize.width;
    if (currentWidth > maxLabelWidth) {
      maxLabelWidth = currentWidth;
    }
  }
  
  NSArray *labelConstraints = [NSArray arrayWithObjects: _surnameWidthConstraint, _lastNameWidthConstraint, _emailWidthConstraint, nil];
  
  for (NSLayoutConstraint *constraint in labelConstraints) {
    constraint.constant = maxLabelWidth;
  }
}

#pragma mark - Saving
- (void)save {
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  
  // Update the remember-default.
  [defaults setBool: _rememberSwitch.on
             forKey: kRememberKey];
  
  // If the details should be remembered / saved, do so now.
  // If the details should *NOT* be remembered / saved, remove them.
  if (_rememberSwitch.on) {
    [defaults setObject: _surnameTextField.text
                 forKey: kSurnameKey];
    [defaults setObject: _lastNameTextField.text
                 forKey: kLastNameKey];
    // It's neat to save the email as a lowercase string, in case the user
    // added some capitalization.
    [defaults setObject: _emailTextField.text.lowercaseString
                 forKey: kEmailKey];
  } else {
    [defaults removeObjectForKey: kSurnameKey];
    [defaults removeObjectForKey: kLastNameKey];
    [defaults removeObjectForKey: kEmailKey];
  }
  
  // ... and report the message. :-)
  [self report];
}

#pragma mark - Reporting
- (void)report {
  // Send the message and the details along with the provided reportURL.
  // These should be provided as parameters.
  
  // Use a delegate to be able to show the user if the report failed
  // or succeeded in the ViewController.
  
  NSLog(@"Should report article here...");
  NSLog(@"See comments in %s. (line %d)", __PRETTY_FUNCTION__, __LINE__);
  
  NSLog(@"---");
  
  NSLog(@"[MESSAGE]: %@", _messageTextView.text);
  NSLog(@"[SURNAME]: %@", _surnameTextField.text);
  NSLog(@"[EMAIL]: %@", _emailTextField.text.lowercaseString);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  switch (indexPath.section) {
    case DetailSection:
      switch (indexPath.row) {
        case SurnameRow:
          [_surnameTextField becomeFirstResponder];
          break;
        case LastNameRow:
          [_lastNameTextField becomeFirstResponder];
          break;
        case EmailRow:
          [_emailTextField becomeFirstResponder];
          break;
          
        default:
          break;
      }
      break;
      
    default:
      break;
  }
}

@end