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
        [self setTelefone:[aDecoder decodeObjectForKey:@"telefone"]];
        [self setEmail:[aDecoder decodeObjectForKey:@"email"]];
        [self setEndereco:[aDecoder decodeObjectForKey:@"endereco"]];
        [self setSite:[aDecoder decodeObjectForKey:@"site"]];
    }
    return self;
}
@end
