/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a property extraction i of the form super#m
 * proceeds as follows:
 * ...
 * If m is not a setter name, let f be the result of looking up method m in S
 * with respect to the current library L. If method lookup succeeds then i
 * evaluates to the closurization of method m with respect to superclass S
 *
 * @description Check that if method lookup succeeds then result of the
 * property extraction is method that was found. Method defined in
 * superclass of the superclass
 *
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class A {
  String result = "none";

  void m() {
    this.result = "A";
  }
}

class B extends A {
}

class C extends B {
  void m() {
    this.result = "C";
  }

  void test() {
    var i = super#m;
    i(1);
    Expect.equals("A", this.result);
  }
}

main() {
  C c = new C();
  c.test();
}
