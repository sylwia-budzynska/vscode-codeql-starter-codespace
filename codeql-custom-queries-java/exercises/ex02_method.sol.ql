import java

// Solution for exercise 2: Find all methods that have a parameter of type String and are in a sub package of "seclab.testprojects.jxpathvuln."

from Method m
where m.getAParameter().getType() instanceof TypeString
and m.getDeclaringType().getPackage().getName().matches("seclab.testprojects.jxpathvuln.%")
select m
