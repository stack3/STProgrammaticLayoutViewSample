//
//  STHorizontal2ViewController.m
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


#import "STLayoutHorizontal2ViewController.h"

@implementation STLayoutHorizontal2ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Horizontal2";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    CGRect bounds = self.view.bounds;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    STLayoutHorizontal2View *customView = [[STLayoutHorizontal2View alloc] initWithFrame:bounds];
    _customView = customView;
    _customView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [_customView.longTextButton addTarget:self action:@selector(longTextButtonDidTap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_customView];
}

- (void)longTextButtonDidTap
{
    NSString *longText = @"Looooong text";
    [_customView.searchButton setTitle:longText forState:UIControlStateNormal];
    _customView.nameLabel.text = longText;
    [_customView setNeedsLayout];
}

@end
