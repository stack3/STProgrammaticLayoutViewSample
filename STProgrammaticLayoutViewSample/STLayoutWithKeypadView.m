//
//  STLayoutWithKeypadView.m
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

#import "STLayoutWithKeypadView.h"

#define _ST_TOOLBAR_HEIGHT 44

@implementation STLayoutWithKeypadView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGRect bounds = self.bounds;
        
        CGRect textViewFrame;
        textViewFrame.origin.x = 0;
        textViewFrame.origin.y = 0;
        textViewFrame.size.width = bounds.size.width;
        textViewFrame.size.height = bounds.size.height - _ST_TOOLBAR_HEIGHT;
        _textView = [[UITextView alloc] initWithFrame:textViewFrame];
        _textView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        _textView.font = [UIFont systemFontOfSize:16.0];
        [self addSubview:_textView];
        
        CGRect toolbarFrame;
        toolbarFrame.origin.x = 0;
        toolbarFrame.origin.y = textViewFrame.size.height;
        toolbarFrame.size.width = bounds.size.width;
        toolbarFrame.size.height = _ST_TOOLBAR_HEIGHT;
        _toolbar = [[UIToolbar alloc] initWithFrame:toolbarFrame];
        _toolbar.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin;
        [self addSubview:_toolbar];
        
        UIBarButtonItem *flexibleItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem *toggleKeypadButton = [[UIBarButtonItem alloc] initWithTitle:@"Keypad"
                                                                               style:UIBarButtonItemStyleBordered
                                                                              target:self
                                                                              action:@selector(toggleKeypadButtonDidTap)];
        _toolbar.items = @[flexibleItem, toggleKeypadButton];
    }
    return self;
}

- (void)toggleKeypadButtonDidTap
{
    if ([_textView isFirstResponder]) {
        [_textView resignFirstResponder];
    } else {
        [_textView becomeFirstResponder];
    }
}

@end
