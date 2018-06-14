/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";
import "../../resources/check-layout.dart";
import "pwd.dart";

main() {
  var f = new DocumentFragment.html('''
      <link href="$root/resources/grid.css" rel="stylesheet">
      <style>
      .grid {
          grid-template-columns: 100px 300px;
          grid-template-rows: 50px 150px;
          height: 200px;
          width: 400px;
      }

      .percentWidth {
          width: 100%;
          height: 15px;
      }

      .percentHeight {
          width: 15px;
          height: 100%;
      }

      .percentHeightAndWidth {
          width: 100%;
          height: 100%;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <p>Test that resolving percent lengths on grid items works properly on a fixed grid with different writing modes.</p>

      <div class="grid">
          <div class="firstRowFirstColumn percentWidth" data-expected-width="100" data-expected-height="15"></div>
          <div class="firstRowSecondColumn percentHeight" data-expected-width="15" data-expected-height="50"></div>
          <div class="secondRowFirstColumn percentHeightAndWidth" data-expected-width="100" data-expected-height="150"></div>
          <div class="secondRowSecondColumn percentHeightAndWidth" data-expected-width="300" data-expected-height="150"></div>
      </div>

      <div class="grid verticalRL">
          <div class="firstRowFirstColumn percentWidth" data-expected-width="50" data-expected-height="15"></div>
          <div class="firstRowSecondColumn percentHeight" data-expected-width="15" data-expected-height="300"></div>
          <div class="secondRowFirstColumn percentHeightAndWidth" data-expected-width="150" data-expected-height="100"></div>
          <div class="secondRowSecondColumn percentHeightAndWidth" data-expected-width="150" data-expected-height="300"></div>
      </div>

      <div class="grid">
          <div class="firstRowFirstColumn percentWidth verticalRL" data-expected-width="100" data-expected-height="15"></div>
          <div class="firstRowSecondColumn percentHeight verticalRL" data-expected-width="15" data-expected-height="50"></div>
          <div class="secondRowFirstColumn percentHeightAndWidth verticalRL" data-expected-width="100" data-expected-height="150"></div>
          <div class="secondRowSecondColumn percentHeightAndWidth verticalRL" data-expected-width="300" data-expected-height="150"></div>
      </div>

      <div class="grid">
          <div class="firstRowFirstColumn percentWidth verticalRL" data-expected-width="100" data-expected-height="15"></div>
          <div class="firstRowSecondColumn percentHeight" data-expected-width="15" data-expected-height="50"></div>
          <div class="secondRowFirstColumn percentHeightAndWidth verticalRL" data-expected-width="100" data-expected-height="150"></div>
          <div class="secondRowSecondColumn percentHeightAndWidth" data-expected-width="300" data-expected-height="150"></div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    checkLayout('.grid');
    asyncEnd();
  });
}
