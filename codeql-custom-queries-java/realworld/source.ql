import java
import semmle.code.java.dataflow.DataFlow

predicate isSource(DataFlow::Node node) {
  none() // replace this line with your solution for finding the source.
}

from DataFlow::Node node
where isSource(node)
select node
