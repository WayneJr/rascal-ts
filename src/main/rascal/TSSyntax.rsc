module TSSyntax

import TSLex;

start syntax Stmt = VariableStmt;

start syntax Decl = VariableDecl;

syntax VariableStmt = "var" {VariableDecl ","}+ SemiColon?;

syntax VariableDecl = Id Initialize?;

syntax Initialize = "=" Exp;

start syntax Exp
        = var: Id
        | Integer
        | String
        > left Exp "*" Exp
        > left Exp "+" Exp
        ;