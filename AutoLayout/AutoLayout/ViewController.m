//
//  ViewController.m
//  AutoLayoutCell
//
//  Created by 王宏志 on 16/4/23.
//  Copyright © 2016年 王宏志. All rights reserved.
//

#import "ViewController.h"
#import "HZTableViewCell.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *dataList;

@property (nonatomic, strong) NSMutableDictionary *heightContent;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //    self.tableView.rowHeight = UITableViewAutomaticDimension;
    //    self.tableView.estimatedRowHeight = 50;\
    
    
    /*methd  2 */
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HZTableViewCell class])
                                               bundle:[NSBundle mainBundle]]
         forCellReuseIdentifier:NSStringFromClass([HZTableViewCell class])];
    
    
}

#pragma mark -
#pragma mark - setter / getter
- (NSArray *)dataList
{
    if (!_dataList) {
        _dataList = @[@"文案111文案111文案111文案111文案111文案111文案111文案111文案111",
                      @"文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111",
                      @"文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111",
                      @"文案11文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111",
                      @"文案1文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案11111",
                      @"文案文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111",
                      @"文案文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111",
                      @"文案1文案111文案111文案111文案111文案111文案111文案111文案111文案11111",
                      @"文案1文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案11111",
                      @"文案111",
                      @"文案11文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案111文案1111",];
    }
    return _dataList;
}

- (NSMutableDictionary *)heightContent
{
    if (!_heightContent) {
        _heightContent = [NSMutableDictionary dictionary];
    }
    return _heightContent;
}

#pragma mark -
#pragma mark - delegate && datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    HZTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HZTableViewCell class])];
    //    if (!cell) {
    //        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([HZTableViewCell class]) owner:nil options:nil]firstObject];
    //    }
    //    cell.testLabel.text = self.dataList[indexPath.row];
    //    cell.testLabel.preferredMaxLayoutWidth = 300;
    HZTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HZTableViewCell class])];
    cell.testLabel.text = self.dataList[indexPath.row];
    
    cell.testLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 16;
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    [self.heightContent setObject:@(size.height + 1) forKey:indexPath];
    NSLog(@"cell for row %f",size.height + 1);
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"height for row %@",self.heightContent[indexPath] );
    return [self.heightContent[indexPath] floatValue];
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
