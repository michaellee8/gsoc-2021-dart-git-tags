# gsoc-2021-dart-git-tags

## Requirement
https://github.com/dart-lang/sdk/wiki/Dart-GSoC-2021-Project-Ideas#idea-extends-git-source-in-pubspecyaml-to-understand-tags

## Interesting links
https://github.blog/2020-01-17-bring-your-monorepo-down-to-size-with-sparse-checkout/

## Prototype
<pre><font color="#4E9A06"><b>michaellee8@</b></font><font color="#06989A"><b>michaellee8-piggy:</b></font><font color="#3465A4"><b>~/oss-projects/dart-gsoc $ </b></font>git clone --depth 1 --filter=tree:0 --sparse --no-checkout https://github.com/flutter/plugins
Cloning into &apos;plugins&apos;...
remote: Enumerating objects: 1, done.
remote: Counting objects: 100% (1/1), done.
remote: Total 1 (delta 0), reused 0 (delta 0), pack-reused 0
Receiving objects: 100% (1/1), done.
<font color="#4E9A06"><b>michaellee8@</b></font><font color="#06989A"><b>michaellee8-piggy:</b></font><font color="#3465A4"><b>~/oss-projects/dart-gsoc $ </b></font>cd plugins
<font color="#4E9A06"><b>michaellee8@</b></font><font color="#06989A"><b>michaellee8-piggy:</b></font><font color="#3465A4"><b>~/oss-projects/dart-gsoc/plugins $ </b></font>git fetch --tag --quiet
remote: Enumerating objects: 1349, done.
remote: Counting objects: 100% (1349/1349), done.
remote: Compressing objects: 100% (805/805), done.
remote: Total 1349 (delta 59), reused 1142 (delta 23), pack-reused 0
Receiving objects: 100% (1349/1349), 137.91 KiB | 295.00 KiB/s, done.
Resolving deltas: 100% (59/59), done.
<font color="#4E9A06"><b>michaellee8@</b></font><font color="#06989A"><b>michaellee8-piggy:</b></font><font color="#3465A4"><b>~/oss-projects/dart-gsoc/plugins $ </b></font>git sparse-checkout init
<font color="#4E9A06"><b>michaellee8@</b></font><font color="#06989A"><b>michaellee8-piggy:</b></font><font color="#3465A4"><b>~/oss-projects/dart-gsoc/plugins $ </b></font>git sparse-checkout set packages/camera/camera/pubspec.yaml
<font color="#4E9A06"><b>michaellee8@</b></font><font color="#06989A"><b>michaellee8-piggy:</b></font><font color="#3465A4"><b>~/oss-projects/dart-gsoc/plugins $ </b></font>git checkout camera-v0.8.0-nullsafety --quiet
remote: Enumerating objects: 1395, done.
remote: Counting objects: 100% (1395/1395), done.
remote: Compressing objects: 100% (844/844), done.
remote: Total 1395 (delta 69), reused 1129 (delta 27), pack-reused 0
Receiving objects: 100% (1395/1395), 142.05 KiB | 293.00 KiB/s, done.
Resolving deltas: 100% (69/69), done.
remote: Enumerating objects: 1, done.
remote: Counting objects: 100% (1/1), done.
remote: Total 1 (delta 0), reused 0 (delta 0), pack-reused 0
Receiving objects: 100% (1/1), 472 bytes | 472.00 KiB/s, done.
remote: Enumerating objects: 1, done.
remote: Counting objects: 100% (1/1), done.
remote: Total 1 (delta 0), reused 1 (delta 0), pack-reused 0
Receiving objects: 100% (1/1), 282 bytes | 282.00 KiB/s, done.
<font color="#4E9A06"><b>michaellee8@</b></font><font color="#06989A"><b>michaellee8-piggy:</b></font><font color="#3465A4"><b>~/oss-projects/dart-gsoc/plugins $ </b></font>cat packages/camera/camera/pubspec.yaml | grep version
<font color="#ED7B7B"><b>version</b></font>: 0.8.0-nullsafety
<font color="#4E9A06"><b>michaellee8@</b></font><font color="#06989A"><b>michaellee8-piggy:</b></font><font color="#3465A4"><b>~/oss-projects/dart-gsoc/plugins $ </b></font>git checkout camera-v0.7.0  --quiet
remote: Enumerating objects: 1377, done.
remote: Counting objects: 100% (1377/1377), done.
remote: Compressing objects: 100% (833/833), done.
remote: Total 1377 (delta 66), reused 1169 (delta 23), pack-reused 0
Receiving objects: 100% (1377/1377), 138.75 KiB | 302.00 KiB/s, done.
Resolving deltas: 100% (66/66), done.
remote: Enumerating objects: 1, done.
remote: Counting objects: 100% (1/1), done.
remote: Total 1 (delta 0), reused 0 (delta 0), pack-reused 0
Receiving objects: 100% (1/1), 469 bytes | 469.00 KiB/s, done.
<font color="#4E9A06"><b>michaellee8@</b></font><font color="#06989A"><b>michaellee8-piggy:</b></font><font color="#3465A4"><b>~/oss-projects/dart-gsoc/plugins $ </b></font>cat packages/camera/camera/pubspec.yaml | grep version
<font color="#ED7B7B"><b>version</b></font>: 0.7.0
</pre>
