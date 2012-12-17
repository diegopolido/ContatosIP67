//
//  Contato.m
//  ContatosIP67
//
//  Created by ios3135 on 11/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Contato.h"

@implementation Contato

@synthesize nome, telefone, email, endereco, site;

-(void) encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:nome forKey:@"nome"];
    [aCoder encodeObject:telefone forKey:@"telefone"];
    [aCoder encodeObject:email forKey:@"email"];
    [aCoder encodeObject:endereco forKey:@"endereco"];
    [aCoder encodeObject:site forKey:@"site"];
}

-(id) initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if(self) {
        [self setNome:[aDecoder decodeObjectForKey:@"nome"]];
        [self setNome:[aDecoder decodeObjectForKey:@"telefone"]];
        [self setNome:[aDecoder decodeObjectForKey:@"email"]];
        [self setNome:[aDecoder decodeObjectForKey:@"endereco"]];
        [self setNome:[aDecoder decodeObjectForKey:@"site"]];
    }
    return self;
}
@end
