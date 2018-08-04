# homebrew-cmake

This is a homebrew tap for collecting different cmake versions

Available cmake versions are:

* 3.11
* 3.10
* 3.9
* 3.8
* 3.7
* 3.6
* 3.5

To install cmake version x.x, you can use:

```bash
brew tap wilsonCernWq/cmake
brew tap-pin wilsonCernWq/cmake
brew install cmake@x.x
```

If you have multiple versions of cmake installed, you can first do `brew unlink cmake` or `brew unlink cmake@x.x` to remove the installed cmake, and then use `brew link cmake@x.x` to create symbolic links for a different version of cmake

Feel free to submit an issue or pull request if you run into any problems or have any suggestions for improvements to the packages.
