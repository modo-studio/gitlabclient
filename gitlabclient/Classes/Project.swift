import Foundation
import Unbox

public struct Project: Unboxable {
    
    // MARK: - Properties
    
    public let id: Int
    public let description: String?
    public let defaultBranch: String
    public let isPublic: Bool
    public let archived: Bool
    public let visibilityLevel: UInt
    public let sshUrlToRepo: String
    public let httpUrlToRepo: URL
    public let webUrl: URL
    public let name: String
    public let nameWithNamespace: String
    public let path: String
    public let pathWithNamespace: String
    public let cotainerRegistryEnabled: Bool
    public let issuesEnabled: Bool
    public let mergeRequestsEnabled: Bool
    public let wikiEnabled: Bool
    public let buildsEnabled: Bool
    public let snippetsEnabled: Bool
    public let createdAt: Date
    public let lastActivityAt: Date
    public let sharedRunnersEnabled: Bool
    public let lfsEnabled: Bool
    public let creatorId: String
    public let namespace: Namespace?
    public let avatarUrl: URL?
    public let starsCount: UInt
    public let forksCount: UInt
    public let openIssuesCount: UInt
    public let publicBuilds: Bool
    public let onlyAllowMergeIfBuildSucceeds: Bool
    public let requestAccessEnabled: Bool
    public let onlyAllowMergeIfAllDiscussionsAreResolved: Bool
    public let approvalsBeforeMerge: UInt
    
    // MARK: - Unboxable
    
    /// Initialize an instance of this model by unboxing a dictionary using an Unboxer
    public init(unboxer: Unboxer) throws {
        self.id = try unboxer.unbox(key: "id")
        self.description = unboxer.unbox(key: "description")
        self.defaultBranch = try unboxer.unbox(key: "default_branch")
        self.isPublic = try unboxer.unbox(key: "public")
        self.archived = try unboxer.unbox(key: "archived")
        self.visibilityLevel = try unboxer.unbox(key: "visibility_level")
        self.sshUrlToRepo = try unboxer.unbox(key: "ssh_url_to_repo")
        self.httpUrlToRepo = try unboxer.unbox(key: "http_url_to_repo")
        self.webUrl = try unboxer.unbox(key: "web_url")
        self.name = try unboxer.unbox(key: "name")
        self.nameWithNamespace = try unboxer.unbox(key: "name_with_namespace")
        self.path = try unboxer.unbox(key: "path")
        self.pathWithNamespace = try unboxer.unbox(key: "path_with_namespace")
        self.cotainerRegistryEnabled = try unboxer.unbox(key: "container_registry_enabled")
        self.issuesEnabled = try unboxer.unbox(key: "issues_enabled")
        self.mergeRequestsEnabled = try unboxer.unbox(key: "merge_requests_enabled")
        self.wikiEnabled = try unboxer.unbox(key: "wiki_enabled")
        self.buildsEnabled = try unboxer.unbox(key: "builds_enabled")
        self.snippetsEnabled = try unboxer.unbox(key: "snippets_enabled")
        self.createdAt = try unboxer.unbox(key: "created_at", formatter: DateFormatter.gitlab)
        self.lastActivityAt = try unboxer.unbox(key: "last_activity_at", formatter: DateFormatter.gitlab)
        self.sharedRunnersEnabled = try unboxer.unbox(key: "shared_runners_enabled")
        self.lfsEnabled = try unboxer.unbox(key: "lfs_enabled")
        self.creatorId = try unboxer.unbox(key: "creator_id")
        self.namespace = unboxer.unbox(key: "namespace")
        self.avatarUrl = unboxer.unbox(key: "avatar_url")
        self.starsCount = try unboxer.unbox(key: "stars_count")
        self.forksCount = try unboxer.unbox(key: "forks_count")
        self.openIssuesCount = try unboxer.unbox(key: "open_issues_count")
        self.publicBuilds = try unboxer.unbox(key: "public_builds")
        self.onlyAllowMergeIfBuildSucceeds = try unboxer.unbox(key: "only_allow_merge_if_build_succeeds")
        self.requestAccessEnabled = try unboxer.unbox(key: "request_access_enabled")
        self.onlyAllowMergeIfAllDiscussionsAreResolved = try unboxer.unbox(key: "only_allow_merge_if_all_discussions_are_resolved")
        self.approvalsBeforeMerge = try unboxer.unbox(key: "approvals_before_merge")
    }
    
}

public extension Project {
    
    public static func list(archived: Bool? = nil,
                            visibility: String? = nil,
                            orderBy: String? = nil,
                            sort: String = "desc",
                            search: String? = nil,
                            page: Int = 1,
                            perPage: Int = 20) -> Resource<[Project]> {
        return listResource(path: "/projects",
                            archived: archived,
                            visibility: visibility,
                            orderBy: orderBy,
                            sort: sort,
                            search: search,
                            page: page,
                            perPage: perPage)
    }
    
    public static func listVisible(archived: Bool? = nil,
                                   visibility: String? = nil,
                                   orderBy: String? = nil,
                                   sort: String = "desc",
                                   search: String? = nil,
                                   page: Int = 1,
                                   perPage: Int = 20) -> Resource<[Project]> {
        return listResource(path: "/projects/visible",
                            archived: archived,
                            visibility: visibility,
                            orderBy: orderBy,
                            sort: sort,
                            search: search,
                            page: page,
                            perPage: perPage)
    }
    
    public static func listOwned(archived: Bool? = nil,
                                 visibility: String? = nil,
                                 orderBy: String? = nil,
                                 sort: String = "desc",
                                 search: String? = nil,
                                 page: Int = 1,
                                 perPage: Int = 20) -> Resource<[Project]> {
        return listResource(path: "/projects/owned",
                            archived: archived,
                            visibility: visibility,
                            orderBy: orderBy,
                            sort: sort,
                            search: search,
                            page: page,
                            perPage: perPage)
    }
    
    public static func listStarred(archived: Bool? = nil,
                                   visibility: String? = nil,
                                   orderBy: String? = nil,
                                   sort: String = "desc",
                                   search: String? = nil,
                                   page: Int = 1,
                                   perPage: Int = 20) -> Resource<[Project]> {
        return listResource(path: "/projects/starred",
                            archived: archived,
                            visibility: visibility,
                            orderBy: orderBy,
                            sort: sort,
                            search: search,
                            page: page,
                            perPage: perPage)
    }
    
    public static func listAll(archived: Bool? = nil,
                               visibility: String? = nil,
                               orderBy: String? = nil,
                               sort: String = "desc",
                               search: String? = nil,
                               page: Int = 1,
                               perPage: Int = 20) -> Resource<[Project]> {
        return listResource(path: "/projects/all",
                            archived: archived,
                            visibility: visibility,
                            orderBy: orderBy,
                            sort: sort,
                            search: search,
                            page: page,
                            perPage: perPage)
    }
    
    private static func listResource(path: String,
                                     archived: Bool?,
                                     visibility: String? = nil,
                                     orderBy: String? = nil,
                                     sort: String = "desc",
                                     search: String? = nil,
                                     page: Int = 1,
                                     perPage: Int = 20) -> Resource<[Project]> {
        return Resource(request: { (components) -> URLRequest in
            var mutable = components
            mutable.path = path
            var queryItems = [
                URLQueryItem(name: "page", value: "\(page)"),
                URLQueryItem(name: "per_page", value: "\(perPage)")
            ]
            if let archived = archived { queryItems.append(URLQueryItem(name: "archived", value: "\(archived)")) }
            if let visibility = visibility { queryItems.append(URLQueryItem(name: "visibility", value: visibility)) }
            if let orderBy = orderBy { queryItems.append(URLQueryItem(name: "order_by", value: orderBy)) }
            queryItems.append(URLQueryItem(name: "sort", value: sort))
            if let search = search { queryItems.append(URLQueryItem(name: "search", value: "\(search)")) }
            return URLRequest(url: mutable.url!)
        })
    }
    
    public static func get(id: String) -> Resource<Project> {
        return Resource(request: { (components) -> URLRequest in
            var mutable = components
            mutable.path = "/projects/\(id)"
            return URLRequest(url: mutable.url!)
        })
    }
}
    
