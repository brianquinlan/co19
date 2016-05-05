/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future.microtask(dynamic computation())
 * Creates a future containing the result of calling computation
 * asynchronously with scheduleMicrotask.
 * If executing computation throws, the returned future is completed with the
 * thrown error.
 * If calling computation returns a Future, completion of the created future
 * will wait until the returned future completes, and will then complete with
 * the same result.
 * If calling computation returns a non-future value, the returned future is
 * completed with that value.
 * @description Checks that if computation() returns a value, it becomes the
 * result of created future.
 * @author ilya
 */
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  var value = [1, 2, 3];

  asyncStart();
  Future future = new Future.microtask(() => value);

  future
    .then((x) {
      Expect.identical(value, x);
      asyncEnd();
    });
}
