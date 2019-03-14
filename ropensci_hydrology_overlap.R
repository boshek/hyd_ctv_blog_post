library(gh)
library(kableExtra)

ropensci_repos <- gh('/orgs/ropensci/repos', type = "public", .limit = Inf)

Package <- vapply(ropensci_repos, "[[", "", "name")

as.data.frame(Package) %>%
  inner_join(as.data.frame(hyd_packages), by = c("Package" = "hyd_packages")) %>%
  arrange(Package) %>% 
  kable() %>%
  kable_styling(bootstrap_options = c("striped"), position = "left", full_width = FALSE)
