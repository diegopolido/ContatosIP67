//
//  FormularioContatoViewController.h
//  ContatosIP67
//
//  Created by ios3135 on 11/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FormularioContatoViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *nome;
@property (nonatomic, weak) IBOutlet UITextField *email;
@property (nonatomic, weak) IBOutlet UITextField *endereco;
@property (nonatomic, weak) IBOutlet UITextField *site;
@property (nonatomic, weak) IBOutlet UITextField *telefone;
@property (nonatomic, strong) NSMutableArray *contatos;

-(IBAction)pegaDadosDoFormulario:(id)sender;
-(IBAction)proximoElemento:(UITextField*)textField;
@end
