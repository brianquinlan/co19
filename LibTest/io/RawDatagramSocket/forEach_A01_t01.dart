/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future forEach(void action(T element))
 * Executes action on each data event of the stream.
 *
 * Completes the returned Future when all events of the stream have been
 * processed.
 *
 * @description Checks that method [forEach] executes action on each data event
 * of the stream, and the returned Future is completed when all events of the
 * stream have been processed.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(variant, expected) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      List list = [];
      void action1(e) => list.add(e);
      void action2(e) => e == RawSocketEvent.CLOSED ? list.add(3) : list.add(0);
      var action = variant == 1 ? action1 : action2;
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent], address, receiver.port);
      producer.close();
      receiver.close();

      receiver.forEach(action).then((_) {
        Expect.listEquals(expected, list);
      }).whenComplete(() {
        asyncEnd();
      });
    });
  });
}

main() {
  check(1, [RawSocketEvent.CLOSED]);
  check(2, [3]);
}
