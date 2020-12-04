if (! "renv" %in% rownames(utils::installed.packages())) {
  if (! "remotes" %in% rownames(utils::installed.packages())) {
    utils::install.packages("remotes")
  }
  remotes::install_github("rstudio/renv")
}

source("renv/activate.R")
renv::settings$r.version("3.6")
renv::settings$ignored.packages(c("remotes", "rstudioapi", "later"))

local({
  pkgs <- c("rstudioapi", "later")
  old_pkgs <- pkgs %in% rownames(installed.packages())
  if (! all(old_pkgs)) {
    renv::install(pkgs[!old_pkgs], prompt = F)
  }
  r_minor <- paste0(R.version$major, '.', unlist(strsplit(R.version$minor, '.', fixed = T))[1])
  if (r_minor != renv::settings$r.version()) {
    message <- paste0(
      "Project requires R major.minor version ", renv::settings$r.version(), ".\n",
      "You're running R ", r_minor, ".\n",
      "Please change your R version to ",  renv::settings$r.version(), " before proceeding."
    )
    message(message)
    if (Sys.getenv("RSTUDIO") != '') {
      later::later(function() {
        rstudioapi::showDialog(title = "Change your R Version", message = message)
      }, 5)
    }
  }
})

