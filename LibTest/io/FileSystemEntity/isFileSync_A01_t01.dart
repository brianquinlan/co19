/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isFileSync(String path)
 * Synchronously checks if typeSync(path) returns FileSystemEntityType.file.
 *
 * @description Checks that this property Synchronously checks if typeSync(path)
 * returns FileSystemEntityType.file. Test File
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  File file = getTempFileSync();
  try {
    Expect.isTrue(FileSystemEntity.isFileSync(file.path));
    Expect.equals(
        FileSystemEntity.typeSync(file.path), FileSystemEntityType.file);
  } finally {
    file.delete();
  }
}
