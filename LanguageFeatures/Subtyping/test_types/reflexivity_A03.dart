/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Reflexivity: T0 and T1 are the same type.
 * @description Check that if type T1 and T0 are both Object then instance of
 * T0 can be as T1 variable.
 * @author sgrekhov@unipro.ru
 */

import "../utils/common.dart";

Object t0Instance = new Object();
Object t1Instance = new Object();

//# @T0 = Object
//# @T1 = Object
