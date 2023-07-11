//
//  FilterHandler.swift
//  LivePhotoFilter
//
//  Created by Vladyslav Torhovenkov on 11.07.2023.
//

import CoreImage
import MetalPetal


struct FilterHandler {
    let cgImage: CGImage
    let filterType: FilterType
    
    var filteredImage: CGImage {
        return getFilteredImage()
    }
    
    private func getFilteredImage() -> CGImage {
        let imageFromCGImage = MTIImage(cgImage: self.cgImage, isOpaque: true)
        return applyFilter(mtImage: imageFromCGImage,filterType: self.filterType)
        
    }
    
    private func applyFilter(mtImage: MTIImage, filterType: FilterType) -> CGImage {
        var currentFilter: MTIUnaryFilter
        switch filterType {
        case .notSelected:
            return self.cgImage
        case .opacity:
            currentFilter = getConfiguredOpacityFilter()
        case .colorInvert:
            currentFilter = MTIColorInvertFilter()
        case .contrast:
            currentFilter = getConfiguredContrastFilter()
        }
        let context = try! MTIContext(device: MTLCreateSystemDefaultDevice()!)
        currentFilter.inputImage = mtImage
        guard let output = currentFilter.outputImage else { return self.cgImage}
        let cgImage = try! context.makeCGImage(from: output)
        return cgImage
    }
    
    private func getConfiguredOpacityFilter() -> MTIOpacityFilter {
        let filter = MTIOpacityFilter()
        filter.opacity = 0.5
        return filter
    }
    private func getConfiguredContrastFilter() -> MTIContrastFilter {
        let filter = MTIContrastFilter()
        filter.contrast = 1.5
        return filter
    }
    
}

enum FilterType: CaseIterable, Identifiable, CustomStringConvertible {
    case notSelected
    case opacity
    case colorInvert
    case contrast
    
    var id: Self { self }
    
    var description: String {
        switch self {
        case .notSelected:
            return "None"
        case .opacity:
            return "Opacity"
        case .colorInvert:
            return "Color Invert"
        case .contrast:
            return "Contrast"
        }
    }
}
