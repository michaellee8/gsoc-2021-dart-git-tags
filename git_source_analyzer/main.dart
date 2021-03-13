import 'dart:io';

void main(List<String> arguments) async {
  var tempDir = (await Directory.systemTemp.createTemp()).path;
  var repoUrl = arguments[1];
  var packagePath = arguments[2];
  var cloneResult = await Process.run('git', [
    'clone',
    '--depth',
    '1',
    '--filter=tree:0',
    '--sparse',
    '--bo-checkout',
    tempDir
  ]);

  var fetchResult = await Process.run('git', ['fetch', '-tag', '--quiet'],
      workingDirectory: tempDir);
  var listTagResult =
      await Process.run('git', ['tag', '--list'], workingDirectory: tempDir);
  var tags = (listTagResult.stdout as String).split('\n');

  var sparseInitResult = await Process.run('git', ['sparse-checkout', 'init'],
      workingDirectory: tempDir);
  var sparseSetResult = await Process.run(
      'git', ['sparse-checkout', packagePath + '/pubspec.yaml'],
      workingDirectory: tempDir);

  List<List<String>> pubspecs = [];

  for (var tagName in tags) {
    var checkoutResult = await Process.run('git', ['checkout', tagName],
        workingDirectory: tempDir);
    var pubspec = await File(tempDir + '/' + packagePath + '/pubspec.yaml').readAsLines();
    pubspecs.add(pubspec);
  }
  for (var pubspec in pubspecs){
      for (var line in pubspec){
          if (line.contains('version')){
              print(line);
          }
      }
  }
}
