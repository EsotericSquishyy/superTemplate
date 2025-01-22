
#let colors_dict = (
  bookmark: (
    bgcolor: white,
    strokecolor:  red,
  ),

  thm: (
    bgcolor1:     rgb("#faf1fd"),
    bgcolor2:     rgb("#dfc1e6"),
    strokecolor1: rgb("#6913d1"),
    strokecolor2: rgb("#87739a"),
  ),
  lemma: (
    bgcolor1:     rgb("#fcffcc"),
    bgcolor2:     rgb("#edeb69"),
    strokecolor1: rgb("#abc00c"),
    strokecolor2: rgb("#b2c016"),
  ),
  cor: (
    bgcolor1:     rgb("#dedbf8"),
    bgcolor2:     rgb("#bfb6df"),
    strokecolor1: rgb("#0f0cc0"),
    strokecolor2: rgb("#4922bf"),
  ),
  prop: (
    bgcolor1:     rgb("#fbdfdb"),
    bgcolor2:     rgb("#e1a29f"),
    strokecolor1: rgb("#e03636"),
    strokecolor2: rgb("#d45345"),
  ),

  note: (
    bgcolor:      rgb("#ffffff"),
    strokecolor:  rgb("#000000"),
  ),
  defn: (
    bgcolor:      rgb("#cceeff"),
    strokecolor:  rgb("#33adff"),
  ),
  remark: (
    bgcolor:      rgb("#fcf0fc"),
    strokecolor:  rgb("#e734ed"),
  ),
  notation: (
    bgcolor:      rgb("#fcf4f0"),
    strokecolor:  rgb("#ed9a34"),
  ),
  example: (
    bgcolor:      rgb("#fafffa"),
    strokecolor:  rgb("#1fc71f"),
  ),
  conc: (
    bgcolor:      rgb("#bddce9"),
    strokecolor:  rgb("#0a5667"),
  ),
  comp_prob: (
    bgcolor:      rgb("#e3f2f4"),
    strokecolor:  rgb("#14a1f2"),
  ),
  algor: (
    bgcolor:      rgb("#e3e3f4"),
    strokecolor:  rgb("#221fc7"),
  ),

  named_prob: (
    bgcolor1:     rgb("#fafffa"),
    bgcolor2:     rgb("#abc3b0"),
    strokecolor1: rgb("#1fc71f"),
    strokecolor2: rgb("#739a7a"),
  ),
  prob: (
    bgcolor1:     rgb("#fafffa"),
    bgcolor2:     rgb("#abc3b0"),
    strokecolor1: rgb("#1fc71f"),
    strokecolor2: rgb("#739a7a"),
  ),
  named_excs: (
    bgcolor1:     rgb("#fff3e1"),
    bgcolor2:     rgb("#eed08a"),
    strokecolor1: rgb("#fd9e0a"),
    strokecolor2: rgb("#c37410"),
  ),
  excs: (
    bgcolor1:     rgb("#fff3e1"),
    bgcolor2:     rgb("#eed08a"),
    strokecolor1: rgb("#fd9e0a"),
    strokecolor2: rgb("#c37410"),
  ),
)

#let colors(env_name, color_name) = colors_dict.at(env_name).at(color_name)
