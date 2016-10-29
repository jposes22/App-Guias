//
//  CopyrightTableController.m
//  TorresDeOeste
//
//  Created by Evelb on 26/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "CopyrightTableController.h"
#import "CopyrightCell.h"
#import "UtilsAppearance.h"
#import "HeaderCopyright.h"

@implementation CopyrightTableController
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _listCopyRight.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        static NSString *identifier = @"CopyrightCell";
        
        CopyrightCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell){
            [tableView registerNib:[UINib nibWithNibName:identifier bundle:nil] forCellReuseIdentifier:identifier];
            cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        }
        NSString * copryrignt = [_listCopyRight objectAtIndex:indexPath.row];

        [cell loadData:@"nombre" texto:copryrignt];
        
        return cell;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    HeaderCopyright *nibView = [[[NSBundle mainBundle] loadNibNamed:@"HeaderCopyright" owner:self options:nil] objectAtIndex:0];
    nibView.frame = CGRectMake(0, 0, tableView.frame.size.width, 50);

    [nibView loadData:@"Propiedad intelectual"];
    return nibView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50.0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

@end
