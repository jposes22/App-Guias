//
//  RemoteImageDetalleVO.h
//  TorresDeOeste
//
//  Created by Evelb on 11/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GenericResponse.h"
@interface RemoteImageDetalleVO : GenericResponse
-(RemoteImageDetalleVO *)initGuiaDetalleImagen:(id) jsonObject;

@end
