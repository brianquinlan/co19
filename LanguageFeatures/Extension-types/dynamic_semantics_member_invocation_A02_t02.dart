// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider an invocation of the extension type member m on the
/// receiver expression e according to the extension type declaration V with
/// actual type arguments T1, ..., Ts. If the invocation includes an actual
/// argument part (possibly including some actual type arguments) then call it
/// args. If the invocation omits args, but includes a list of actual type
/// arguments then call them typeArgs. Assume that V declares the type variables
/// X1, ..., Xs
/// ...
/// Let Dm be the unique declaration named m that V has.
///
/// Evaluation of this invocation proceeds by evaluating e to an object o.
/// ...
/// Otherwise, if args is omitted and Dm is a method, the invocation evaluates
/// to a closurization of Dm where this and the name of the representation are
/// bound as with the getter invocation, and the type variables of V are bound
/// to the actual values of T1, .. Ts. The operator == of the closurization
/// returns true if and only if the operand is the same object.
///
/// @description Check that `this` is bound to `o`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

extension type ET<T>(T id) {
  Object test1() => this;
  void test2() {
    Expect.identical(this, id);
  }
}

extension type ET2<T>(T id) implements ET<T> {}

main() {
  ET et = ET(42);
  Expect.identical(et, et.test1());
  et.test2();

  ET2 et2 = ET2(42);
  Expect.identical(et2, et2.test1());
  et2.test2();
}
