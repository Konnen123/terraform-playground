resource "local_file" "test_file" {
  filename = "Information_about_random_integer.txt"
  content = "The random integer generated is: ${random_integer.random_integer.id}. It is between ${random_integer.random_integer.min} and ${random_integer.random_integer.max}. This integer is ${random_integer.random_integer.result % 2 == 0 ? "even" : "odd"}"
}

resource "random_integer" "random_integer" {
  max = 100
  min = 0
}