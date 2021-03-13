import 'dart:io';

void main(List<String> arguments) async {
  var tempDir = (await Directory.systemTemp.createTemp()).path;
  var repoUrl = arguments[0];
  var packagePath = arguments[1];
  var startTime = DateTime.now();
  var cloneResult = await Process.run(
      'git',
      [
        'clone',
        '--depth',
        '1',
        '--filter=tree:0',
        '--sparse',
        '--no-checkout',
        repoUrl,
        tempDir,
      ],
      workingDirectory: tempDir);

  var fetchResult = await Process.run('git', ['fetch', '--tag', '--quiet'],
      workingDirectory: tempDir);
  var listTagResult =
      await Process.run('git', ['tag', '--list'], workingDirectory: tempDir);
  var tags = (listTagResult.stdout as String).split('\n');

  var sparseInitResult = await Process.run('git', ['sparse-checkout', 'init'],
      workingDirectory: tempDir);
  var sparseSetResult = await Process.run(
      'git',
      [
        'sparse-checkout',
        'set',
        packagePath == '/' ? 'pubspec.yaml' : packagePath + '/pubspec.yaml'
      ],
      workingDirectory: tempDir);

  var pubspecs = <List<String>>[];

  stderr.writeln('Initialization completed, start looping through tags now.');

  for (var tagName in tags) {
    stderr.writeln([
      'Working at tag ',
      tagName,
      ' seconds passed: ',
      DateTime.now().difference(startTime).inSeconds.toString()
    ]);
    var checkoutResult = await Process.run('git', ['checkout', tagName],
        workingDirectory: tempDir);
    if (!await File(tempDir + '/' + packagePath + '/pubspec.yaml').exists()) {
      continue;
    }
    var pubspec =
        await File(tempDir + '/' + packagePath + '/pubspec.yaml').readAsLines();
    pubspecs.add(pubspec);
  }
  for (var pubspec in pubspecs) {
    for (var line in pubspec) {
      if (line.contains('version')) {
        print(line);
      }
    }
  }
}
