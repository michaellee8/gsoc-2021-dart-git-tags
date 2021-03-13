A rudimentary sample demonstrating the git partial clone + sparse checkout method.

## What does it do

1. Given a git url and a path to package
2. perform a partial clone of the repo to the disk (without all trees and blobs)
3. perform a sparse checkout on the required pubspec.yaml
4. loop through all tags to scrape all applicable pubspec.yaml
5. all found version of the discovered package.

## Usage

```bash
dart main.dart <url to git repo> <path to package>
```

```bash
# Simple example
dart main.dart https://github.com/rrousselGit/provider /

# Heavy load test, would take quite a lot of time to complete
dart main.dart https://github.com/flutter/plugins packages/camera/camera
```
