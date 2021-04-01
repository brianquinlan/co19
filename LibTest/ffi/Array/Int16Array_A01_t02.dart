/*
 * Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * const Array<T extends NativeType>(
 * int dimension1,
 *  [int dimension2,
 *  int dimension3,
 *  int dimension4,
 *  int dimension5]
 *  )
 *  Const constructor to specify Array dimensions in Structs.
 *
 *  class MyStruct extends Struct {
 *  @Array(8)
 *  external Array<Uint8> inlineArray;
 *
 *  @Array(2, 2, 2)
 *  external Array<Array<Array<Uint8>>> threeDimensionalInlineArray;
 *  }
 *  Do not invoke in normal code.
 *
 * @description Checks that this class represents a fixed-size array of Int16
 * @author sgrekhov@unipro.ru
 */
import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

class MyStruct extends Struct {
  @Array.multi([1, 2])
  external Array<Array<Int16>> a0;
}

void main() {
  final pointer = calloc<MyStruct>();
  try {
    final array = pointer.ref.a0;
    for (int i = 0; i < 1; i++) {
      for (int j = 0; j < 2; j++) {
        array[i][j] = i + j + 1;
        Expect.equals(i + j + 1, array[i][j]);
        array[i][j] = 32767;
        Expect.equals(32767, array[i][j]);
        array[i][j] = 32768;
        Expect.equals(-32768, array[i][j]);
        array[i][j] = -32768;
        Expect.equals(-32768, array[i][j]);
        array[i][j] = -32769;
        Expect.equals(32767, array[i][j]);
      }
    }
  } finally {
    calloc.free(pointer);
  }
}
