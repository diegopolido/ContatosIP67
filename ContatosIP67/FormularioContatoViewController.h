//
//  FormularioContatoViewController.h
//  ContatosIP67
//
//  Created by ios3135 on 11/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contato.h"

@interface FormularioContatoViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *nome;
@property (nonatomic, weak) IBOutlet UITextField *email;
@property (nonatomic, weak) IBOutlet UITextField *endereco;
@property (nonatomic, weak) IBOutlet UITextField *site;
@property (nonatomic, weak) IBOutlet UITextField *telefone;
@property (nonatomic, strong) NSMutableArray *contatos;
@property (strong) Contato *contato;

-(IBAction)proximoElemento:(UITextField*)textField;
-(id) initWithContato:(Contato*)contato;
-(void) atualizaContato;
@end
