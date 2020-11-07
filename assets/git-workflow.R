library(DiagrammeR)
library(DiagrammeRsvg)
library(rsvg)

g <- create_graph(attr_theme = "lr", graph_name = "three-trees") %>%
  add_node(label = "Commit \n(or Stash)") %>%
  add_node(label = "Pull") %>%
  add_node(label = "Push") %>%
  add_edges_w_string("1->2 2->3") %>%
  set_node_attrs(node_attr = "fixedsize", values = "false") %>%
  set_node_attrs(node_attr = "shape", values = "box") %>%
  set_node_attrs(node_attr = "fillcolor", values = c("firebrick", "goldenrod", "turquoise")) %>%
  set_node_attrs(node_attr = "fontcolor", values = "white") %>%
  set_edge_attrs(edge_attr = "labelfloat", values = "true") %>%
  set_edge_attrs(edge_attr = "splines", values = "ortho")
g$nodes_df$style <- "filled,rounded"
writeLines(generate_dot(g), "./assets/git-workflow.gv")
# cat(generate_dot(g))

# do manual edits e.g. saving to file - then, run below
gv <- grViz(diagram = "./assets/git-workflow.gv")
gv_svg <- export_svg(gv = gv)
write(x = gv_svg, file = "./assets/img/git-workflow.svg")
rsvg_svg(
  svg = "./assets/img/git-workflow.svg", file = "./assets/img/git-workflow-scaled.svg",
  height = 44*2
)
