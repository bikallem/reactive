///|
#external
type PointerEvent

///|
pub impl TMouseEvent for PointerEvent

///|
pub impl TJsValue for PointerEvent with to_jv(self : PointerEvent) -> JsValue = "%identity"

///|
pub impl TEvent for PointerEvent

///|
pub fn PointerEvent::from_event(ev : &TEvent) -> PointerEvent = "%identity"
