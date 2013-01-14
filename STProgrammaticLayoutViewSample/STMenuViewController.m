//
//  STMenuViewController.m
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

#import "STMenuViewController.h"
#import "STLayoutFillViewController.h"
#import "STLayoutHeaderFooterViewController.h"
#import "STLayoutVerticalViewController.h"
#import "STLayoutHorizontalViewController.h"
#import "STLayoutHorizontal2ViewController.h"
#import "STLayoutHorizontal3ViewController.h"
#import "STLayoutWithKeypadViewController.h"

typedef enum {
    _STMenuFillOK,
    _STMenuFillNG,
    _STMenuHeaderFooter,
    _STMenuVertical,
    _STMenuHorizontal,
    _STMenuHorizontal2,
    _STMenuHorizontal3,
    _STMenuWithKeypad
} _STMenus;

@implementation STMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Menu";
        _menus = @[@"Fill(OK)", @"Fill(NG)", @"Header & Footer", @"Vertical", @"Horizontal", @"Horizontal2", @"Horizontal3", @"With Keypad"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView = tableView;
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _menus.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId = @"cellId";
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = [_menus objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == _STMenuFillOK) {
        STLayoutFillViewController *con = [[STLayoutFillViewController alloc] initWithOK:YES];
        [self.navigationController pushViewController:con animated:YES];
    } else if (indexPath.row == _STMenuFillNG) {
        STLayoutFillViewController *con = [[STLayoutFillViewController alloc] initWithOK:NO];
        [self.navigationController pushViewController:con animated:YES];
    } else if (indexPath.row == _STMenuHeaderFooter) {
        STLayoutHeaderFooterViewController *con = [[STLayoutHeaderFooterViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:con animated:YES];
    } else if (indexPath.row == _STMenuVertical) {
        STLayoutVerticalViewController *con = [[STLayoutVerticalViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:con animated:YES];
    } else if (indexPath.row == _STMenuHorizontal) {
        STLayoutHorizontalViewController *con = [[STLayoutHorizontalViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:con animated:YES];
    } else if (indexPath.row == _STMenuHorizontal2) {
        STLayoutHorizontal2ViewController *con = [[STLayoutHorizontal2ViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:con animated:YES];
    } else if (indexPath.row == _STMenuHorizontal3) {
        STLayoutHorizontal3ViewController *con = [[STLayoutHorizontal3ViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:con animated:YES];
    } else if (indexPath.row == _STMenuWithKeypad) {
        STLayoutWithKeypadViewController *con = [[STLayoutWithKeypadViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:con animated:YES];
    }
}

@end
