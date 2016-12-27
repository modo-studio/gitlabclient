import Foundation
import Unbox

public struct Build: Unboxable {
    
    // MARK: - Properties
    
    public let id: Int
    public let status: String
    public let stage: String
    public let name: String
    public let ref: String
    public let tag: Bool
    public let createdAt: Date
    public let startedAt: Date?
    public let finishedAt: Date?
    public let userName: String
    public let userUsername: String
    public let userId: String
    public let userAvatarUrl: URL?
    public let userWebUrl: URL
    public let commitId: String?
    public let commitShortId: String?
    public let commitTitle: String?
    public let commitAuthorName: String?
    public let commitAuthorEmail: String?
    public let commitCreatedAt: Date?
    public let commitCommiterName: String?
    public let commitCommiterEmail: String?
    public let commitMessage: String?
    public let runnerId: String?
    public let runnerDescription: String?
    public let runnerActive: Bool?
    public let runnerIsShared: Bool?
    public let runnerName: String?
    public let pipelineId: String?
    public let pipelineSha: String?
    public let pipelineRef: String?
    public let pipelineStatus: String?
    
    // MARK: - Unboxable
    
    /// Initialize an instance of this model by unboxing a dictionary using an Unboxer
    public init(unboxer: Unboxer) throws {
        self.id = try unboxer.unbox(key: "id")
        self.status = try unboxer.unbox(key: "status")
        self.stage = try unboxer.unbox(key: "stage")
        self.name = try unboxer.unbox(key: "name")
        self.ref = try unboxer.unbox(key: "ref")
        self.tag = try unboxer.unbox(key: "tag")
        self.createdAt = try unboxer.unbox(key: "created_at", formatter: DateFormatter.gitlab)
        self.startedAt = unboxer.unbox(key: "started_at", formatter: DateFormatter.gitlab)
        self.finishedAt = unboxer.unbox(key: "finished_at", formatter: DateFormatter.gitlab)
        self.userName = try unboxer.unbox(key: "user.name")
        self.userUsername = try unboxer.unbox(key: "user.username")
        self.userId = try unboxer.unbox(key: "user.id")
        self.userAvatarUrl = unboxer.unbox(key: "user.avatar_url")
        self.userWebUrl = try unboxer.unbox(key: "user.web_url")
        
        self.commitId = unboxer.unbox(key: "commit.id")
        self.commitShortId = unboxer.unbox(key: "commit.short_id")
        self.commitTitle = unboxer.unbox(key: "commit.title")
        self.commitAuthorName = unboxer.unbox(key: "commit.author_name")
        self.commitAuthorEmail = unboxer.unbox(key: "commit.author_email")
        self.commitCreatedAt = unboxer.unbox(key: "commit.created_at", formatter: DateFormatter.gitlab)
        self.commitCommiterName = unboxer.unbox(key: "commit.commiter_name")
        self.commitCommiterEmail = unboxer.unbox(key: "commit.commiter_email")
        self.commitMessage = unboxer.unbox(key: "commit.message")
        self.runnerId = unboxer.unbox(key: "runner.id")
        self.runnerDescription = unboxer.unbox(key: "runner.description")
        self.runnerActive = unboxer.unbox(key: "runner.active")
        self.runnerIsShared = unboxer.unbox(key: "runner.is_shared")
        self.runnerName = unboxer.unbox(key: "runner.name")
        self.pipelineId = unboxer.unbox(key: "pipeline.id")
        self.pipelineSha = unboxer.unbox(key: "pipeline.sha")
        self.pipelineRef = unboxer.unbox(key: "pipeline.ref")
        self.pipelineStatus = unboxer.unbox(key: "pipeline.status")
    }
    
}
