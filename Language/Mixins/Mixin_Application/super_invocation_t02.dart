// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let S be a class, M be a mixin with required superinterfaces
/// T1, . . . , Tn, combined superinterface MS, implemented interfaces
/// I1, . . . , Ik and members as mixin member declarations, and let N be a name
/// ...
/// It is a compile-time error if any of members contains a super-invocation of
/// a member m (for example super.foo, super + 2, or super[1] = 2), and S does
/// not have a concrete implementation of m which is a valid override of the
/// member m in the interface MS
///
/// @description Checks that it is not an error if `S` does not have a concrete
/// implementation of a member `m` but there are no super-invocation of `m`
/// @author sgrekhov22@gmail.com

abstract class S {
  bool get m;
  S operator +(int other);
  S operator [](int index);
}

mixin M1 on S {
  void foo() {}
}

mixin M2 on S {
  void foo() {}
}

mixin M3 on S {
  void foo() {}
}

abstract class C1 = S with M1;

abstract class C2 = S with M2;

abstract class C3 = S with M3;

main() {
  print(C1);
  print(C2);
  print(C3);
}
