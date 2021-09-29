// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Test equality of function and methods tearoffs.
///
/// @description Checks that the equality properties of any function object
/// obtained by generic function instantiation is determined by the equality of
/// the source function objects
/// @author sgrekhov@unipro.ru
/// @issue 47317

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

main() {
  X localFunction<X>(X x) => x;

  var f1_1 = localFunction;
  var f1_2 = localFunction;
  int Function(int) f2_1 = f1_1;
  int Function(int) f2_2 = f1_2;

  Expect.equals(f1_1 == f1_2, f2_1 == f2_2);
}
