///|
fnalias @reactive_web.(div, button, style, onclick, h)

///|
typealias @reactive_web.(
  HTMLDivElement,
  ReactiveElement as RE,
  ReactiveAttr as RA
)

///|
fn counter(initial_count : Int) -> HTMLDivElement {
  let state = @reactive_core.new(initial_count) // root signal
  div([
    style("display: flex; flex-direction: column; align-items: center;"),
    h("h2", ["The Greatest Counter Ever!"]),
    div([
      style("display: flex; flex-direction: row; column-gap: 1em;"),
      button("Decrement", [
        onclick(_ => state.update(state.val() - 1)),
        RA::disabled(state.map(count => count <= 0)), // Disable button when count is 0
      ]),
      RE::text(state, (txt, cur_count) => txt.set_text_content(cur_count)),
      button("Increment", [onclick(_ => state.update(state.val() + 1))]),
    ]),
  ])
}

///|
fn main {
  let el = counter(0)
  @reactive_web.mount_to_body(el)
}
