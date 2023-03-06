import java
import semmle.code.java.dataflow.DataFlow

predicate isSink(DataFlow::Node node) {
  none() // replace this line with your solution for finding the sink.
}

from DataFlow::Node node
where isSink(node)
select node
