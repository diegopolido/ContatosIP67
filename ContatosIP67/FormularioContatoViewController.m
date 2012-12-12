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

    contato.nome =  nome.text;
    contato.email = email.text;
    contato.endereco = endereco.text;
    contato.site = site.text;
    contato.telefone = telefone.text;
    NSLog(@"Dados: %@", contato.nome);
    
}
@end
