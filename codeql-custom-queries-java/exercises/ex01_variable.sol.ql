import java

// Solution for exercise 1: Find all variables named “pathAdjusted” of type String.

from Variable v
where v.getType() instanceof TypeString
and v.getName() = "pathAdjusted"
select v
