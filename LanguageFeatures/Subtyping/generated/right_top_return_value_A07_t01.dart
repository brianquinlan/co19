/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Right Top: T1 is a top type (i.e. Object, dynamic, or void)
 * @description Check that if type T1 is a dynamic and T0 is an Object then
 * instance of T0 can be used as T1 variable.
 * @author sgrekhov@unipro.ru
 */

import "../utils/common.dart";

Object t0Instance = new Object();
dynamic t1Instance = 2018;




dynamic returnValueFunc() => forgetType(t0Instance);

class ReturnValueTest {
  static dynamic staticTestMethod() => forgetType(t0Instance);

  dynamic testMethod() => forgetType(t0Instance);

  dynamic get testGetter => forgetType(t0Instance);
}

class ReturnValueGen<X> {
  X testMethod() => forgetType(t0Instance);
  X get testGetter => forgetType(t0Instance);
}


main() {
  dynamic returnValueLocalFunc() => forgetType(t0Instance);

  returnValueFunc();
  returnValueLocalFunc();

  ReturnValueTest.staticTestMethod();

  new ReturnValueTest().testMethod();
  new ReturnValueTest().testGetter;

  new ReturnValueGen<Object>().testMethod();
  new ReturnValueGen<Object>().testGetter;
}
