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
@synthesize contatos, contato, delegate, botaoImagem;

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

-(id) initWithContato:(Contato*)_contato {
    self = [super init];
    if(self) {
        self.contato = _contato;
        UIBarButtonItem *confirmar = [[UIBarButtonItem alloc]initWithTitle:@"Confirmar" style:UIBarButtonItemStylePlain target:self action:@selector(atualizaContato)];
        self.navigationItem.rightBarButtonItem = confirmar;
    }
    return self;
}

-(void)viewDidLoad {
    nome.text = contato.nome;
    email.text = contato.email;
    endereco.text = contato.endereco;
    site.text = contato.site;
    telefone.text = contato.telefone;
    if(contato.foto) {
        [botaoImagem setImage:contato.foto forState:UIControlStateNormal];
    }
}

-(Contato*)pegaDadosDoFormulario {
    
    if(!self.contato) {
        contato = [[Contato alloc] init];
    }

    [contato setNome: [nome text]];
    [contato setEmail: [email text]];
    [contato setEndereco: [endereco text]];
    [contato setSite: [site text]];
    [contato setTelefone: [telefone text]];
    
    if(botaoImagem.imageView.image) {
        contato.foto = botaoImagem.imageView.image;
    }
    return contato;
    
}

-(void) atualizaContato {
    Contato *contatoatualizado = [self pegaDadosDoFormulario];
    [self.delegate contatoAtualizado:contatoatualizado];
    [self.navigationController popViewControllerAnimated:YES];
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
    [self.delegate contatoAdicionado:cont];
    [self dismissModalViewControllerAnimated:YES];
}

-(IBAction)carregaImagem {
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        NSLog(@"Tem camera");
    } else {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.allowsEditing = YES;
        picker.delegate = self;
        [self presentModalViewController:picker animated:YES];
        NSLog(@"Nao tem camera");        
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *imagemSelecionada = [info valueForKey:UIImagePickerControllerEditedImage];
    [botaoImagem setImage:imagemSelecionada forState:UIControlStateNormal];
    NSLog(@"Carregando imagem...");
    [picker dismissModalViewControllerAnimated:YES];
}

@end
