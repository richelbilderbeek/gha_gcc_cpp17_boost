#include <cassert>
#include <iostream>
#include <optional>
#include <string>

#include <boost/config.hpp>

int main()
{
  static_assert("C++17");

  #ifndef __GNUC__
  #error GCC in this example please
  #endif

  #ifdef __clang__
  #error No clang in this example please
  #endif

  // Show compiler and version
  std::cout << "Compiler: " << BOOST_COMPILER << '\n';

  const std::optional<std::string> maybe_string("Hello world");
  assert(maybe_string.has_value());
  std::cout << maybe_string.value() << '\n';
}
