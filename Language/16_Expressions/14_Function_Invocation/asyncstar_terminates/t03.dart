/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Checks that when async function f terminates, if the current
 * exception x is defined:
 *   x is added to s and can be detected by subscription.
 * @author kaigorodov
 */
import "dart:async";
import "package:expect/expect.dart";
import "package:async_helper/async_helper.dart";

var thrown=99;

f () async* {
   throw thrown;
}

test() async {
  StreamSubscription<int> subscr=f().listen(null);
  subscr.onData((_){Expect.fail("onData not expected");});
  subscr.onError((e){Expect.equals(thrown, e);});
  Completer completer = new Completer();
  subscr.onDone((){completer.complete(null);});
  return completer.future;
}

main() {
  asyncStart();
  test().then((_) => asyncEnd());
}
