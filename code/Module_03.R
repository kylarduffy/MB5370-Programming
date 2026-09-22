#------------------------------------#
# MB5370: Techniques in Marine Science 1
# Programming Fundamentals
# Kylar Duffy
# 16/09/2026
#------------------------------------#

# Workshop 03. Git and Github ####
# Setting up Git and Github on computer
library(usethis)
usethis::use_git_config(
  user.name = "kylarduffy",
  user.email = "kylar.duffy8@gmail.com")
credentials::git_credential_ask()
usethis::create_github_token()
gitcreds::gitcreds_set()
usethis::git_sitrep()
credentials::set_github_pat()

# Using the class Github repository ####
# Clone the class repo to my computer
# Track my projject
usethis::use_git()
