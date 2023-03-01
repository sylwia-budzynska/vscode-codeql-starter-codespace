import java
import semmle.code.java.dataflow.DataFlow

// Exercise 6: local data flow from a string literal to a method call

from MethodAccess ma, StringLiteral sl
// TODO: add where clause that solves the exercise
select ma
