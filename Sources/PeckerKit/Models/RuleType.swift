import Foundation

public enum RuleType: String, Decodable, CaseIterable {
    
    case skipPublic = "skip_public"
    case xctest
}