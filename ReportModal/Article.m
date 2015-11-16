//
//  Article.m
//  ReportModal
//
//  Created by Bas Broek on 11/16/15.
//  Copyright © 2015 Bas Broek. All rights reserved.
//

#import "Article.h"

@implementation Article

- (id)initWithID:(int)identifier title:(NSString *)title reportURL:(NSURL *)reportURL {
  self.identifier = identifier;
  self.title = title;
  self.reportURL = reportURL;
  
  return self;
}

@end