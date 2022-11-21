import SwiftUI

@main
struct SoopGwanApp: App {
    init() {
        UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self])
            .tintColor = SoopGwanAsset.Color._3D8361.color
    }
    var body: some Scene {
        WindowGroup {
            if #available(iOS 16.0, *) {
                NavigationStack {
                    SignInView(isToast: false)
                }
                .accentColor(.black)
            } else {
                NavigationView {
                    SignInView(isToast: false)
                }
                .accentColor(.black)
            }
        }
    }
}
