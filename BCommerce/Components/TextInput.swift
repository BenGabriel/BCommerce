import SwiftUI

// MARK: - Custom Text Input Component
struct CustomTextInput: View {
    // MARK: - Properties
    @Binding var text: String
    let placeholder: String
    var icon: String? = nil
    var rightIcon: String? = nil
    var isSecure: Bool = false
    var keyboardType: UIKeyboardType = .default
    var errorMessage: String? = nil
    var helperText: String? = nil
    var maxLength: Int? = nil
    var backgroundColor: Color = Color(hex:"#f6f6f6")
    var cornerRadius: CGFloat = 12
    var padding: CGFloat = 20
    var iconColor: Color = .black
    
    @FocusState private var isFocused: Bool
    @State private var isPasswordVisible: Bool = false
    
    // MARK: - Computed Properties
    private var hasError: Bool {
        errorMessage != nil
    }
    
    private var borderColor: Color {
        if hasError {
            return .red
        } else {
            return .clear
        }
    }
    
    private var characterCount: String? {
        guard let maxLength = maxLength else { return nil }
        return "\(text.count)/\(maxLength)"
    }
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            // Input Field Container
            HStack(spacing: 12) {
                // Leading Icon
                if let icon = icon {
                    Image(systemName: icon)
                        .foregroundColor(iconColor)
                        .frame(width: 20, height: 20)
                }
                
                // Text Field
                Group {
                    if isSecure && !isPasswordVisible {
                        SecureField(placeholder, text: $text)
                            .focused($isFocused)
                    } else {
                        TextField(placeholder, text: $text)
                            .focused($isFocused)
                    }
                }
                .keyboardType(keyboardType)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .onChange(of: text) { oldValue, newValue in
                    if let maxLength = maxLength, newValue.count > maxLength {
                        text = String(newValue.prefix(maxLength))
                    }
                }
                
                // Trailing Actions
                HStack(spacing: 8) {
                    if let rightIcon = rightIcon{
                        if isFocused {
                            Button {
                                text = ""
                            } label: {
                                Image(systemName: rightIcon)
                                    .foregroundColor(iconColor)
                                    .frame(width: 20, height: 20)
                            }
                        }
                    }
                    
                    // Password Toggle
                    if isSecure {
                        Button(action: {
                            isPasswordVisible.toggle()
                        }) {
                            Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .padding(padding)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderColor, lineWidth: 2)
            )
            .animation(.easeInOut(duration: 0.2), value: isFocused)
            .animation(.easeInOut(duration: 0.2), value: hasError)
            
            // Helper Text / Error Message / Character Count
            HStack {
                if let errorMessage = errorMessage {
                    Label(errorMessage, systemImage: "exclamationmark.circle.fill")
                        .font(.caption)
                        .foregroundColor(.red)
                } else if let helperText = helperText {
                    Text(helperText)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                if let characterCount = characterCount {
                    Text(characterCount)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

// MARK: - Preview Examples
#Preview("Basic Input") {
    VStack(spacing: 20) {
        CustomTextInput(
            text: .constant("hh"),
            placeholder: "Enter your name"
        )
        
        CustomTextInput(
            text: .constant("John Doe"),
            placeholder: "Enter your name"
        )
    }
    .padding()
}

#Preview("With Icons") {
    VStack(spacing: 20) {
        CustomTextInput(
            text: .constant(""),
            placeholder: "Enter email",
            icon: "envelope.fill",
            keyboardType: .emailAddress
        )
        
        CustomTextInput(
            text: .constant(""),
            placeholder: "Enter phone number",
            icon: "phone.fill",
            keyboardType: .phonePad
        )
    }
    .padding()
}

#Preview("Password Field") {
    VStack(spacing: 20) {
        CustomTextInput(
            text: .constant(""),
            placeholder: "Enter password",
            icon: "lock.fill",
            isSecure: true
        )
    }
    .padding()
}

#Preview("With Validation") {
    VStack(spacing: 20) {
        CustomTextInput(
            text: .constant("invalid-email"),
            placeholder: "Enter email",
            icon: "envelope.fill",
            errorMessage: "Please enter a valid email address"
        )
        
        CustomTextInput(
            text: .constant("Hello"),
            placeholder: "Enter username",
            icon: "person.fill",
            helperText: "Username must be 3-20 characters"
        )
    }
    .padding()
}

#Preview("Character Limit") {
    VStack(spacing: 20) {
        CustomTextInput(
            text: .constant("This is a tweet"),
            placeholder: "What's happening?",
            maxLength: 280,
            backgroundColor: Color(.systemGray6),
            cornerRadius: 12
        )
    }
    .padding()
}

#Preview("Custom Styling") {
    VStack(spacing: 20) {
        CustomTextInput(
            text: .constant(""),
            placeholder: "Search...",
            icon: "magnifyingglass",
            backgroundColor: Color(.systemGray5),
            cornerRadius: 25,
            padding: 12
        )
        
        CustomTextInput(
            text: .constant(""),
            placeholder: "Enter amount",
            icon: "dollarsign.circle.fill",
            keyboardType: .decimalPad,
            backgroundColor: Color.blue.opacity(0.1),
            cornerRadius: 8
        )
    }
    .padding()
}
