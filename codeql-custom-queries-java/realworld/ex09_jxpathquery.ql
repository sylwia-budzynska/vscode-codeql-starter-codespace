import java
import semmle.code.java.dataflow.TaintTracking
import semmle.code.java.dataflow.FlowSources

class JXPathInjectionTracking extends TaintTracking::Configuration {
  JXPathInjectionTracking() { this = "JXPathInjectionTracking" }

  override predicate isSource(DataFlow::Node source) {
    none() // replace this line with your solution for finding the source.
  }

  override predicate isSink(DataFlow::Node sink) {
    none() // replace this line with your solution for finding the sink.
  }
}

from JXPathInjectionTracking cfg, DataFlow::Node src, DataFlow::Node sink
where cfg.hasFlow(src, sink)
select sink, src, sink, "User-controlled data in XPath expression can lead to RCE."
