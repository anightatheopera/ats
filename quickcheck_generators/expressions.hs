import Test.QuickCheck

data Expr = Add Expr Expr
          | Mul Expr Expr
          | Const Float
            deriving Show

genExpr :: Gen Expr
genExpr = do
    f1 <- arbitrary
    f2 <- arbitrary
    frequency [(50, return (Const f1)),
               (50, return (Const f2)),
               (80, return (Add (Const f1) (Const f2))),
               (20, return (Mul (Const f1) (Const f2)))]


