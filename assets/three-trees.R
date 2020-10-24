library(DiagrammeR)
library(DiagrammeRsvg)
library(rsvg)

g <- create_graph(attr_theme = "tb", graph_name = "three-trees") %>%
  add_node(label = "Working Directory") %>%
  add_node(label = "Staging Index") %>%
  add_node(label = "Commit History / HEAD / Repo") %>%
  add_edge(
    from = 1, to = 2, edge_aes = list(label = "git add")
  ) %>%
  add_edge(
    from = 2, to = 3, edge_aes = list(label = "git commit")
  ) %>%
  set_node_attrs(node_attr = "fixedsize", values = "false") %>%
  set_node_attrs(node_attr = "shape", values = "box") %>%
  set_node_attrs(node_attr = "fillcolor", values = "orange") %>%
  set_edge_attrs(edge_attr = "labelfloat", values = "true") %>%
  set_edge_attrs(edge_attr = "splines", values = "ortho")
g$nodes_df$style <- "filled,rounded"
cat(generate_dot(g))

# do manual edits - then, run below
gv <- grViz(diagram = "./assets/three-trees.gv")
gv_svg <- export_svg(gv = gv)
write(x = gv_svg, file = "./assets/img/three-tress.svg")
rsvg_svg(
  svg = "./assets/img/three-trees.svg", file = "./assets/img/three-trees-scaled.svg",
  height = 188*2
)
