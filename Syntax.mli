type type_expr = Integer | Boolean | Array of type_expr;;
type var_list = ((string list) * type_expr) list;;

type program =Program of var_list * (func_def list) * instruction

and func_def = Func_def of string * definition

and definition = Definition of var_list * type_expr option * var_list * instruction

and expression =
  | Int of int | Bool of bool
    (* constantes *)
  | Un of unop * expression
    (* moins unaire*)
  | Bin of binop * expression * expression
    (* expressions arithétiques *)
  | Get of string
    (* accès à une variable *)
  | Function_call of string * expression list
    (* appel de fonction *)
  | Geti of expression * expression
    (* accès dans un tableau à une position *)
  | Alloc of expression * type_expr
    (* Création d'un tableau d'une certaine taille *)
  | New of type_expr
    (* Création objet*)
  | Read
  | Readln

and binop =
  | Plus | Minus | Times | Div
    (* arithmétique *)
  | Or |  And
  | Lt | Le | Gt | Ge | Eq | Ne
    (* comparaisons *)

and unop =
  | UMinus | Not

and instruction =
  | Set of string * expression
    (* Affectation d'une variable *)
  | Sequence of instruction list
    (* Suite d'instructions *)
  | If of expression * instruction * instruction
  | While of expression * instruction
  | Procedure_call of string * expression list
    (* Appel de procédure *)
  | Write of expression
  | Writeln of expression
    (* Ecriture d'un entier sans ou avec retour à la ligne *)
  | Seti of expression * expression * expression
