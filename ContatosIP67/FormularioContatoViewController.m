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
@synthesize contatos, contato;

-(id)init {
    self = [super init];
    if (self != nil) {
        self.navigationItem.title = @"Contato";
        UIBarButtonItem *cancelar = [[UIBarButtonItem alloc]initWithTitle:@"Cancelar" style:UIBarButtonItemStylePlain target:self action:@selector(voltar)];
        self.navigationItem.leftBarButtonItem = cancelar;
        UIBarButtonItem *adicionar = [[UIBarButtonItem alloc]initWithTitle:@"Adicionar" style:UIBarButtonItemStylePlain target:self action:@selector(adicionar)];
        self.navigationItem.rightBarButtonItem = adicionar;
        
    }
    return self;
}

-(id) initWithContato:(Contato*)contatos {
    self = [super init];
    if(self) {
        self.contato = contato;
    }
    return self;
}

-(void)viewDidLoad {
    nome.text = contato.nome;
    email.text = contato.email;
    endereco.text = contato.endereco;
    site.text = contato.site;
    telefone.text = contato.telefone;
}

-(Contato*)pegaDadosDoFormulario {
    
    Contato *cont = [[Contato alloc] init];

    [cont setNome: [nome text]];
    [cont setEmail: [email text]];
    [cont setEndereco: [endereco text]];
    [cont setSite: [site text]];
    [cont setTelefone: [telefone text]];
    
    return cont;
    
}

-(IBAction)proximoElemento:(UITextField*)textField {
    if(textField == self.nome) {
        [self.telefone becomeFirstResponder];
    } else if(textField == self.telefone) {
        [self.email becomeFirstResponder];
    } else if(textField == self.email) {
        [self.endereco becomeFirstResponder];
    } else if(textField == self.endereco) {
        [self.site becomeFirstResponder];
    } else if(textField == self.site) {
        [self.site resignFirstResponder];
    } 
}

-(void)voltar {
    [self dismissModalViewControllerAnimated:YES];
}

-(void)adicionar {
    Contato *cont = [self pegaDadosDoFormulario];
    [contatos addObject:cont];
     
    NSLog(@"Dados: %@", contatos);
     
    [self dismissModalViewControllerAnimated:YES];
}
@end
