import Foundation
import Unbox

public struct Namespace: Unboxable {
    
    // MARK: - Properties
    
    public let id: String
    public let name: String
    public let path: String
    public let ownerId: String?
    public let createdAt: Date
    public let updatedAt: Date?
    public let avatarUrl: String?
    public let membershipLock: Bool
    public let shareWithGroupLock: Bool
    public let visibilityLevel: UInt
    public let requestAccessEnabled: Bool
    
    // MARK: - Unboxable
    
    /// Initialize an instance of this model by unboxing a dictionary using an Unboxer
    public init(unboxer: Unboxer) throws {
        self.id = try unboxer.unbox(key: "id")
        self.name = try unboxer.unbox(key: "name")
        self.path = try unboxer.unbox(key: "path")
        self.ownerId = unboxer.unbox(key: "owner_id")
        self.createdAt = try unboxer.unbox(key: "created_at", formatter: DateFormatter.gitlab)
        self.updatedAt = unboxer.unbox(key: "updated_at", formatter: DateFormatter.gitlab)
        self.avatarUrl = unboxer.unbox(key: "avatar.url")
        self.membershipLock = try unboxer.unbox(key: "membership_lock")
        self.shareWithGroupLock = try unboxer.unbox(key: "share_with_group_lock")
        self.visibilityLevel = try unboxer.unbox(key: "visibility_level")
        self.requestAccessEnabled = try unboxer.unbox(key: "request_access_enabled")
    }
    
}

extension Namespace {
    
    static func list(page: Int = 1,
                     perPage: Int = 20) -> Resource<[Namespace]> {
        return Resource(request: { (components) -> URLRequest in
            var mutable = components
            mutable.path = "/namespaces"
            mutable.queryItems = [
                URLQueryItem(name: "page", value: "\(page)"),
                URLQueryItem(name: "per_page", value: "\(perPage)")
            ]
            return URLRequest(url: mutable.url!)
        })
    }
    
    static func search(query: String,
                       page: Int = 1,
                       perPage: Int = 20) -> Resource<[Namespace]> {
        return Resource(request: { (components) -> URLRequest in
            var mutable = components
            mutable.path = "/namespaces"
            mutable.queryItems = [
                URLQueryItem(name: "search", value: query),
                URLQueryItem(name: "page", value: "\(page)"),
                URLQueryItem(name: "per_page", value: "\(perPage)")
            ]
            return URLRequest(url: mutable.url!)
        })
    }
    
}
