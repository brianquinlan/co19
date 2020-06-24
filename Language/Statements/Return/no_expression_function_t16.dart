/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let f be the function immediately enclosing a return statement of
 * the form return; It is a static warning f is neither a generator nor a
 * generative constructor and either:
 *  • f is synchronous and the return type of f may not be assigned to void or,
 *  • f is asynchronous and the return type of f may not be assigned to
 *    Future<Null>.
 *
 * @description Checks that there's a static warning when a statement of the
 * form "return;" is used in an asynchronous function whose return type is
 * Future<Object>
 *
 * @static-warning
 * @author a.semenov@unipro.ru
 */
import 'dart:async';

Future<Object?> bar() async {
  return; /// static type warning
}

class C {
  static Future<Object?> sm() async {
    return; /// static type warning
  }
  Future<Object?> foo() async {
    return; /// static type warning
  }
}

main() {
  bar();
  C.sm();
  new C().foo();
}
