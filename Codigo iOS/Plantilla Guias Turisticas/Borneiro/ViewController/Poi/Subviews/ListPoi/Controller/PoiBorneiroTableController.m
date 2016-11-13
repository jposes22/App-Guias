//
//  PoiTableController.m
//  TorresDeOeste
//
//  Created by Jose Pose on 22/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "PoiBorneiroTableController.h"
#import "PoiTableViewCell.h"

@implementation PoiBorneiroTableController


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _listOfPois.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"PoiBorneiroTableViewCell";
    id cell = nil;
    if(_isSinglePoi){
        identifier = @"PoiBorneiroSinglePoiTableViewCell";
        cell = [tableView  dequeueReusableCellWithIdentifier:identifier];
    }else{
        cell = [tableView  dequeueReusableCellWithIdentifier:identifier];
    }
    
    if (!cell){
        [tableView registerNib:[UINib nibWithNibName:identifier bundle:nil] forCellReuseIdentifier:identifier];
        cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    }

    [cell loadData:(Poi *)[_listOfPois objectAtIndex:indexPath.row]];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(_delegatePoi && [_delegatePoi respondsToSelector:@selector(communicationPoiSelected:)] && _isSinglePoi){
        [_delegatePoi communicationPoiSelected:indexPath.row];
    }
}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 160.0f;
}

@end
