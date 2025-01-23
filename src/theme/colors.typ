#let theme_list = ("default", "bw")
#let colors_dict = (:)
#for theme in theme_list {
  colors_dict.insert(theme, json(theme + ".json"))
}

#let colors(env_name, color_name, theme: "default") = rgb(colors_dict.at(theme).at(env_name).at(color_name))
