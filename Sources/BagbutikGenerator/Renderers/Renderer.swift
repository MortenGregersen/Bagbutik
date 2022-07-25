import BagbutikDocsCollector
import StencilSwiftKit

/// A base class for the renderes which contains a default environment for Swift code rendering
public class Renderer {
    let docsLoader: DocsLoader
    let environment = StencilSwiftKit.stencilSwiftEnvironment()

    public init(docsLoader: DocsLoader) {
        self.docsLoader = docsLoader
    }
}
