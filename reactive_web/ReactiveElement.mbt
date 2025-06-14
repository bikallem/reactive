///| Reactive DOM Element
struct ReactiveElement[T] {
  node : T
}

///|
pub impl[A : TNode] TJsValue for ReactiveElement[A] with to_jv(self) -> JsValue {
  self.node.to_jv()
}

///|
pub impl[A : TNode] TElement for ReactiveElement[A] with nop(_) -> Unit {

}

///|
pub impl[A : TNode] TNode for ReactiveElement[A] with nop(_) -> Unit {

}

///|
pub impl[A : TNode] TAttachableNode for ReactiveElement[A] with nop(_) -> Unit {

}

///|
pub impl[A : TNode] TEventTarget for ReactiveElement[A] with nop(_) -> Unit {

}

///| Creates a new reactive DOM element that updates text content based on a signal.
pub fn[T : Show] ReactiveElement::text(
  signal : @reactive_core.Signal[T],
  effect : (Text, T) -> Unit
) -> ReactiveElement[Text] {
  let txt = document.create_text_node("")
  signal.subscribe_permanent(fn(value) { effect(txt, value) })
  ReactiveElement::{ node: txt }
}

///| Creates a new reactive HTML element with the given tag name.
pub fn[A : Eq] ReactiveElement::h(
  tag : String,
  signal : @reactive_core.Signal[A],
  effect : (Element, A) -> Unit,
  nodes : Array[&TAttachableNode]
) -> ReactiveElement[Element] {
  let el = document.create_element(tag)
  nodes.each(fn(node) { node.attach(el) })
  signal.subscribe_permanent(fn(value) { effect(el, value) })
  ReactiveElement::{ node: el }
}

///| Creates a new reactive HTML div element.
pub fn[A : Eq] ReactiveElement::div(
  signal : @reactive_core.Signal[A],
  effect : (HTMLDivElement, A) -> Unit,
  nodes : Array[&TAttachableNode]
) -> ReactiveElement[Element] {
  ReactiveElement::h(
    "div",
    signal,
    fn(el, value) {
      let div = el.into()
      effect(div, value)
    },
    nodes,
  )
}
