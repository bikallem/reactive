///|
#external
type Window

///|
extern "js" fn window_ffi() -> Window = "() => window"

///|
pub let window : Window = window_ffi()

///|
pub impl TJsValue for Window with to_jv(self : Window) -> JsValue = "%identity"

///|
pub impl TEventTarget for Window

///|
pub extern "js" fn Window::device_pixel_ratio(self : Window) -> Double = "(self) => self.devicePixelRatio"

///|
extern "js" fn beforeunload_ffi(window : Window, f : JsValue) -> Unit = "(self) => self.onbeforeunload"

///|
pub fn Window::beforeunload(
  self : Window,
  handler : (BeforeUnloadEvent) -> Unit
) -> Unit {
  let f = JsValue::to_jv(handler)
  beforeunload_ffi(self, f)
}

///|
#external
type ImageBitmap

///|
pub extern "js" fn Window::create_image_bitmap(
  self : Window,
  image : ImageData
) -> Promise[ImageBitmap] = "(self, image) => createImageBitmap(image)"
