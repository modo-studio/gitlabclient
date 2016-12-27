import Foundation
import Unbox

public struct Pipeline: Unboxable {
    
    // MARK: - Properties
    
    public let id: Int
    public let sha: String
    public let ref: String
    public let status: String
    public let beforeSha: String?
    public let tag: Bool
    public let userName: String
    public let userUsername: String
    public let userId: String
    public let userAvatarUrl: URL?
    public let userWebUrl: URL
    public let createdAt: Date
    public let updatedAt: Date?
    public let startedAt: Date?
    public let finishedAt: Date?
    public let commitedAt: Date?
    public let duration: TimeInterval
    
    // MARK: - Unboxable
    
    /// Initialize an instance of this model by unboxing a dictionary using an Unboxer
    public init(unboxer: Unboxer) throws {
        self.id = try unboxer.unbox(key: "id")
        self.sha = try unboxer.unbox(key: "sha")
        self.ref = try unboxer.unbox(key: "ref")
        self.status = try unboxer.unbox(key: "status")
        self.beforeSha = unboxer.unbox(key: "before_sha")
        self.tag = try unboxer.unbox(key: "tag")
        self.userName = try unboxer.unbox(key: "user.name")
        self.userUsername = try unboxer.unbox(key: "user.username")
        self.userId = try unboxer.unbox(key: "user.id")
        self.userAvatarUrl = unboxer.unbox(key: "user.avatar_url")
        self.userWebUrl = try unboxer.unbox(key: "user.web_url")
        self.createdAt = try unboxer.unbox(key: "created_at", formatter: DateFormatter.gitlab)
        self.updatedAt = unboxer.unbox(key: "updated_at", formatter: DateFormatter.gitlab)
        self.startedAt = unboxer.unbox(key: "started_at", formatter: DateFormatter.gitlab)
        self.finishedAt = unboxer.unbox(key: "finished_at", formatter: DateFormatter.gitlab)
        self.commitedAt = unboxer.unbox(key: "commited_at", formatter: DateFormatter.gitlab)
        self.duration = try unboxer.unbox(key: "duration")
    }

}

public extension Pipeline {
    
    public static func list(projectId: String,
                     page: Int = 1,
                     perPage: Int = 20) -> Resource<[Pipeline]> {
        return Resource(request: { (components) -> URLRequest in
            var mutable = components
            mutable.path = "/projects/\(projectId)/pipelines"
            mutable.queryItems = [
                URLQueryItem(name: "page", value: "\(page)"),
                URLQueryItem(name: "per_page", value: "\(perPage)")
            ]
            return URLRequest(url: mutable.url!)
        })
    }
    
    public static func get(projectId: String, pipelineId: String) -> Resource<Pipeline> {
        return Resource(request: { (components) -> URLRequest in
            var mutable = components
            mutable.path = "/projects/\(projectId)/pipelines/\(pipelineId)"
            return URLRequest(url: mutable.url!)
        })
    }
    
    public static func create(projectId: String, ref: String) -> Resource<Pipeline> {
        return Resource(request: { (components) -> URLRequest in
            var mutable = components
            mutable.path = "/projects/\(projectId)/pipelines"
            mutable.queryItems = [
                URLQueryItem(name: "ref", value: ref),
            ]
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "POST"
            return request
        })
    }
    
    public static func retryBuilds(projectId: String, pipelineId: String) -> Resource<Pipeline> {
        return Resource(request: { (components) -> URLRequest in
            var mutable = components
            mutable.path = "/projects/\(projectId)/pipelines/\(pipelineId)/retry"
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "POST"
            return request
        })
    }
    
    public static func cancelBuilds(projectId: String, pipelineId: String) -> Resource<Pipeline> {
        return Resource(request: { (components) -> URLRequest in
            var mutable = components
            mutable.path = "/projects/\(projectId)/pipelines/\(pipelineId)/cancel"
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "POST"
            return request
        })
    }
    
}
