
struct MyCameraUtil{
    static func isCameraAvailable() -> Bool{
        UIImagePickerController.isSourceTypeAvailable(.camera)
    }
}
