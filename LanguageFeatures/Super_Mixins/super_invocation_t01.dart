/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In a mixin declaration like mixin A<X extends S, Y extends T>
 * on B, C implements D, E { body } the on clause declares the interfaces B and
 * C as super-class constraints of the mixin. Having a super-class constraint
 * allows the mixin declaration instance members to perform super-invocations
 * (like super.foo()) if they are allowed by a class implementing both B and C.
 *
 * @description Checks that a mixin declaration can perform super-invocations.
 * Test getters
 * @author ngl@unipro.ru
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

class B {
  String get b => "B.b";
}
class C {
  String get c => "C.c";
}

mixin M on B, C {
  String get b => "M.b ";
  String get c => "M.c";

  testM() {
    Expect.equals("B.b", super.b);
    Expect.equals("C.c", super.c);
  }
}

class MA with M {
  String get b => "MA.b";
  String get c => "MA.c";

  testMA() {
    Expect.equals("M.b", super.b);
    Expect.equals("M.c", super.c);
  }
}

main() {
  MA ma = new MA();
  Expect.equals("MA.b", ma.b);
  Expect.equals("MA.c", ma.c);

  ma.testM();
  ma.testMA();
}
