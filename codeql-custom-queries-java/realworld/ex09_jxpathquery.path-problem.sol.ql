/**
 * // This is an alternative to solution, that presents the results as a nice path.
 * // CHANGED: Add this, so CodeQL knows to interpret the results as a path.
* @kind path-problem
*/

import java
import semmle.code.java.dataflow.TaintTracking
import semmle.code.java.dataflow.FlowSources
// CHANGED: Add this, so data flow queries "generate" results as a path.
import DataFlow::PathGraph

class JXPathInjectionTracking extends TaintTracking::Configuration {
  JXPathInjectionTracking() { this = "JXPathInjectionTracking" }

  override predicate isSource(DataFlow::Node source) { source instanceof RemoteFlowSource }

  override predicate isSink(DataFlow::Node sink) {
    exists(MethodAccess ma |
      ma.getMethod()
          .hasQualifiedName("org.apache.commons.jxpath", "JXPathContext",
            [
              "createPath", "createPathAndSetValue", "getPointer", "getValue", "iterate",
              "iteratePointers", "removeAll", "removePath", "selectNodes", "selectSingleNode",
              "setValue"
            ]) and
      ma.getArgument(0) = sink.asExpr()
    )
  }
}

// CHANGED: Instead of `DataFlow::Node`, we have to use `DataFlow::PathNode`.
from JXPathInjectionTracking cfg, DataFlow::PathNode src, DataFlow::PathNode sink
// CHANGED: Instead of `hasFlow`, we have to use `hasFlowPath`.
where cfg.hasFlowPath(src, sink)
select sink, src, sink, "User-controlled data in XPath expression can lead to RCE."
