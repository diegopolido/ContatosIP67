//
//  ListaContatosViewController.h
//  ContatosIP67
//
//  Created by ios3135 on 13/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListaContatoProtocol.h"
@interface ListaContatosViewController : UITableViewController<ListaContatoProtocol>

@property (strong) NSMutableArray *contatos;

@end
