module TSSyntax

extend TSLex;

start syntax Stmt = varstatement: VariableStmt;

start syntax Decl = vardeclaration: VariableDecl;

syntax VariableStmt = variableStatement: "var" {VariableDecl ","}+ SemiColon?;

syntax VariableDecl = variableDeclaration: Id Initialize?;

syntax Initialize = initialize: "=" Exp;

start syntax Exp
        = var: Id
        | integer: Integer
        | string: String
        > left mult: Exp "*" Exp
        > left add: Exp "+" Exp
        ;
        