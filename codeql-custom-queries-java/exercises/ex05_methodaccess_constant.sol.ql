import java

// Solution for exercise 5: Find all calls to `getValue` that use a constant string as the first argument.

from MethodAccess ma
where ma.getMethod().hasName("getValue")
and ma.getArgument(0) instanceof StringLiteral
select ma
