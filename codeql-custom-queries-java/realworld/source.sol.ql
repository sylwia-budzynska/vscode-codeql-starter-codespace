import java
import semmle.code.java.dataflow.DataFlow
import semmle.code.java.dataflow.FlowSources

predicate isSource(DataFlow::Node source) { source instanceof RemoteFlowSource }

from DataFlow::Node node
where isSource(node)
select node
