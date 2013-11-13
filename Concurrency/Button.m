//
//  Button.m
//  Currency
//
//  Created by Nick Lockwood on 05/11/2013.
//  Copyright (c) 2013 Charcoal Design. All rights reserved.
//

#import "Button.h"

@implementation Button

static UIColor *selectedColor = nil;

+ (void)initialize
{
    selectedColor = [UIColor colorWithRed:0.2 green:0.6 blue:1 alpha:1];
}

- (void)setUp
{
    self.layer.cornerRadius = 8;
    self.clipsToBounds = YES;
    self.adjustsImageWhenHighlighted = NO;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(fadeToWhite) object:nil];
    self.backgroundColor = selectedColor;
    self.titleLabel.textColor = [UIColor whiteColor];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    self.titleLabel.textColor = [UIColor whiteColor];
    [self performSelector:@selector(fadeToWhite) withObject:nil afterDelay:0.1];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    self.titleLabel.textColor = [UIColor whiteColor];
    [self performSelector:@selector(fadeToWhite) withObject:nil afterDelay:0.1];
}

- (void)fadeToWhite
{
    [self crossfadeWithDuration:0.4];
    self.titleLabel.textColor = [self titleColorForState:UIControlStateNormal];
    self.backgroundColor = [UIColor whiteColor];
}

- (void)setHighlighted:(BOOL)highlighted
{
    //does nothing
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setUp];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        [self setUp];
    }
    return self;
}

@end
