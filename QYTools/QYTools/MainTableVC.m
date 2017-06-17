//
//  MainTableVC.m
//  QYTools
//
//  Created by 张庆玉 on 15/05/2017.
//  Copyright © 2017 张庆玉. All rights reserved.
//

#import "MainTableVC.h"

@interface MainTableVC ()

@end

@implementation MainTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self createData];
//    
//    [self findData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

//// 创建记录
//- (void)createData {
//    Person *person = [Person MR_createEntity];
//    person.firstName = @"张";
//    person.lastName = @"三";
//    person.age = 25;
//    [[NSManagedObjectContext MR_defaultContext]     MR_saveToPersistentStoreAndWait];
//}
//
//// 查询记录
//- (void)findData {
//    // 查找数据库中的所有数据
//    NSArray *person = [Person MR_findAll];
//    // 查找所有的Person并按照firstName排序
//    NSArray *personSorted = [Person MR_findAllSortedBy:@"firstName" ascending:YES];
//    // 查找所有的age属性为25的Person记录
//    NSArray *personAgeEqual25 = [Person MR_findByAttribute:@"age" withValue:[NSNumber numberWithInt:25]];
//    // 查找数据库中的第一条记录
//    Person *personFirst = [Person MR_findFirst];
//    
//    NSLog(@"%@  %@  %@  %@", person, personSorted, personAgeEqual25, personFirst);
//    
//    // 查找数据库中的第一条记录的全名
//    personFirst = [Person MR_findFirst];
//    NSLog(@"personName:%@%@", personFirst.firstName, personFirst.lastName);
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
