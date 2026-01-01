
# Add a repositary  
resource "github_repository" "hello-first" {
  name        = "hellofirst"
  description = "My first repo from terraform"
  visibility  = "public"
  auto_init   = true

}

resource "github_repository" "hello-second" {
  name        = "hellosecond"
  description = "My first repo from terraform"
  visibility  = "public"
  auto_init   = true

}












