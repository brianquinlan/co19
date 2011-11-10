/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Constructor arguments using the this. syntax may still be typed. The static 
 * type-checker will verify that the field's type and the type in the constructor are assignable.
 * @description Checks incompatible types of the field and the argument.
 * @author iefremov
 * @static-type-error
 * @reviewer msyabro
 */ 

class C {
  C(String this.i) {}
  int i;
}


main() {}
