//
//  ListaContatosViewController.m
//  ContatosIP67
//
//  Created by ios3135 on 13/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ListaContatosViewController.h"
#import "FormularioContatoViewController.h"
#import "Contato.h"

@implementation ListaContatosViewController

@synthesize contatos, indexPath, linhaEmDestaque;

-(id)init {
    self = [super init];
    if(self) {
        self.linhaEmDestaque = -1;
        self.navigationItem.title = @"Contatos";
        UIBarButtonItem *botaoExibirFormulario = [[UIBarButtonItem alloc]
                                                  initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(exibeFormulario)];
        self.navigationItem.rightBarButtonItem = botaoExibirFormulario;
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
    }
    return self;
}

-(void) exibeFormulario {
    FormularioContatoViewController *form = [[FormularioContatoViewController alloc]init];
    form.contatos = self.contatos;
    form.delegate = self;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:form];
    [self presentModalViewController:nav animated:YES];
    NSLog(@"Aqui vamos exibir o formulário!");
}

-(void)contatoAdicionado:(Contato*) _contato {
    self.linhaEmDestaque = [self.contatos indexOfObject:_contato];
    NSLog(@"contatoAdicionado: %@", _contato.nome);
}

-(void) contatoAtualizado:(Contato *)_contato {
    self.linhaEmDestaque = [self.contatos indexOfObject:_contato];
    self.indexPath = [NSIndexPath indexPathForRow:linhaEmDestaque inSection:0];
    NSLog(@"contatoAtualizado: %@", _contato.nome);    
}


-(void) viewDidLoad{
    [super viewDidLoad];
    
    UILongPressGestureRecognizer* longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(exibeMaisOpcoes:)];
    
    [self.tableView addGestureRecognizer:longPress];
}

-(void) exibeMaisOpcoes:(UIGestureRecognizer *) gesture {
    if(gesture.state == UIGestureRecognizerStateBegan) {
        CGPoint ponto = [gesture locationInView:self.tableView];
        NSIndexPath *index = [self.tableView indexPathForRowAtPoint:ponto];
        contatoSelecionado = [self.contatos objectAtIndex:index.row];
        UIActionSheet *opcoes = [[UIActionSheet alloc]initWithTitle:contatoSelecionado.nome 
                                                           delegate:self
                                                  cancelButtonTitle:@"Cancelar" 
                                             destructiveButtonTitle:nil 
                                                  otherButtonTitles:@"Ligar", @"Enviar E-mail", @"Visualizar site", nil];
        [opcoes showInView:self.view];
    }
}

-(void) viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
    NSLog(@"Total cadastrado com scroll: %d, com indexPath: %@", [self.contatos count], indexPath);
}

-(void) viewDidAppear:(BOOL)animated {
    if(self.linhaEmDestaque >= 0) {
        self.indexPath = [NSIndexPath indexPathForRow:self.linhaEmDestaque inSection:0];
        [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewRowAnimationNone];
        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewRowAnimationNone animated:YES];
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
        self.linhaEmDestaque = -1;
    }
 
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.contatos count];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)_indexPath {
    Contato *contato = [self.contatos objectAtIndex:_indexPath.row];
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    cell.textLabel.text = contato.nome;
    cell.detailTextLabel.text = @"»";
    return cell;
}
-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)_indexPath {
    if(editingStyle == UITableViewCellEditingStyleDelete) {
        [self.contatos removeObjectAtIndex:_indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)_indexPath {
    Contato *contato = [self.contatos objectAtIndex:_indexPath.row];
    FormularioContatoViewController *form = [[FormularioContatoViewController alloc] initWithContato:contato];
    form.contatos = self.contatos;
    form.delegate = self;
    [self.navigationController pushViewController:form animated:YES];
}
@end
