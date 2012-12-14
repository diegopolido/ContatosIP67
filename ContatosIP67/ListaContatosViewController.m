//
//  ListaContatosViewController.m
//  ContatosIP67
//
//  Created by ios3135 on 13/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ListaContatosViewController.h"
#import "FormularioContatoViewController.h"

@implementation ListaContatosViewController

@synthesize contatos;

-(id)init {
    self = [super init];
    if(self) {
        self.navigationItem.title = @"Contatos";
        UIBarButtonItem *botaoExibirFormulario = [[UIBarButtonItem alloc]
                                                  initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(exibeFormulario)];
        self.navigationItem.rightBarButtonItem = botaoExibirFormulario;
    }
    return self;
}

-(void) exibeFormulario {
    FormularioContatoViewController *form = [[FormularioContatoViewController alloc]init];
    form.contatos = self.contatos;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:form];
    [self presentModalViewController:nav animated:YES];
    NSLog(@"Aqui vamos exibir o formulário!");
}

-(void) viewWillAppear:(BOOL)animated {
    NSLog(@"Total cadastrado: %d", [self.contatos count]);
}
@end
