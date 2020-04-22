/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
// @dart=2.6
// SharedOptions=--enable-experiment=non-nullable
library opted_out_lib;
import 'opted_in_lib.dart';

class T {}
class LA<X> {}
class LB<X> implements LA<X>{}
class LC<X> implements A<X> {}
class LC2<X> implements LC<X>{}
class LE<X> implements B<X> {}

class LD implements LA<dynamic>{}
class LV implements LA<void>{}

