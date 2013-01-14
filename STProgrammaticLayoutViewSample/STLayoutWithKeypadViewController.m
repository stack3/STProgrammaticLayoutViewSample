//
//  STLayoutWithKeypadViewController.m
//  STProgrammaticLayoutViewSample
//
//  Created by EIMEI on 2012/11/22.
//
//  Copyright (c) 2012 stack3.net (http://stack3.net/)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "STLayoutWithKeypadViewController.h"

@implementation STLayoutWithKeypadViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"With Keypad";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    CGRect bounds = self.view.bounds;
    STLayoutWithKeypadView *customView = [[STLayoutWithKeypadView alloc] initWithFrame:bounds];
    _customView = customView;
    _customView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:customView];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [notificationCenter addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    [_customView.textView becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter removeObserver:self];
}

- (void)keyboardWillShow:(NSNotification *)notification
{
    NSDictionary *info = [notification userInfo];
    NSValue *keyValue = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keypadFrame = [keyValue CGRectValue];
    CGFloat keypadHeight = UIInterfaceOrientationIsPortrait(self.interfaceOrientation) ? keypadFrame.size.height : keypadFrame.size.width;
    NSTimeInterval duration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    CGRect bounds = self.view.bounds;
    
    [UIView animateWithDuration:duration animations:^{
        CGRect customViewFrame = _customView.frame;
        customViewFrame.size.height = bounds.size.height - keypadHeight;
        _customView.frame = customViewFrame;
    }];
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    NSDictionary *info = [notification userInfo];
    NSTimeInterval duration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    CGRect bounds = self.view.bounds;
    
    [UIView animateWithDuration:duration animations:^{
        CGRect customViewFrame = _customView.frame;
        customViewFrame.size.height = bounds.size.height;
        _customView.frame = customViewFrame;
    }];
}

@end
