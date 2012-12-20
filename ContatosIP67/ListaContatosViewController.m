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
        UIImage *imagemTabItem = [UIImage imageNamed:@"lista-contatos.png"];
        UITabBarItem *tabItem = [[UITabBarItem alloc]initWithTitle:@"Contatos" image:imagemTabItem tag:0];
        self.tabBarItem = tabItem;
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
                                                  otherButtonTitles:@"Ligar", @"Enviar E-mail", @"Visualizar site", @"Abrir Mapa", nil];
        [opcoes showInView:self.view];
    }
}

-(void) ligar {
    UIDevice *device = [UIDevice currentDevice];
    NSLog(@"Model: %@",device.model);
    if([device.model isEqualToString:@"iPhone"]) {
        NSString *numero = [NSString stringWithFormat:@"tel:%@", contatoSelecionado.telefone];
        [self abrirAplicativoComUrl:numero];
    } else {
        [[[UIAlertView alloc] initWithTitle:@"Impossível fazer ligação" message:@"Seu dispositivo não é um iPhone" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] show];
    }
}
-(void)enviarEmail {
    if([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *enviadorEmail = [[MFMailComposeViewController alloc]init];
        enviadorEmail.mailComposeDelegate = self;
        [enviadorEmail setToRecipients:[NSArray arrayWithObject: contatoSelecionado.email]];
        [enviadorEmail setSubject:@"[Caelum]"];
        [self presentModalViewController:enviadorEmail animated:YES];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ops!!" message:@"Você não conseguiu enviar o seu e-mail" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
}

-(void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:    (MFMailComposeResult)result error:(NSError *)error {
    [self dismissModalViewControllerAnimated:YES];
}

-(void)abrirSite {
    [self abrirAplicativoComUrl:contatoSelecionado.site];
}
-(void)mostrarMapa {
    NSString *url = [[NSString stringWithFormat:@"http://maps.google.com/maps?q=%@", contatoSelecionado.endereco] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [self abrirAplicativoComUrl:url];
}

-(void)abrirAplicativoComUrl:(NSString*)url {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"Action Sheet Ativado: botao[%d]", buttonIndex);
    switch (buttonIndex) {
        case 0:
            [self ligar];
            break;
        case 1:
            [self enviarEmail];
            break;
        case 2:
            [self abrirSite];
            break;
        case 3:
            [self mostrarMapa];
            break;            
        default:
            break;
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
