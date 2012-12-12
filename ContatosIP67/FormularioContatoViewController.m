//
//  FormularioContatoViewController.m
//  ContatosIP67
//
//  Created by ios3135 on 11/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FormularioContatoViewController.h"
#import "Contato.h"
@interface FormularioContatoViewController ()

@end

@implementation FormularioContatoViewController

@synthesize nome, email, endereco, site, telefone;

-(IBAction)pegaDadosDoFormulario:(id)sender {
    
    Contato *contato = [[Contato alloc] init];

    [contato setNome: [nome text]];
    [contato setEmail: [email text]];
    [contato setEndereco: [endereco text]];
    [contato setSite: [site text]];
    [contato setTelefone: [telefone text]];
    
    NSLog(@"Dados: %@", contato.nome);
    
}
@end
