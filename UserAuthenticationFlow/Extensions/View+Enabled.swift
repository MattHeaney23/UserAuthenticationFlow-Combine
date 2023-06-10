//
//  View+Enabled.swift
//  UserAuthenticationFlow
//
//  Created by Matt on 10/06/2023.
//

import Foundation
import SwiftUI

extension View {
    /// View is only enabled when the condition is true. Disabled if false
    func enabled(_ enabled: Bool) -> some View {
        self.disabled(!enabled)
    }
}
