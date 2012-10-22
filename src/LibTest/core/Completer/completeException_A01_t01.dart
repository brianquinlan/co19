/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void completeException(Object exception, [Object stackTrace])
 * Indicate in future that an exception occurred while trying to produce its value.
 * The argument exception should not be null. A stackTrace object can be provided 
 * as well to give the user information about where the error occurred. 
 * If omitted, it will be null.
 * @description Checks that after [completeException] is called, the corresponding
 * future is completed with that exception wrapped in a FutureUnhandledException.
 * @author msyabro
 * @reviewer kaigorodov
 * @needsreview not documented thoroughly
 */

main() {
  var exc=new Exception();
  var completer = new Completer();
  var future = completer.future;

  completer.completeException(exc);
  Expect.isFalse(future.hasValue);
  Expect.isTrue(future.isComplete);
  Expect.equals(exc, future.exception);
  try {
     future.value;
     Expect.fail('FutureUnhandledException expected');
  } on FutureUnhandledException catch(e) {
     Expect.equals(exc, e.source);
  }
}
