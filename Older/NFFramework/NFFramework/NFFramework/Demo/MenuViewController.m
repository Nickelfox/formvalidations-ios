//
//  MenuViewController.m
//  NFFramework
//
//  Created by ras-fueled on 25/08/2014.
//  Copyright (c) 2014 Nickelfox. All rights reserved.
//

#import "MenuViewController.h"
#import "ValidationFieldDemoViewController.h"

#define kCellID @"kMenuCellID"

@interface MenuViewController ()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, weak)IBOutlet UITableView *tableView;
@end

@implementation MenuViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setupTableView];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)setupTableView {
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellID];
  [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID
                                                          forIndexPath:indexPath];
  cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
  cell.textLabel.text = [self textForCellAtIndexPath:indexPath];
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
  [self handleRowSelectedAtIndexPath:indexPath];
}

#pragma mark - Helper
- (NSString *)textForCellAtIndexPath:(NSIndexPath *)indexPath {
  NSString *text;
  switch (indexPath.row) {
    case 0:
      text = @"Validation Field";
      break;
    case 1:
      text = @"Connect";
      break;
    default:
      break;
  }
  return text;
}

- (void)handleRowSelectedAtIndexPath:(NSIndexPath *)indexPath {
  switch (indexPath.row) {
    case 0:{ // Validation Field
      [self showDemoForValidationField];
    }
      break;
    case 1:{ // Connect Flow
      [self showDemoForConnectFlow];
    }
      break;
    default:
      break;
  }
}

#pragma mark - Demos
- (void)showDemoForValidationField {
  ValidationFieldDemoViewController *validationFieldVC = [[ValidationFieldDemoViewController alloc] init];
  [self.navigationController pushViewController:validationFieldVC animated:YES];
}

- (void)showDemoForConnectFlow {
  UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Connect" bundle:[NSBundle mainBundle]];
  UINavigationController *connectNav = [storyboard instantiateInitialViewController];
  [self.navigationController presentViewController:connectNav animated:YES completion:nil];
}
@end
