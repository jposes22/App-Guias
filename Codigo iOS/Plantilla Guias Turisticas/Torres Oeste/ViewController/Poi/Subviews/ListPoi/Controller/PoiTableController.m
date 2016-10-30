//
//  PoiTableController.m
//  TorresDeOeste
//
//  Created by Jose Pose on 22/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "PoiTableController.h"
#import "PoiTableViewCell.h"

@implementation PoiTableController


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _listOfPois.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"PoiTableViewCell";
    PoiTableViewCell * cell = [tableView  dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell){
        [tableView registerNib:[UINib nibWithNibName:@"PoiTableViewCell" bundle:nil] forCellReuseIdentifier:@"PoiTableViewCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"PoiTableViewCell"];
    }

    [cell loadData:(Poi *)[_listOfPois objectAtIndex:indexPath.row]];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(_delegatePoi && [_delegatePoi respondsToSelector:@selector(communicationPoiSelected:)]){
        [_delegatePoi communicationPoiSelected:(Poi *)[_listOfPois objectAtIndex:indexPath.row]];
    }
}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 160.0f;
}

@end
