//
//  OtpTextField.swift
//  BCommerce
//
//  Created by Gabriel on 13/02/2026.
//

import SwiftUI

struct OTPTextField: View {
    let numberOfFields: Int
    @Binding var otpText: String
    @FocusState private var isFocused: Bool

    var body: some View {
        ZStack {
            // Hidden real text field that captures input
            TextField("", text: $otpText)
                .keyboardType(.numberPad)
                .focused($isFocused)
                .opacity(0)
                .onChange(of: otpText) { _, newValue in
                    // Only allow numbers
                    otpText = newValue.filter { $0.isNumber }
                    // Clamp to max length
                    if otpText.count > numberOfFields {
                        otpText = String(otpText.prefix(numberOfFields))
                    }
                }

            // Visual digit boxes
            HStack(spacing: 12) {
                ForEach(0..<numberOfFields, id: \.self) { index in
                    digitBox(at: index)
                        .onTapGesture {
                            isFocused = true
                        }
                }
            }
        }
        .onAppear {
            isFocused = true
        }
    }

    private func digitBox(at index: Int) -> some View {
        let character: String = {
            guard index < otpText.count else { return "" }
            let charIndex = otpText.index(otpText.startIndex, offsetBy: index)
            return String(otpText[charIndex])
        }()

        let isCurrentField = index == otpText.count || (index == numberOfFields - 1 && otpText.count >= numberOfFields)

        return ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(.systemGray6))
                .frame(width: 50, height: 50)

            RoundedRectangle(cornerRadius: 8)
                .stroke(isCurrentField && isFocused ? Color.blue : Color.gray.opacity(0.3), lineWidth: 2)
                .frame(width: 50, height: 50)

            Text(character)
                .font(.title2)
                .fontWeight(.semibold)
        }
    }
}
