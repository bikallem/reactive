///| Javascript DOM Element
extern type Element

///|
pub impl TJsValue for Element with to_jv(self) -> JsValue = "%identity"

///|
pub impl TElement for Element with nop(_) -> Unit {

}

///|
pub impl TNode for Element with nop(_) -> Unit {

}

///|
pub impl TAttachableNode for Element with nop(_) -> Unit {

}

///|
pub impl TEventTarget for Element with nop(_) -> Unit {

}

///|
pub fn[T : TElement] Element::into(self : Element) -> T = "%identity"

///| Create a new HTML element representing the given tag name
pub fn h(tag : String, nodes : Array[&TAttachableNode]) -> Element {
  let el = document.create_element(tag)
  nodes.each(fn(node) { node.attach(el) })
  el
}

///|
pub let span : (Array[&TAttachableNode]) -> Element = h("span", _)
