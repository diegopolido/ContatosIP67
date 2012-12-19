//
//  ListaContatosViewController.h
//  ContatosIP67
//
//  Created by ios3135 on 13/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "ListaContatoProtocol.h"

@interface ListaContatosViewController : UITableViewController<ListaContatoProtocol, UIActionSheetDelegate, MFMailComposeViewControllerDelegate> {
    Contato *contatoSelecionado;
}

@property (strong) NSMutableArray *contatos;
@property (strong) NSIndexPath *indexPath;
@property NSInteger linhaEmDestaque;

-(void) exibeMaisOpcoes:(UIGestureRecognizer *) gesture;
-(void) ligar;
-(void) enviarEmail;
-(void) abrirSite;
-(void) mostrarMapa;
-(void)abrirAplicativoComUrl:(NSString*)url;
@end
