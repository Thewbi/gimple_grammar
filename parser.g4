parser grammar gimple;
options { tokenVocab=gimple; }

// https://gcc.gnu.org/onlinedocs/gcc-4.3.6/gccint/Rough-GIMPLE-Grammar.html

compilation_unit :
	( function )*
	;
	
// function     : FUNCTION_DECL
//                  DECL_SAVED_TREE -> compound-stmt

function :
	function_decl
	OPENING_SQUIGGLY_BRACKET
	( compound_stmt SEMICOLON )+
	CLOSEING_SQUIGGLY_BRACKET
	;
	
function_decl :
	data_type IDENTIFIER OPENING_BRACKET CLOSEING_BRACKET
	;

data_type :
	VOID
	|
	INT
	;

compound_stmt :
	return_stmt
	;

// return-stmt  : RETURN_EXPR
//				op0 -> return-value

return_stmt :
	RETURN return_value?
	;

// return-value : NULL
//                     | RESULT_DECL
//                     | MODIFY_EXPR
//                             op0 -> RESULT_DECL
//                             op1 -> lhs
return_value :
	modify_expression
	;

modify_expression :
	NUMBER
	;
