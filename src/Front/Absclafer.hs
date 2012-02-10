module Front.Absclafer where

-- Haskell module generated by the BNF converter

newtype Ident = Ident String deriving (Eq,Ord,Show)
data Module =
   Module [Declaration]
  deriving (Eq,Ord,Show)

data Declaration =
   EnumDecl Ident [EnumId]
 | ElementDecl Element
  deriving (Eq,Ord,Show)

data Clafer =
   Clafer Abstract GCard Ident Super Card Init Elements
  deriving (Eq,Ord,Show)

data Constraint =
   Constraint [Exp]
  deriving (Eq,Ord,Show)

data Abstract =
   AbstractEmpty
 | Abstract
  deriving (Eq,Ord,Show)

data Elements =
   ElementsEmpty
 | ElementsList [Element]
  deriving (Eq,Ord,Show)

data Element =
   Subclafer Clafer
 | ClaferUse Name Card Elements
 | Subconstraint Constraint
  deriving (Eq,Ord,Show)

data Super =
   SuperEmpty
 | SuperSome SuperHow SetExp
  deriving (Eq,Ord,Show)

data SuperHow =
   SuperHow_1
 | SuperHow_2
  deriving (Eq,Ord,Show)

data Init =
   InitEmpty
 | InitSome InitHow Exp
  deriving (Eq,Ord,Show)

data InitHow =
   InitHow_1
 | InitHow_2
  deriving (Eq,Ord,Show)

data GCard =
   GCardEmpty
 | GCardXor
 | GCardOr
 | GCardMux
 | GCardOpt
 | GCardInterval NCard
  deriving (Eq,Ord,Show)

data Card =
   CardEmpty
 | CardLone
 | CardSome
 | CardAny
 | CardNum Integer
 | CardInterval NCard
  deriving (Eq,Ord,Show)

data NCard =
   NCard Integer ExInteger
  deriving (Eq,Ord,Show)

data ExInteger =
   ExIntegerAst
 | ExIntegerNum Integer
  deriving (Eq,Ord,Show)

data Name =
   LocClafer Ident
 | ModClafer [ModId] Ident
  deriving (Eq,Ord,Show)

data Exp =
   DeclExp ExQuant [Decl] Exp
 | EIff Exp Exp
 | EImplies Exp Exp
 | EImpliesElse Exp Exp Exp
 | EOr Exp Exp
 | EXor Exp Exp
 | EAnd Exp Exp
 | ENeg Exp
 | ELt Exp Exp
 | EGt Exp Exp
 | EEq Exp Exp
 | ELte Exp Exp
 | EGte Exp Exp
 | ENeq Exp Exp
 | EIn Exp Exp
 | ENin Exp Exp
 | QuantExp Quant Exp
 | EAdd Exp Exp
 | ESub Exp Exp
 | EMul Exp Exp
 | EDiv Exp Exp
 | ECSetExp Exp
 | EMinExp Exp
 | EInt Integer
 | EDouble Double
 | EStr String
 | ESetExp SetExp
  deriving (Eq,Ord,Show)

data SetExp =
   Union SetExp SetExp
 | UnionCom SetExp SetExp
 | Difference SetExp SetExp
 | Intersection SetExp SetExp
 | Domain SetExp SetExp
 | Range SetExp SetExp
 | Join SetExp SetExp
 | ClaferId Name
  deriving (Eq,Ord,Show)

data Decl =
   Decl Disj [LocId] Exp
  deriving (Eq,Ord,Show)

data Disj =
   DisjEmpty
 | Disj
  deriving (Eq,Ord,Show)

data Quant =
   QuantNo
 | QuantLone
 | QuantOne
 | QuantSome
  deriving (Eq,Ord,Show)

data ExQuant =
   ExQuantAll
 | ExQuantQuant Quant
  deriving (Eq,Ord,Show)

data EnumId =
   EnumIdIdent Ident
  deriving (Eq,Ord,Show)

data ModId =
   ModIdIdent Ident
  deriving (Eq,Ord,Show)

data LocId =
   LocIdIdent Ident
  deriving (Eq,Ord,Show)

