//
//  STViewController.m
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

#import "STLayoutFillViewController.h"

@implementation STLayoutFillViewController

- (id)initWithOK:(BOOL)isOK
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _isOK = isOK;
        self.title = [NSString stringWithFormat:@"Fill(%@)", isOK ? @"OK" : @"NG"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    CGRect bounds = self.view.bounds;
    NSLog(@"self.view.bounds(%f,%f,%f,%f)", bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height);
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _button = button;
    [_button setTitle:@"Button fills self.view." forState:UIControlStateNormal];
    _button.titleLabel.font = [UIFont systemFontOfSize:24.0f];
    _button.frame = bounds;
    if (_isOK) {
        _button.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    }
    [self.view addSubview:_button];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // You do not set nil to _label because it is already nil with release object.
}

@end
