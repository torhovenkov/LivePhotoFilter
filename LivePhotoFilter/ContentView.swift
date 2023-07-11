//
//  ContentView.swift
//  LivePhotoFilter
//
//  Created by Vladyslav Torhovenkov on 11.07.2023.
//

import SwiftUI
import AVFoundation
import MetalPetal

struct ContentView: View {
    @StateObject private var frameHandler = FrameHandler()
    
    var body: some View {
        CameraPreview(image: frameHandler.frame)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
