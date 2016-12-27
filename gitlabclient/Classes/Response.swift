import Foundation

/// API response that includes the pagination links.
public struct Response<A> {
    
    // MARK: - Attributes
    
    public let object: A
    public let total: Int?
    public let totalPages: Int?
    public let perPage: Int?
    public let page: Int?
    public let nextPage: String?
    public let prevPage: String?

    // MARK: - Init
    /// Initializes the response with the object and the http response.
    ///
    /// - Parameters:
    ///   - object: object included in the response.
    ///   - response: http url response.
    internal init(object: A, response: HTTPURLResponse) {
        self.object = object
        self.total =  response.allHeaderFields["X-Total"] as? Int
        self.totalPages =  response.allHeaderFields["X-Total-Pages"] as? Int
        self.perPage =  response.allHeaderFields["X-Per-Page"] as? Int
        self.page =  response.allHeaderFields["X-Page"] as? Int
        self.nextPage =  response.allHeaderFields["X-Next-Page"] as? String
        self.prevPage =  response.allHeaderFields["X-Prev-Page"] as? String
    }
    
}
