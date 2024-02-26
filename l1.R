install.packages(c("devtools","roxygen2","testthat","rmarkdown","pkgdown","purrr"))

usethis::use_git_config(user.name = "esragonen",
                        user.email="gonen.esra@metu.edu.tr")

usethis::create_github_token()
gitcreds::gitcreds_set()
usethis::git_sitrep()
