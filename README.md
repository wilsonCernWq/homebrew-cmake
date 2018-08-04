# homebrew-cmake

This is a homebrew tap for collecting different cmake versions

Available cmake versions are:

* 3.11 (3.11.0) [documentation](https://cmake.org/cmake/help/v3.11/)
* 3.10 (3.10.3) [documentation](https://cmake.org/cmake/help/v3.10/)
* 3.9  (3.9.6)  [documentation](https://cmake.org/cmake/help/v3.9/)
* 3.8  (3.8.2)  [documentation](https://cmake.org/cmake/help/v3.8/)
* 3.7  (3.7.2)  [documentation](https://cmake.org/cmake/help/v3.7/)
* 3.6  (3.6.3)  [documentation](https://cmake.org/cmake/help/v3.6/)
* 3.5  (3.5.2)  [documentation](https://cmake.org/cmake/help/v3.5/)

To install cmake version x.x, you can use:

```bash
brew tap wilsonCernWq/cmake
brew tap-pin wilsonCernWq/cmake
brew install cmake@x.x
```

If you have multiple versions of cmake installed, you can first do `brew unlink cmake` or `brew unlink cmake@x.x` to remove the installed cmake, and then use `brew link cmake@x.x` to create symbolic links for a different version of cmake

Feel free to submit an issue or pull request if you run into any problems or have any suggestions for improvements to the packages.
