# LivePhotoFilter

The app lets you apply filter in real time.

- SwiftUI
- 3 fliters: Opacity, Color Invert and Contrast
- App uses MetalPetal framework for image processing.
- Currently the app doesn't let you save pictures

  CameraPreview is responsible for displaying the video
  FrameHandler is responsible for receiving inputStream from the camera
  FilterHandler is responsible for applying filters on current video stream (video stram must be converted to CGImage)
  Opacity and Contrast intensity are hardcoded, you can see it it getConfiguredOpacityFilter() and getConfiguredContrastFilter()
  

<img src="https://github.com/torhovenkov/torhovenkov/assets/45015699/081648ac-19f4-40a4-a51b-d8cf6b4e5331" width="300" title="No filters">
<img src="https://github.com/torhovenkov/torhovenkov/assets/45015699/8c81c394-b123-43a9-9b45-8678e8ccb656" width="300" title="Color Invert">
