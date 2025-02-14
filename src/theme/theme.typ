// Colors
#let env_colors_list  = ("classic", "bw", "bootstrap")
#let env_colors       = state("theme", "bootstrap")
#let colors_dict      = (:)
#for colors_name in env_colors_list {
  colors_dict.insert(colors_name, json(colors_name + ".json"))
}
#let colors(theme_name, env_name, color_name) = {
  return rgb(colors_dict.at(theme_name).at(env_name).at(color_name))
}
#let ratios(theme_name, env_name, parameter_name) = {
  return float(colors_dict.at(theme_name).at(env_name).at(parameter_name)) * 100%
}

// Header Styling
#let env_headers_list = ("tab", "classic")
#let env_headers      = state("headers", "tab")
