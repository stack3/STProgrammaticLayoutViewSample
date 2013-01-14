//
//  STLayoutHeaderFooterViewController.m
//  STPlaceSubviewsSample
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


#import "STLayoutHeaderFooterViewController.h"

@implementation STLayoutHeaderFooterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Header & Footer";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    CGRect bounds = self.view.bounds;
    
    CGRect headerViewFrame;
    headerViewFrame.origin.x = 0;
    headerViewFrame.origin.y = 0;
    headerViewFrame.size.width = bounds.size.width;
    headerViewFrame.size.height = 50;
    UIView *headerView = [[UIView alloc] initWithFrame:headerViewFrame];
    _headerView = headerView;
    _headerView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    _headerView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_headerView];

    CGRect footerViewFrame;
    footerViewFrame.origin.x = 0;
    footerViewFrame.origin.y = bounds.size.height - 50;
    footerViewFrame.size.width = bounds.size.width;
    footerViewFrame.size.height = 50;
    UIView *footerView = [[UIView alloc] initWithFrame:footerViewFrame];
    _footerView = footerView;
    _footerView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin;
    _footerView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_footerView];
}

@end
