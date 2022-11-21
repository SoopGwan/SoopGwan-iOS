import Foundation

extension Int {
    func levelToTitle() -> String {
        switch self {
        case -1:
            return ""
        case 0:
            return "나무가 썩었어요"
        case 1:
            return "LV 1. 죽순"
        case 2:
            return "LV 2. 대나무 완성!"
        case 3:
            return "LV 3. 나무 분재"
        case 4:
            return "LV 4. 나무 완성!"
        default:
            return "너 뭐야"
        }
    }

    func levelToImageName() -> String {
        switch self {
        case -1:
            return ""
        case 0:
            return "lv0"
        case 1:
            return "lv1"
        case 2:
            return "lv2"
        case 3:
            return "lv3"
        case 4:
            return "lv4"
        default:
            return "lv0"
        }
    }

    func levelToContent() -> String {
        switch self {
        case -1:
            return ""
        case 0:
            return "죽순이 죽었어요 ㅜ"
        case 1:
            return "죽순이 성장중이에요!"
        case 2:
            return "죽순이 대나무로 성장했어요!!"
        case 3:
            return "나무가 성장중이에요!"
        case 4:
            return "분재가 나무로 성장했어요!!"
        default:
            return "너 뭐야, 너 뭐한거야"
        }
    }
}
