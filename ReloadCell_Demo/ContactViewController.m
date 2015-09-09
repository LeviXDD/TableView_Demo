//
//  ContactViewController.m
//  ReloadCell_Demo
//
//  Created by 黎海涛 on 15/9/9.
//  Copyright (c) 2015年 dianzhidao. All rights reserved.
//

#import "ContactViewController.h"
#import "Contact.h"
#import "ContactGroup.h"

#define kSearchBarHeight 44
@interface ContactViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate,UISearchBarDelegate>{
    UITableView *_tableView;
    UISearchBar *_searchBar;
    NSMutableArray *_contacts;
    NSIndexPath *_selectedIndexPath;
    BOOL _isInsert;
}

@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
   
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
     [self addSearchBar];
    [self.view addSubview:_tableView];
    
}
- (IBAction)popBack:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (IBAction)remove:(id)sender {
    _isInsert = NO;
    [_tableView setEditing:!_tableView.isEditing animated:YES];
}
- (IBAction)add:(id)sender {
    _isInsert = YES;
     [_tableView setEditing:!_tableView.isEditing animated:YES];
}

#pragma mark - 数据源方法
#pragma mark 分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _contacts.count;
}

#pragma mark 每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    ContactGroup *group = _contacts[section];
    return group.contacts.count;
}

#pragma mark 返回每行单元格
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ContactGroup *group = _contacts[indexPath.section];
    Contact *contact = group.contacts[indexPath.row];
    //设置标识符
    static NSString *cellIdentifier = @"UITableViewCellIdentifieKey1";
    static NSString *cellIdentifierForFirstRow = @"UITableViewCellIdentifierKeyWithSwitch";
    
    
    
    UITableViewCell *cell;
    if (indexPath.row == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierForFirstRow];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    }
    
    if (!cell) {
        if (indexPath.row == 0) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifierForFirstRow];
            UISwitch *sw = [[UISwitch alloc]init];
            [sw addTarget:self action:@selector(switchValueChange:) forControlEvents:UIControlEventValueChanged];
            cell.accessoryView = sw;
        } else {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    
    if (indexPath.row == 0) {
        ((UISwitch *)cell.accessoryView).tag=indexPath.section;
    }
    
    cell.textLabel.text = [contact getName];
    cell.detailTextLabel.text = contact.phoneNumber;
    return cell;
}

#pragma mark 返回每组头标题名称
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    ContactGroup *group = _contacts[section];
    return group.name;
}

//#pragma mark 返回每组尾部说明
//-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
//    ContactGroup *group=_contacts[section];
//    return group.detail;
//}

#pragma mark 返回每组标题索引
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    NSMutableArray *indexs=[[NSMutableArray alloc]init];
    for(ContactGroup *group in _contacts){
        [indexs addObject:group.name];
    }
    return indexs;
}

#pragma mark - 代理方法
#pragma mark 设置分组标题内容高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section==0){
        return 20;
    }
    return 20;
}

#pragma mark 设置每行高度（每行高度可以不一样）
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

#pragma mark 取得当前操作状态，根据不同的状态左侧出现不同的操作按钮
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_isInsert) {
        return UITableViewCellEditingStyleInsert;
    }
    return UITableViewCellEditingStyleDelete;
}

//#pragma mark 设置尾部说明内容高度
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 40;
//}
#pragma mark 删除操作
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    ContactGroup *group = _contacts[indexPath.section];
    Contact *contact = group.contacts[indexPath.row];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [group.contacts removeObject:contact];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
        
        if (group.contacts.count == 0) {
            [_contacts removeObject:group];
            [tableView reloadData];
        }
    }else if(editingStyle==UITableViewCellEditingStyleInsert){
        Contact *newContact=[[Contact alloc]init];
        newContact.firstName=@"first";
        newContact.lastName=@"last";
        newContact.phoneNumber=@"12345678901";
        [group.contacts copy];
        [group.contacts insertObject:newContact atIndex:indexPath.row];
        [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];//注意这里没有使用reladData刷新
    }
}

#pragma mark 选中单元格
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _selectedIndexPath = indexPath;
    ContactGroup *group = _contacts[indexPath.section];
    Contact *contact = group.contacts[indexPath.row];
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"System Info" message:[contact getName] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    UITextField *tf = [alert textFieldAtIndex:0];
    tf.text = contact.phoneNumber;
    [alert show];
}

#pragma mark 窗口的代理方法，用户保存数据
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    //当点击了第二个按钮（OK）
    if (buttonIndex==1) {
        UITextField *textField= [alertView textFieldAtIndex:0];
        //修改模型数据
        ContactGroup *group=_contacts[_selectedIndexPath.section];
        Contact *contact=group.contacts[_selectedIndexPath.row];
        contact.phoneNumber=textField.text;
        //刷新表格
        [_tableView reloadData];
    }
}

-(void)switchValueChange:(UISwitch *)sw{
    NSLog(@"section:%li,switch:%i",(long)sw.tag, sw.on);
}

-(void)initData{
    _contacts = [[NSMutableArray alloc]init];
    
    Contact *contact1=[Contact initWithFirstName:@"Cui" andLastName:@"Kenshin" andPhoneNumber:@"18500131234"];
    Contact *contact2=[Contact initWithFirstName:@"Cui" andLastName:@"Tom" andPhoneNumber:@"18500131237"];
    ContactGroup *group1=[ContactGroup initWithName:@"C" andDetail:@"With names beginning with C" andContacts:[NSMutableArray arrayWithObjects:contact1,contact2, nil]];
    [_contacts addObject:group1];
    
    
    
    Contact *contact3=[Contact initWithFirstName:@"Lee" andLastName:@"Terry" andPhoneNumber:@"18500131238"];
    Contact *contact4=[Contact initWithFirstName:@"Lee" andLastName:@"Jack" andPhoneNumber:@"18500131239"];
    Contact *contact5=[Contact initWithFirstName:@"黎" andLastName:@"Rose" andPhoneNumber:@"18500131240"];
    ContactGroup *group2=[ContactGroup initWithName:@"L" andDetail:@"With names beginning with L" andContacts:[NSMutableArray arrayWithObjects:contact3,contact4,contact5, nil]];
    [_contacts addObject:group2];
    
    
    
    Contact *contact6=[Contact initWithFirstName:@"Sun" andLastName:@"Kaoru" andPhoneNumber:@"18500131235"];
    Contact *contact7=[Contact initWithFirstName:@"Sun" andLastName:@"Rosa" andPhoneNumber:@"18500131236"];
    
    ContactGroup *group3=[ContactGroup initWithName:@"S" andDetail:@"With names beginning with S" andContacts:[NSMutableArray arrayWithObjects:contact6,contact7, nil]];
    [_contacts addObject:group3];
    
    
    Contact *contact8=[Contact initWithFirstName:@"Wang" andLastName:@"Stephone" andPhoneNumber:@"18500131241"];
    Contact *contact9=[Contact initWithFirstName:@"Wang" andLastName:@"Lucy" andPhoneNumber:@"18500131242"];
    Contact *contact10=[Contact initWithFirstName:@"Wang" andLastName:@"Lily" andPhoneNumber:@"18500131243"];
    Contact *contact11=[Contact initWithFirstName:@"Wang" andLastName:@"Emily" andPhoneNumber:@"18500131244"];
    Contact *contact12=[Contact initWithFirstName:@"Wang" andLastName:@"Andy" andPhoneNumber:@"18500131245"];
    ContactGroup *group4=[ContactGroup initWithName:@"W" andDetail:@"With names beginning with W" andContacts:[NSMutableArray arrayWithObjects:contact8,contact9,contact10,contact11,contact12, nil]];
    [_contacts addObject:group4];
    
    
    Contact *contact13=[Contact initWithFirstName:@"Zhang" andLastName:@"Joy" andPhoneNumber:@"18500131246"];
    Contact *contact14=[Contact initWithFirstName:@"Zhang" andLastName:@"Vivan" andPhoneNumber:@"18500131247"];
    Contact *contact15=[Contact initWithFirstName:@"Zhang" andLastName:@"Joyse" andPhoneNumber:@"18500131248"];
    ContactGroup *group5=[ContactGroup initWithName:@"Z" andDetail:@"With names beginning with Z" andContacts:[NSMutableArray arrayWithObjects:contact13,contact14,contact15, nil]];
    [_contacts addObject:group5];
}


#pragma mark 添加搜索框
-(void)addSearchBar{
    CGRect searchBarRect = CGRectMake(0, 0, self.view.frame.size.width, kSearchBarHeight);
    _searchBar = [[UISearchBar alloc]initWithFrame:searchBarRect];
    _searchBar.placeholder = @"请在此处输入关键字...";
    _searchBar.showsCancelButton = YES;
    _searchBar.delegate = self;
    _tableView.tableHeaderView = _searchBar;
}



































@end
