import Foundation
import Unbox

public struct User: Unboxable {
    
    // MARK: - Properties
    
    public let name: String
    public let username: String
    public let id: Int
    public let active: Bool
    public let avatarUrl: URL?
    public let isAdmin: Bool
    public let bio: String?
    public let location: String?
    public let skype: String?
    public let linkedin: String?
    public let twitter: String?
    public let websiteUrl: URL?
    public let organization: String?
    public let createdAt: Date
    public let lastSignInAt: Date
    public let confirmedAt: Date
    public let email: String?
    public let projectsLimit: UInt
    
    // MARK: - Unboxable
    
    /// Initialize an instance of this model by unboxing a dictionary using an Unboxer
    public init(unboxer: Unboxer) throws {
        self.name = try unboxer.unbox(key: "name")
        self.username = try unboxer.unbox(key: "username")
        self.id = try unboxer.unbox(key: "id")
        self.active = try unboxer.unbox(key: "active")
        self.avatarUrl = unboxer.unbox(key: "avatar_url")
        self.isAdmin = try unboxer.unbox(key: "is_admin")
        self.bio = unboxer.unbox(key: "bio")
        self.location = unboxer.unbox(key: "location")
        self.skype = unboxer.unbox(key: "skype")
        self.linkedin = unboxer.unbox(key: "linkedin")
        self.twitter = unboxer.unbox(key: "twitter")
        self.websiteUrl = unboxer.unbox(key: "website_url")
        self.organization = unboxer.unbox(key: "organization")
        self.createdAt = try unboxer.unbox(key: "created_at", formatter: DateFormatter.gitlab)
        self.lastSignInAt = try unboxer.unbox(key: "last_sign_in_at", formatter: DateFormatter.gitlab)
        self.confirmedAt = try unboxer.unbox(key: "confirmed_at", formatter: DateFormatter.gitlab)
        self.email = unboxer.unbox(key: "email")
        self.projectsLimit = try unboxer.unbox(key: "projects_limit")
        
        
    }

}

public extension User {
    
    
    static var Me: Resource<User> = Resource(request: { (components) -> URLRequest in
        var mutable = components
        mutable.path = "/api/v3/user"
        return URLRequest(url: mutable.url!)
    })
    
}
