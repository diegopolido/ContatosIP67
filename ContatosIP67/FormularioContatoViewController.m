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
    
    [self.view endEditing:YES];
    
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
@end
