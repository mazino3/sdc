module d.ir.statement;

import d.ast.base;
import d.ast.statement;

import d.ir.expression;

class Statement : AstStatement {
	this(Location location) {
		super(location);
	}
}

alias BlockStatement = d.ast.statement.BlockStatement!Statement;
alias ExpressionStatement = d.ast.statement.ExpressionStatement!(Expression, Statement);
alias IfStatement = d.ast.statement.IfStatement!(Expression, Statement);
alias WhileStatement = d.ast.statement.WhileStatement!(Expression, Statement);
alias DoWhileStatement = d.ast.statement.DoWhileStatement!(Expression, Statement);
alias ForStatement = d.ast.statement.ForStatement!(Expression, Statement);
alias ReturnStatement = d.ast.statement.ReturnStatement!(Expression, Statement);
alias SwitchStatement = d.ast.statement.SwitchStatement!(Expression, Statement);
alias CaseStatement = d.ast.statement.CaseStatement!(CompileTimeExpression, Statement);
alias LabeledStatement = d.ast.statement.LabeledStatement!Statement;
alias SynchronizedStatement = d.ast.statement.SynchronizedStatement!Statement;
alias ThrowStatement = d.ast.statement.ThrowStatement!(Expression, Statement);

final:

/**
 * Symbols
 */
class SymbolStatement : Statement {
	import d.ir.symbol;
	Symbol symbol;
	
	this(Symbol symbol) {
		super(symbol.location);
		
		this.symbol = symbol;
	}
}

/**
 * break statements
 */
class BreakStatement : Statement {
	this(Location location) {
		super(location);
	}
}

/**
 * continue statements
 */
class ContinueStatement : Statement {
	this(Location location) {
		super(location);
	}
}

/**
 * goto statements
 */
class GotoStatement : Statement {
	string label;
	
	this(Location location, string label) {
		super(location);
		
		this.label = label;
	}
}
