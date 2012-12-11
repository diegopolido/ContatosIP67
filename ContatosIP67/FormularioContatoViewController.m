//
//  FormularioContatoViewController.m
//  ContatosIP67
//
//  Created by ios3135 on 11/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FormularioContatoViewController.h"

@interface FormularioContatoViewController ()

@end

@implementation FormularioContatoViewController

@synthesize nome, email, endereco, site, telefone;

-(IBAction)pegaDadosDoFormulario:(id)sender {
//    NSDictionary *contato = [[NSDictionary alloc] initWithObjectsAndKeys:
//                            @"Vaor1", @"Chave1", @"Valor2", @"Chave2", nil];
    NSMutableDictionary *contato = [[NSMutableDictionary alloc] init];

    [contato setObject: [nome text] forKey:@"nome"];
    [contato setObject: [email text] forKey:@"email"];
    [contato setObject: [endereco text] forKey:@"endereco"];
    [contato setObject: [site text] forKey:@"site"];
    [contato setObject: [telefone text] forKey:@"telefone"];
    NSLog(@"Dados: %@", contato);
    
}
@end
