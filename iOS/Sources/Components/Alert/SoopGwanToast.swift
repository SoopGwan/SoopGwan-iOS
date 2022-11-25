import SwiftUI

struct SoopGwanToast: ViewModifier {
    @Binding var isShowing: Bool
    let message: String
    let style: DmsToastStyle

    init(
        isShowing: Binding<Bool>,
        message: String,
        style: DmsToastStyle
    ) {
        _isShowing = isShowing
        self.message = message
        self.style = style
    }

    func body(content: Content) -> some View {
        ZStack {
            content
            soopGwanToastView()
        }
        .onChange(of: isShowing) { _ in
            if isShowing {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isShowing = false
                    }
                }
            }
        }
    }

    @ViewBuilder
    private func soopGwanToastView() -> some View {
        VStack {
            if isShowing {
                HStack(spacing: 10) {
                    style.icon
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: style.size.width, height: style.size.height)
                        .foregroundColor(style.iconForeground)

                    Text(message)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(style.textForeground)

                    Spacer()
                }
                .transition(.offset(y: -50).combined(with: AnyTransition.opacity.animation(.default)))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .padding(.horizontal, 16)
                .background {
                    Rectangle()
                        .fill(.white)
                        .cornerRadius(10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("2F6149"), lineWidth: 0.5)
                        }

                        .shadow(
                            color: .gray.opacity(0.2),
                            radius: 10,
                            y: 1
                        )
                }
                .padding(.horizontal, 12)
                .onTapGesture {
                    withAnimation {
                        isShowing = false
                    }
                }
            }

            Spacer()
        }
        .animation(.default, value: isShowing)
    }
}

public extension View {
    func soopGwanToast(
        isShowing: Binding<Bool>,
        message: String,
        style: DmsToastStyle
    ) -> some View {
        modifier(SoopGwanToast(isShowing: isShowing, message: message, style: style))
    }
}
