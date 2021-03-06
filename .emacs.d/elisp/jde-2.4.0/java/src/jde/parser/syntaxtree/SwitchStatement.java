//
// Generated by JTB 1.1.2
//

package jde.parser.syntaxtree;

/**
 * Grammar production:
 * <PRE>
 * f0 -> "switch"
 * f1 -> "("
 * f2 -> Expression()
 * f3 -> ")"
 * f4 -> "{"
 * f5 -> ( SwitchLabel() ( BlockStatement() )* )*
 * f6 -> "}"
 * </PRE>
 */
public class SwitchStatement implements Node {
   public NodeToken f0;
   public NodeToken f1;
   public Expression f2;
   public NodeToken f3;
   public NodeToken f4;
   public NodeListOptional f5;
   public NodeToken f6;

   public SwitchStatement(NodeToken n0, NodeToken n1, Expression n2, NodeToken n3, NodeToken n4, NodeListOptional n5, NodeToken n6) {
      f0 = n0;
      f1 = n1;
      f2 = n2;
      f3 = n3;
      f4 = n4;
      f5 = n5;
      f6 = n6;
   }

   public SwitchStatement(Expression n0, NodeListOptional n1) {
      f0 = new NodeToken("switch");
      f1 = new NodeToken("(");
      f2 = n0;
      f3 = new NodeToken(")");
      f4 = new NodeToken("{");
      f5 = n1;
      f6 = new NodeToken("}");
   }

   public void accept(jde.parser.visitor.Visitor v) {
      v.visit(this);
   }
}

