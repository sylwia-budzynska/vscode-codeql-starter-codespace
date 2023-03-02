import java
import semmle.code.java.dataflow.DataFlow

predicate isSink(DataFlow::Node sink) {
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

from DataFlow::Node node
where isSink(node)
select node
