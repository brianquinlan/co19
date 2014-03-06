/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Upper-boundary encapsulation:
 * Nodes in a shadow tree must be accessible through selector APIs of the
 * shadow root.
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  // Return a document containing the structure below:
  //
  // <body> - - - - - {shadow-root}
  //   |                    |
  //   |                    +-- <p class="test-class" id="test-id">
  //   |
  //   +-- <p class="test-class" id="test-id">
  createTestDocument() {
    var doc = document.implementation.createHtmlDocument('Test');
    var pHost = doc.createElement('p');
    pHost.className = 'test-class';
    pHost.id = 'test-id';
    doc.body.append(pHost);
    var shadowRoot = doc.body.createShadowRoot();
    var pShadow = doc.createElement('p');
    pShadow.className = 'test-class';
    pShadow.id = 'test-id';
    shadowRoot.append(pShadow);
    return new DynObject.fromMap({
      'doc': doc,
      'shadowRoot': shadowRoot,
      'pHost': pHost,
      'pShadow': pShadow
    });;
  }

  test(() {
    var documentObject = createTestDocument();
    var shadowRoot = documentObject.shadowRoot;
    var pShadow = documentObject.pShadow;
    assert_equals(shadowRoot.querySelector('p'), pShadow);
    assert_equals(shadowRoot.querySelector('.test-class'), pShadow);
    assert_equals(shadowRoot.querySelector('#test-id'), pShadow);
  },
  'Elements in a shadow tree should be accessible from ' +
  'shadow root\'s querySelector() method.'
  );

  assert_singleton_node_list(nodeList, expectedNode) {
    assert_equals(nodeList.length, 1);
    assert_equals(nodeList[0], expectedNode);
  }

  test(() {
    var documentObject = createTestDocument();
    var shadowRoot = documentObject.shadowRoot;
    var pShadow = documentObject.pShadow;
    assert_singleton_node_list(shadowRoot.querySelectorAll('p'), pShadow);
    assert_singleton_node_list(shadowRoot.querySelectorAll('.test-class'),
      pShadow);
    assert_singleton_node_list(shadowRoot.querySelectorAll('#test-id'),
      pShadow);
  },
  'Elements in a shadow tree should be accessible from ' +
  'shadow root\'s querySelectorAll() method.'
  );
}
