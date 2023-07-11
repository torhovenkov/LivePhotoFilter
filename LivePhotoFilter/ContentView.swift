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
        VStack{
            CameraPreview(image: frameHandler.frame)
            Picker("Choose filter", selection: $frameHandler.filterType) {
                ForEach(FilterType.allCases) { type in
                    Text(String(describing: type))
                }
            }
            .pickerStyle(.segmented)
            .frame(height: 50)
            .padding(.horizontal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
