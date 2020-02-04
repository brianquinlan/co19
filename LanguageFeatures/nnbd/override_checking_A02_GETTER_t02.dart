/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In a migrated library, override checking must check that an
 * override is consistent with all overridden methods from other migrated
 * libraries in the super-interface chain, since a legacy library is permitted
 * to override otherwise incompatible signatures for a method.
 *
 * @description Check that if opted-in class extends legacy class, opted-in
 * getter of nullable type can override legacy getter which returns [null]
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "dart:async";
import "../../Utils/expect.dart";
import "override_checking_A02_opted_out_lib.dart";

class A extends LEGACY_GETTER {
  int? get getInt => null;
  Object? get getObject => null;
  dynamic get getDynamic => null;
  Function? get getFunction => null;
  Null get getNull => null;
  FutureOr get getFutureOr => null;
  FutureOr<int>? get getFutureOrInt => null;
  FutureOr<Function>? get getFutureOrFunction => null;
}

main() {
  A a = A();
  Expect.isNull(a.getInt);
  Expect.isNull(a.getObject);
  Expect.isNull(a.getDynamic);
  Expect.isNull(a.getFunction);
  Expect.isNull(a.getNull);
  Expect.isNull(a.getFutureOr);
  Expect.isNull(a.getFutureOrInt);
  Expect.isNull(a.getFutureOrFunction);
}
