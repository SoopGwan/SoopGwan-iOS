import Moya
import Foundation

public enum UserAPI {
    case signin
    case signup
    case verifyAuthCode(phoneNumber: String)
    case sendAuthCode(phoneNumber: String, code: String)
    case checkAccountIDIsExist(accountID: String)
    case renewalPassword(password: String, mewPassword: String)
}
