import java
import semmle.code.java.dataflow.DataFlow

// Solution for exercise 6: local data flow from a string literal to a method call

from MethodAccess ma, StringLiteral sl
where ma.getMethod().hasName("getValue")
and DataFlow::localExprFlow(sl, ma.getArgument(0))
select ma
