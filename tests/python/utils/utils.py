from metalift.ir import Add, Call, Eq, Expr, Ite, Lit, Tuple


def codegen(expr: Expr) -> str:
    def eval(expr: Expr) -> str:
        if isinstance(expr, Eq):
            return f"{expr.e1()} == {eval(expr.e2())}"
        if isinstance(expr, Add):
            return f"{eval(expr.args[0])} + {eval(expr.args[1])}"
        if isinstance(expr, Call):
            eval_args = []
            for a in expr.arguments():
                eval_args.append(eval(a))
            return f"{expr.name()}({', '.join(a for a in eval_args)})"
        if isinstance(expr, Lit):
            return f"{expr.val()}"
        if isinstance(expr, Tuple):
            return f"({', '.join(eval(a) for a in expr.args)})"
        if isinstance(expr, Ite):
            return f"{eval(expr.e1())} if {eval(expr.c())} else {eval(expr.e2())}"
        else:
            return "%s"%(expr)
    return eval(expr)