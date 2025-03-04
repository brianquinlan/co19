// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Link renameSync(String newPath)
/// Synchronously renames this link. Returns a Link instance for the renamed
/// link.
///
/// If newPath identifies an existing link, that link is replaced. If newPath
/// identifies an existing file or directory the operation fails and an
/// exception is thrown.
/// @description Checks that if newPath identifies an existing directory the
/// operation fails and an exception is thrown.
///
/// @note The test should run with the Administrator priveleges on Windows.
/// Dart API Spec reads:
/// In order to create a symbolic link on Windows, Dart must be run in
/// Administrator mode or the system must have Developer Mode enabled, otherwise
/// a FileSystemException will be raised with ERROR_PRIVILEGE_NOT_HELD set as
/// the errno when this call is made.
///
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  Link link = getTempLinkSync(parent: sandbox);
  Directory dir = getTempDirectorySync(parent: sandbox);

  Expect.throws(() {
    link.renameSync(dir.path);
  });
  Expect.isTrue(link.existsSync());
  Expect.isTrue(dir.existsSync());
}
