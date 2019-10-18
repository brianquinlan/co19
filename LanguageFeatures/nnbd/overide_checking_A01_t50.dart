/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In an unmigrated library, override checking is done using legacy
 * types. This means that an unmigrated library can bring together otherwise
 * incompatible methods. When choosing the most specific signature during
 * interface computation, all nullability and requiredness annotations are
 * ignored, and the [Never] type is treated as [Null].
 * @description Check that when choosing the most specific method signature
 * during interface computation, [Never] method return value is treated as
 * [Null] in legacy library.
 */
// SharedOptions=--enable-experiment=non-nullable
// @dart=2.4

import "../../Utils/expect.dart";
import "override_checking_opted_in_lib.dart";

class A1 with A {
}

class A2 with A {
  Null test_return_never() => null;
}

main() {
  A a = A();
  Expect.throws(() { a.test_return_never(); });

  A1 a1 = A1();
  Expect.throws(() { a1.test_return_never(); });

  A2 a2 = A2();
  Expect.isNull(a2.test_return_never());
}
