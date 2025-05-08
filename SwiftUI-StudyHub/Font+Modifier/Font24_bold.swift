//
//  Font24_bold.swift
//  SwiftUI-StudyHub
//
//  Created by 최민준 on 4/12/25.
//

import SwiftUI

struct Font24_bold: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(size: 24, weight: .bold, design: .default))
      .foregroundColor(.blue)
  }
}
