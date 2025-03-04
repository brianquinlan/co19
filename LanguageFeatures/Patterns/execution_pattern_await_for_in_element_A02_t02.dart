// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if an asynchronous for-in element
/// appears inside a synchronous function
///
/// @description Checks that in an async for-in element it is a compile-time
/// error if a <keyword> is empty. Test a map literal
/// @author sgrekhov22@gmail.com

import "patterns_lib.dart";

Future<Map<String, int>> test1() async {
  var v1 = 0;
  var v2 = 0;
  return {
    "k0": 0,
    await for ((v1 && v2) in Stream.fromIterable([1, 2, 3])) "k$v1": v2,
//             ^
// [analyzer] unspecified
// [cfe] unspecified
  };
}

Future<Map<String, int>> test2() async {
  var v = 0;
  return {"k0": 0, await for ((v) in Stream.fromIterable([1, 2, 3])) "k$v": v};
//                            ^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<Map<String, int>> test3() async {
  var v = 0;
  return {
    "k0": 0,
    await for ([v] in Stream.fromIterable([[1], [2], [3]])) "k$v": v};
//             ^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<Map<String, int>> test4() async {
  var v = 0;
  return {
    "k0": 0,
    await for ({"k": v} in Stream.fromIterable([{"k": 1}])) "k$v": v};
//             ^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<Map<String, int>> test5() async {
  var v1 = 0;
  var v2 = 0;
  return {
    "k0": 0,
    await for ((v1, n: v2) in Stream.fromIterable([(1, n: 2)])) "k$v1": v2};
//             ^
// [analyzer] unspecified
// [cfe] unspecified
}

Future<Map<String, int>> test6() async {
  var v = 0;
  return {
    "k0": 0,
    await for (Square(area: v) in Stream.fromIterable([Square(1)])) "k$v": v};
//             ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() async {
  test1();
  test2();
  test3();
  test4();
  test5();
  test6();
}
