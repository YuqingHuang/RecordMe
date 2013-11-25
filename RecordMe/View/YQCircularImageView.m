//
//  YQCircularImageView.m
//  RecordMe
//
//  Created by Huang Yuqing on 11/25/13.
//  Copyright (c) 2013 YQ. All rights reserved.
//

#import "YQCircularImageView.h"
#import <QuartzCore/QuartzCore.h>

@implementation YQCircularImageView
- (id)initWithImage:(UIImage *)image diameter:(float)newSize {
    self = [super initWithImage:image];
    if (self) {
        [self _roundedViewWithDiameter:newSize];
    }

    return self;
}

-(void)_roundedViewWithDiameter:(float)newSize {
    CGPoint saveCenter = self.center;
    CGRect newFrame = CGRectMake(self.frame.origin.x, self.frame.origin.y, newSize, newSize);
    self.frame = newFrame;
    self.layer.cornerRadius = newSize / 2.0;
    self.center = saveCenter;
    self.clipsToBounds = YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
