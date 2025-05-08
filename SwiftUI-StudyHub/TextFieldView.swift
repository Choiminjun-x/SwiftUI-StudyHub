//
//  TextFieldView.swift
//  SwiftUI-StudyHub
//
//  Created by 최민준 on 5/8/25.
//

import SwiftUI

struct TextFieldView: View {
    
    enum Field {
        case username
        case email
    }
    
    @State private var username = ""
    @State private var email = ""
    @FocusState private var focusField: Field?
    
    var body: some View {
        ZStack {
            Color.clear // 배경 터치 인식을 위한 clear color
                .contentShape(Rectangle()) // 터치 영역을 명시적으로 설정
                .onTapGesture {
                    focusField = nil // iOS+15 이후 도입된 공식 키보드 제어 방식
                }
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, World")
                    .modifier(Font24_bold())
                TextField("User name",
                          text: $username)
                .onSubmit {
                    print("user did tap return , \(username)")
                }
                .textInputAutocapitalization(.never) // 첫 글자 자동 대문자 비활성화
                .disableAutocorrection(true) // 자동 맞춤법 수정 비활성화
                .textFieldStyle(.roundedBorder) // 텍스트 필드 rounded 윤곽선 노출
                .focused($focusField, equals: .username)
                TextField("Email",
                          text: $email)
                .textFieldStyle(.roundedBorder) // 텍스트 필드 rounded 윤곽선 노출
                .focused($focusField, equals: .email)
                Button("Sign In") {
                    if username.isEmpty {
                        focusField = .username
                    } else if email.isEmpty {
                        focusField = .email
                    } else {
                        focusField = nil
                        print("Complete Input and Sign In...")
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    TextFieldView()
}
