import java

// Solution for exercise 3: Find all static fields whose name starts with "ERROR".
// Note: some results might be in the JDK or libraries (those sources are not included in the CodeQL database).

from Field f
where f.getName().matches("ERROR%")
and f.isStatic()
select f
