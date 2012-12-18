//
//  ListaContatoProtocol.h
//  ContatosIP67
//
//  Created by ios3135 on 18/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contato.h"
@protocol  ListaContatoProtocol<NSObject>
-(void)contatoAdicionado:(Contato*) contato;
-(void)contatoAtualizado:(Contato*) contato;
@end
