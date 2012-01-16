module Generator.Schema where
xsd = concat [ ""
  , "<!-- ........................................................................ *\n"
  , "  *   Clafer Project                                                          *\n"
  , "  *                                                                           *\n"
  , "  *   File description: XML schema of Clafer intermediate representation (IR) *\n"
  , "  *   Depends on: Haskell IR data types defined for clafer                    *\n"
  , "  *   Author: Leonardo Passos (lpassos@gsd.uwaterloo.ca)                      *\n"
  , "  *   Date: October 19th, 2011                                                *\n"
  , "  *   Last update: November 28th, 2011                                        *\n"
  , "  *                                                                           *\n"
  , "  *   Generate scala classes with:                                            *\n"
  , "  *   scalaxb -p gsd.clafer.ir ClaferIR.xsd                                   *\n"
  , "  *           - -protocol-file ClaferIR_XmlProtocol.scala                     *\n"
  , "  * ......................................................................... *\n"
  , "  */\n"
  , "-->\n"
  , "<xs:schema targetNamespace=\"http://gsd.uwaterloo.ca/clafer\"\n"
  , "           elementFormDefault=\"qualified\"\n"
  , "           xmlns=\"http://gsd.uwaterloo.ca/clafer\"\n"
  , "           xmlns:xs=\"http://www.w3.org/2001/XMLSchema\"\n"
  , "           xmlns:cl=\"http://gsd.uwaterloo.ca/clafer\">\n"
  , "\n"
  , "  <!-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .-->\n"
  , "  <!--\n"
  , "    data IType = IBoolean\n"
  , "               | IString  (Maybe IStringSub)\n"
  , "               | INumeric (Maybe INumericSub)\n"
  , "               | ISet\n"
  , "  -->\n"
  , "  <xs:complexType name=\"IType\" abstract=\"true\"/>\n"
  , "  <xs:element name=\"Type\" type=\"cl:IType\"/>\n"
  , "\n"
  , "  <xs:complexType name=\"IBoolean\">\n"
  , "      <xs:complexContent>\n"
  , "          <xs:extension base=\"cl:IType\"/>\n"
  , "      </xs:complexContent>\n"
  , "  </xs:complexType>\n"
  , "\n"
  , "  <xs:complexType name=\"IString\">\n"
  , "      <xs:complexContent>\n"
  , "          <xs:extension base=\"cl:IType\">\n"
  , "              <xs:sequence>\n"
  , "                  <xs:element name=\"StringSubtype\" minOccurs=\"0\" maxOccurs=\"1\" type=\"cl:IStringSubtype\"/>\n"
  , "              </xs:sequence>\n"
  , "          </xs:extension>\n"
  , "      </xs:complexContent>\n"
  , "  </xs:complexType>\n"
  , "\n"
  , "  <xs:complexType name=\"INumeric\">\n"
  , "      <xs:complexContent>\n"
  , "          <xs:extension base=\"IType\">\n"
  , "              <xs:sequence>\n"
  , "                  <xs:element name=\"NumericSubtype\" minOccurs=\"0\" maxOccurs=\"1\" type=\"cl:INumericSubtype\"/>\n"
  , "              </xs:sequence>\n"
  , "          </xs:extension>\n"
  , "      </xs:complexContent>\n"
  , "  </xs:complexType>\n"
  , "\n"
  , "  <xs:complexType name=\"ISet\">\n"
  , "      <xs:complexContent>\n"
  , "          <xs:extension base=\"cl:IType\"/>\n"
  , "      </xs:complexContent>\n"
  , "  </xs:complexType>\n"
  , "\n"
  , "  <!-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .-->\n"
  , "  <!-- data IStringSub = ILiteral | ISetString -->\n"
  , "\n"
  , "  <xs:complexType name=\"IStringSubtype\" abstract=\"true\"/>\n"
  , "\n"
  , "  <xs:complexType name=\"ILiteral\">\n"
  , "      <xs:complexContent>\n"
  , "          <xs:extension base=\"cl:IStringSubtype\"/>\n"
  , "      </xs:complexContent>\n"
  , "  </xs:complexType>\n"
  , "\n"
  , "  <xs:complexType name=\"ISetString\">\n"
  , "      <xs:complexContent>\n"
  , "          <xs:extension base=\"cl:IStringSubtype\"/>\n"
  , "      </xs:complexContent>\n"
  , "  </xs:complexType>\n"
  , "\n"
  , "  <!-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .-->\n"
  , "  <!-- data INumericSub = IInteger | IReal | ISetInteger | ISetReal -->\n"
  , "\n"
  , "  <xs:complexType name=\"INumericSubtype\" abstract=\"true\"/>\n"
  , "\n"
  , "  <xs:complexType name=\"IInteger\">\n"
  , "      <xs:complexContent>\n"
  , "          <xs:extension base=\"cl:INumericSubtype\"/>\n"
  , "      </xs:complexContent>\n"
  , "  </xs:complexType>\n"
  , "\n"
  , "  <xs:complexType name=\"IReal\">\n"
  , "      <xs:complexContent>\n"
  , "          <xs:extension base=\"cl:INumericSubtype\"/>\n"
  , "      </xs:complexContent>\n"
  , "  </xs:complexType>\n"
  , "\n"
  , "  <xs:complexType name=\"ISetInteger\">\n"
  , "      <xs:complexContent>\n"
  , "          <xs:extension base=\"cl:INumericSubtype\"/>\n"
  , "      </xs:complexContent>\n"
  , "  </xs:complexType>\n"
  , "\n"
  , "  <xs:complexType name=\"ISetReal\">\n"
  , "      <xs:complexContent>\n"
  , "          <xs:extension base=\"cl:INumericSubtype\"/>\n"
  , "      </xs:complexContent>\n"
  , "  </xs:complexType>\n"
  , "\n"
  , "  <!-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .-->\n"
  , "  <!-- data IModule = IModule {\n"
  , "      mName :: String,\n"
  , "      mDecls :: [IElement]\n"
  , "    }\n"
  , "  -->\n"
  , "\n"
  , "  <xs:complexType name=\"IModule\">\n"
  , "      <xs:sequence>\n"
  , "          <xs:element name=\"Name\" type=\"xs:string\"/>\n"
  , "          <xs:element ref=\"Declaration\" minOccurs=\"0\" maxOccurs=\"unbounded\"/>\n"
  , "      </xs:sequence>\n"
  , "  </xs:complexType>\n"
  , "\n"
  , "  <xs:element name=\"Module\" type=\"cl:IModule\"/>\n"
  , "\n"
  , "  <!-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .-->\n"
  , "  <!-- data IClafer =\n"
  , "       IClafer {\n"
  , "          isAbstract :: Bool,     - determines whether it's abstract\n"
  , "          gcard :: Maybe IGCard,  - group cardinality\n"
  , "          ident :: String,        - name\n"
  , "          uid :: String,          - (o) unique identifier\n"
  , "          super:: ISuper,         - superclafers\n"
  , "          card :: Maybe Interval, - cardinality\n"
  , "          glCard :: Interval,     - (o) global cardinality\n"
  , "          elements :: [IElement]  - subclafers or constraints specified in the context of given clafer\n"
  , "        }\n"
  , "  -->\n"
  , "  <xs:complexType name=\"IClafer\">\n"
  , "      <xs:complexContent>\n"
  , "          <xs:extension base=\"IElement\">\n"
  , "            <xs:sequence>\n"
  , "                <xs:element name=\"IsAbstract\" type=\"xs:boolean\"/>\n"
  , "                <xs:element name=\"GroupCard\"  type=\"cl:IGroupCard\" minOccurs=\"0\" maxOccurs=\"1\"/>\n"
  , "                <xs:element name=\"Id\"         type=\"xs:string\"/>\n"
  , "                <xs:element name=\"UniqueId\"   type=\"xs:string\"/>\n"
  , "                <xs:element name=\"Supers\"     type=\"cl:ISuper\"/>\n"
  , "                <xs:element name=\"Card\"       type=\"cl:IInterval\" minOccurs=\"0\" maxOccurs=\"1\"/>\n"
  , "                <xs:element name=\"GlobalCard\" type=\"cl:IInterval\"/>\n"
  , "                <xs:element ref=\"Declaration\" minOccurs=\"0\" maxOccurs=\"unbounded\"/>\n"
  , "            </xs:sequence>\n"
  , "          </xs:extension>\n"
  , "      </xs:complexContent>\n"
  , "  </xs:complexType>\n"
  , "\n"
  , "  <!-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .-->\n"
  , "  <!-- data IElement =\n"
  , "       IEClafer IClafer\n"
  , "     | IEConstraint {\n"
  , "          isHard :: Bool,\n"
  , "          cpexp :: PExp\n"
  , "        }\n"
  , "   -->\n"
  , "\n"
  , "  <xs:complexType name=\"IElement\" abstract=\"true\"/>\n"
  , "  <xs:element name=\"Declaration\" type=\"IElement\"/>\n"
  , "\n"
  , "  <!-- No need to create IEClafer type. IClafer is already a subtype\n"
  , "       of IElement\n"
  , "    -->\n"
  , "\n"
  , "  <xs:complexType name=\"IConstraint\">\n"
  , "    <xs:complexContent>\n"
  , "      <xs:extension base=\"cl:IElement\">\n"
  , "          <xs:sequence>\n"
  , "              <xs:element name=\"IsHard\"    type=\"xs:boolean\"/>\n"
  , "              <xs:element name=\"ParentExp\" type=\"cl:IParentExp\"/>\n"
  , "          </xs:sequence>\n"
  , "      </xs:extension>\n"
  , "\n"
  , "    </xs:complexContent>\n"
  , "  </xs:complexType>\n"
  , "\n"
  , "  <!-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .-->\n"
  , "  <!-- data ISuper =\n"
  , "       ISuper {\n"
  , "          isOverlapping :: Bool,\n"
  , "          supers :: [PExp]\n"
  , "        }\n"
  , "  -->\n"
  , "  <xs:complexType name=\"ISuper\">\n"
  , "    <xs:sequence>\n"
  , "        <xs:element name=\"IsOverlapping\" type=\"xs:boolean\"/>\n"
  , "        <xs:element name=\"Super\"         type=\"cl:IParentExp\" minOccurs=\"0\" maxOccurs=\"unbounded\"/>\n"
  , "    </xs:sequence>\n"
  , "  </xs:complexType>\n"
  , "\n"
  , "  <!-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .-->\n"
  , "  <!-- data IGCard =\n"
  , "      IGCard {\n"
  , "          isKeyword :: Bool,\n"
  , "          interval :: Interval\n"
  , "        }\n"
  , "  -->\n"
  , "\n"
  , "  <xs:complexType name=\"IGroupCard\">\n"
  , "    <xs:sequence>\n"
  , "        <xs:element name=\"IsKeyword\" type=\"xs:boolean\"/>\n"
  , "        <xs:element name=\"Interval\"  type=\"cl:IInterval\"/>\n"
  , "    </xs:sequence>\n"
  , "  </xs:complexType>\n"
  , "\n"
  , "  <!-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .-->\n"
  , "  <!-- type Interval = (Integer, ExInteger) -->\n"
  , "\n"
  , "  <xs:complexType name=\"IInterval\">\n"
  , "      <xs:sequence>\n"
  , "          <xs:element name=\"Min\">\n"
  , "            <xs:complexType>\n"
  , "                <xs:sequence>\n"
  , "                    <xs:element ref=\"IntLiteral\"/>\n"
  , "                </xs:sequence>\n"
  , "            </xs:complexType>\n"
  , "          </xs:element>\n"
  , "          <xs:element name=\"Max\" type=\"cl:ExInteger\"/>\n"
  , "      </xs:sequence>\n"
  , "  </xs:complexType>\n"
  , "\n"
  , "  <!-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .-->\n"
  , "  <!-- data PExp = PExp {\n"
  , "      iType :: Maybe IType,\n"
  , "      pid :: String,\n"
  , "      exp :: IExp\n"
  , "    }\n"
  , "  -->\n"
  , "\n"
  , "  <xs:complexType name=\"IParentExp\">\n"
  , "      <xs:sequence>\n"
  , "          <xs:element name=\"Type\"     type=\"cl:IType\" minOccurs=\"0\" maxOccurs=\"1\"/>\n"
  , "          <xs:element name=\"ParentId\" type=\"xs:string\" minOccurs=\"0\" maxOccurs=\"1\"/>\n"
  , "          <xs:element name=\"Exp\"      type=\"cl:IExp\"/>\n"
  , "      </xs:sequence>\n"
  , "  </xs:complexType>\n"
  , "\n"
  , "  <!-- ......................................................................-->\n"
  , "  <!-- data ExInteger =\n"
  , "       ExIntegerAst\n"
  , "     | ExIntegerNum Integer\n"
  , "  -->\n"
  , "\n"
  , "  <xs:complexType name=\"ExInteger\" abstract=\"true\"/>\n"
  , "\n"
  , "  <xs:complexType name=\"ExIntegerAst\">\n"
  , "    <xs:complexContent>\n"
  , "      <xs:extension base=\"cl:ExInteger\"/>\n"
  , "    </xs:complexContent>\n"
  , "  </xs:complexType>\n"
  , "\n"
  , "  <xs:complexType name=\"ExIntegerNum\">\n"
  , "    <xs:complexContent>\n"
  , "        <xs:extension base=\"cl:ExInteger\">\n"
  , "            <xs:sequence>\n"
  , "                <xs:element ref=\"IntLiteral\"/>\n"
  , "            </xs:sequence>\n"
  , "        </xs:extension>\n"
  , "    </xs:complexContent>\n"
  , "  </xs:complexType>\n"
  , "\n"
  , "  <!-- ......................................................................-->\n"
  , "  <!--\n"
  , "    data IExp =\n"
  , "       - quantified expression  declarations\n"
  , "       IDeclPExp {quant :: IQuant, oDecls :: [IDecl], bpexp :: PExp}\n"
  , "     | IFunExp {op :: String, exps :: [PExp]}\n"
  , "     | IInt Integer                  - integer number\n"
  , "     | IDouble Double                - real number\n"
  , "     | IStr String                   - string\n"
  , "     | IClaferId {                   - clafer name\n"
  , "          modName :: String,         - module name\n"
  , "          sident :: String,          - name\n"
  , "          isTop :: Bool              - identifier refers to a top-level definition\n"
  , "        }\n"
  , "   -->\n"
  , "  <xs:complexType name=\"IExp\" abstract=\"true\"/>\n"
  , "\n"
  , "  <xs:complexType name=\"IDeclarationParentExp\">\n"
  , "      <xs:complexContent>\n"
  , "          <xs:extension base=\"cl:IExp\">\n"
  , "              <xs:sequence>\n"
  , "                  <xs:element name=\"Quantifier\"    type=\"cl:IQuantifier\"/>\n"
  , "                  <xs:element name=\"Declaration\"   type=\"cl:IDeclaration\" minOccurs=\"0\" maxOccurs=\"unbounded\"/>\n"
  , "                  <xs:element name=\"BodyParentExp\" type=\"cl:IParentExp\"/>\n"
  , "              </xs:sequence>\n"
  , "          </xs:extension>\n"
  , "      </xs:complexContent>\n"
  , "  </xs:complexType>\n"
  , "\n"
  , "  <xs:complexType name=\"IFunctionExp\">\n"
  , "      <xs:complexContent>\n"
  , "          <xs:extension base=\"IExp\">\n"
  , "              <xs:sequence>\n"
  , "                  <xs:element name=\"Operation\" type=\"xs:string\"/>\n"
  , "                  <xs:element name=\"Argument\" minOccurs=\"0\" maxOccurs=\"unbounded\" type=\"IParentExp\"/>\n"
  , "              </xs:sequence>\n"
  , "          </xs:extension>\n"
  , "      </xs:complexContent>\n"
  , "  </xs:complexType>\n"
  , "\n"
  , "  <xs:complexType name=\"IIntExp\">\n"
  , "      <xs:complexContent>\n"
  , "          <xs:extension base=\"IExp\">\n"
  , "              <xs:sequence>\n"
  , "                 <xs:element ref=\"IntLiteral\"/>\n"
  , "              </xs:sequence>\n"
  , "          </xs:extension>\n"
  , "      </xs:complexContent>\n"
  , "  </xs:complexType>\n"
  , "\n"
  , "  <xs:complexType name=\"IDoubleExp\">\n"
  , "      <xs:complexContent>\n"
  , "          <xs:extension base=\"IExp\">\n"
  , "              <xs:sequence>\n"
  , "                 <xs:element ref=\"DoubleLiteral\"/>\n"
  , "              </xs:sequence>\n"
  , "          </xs:extension>\n"
  , "      </xs:complexContent>\n"
  , "  </xs:complexType>\n"
  , "\n"
  , "  <xs:complexType name=\"IStringExp\">\n"
  , "      <xs:complexContent>\n"
  , "          <xs:extension base=\"IExp\">\n"
  , "              <xs:sequence>\n"
  , "                 <xs:element ref=\"StringLiteral\"/>\n"
  , "              </xs:sequence>\n"
  , "          </xs:extension>\n"
  , "      </xs:complexContent>\n"
  , "  </xs:complexType>\n"
  , "\n"
  , "\n"
  , "  <xs:complexType name=\"IClaferId\">\n"
  , "      <xs:complexContent>\n"
  , "          <xs:extension base=\"IExp\">\n"
  , "              <xs:sequence>\n"
  , "                  <xs:element name=\"ModuleName\" type=\"xs:string\" minOccurs=\"0\" maxOccurs=\"1\"/>\n"
  , "                  <xs:element name=\"Id\"         type=\"xs:string\" />\n"
  , "                  <xs:element name=\"IsTop\"      type=\"xs:boolean\"/>\n"
  , "              </xs:sequence>\n"
  , "          </xs:extension>\n"
  , "      </xs:complexContent>\n"
  , "  </xs:complexType>\n"
  , "\n"
  , "  <!-- ......................................................................-->\n"
  , "  <!-- data IDecl =\n"
  , "       IDecl {\n"
  , "          isDisj :: Bool,     - is disjunct\n"
  , "          decls :: [String],  - a list of local names\n"
  , "          body :: PExp        - set to which local names refer to\n"
  , "        }\n"
  , "    -->\n"
  , "\n"
  , "   <xs:complexType name=\"IDeclaration\">\n"
  , "       <xs:sequence>\n"
  , "           <xs:element name=\"IsDisjunct\"       type=\"xs:boolean\"/>\n"
  , "           <xs:element name=\"LocalDeclaration\" type=\"xs:string\" minOccurs=\"0\" maxOccurs=\"unbounded\"/>\n"
  , "           <xs:element name=\"Body\"             type=\"cl:IParentExp\"/>\n"
  , "       </xs:sequence>\n"
  , "   </xs:complexType>\n"
  , "\n"
  , "  <!-- ......................................................................-->\n"
  , "  <!-- data IQuant =\n"
  , "        INo\n"
  , "        | ILone\n"
  , "        | IOne\n"
  , "        | ISome\n"
  , "        | IAll\n"
  , "   -->\n"
  , "\n"
  , "   <xs:complexType name=\"IQuantifier\" abstract=\"true\"/>\n"
  , "\n"
  , "   <xs:complexType name=\"INo\">\n"
  , "       <xs:complexContent>\n"
  , "           <xs:extension base=\"cl:IQuantifier\"/>\n"
  , "       </xs:complexContent>\n"
  , "   </xs:complexType>\n"
  , "\n"
  , "   <xs:complexType name=\"ILone\">\n"
  , "       <xs:complexContent>\n"
  , "           <xs:extension base=\"cl:IQuantifier\"/>\n"
  , "       </xs:complexContent>\n"
  , "   </xs:complexType>\n"
  , "\n"
  , "   <xs:complexType name=\"IOne\">\n"
  , "       <xs:complexContent>\n"
  , "           <xs:extension base=\"cl:IQuantifier\"/>\n"
  , "       </xs:complexContent>\n"
  , "   </xs:complexType>\n"
  , "\n"
  , "   <xs:complexType name=\"ISome\">\n"
  , "       <xs:complexContent>\n"
  , "           <xs:extension base=\"cl:IQuantifier\"/>\n"
  , "       </xs:complexContent>\n"
  , "   </xs:complexType>\n"
  , "\n"
  , "   <xs:complexType name=\"IAll\">\n"
  , "       <xs:complexContent>\n"
  , "           <xs:extension base=\"cl:IQuantifier\"/>\n"
  , "       </xs:complexContent>\n"
  , "   </xs:complexType>\n"
  , "\n"
  , " <!-- ......................................................................-->\n"
  , "\n"
  , " <xs:element name=\"IntLiteral\"    type=\"xs:integer\"/>\n"
  , " <xs:element name=\"DoubleLiteral\" type=\"xs:double\"/>\n"
  , " <xs:element name=\"StringLiteral\" type=\"xs:string\"/>\n"
  , "\n"
  , "</xs:schema>\n"
  , ""]
