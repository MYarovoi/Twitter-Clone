//
//  LazyView.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 17.12.2024.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}
