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

-(IBAction)pegaDadosDoFormulario:(id)sender;
@end
