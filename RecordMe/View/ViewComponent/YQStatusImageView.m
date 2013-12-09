//
// Created by Huang Yuqing on 12/9/13.
// Copyright (c) 2013 YQ. All rights reserved.
//


#import "YQStatusImageView.h"


@implementation YQStatusImageView

- (id)initWithImage:(UIImage *)image {
    self = [super initWithImage:image];
    if (self) {
        self.frame = CGRectMake(0, 0, 14, 14);
    }

    return self;
}

@end