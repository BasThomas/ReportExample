//
//  Article.h
//  ReportModal
//
//  Created by Bas Broek on 11/16/15.
//  Copyright © 2015 Bas Broek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Article : NSObject

@property int identifier;
@property (weak, nonatomic) NSString *title;
@property (weak, nonatomic) NSURL *reportURL;

- (id)initWithID:(int) identifier title:(NSString *)title reportURL:(NSURL *)reportURL;

@end