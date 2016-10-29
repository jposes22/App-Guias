//
//  SlideGuideBorneiro.h
//  Plantilla Guias Turisticas
//
//  Created by Evelb on 29/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GuiaList.h"

@interface SlideGuideBorneiro : UIViewController
@property (nonatomic) NSInteger index;
@property (nonatomic, strong) GuiaList * guiaList;
@end
