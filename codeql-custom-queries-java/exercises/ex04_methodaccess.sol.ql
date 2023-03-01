import java

// Solution for exercise 4: Find all accesses to methods with name `getValue` that do not take place inside callables with names starting with `get`.

from MethodAccess ma
where ma.getMethod().getName() = "getValue"
and not ma.getEnclosingCallable().getName().matches("get%")
select ma
