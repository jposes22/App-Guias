//
//  Metodos.m
//  TorresDeOeste
//
//  Created by Evelb on 22/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "Metodos.h"

@implementation Metodos
+(NSAttributedString *) convertHTMLToString:(NSString *)textHtml{
    
    NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[textHtml dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    
    return attrStr;
}
@end
