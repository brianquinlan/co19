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
import "../../../Utils/async_utils.dart";
import "../../resources/check-layout.dart";
import "pwd.dart";

main() {
  var f = new DocumentFragment.html('''
      <link href="$root/resources/grid.css" rel="stylesheet">
      <style>
      .gridMinFlexContent {
          grid-template-columns: minmax(1fr, 50px);
          grid-template-rows: 50px;
      }
      .gridMaxFlexContent {
          grid-template-columns: minmax(30px, 2fr);
          grid-template-rows: 50px;
      }
      .gridTwoMaxFlexContent {
          grid-template-columns: minmax(10px, 1fr) minmax(10px, 2fr);
          grid-template-rows: 50px;
      }
      .gridTwoDoubleMaxFlexContent {
          grid-template-columns: minmax(10px, 0.5fr) minmax(10px, 2fr);
          grid-template-rows: 50px;
      }
      .gridIgnoreSecondGridItem {
          grid-template-columns: minmax(300px, 3fr) minmax(150px, 1fr);
          grid-template-rows: 50px;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <p>Test that resolving auto tracks on grid items works properly.</p>

      <div style="width: 0px">
          <div class="grid gridMinFlexContent">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="0" data-expected-height="50"></div>
          </div>
      </div>

      <!-- Allow the extra logical space distribution to occur. -->
      <div style="width: 40px; height: 10px">
          <div class="grid gridMinFlexContent">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="40" data-expected-height="50"></div>
          </div>
      </div>

      <div style="width: 100px; height: 10px;">
          <div class="grid gridMinFlexContent">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="50"></div>
          </div>
      </div>

      <div class="constrainedContainer">
          <div class="grid gridMaxFlexContent">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="30" data-expected-height="50"></div>
          </div>
      </div>

      <!-- Allow the extra logical space distribution to occur. -->
      <div style="width: 40px; height: 10px">
          <div class="grid gridMaxFlexContent">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="40" data-expected-height="50"></div>
          </div>
      </div>

      <div style="width: 100px; height: 10px;">
          <div class="grid gridMaxFlexContent">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="100" data-expected-height="50"></div>
          </div>
      </div>


      <div class="constrainedContainer">
          <div class="grid gridTwoMaxFlexContent">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="10" data-expected-height="50"></div>
              <div class="sizedToGridArea firstRowSecondColumn" data-expected-width="10" data-expected-height="50"></div>
          </div>
      </div>

      <!-- Allow the extra logical space distribution to occur. -->
      <div style="width: 60px; height: 10px">
          <div class="grid gridTwoMaxFlexContent">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="20" data-expected-height="50"></div>
              <div class="sizedToGridArea firstRowSecondColumn" data-expected-width="40" data-expected-height="50"></div>
          </div>
      </div>

      <div style="width: 120px; height: 10px;">
          <div class="grid gridTwoMaxFlexContent">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="40" data-expected-height="50"></div>
              <div class="sizedToGridArea firstRowSecondColumn" data-expected-width="80" data-expected-height="50"></div>
          </div>
      </div>


      <div class="constrainedContainer">
          <div class="grid gridTwoDoubleMaxFlexContent">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="10" data-expected-height="50"></div>
              <div class="sizedToGridArea firstRowSecondColumn" data-expected-width="10" data-expected-height="50"></div>
          </div>
      </div>

      <!-- Allow the extra logical space distribution to occur. -->
      <div style="width: 60px; height: 10px">
          <div class="grid gridTwoDoubleMaxFlexContent">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="12" data-expected-height="50"></div>
              <div class="sizedToGridArea firstRowSecondColumn" data-expected-width="48" data-expected-height="50"></div>
          </div>
      </div>

      <div style="width: 120px; height: 10px;">
          <div class="grid gridTwoDoubleMaxFlexContent">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="24" data-expected-height="50"></div>
              <div class="sizedToGridArea firstRowSecondColumn" data-expected-width="96" data-expected-height="50"></div>
          </div>
      </div>


      <!-- Custom test for a corner case. -->
      <div style="width: 570px; height: 10px;">
          <div class="grid gridIgnoreSecondGridItem">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="420" data-expected-height="50"></div>
              <div class="sizedToGridArea firstRowSecondColumn" data-expected-width="150" data-expected-height="50"></div>
          </div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    checkLayout('.grid');
    asyncEnd();
  });
}
