import Foundation

public struct AchieveListEntity: Equatable, Hashable {
    public let title: String
    public let imageName: String
    public let content: String

    public init(
        title: String,
        imageName: String,
        content: String
    ) {
        self.title = title
        self.imageName = imageName
        self.content = content
    }
}
