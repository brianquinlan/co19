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
      .gridMaxMaxContent {
          grid-template-columns: 50px;
          grid-template-rows: minmax(10px, max-content) minmax(10px, 1fr);
      }

      .gridMinMinContent {
          grid-template-columns: 50px;
          grid-template-rows: minmax(10px, 1fr) minmax(min-content, 50px);
      }

      .gridWithIntrinsicSizeBiggerThanFlex {
          grid-template-columns: 50px;
          grid-template-rows: minmax(min-content, 0.5fr) minmax(18px, 2fr);
      }

      .gridShrinkBelowItemsIntrinsicSize {
          grid-template-columns: 50px;
          grid-template-rows: minmax(0px, 1fr) minmax(0px, 2fr);
      }

      .gridWithNonFlexingItems {
          grid-template-columns: 50px;
          grid-template-rows: 40px minmax(min-content, 1fr) auto minmax(20px, 2fr);
      }

      .thirdRowFirstColumn {
          grid-column: 1;
          grid-row: 3;
      }
      .fourthRowFirstColumn {
          grid-column: 1;
          grid-row: 4;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <p>Test that resolving auto tracks on grid items works properly.</p>

      <div class="constrainedContainer">
          <div class="grid gridMaxMaxContent">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="10">XXXXX</div>
              <div class="sizedToGridArea secondRowFirstColumn" data-expected-width="50" data-expected-height="10"></div>
          </div>
      </div>

      <!-- Allow the extra logical space distribution to occur. -->
      <div style="width: 10px; height: 40px">
          <div class="grid gridMaxMaxContent" style="height: 100%">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="10">XXXXX</div>
              <div class="sizedToGridArea secondRowFirstColumn" data-expected-width="50" data-expected-height="30"></div>
          </div>
      </div>

      <div style="width: 10px; height: 40px">
          <div class="grid gridMaxMaxContent">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="10">XXXXX</div>
              <div class="sizedToGridArea secondRowFirstColumn" data-expected-width="50" data-expected-height="10"></div>
          </div>
      </div>

      <div style="width: 10px; height: 110px;">
          <div class="grid gridMaxMaxContent" style="height: 100%">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="10">XXXXX</div>
              <div class="sizedToGridArea secondRowFirstColumn" data-expected-width="50" data-expected-height="100"></div>
          </div>
      </div>

      <div style="width: 10px; height: 110px;">
          <div class="grid gridMaxMaxContent">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="10">XXXXX</div>
              <div class="sizedToGridArea secondRowFirstColumn" data-expected-width="50" data-expected-height="10"></div>
          </div>
      </div>

      <div class="constrainedContainer">
          <div class="grid gridMinMinContent" style="height: 100%">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="10">XXXXX XXXX</div>
              <div class="sizedToGridArea secondRowFirstColumn" data-expected-width="50" data-expected-height="20">XXXXX XXXX</div>
          </div>
      </div>

      <div class="constrainedContainer">
          <div class="grid gridMinMinContent">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="30">XXXXX XXXX</div>
              <div class="sizedToGridArea secondRowFirstColumn" data-expected-width="50" data-expected-height="50">XXXXX XXXX</div>
          </div>
      </div>

      <!-- Allow the extra logical space distribution to occur. -->
      <div style="width: 10px; height: 40px">
          <div class="grid gridMinMinContent" style="height: 100%">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="10">XXXXX XXXX</div>
              <div class="sizedToGridArea secondRowFirstColumn" data-expected-width="50" data-expected-height="30">XXXXX XXXX</div>
          </div>
      </div>

      <div style="width: 10px; height: 40px">
          <div class="grid gridMinMinContent">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="30">XXXXX XXXX</div>
              <div class="sizedToGridArea secondRowFirstColumn" data-expected-width="50" data-expected-height="50">XXXXX XXXX</div>
          </div>
      </div>

      <div style="width: 10px; height: 110px;">
          <div class="grid gridMinMinContent" style="height: 100%">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="60">XXXXX XXXX</div>
              <div class="sizedToGridArea secondRowFirstColumn" data-expected-width="50" data-expected-height="50">XXXXX XXXX</div>
          </div>
      </div>

      <div style="width: 10px; height: 110px;">
          <div class="grid gridMinMinContent">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="30">XXXXX XXXX</div>
              <div class="sizedToGridArea secondRowFirstColumn" data-expected-width="50" data-expected-height="50">XXXXX XXXX</div>
          </div>
      </div>

      <div style="width: 10px; height: 60px;">
          <div class="grid gridWithIntrinsicSizeBiggerThanFlex" style="height: 100%">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="40">XXXXX XXXXX XXXXX XXXXX</div>
              <div class="sizedToGridArea secondRowFirstColumn" data-expected-width="50" data-expected-height="20"></div>
          </div>
      </div>

      <div style="width: 10px; height: 60px;">
          <div class="grid gridWithIntrinsicSizeBiggerThanFlex">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="40">XXXXX XXXXX XXXXX XXXXX</div>
              <div class="sizedToGridArea secondRowFirstColumn" data-expected-width="50" data-expected-height="160"></div>
          </div>
      </div>

      <div style="width: 10px; height: 60px;">
          <div class="grid gridShrinkBelowItemsIntrinsicSize" style="height: 100%">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="20">XXXXX XXXXX XXXXX XXXXX XXXXX</div>
              <div class="sizedToGridArea secondRowFirstColumn" data-expected-width="50" data-expected-height="40">XXXXX XXXXX XXXXX XXXXX XXXXX XXXXX</div>
          </div>
      </div>

      <div style="width: 10px; height: 60px;">
          <div class="grid gridShrinkBelowItemsIntrinsicSize">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="50">XXXXX XXXXX XXXXX XXXXX XXXXX</div>
              <div class="sizedToGridArea secondRowFirstColumn" data-expected-width="50" data-expected-height="100">XXXXX XXXXX XXXXX XXXXX XXXXX XXXXX</div>
          </div>
      </div>

      <!-- No space available for the <flex> -->
      <div style="width: 10px; height: 100px;">
          <div class="grid gridWithNonFlexingItems" style="height: 100%">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="40"></div>
              <div class="sizedToGridArea secondRowFirstColumn" data-expected-width="50" data-expected-height="40">XXXXX XXXXX XXXXX XXXXX</div>
              <div class="sizedToGridArea thirdRowFirstColumn" data-expected-width="50" data-expected-height="60">XXXXX XXXXX XXXXX XXXXX XXXXX XXXXX</div>
              <div class="sizedToGridArea fourthRowFirstColumn" data-expected-width="50" data-expected-height="20"></div>
          </div>
      </div>

      <div style="width: 10px; height: 100px;">
          <div class="grid gridWithNonFlexingItems">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="40"></div>
              <div class="sizedToGridArea secondRowFirstColumn" data-expected-width="50" data-expected-height="40">XXXXX XXXXX XXXXX XXXXX</div>
              <div class="sizedToGridArea thirdRowFirstColumn" data-expected-width="50" data-expected-height="60">XXXXX XXXXX XXXXX XXXXX XXXXX XXXXX</div>
              <div class="sizedToGridArea fourthRowFirstColumn" data-expected-width="50" data-expected-height="80"></div>
          </div>
      </div>

      <!-- The second track should be sized after the min-content as the <flex> value should be too small. -->
      <div style="width: 10px; height: 180px;">
          <div class="grid gridWithNonFlexingItems" style="height: 100%">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="40"></div>
              <div class="sizedToGridArea secondRowFirstColumn" data-expected-width="50" data-expected-height="40">XXXXX XXXXX XXXXX XXXXX</div>
              <div class="sizedToGridArea thirdRowFirstColumn" data-expected-width="50" data-expected-height="60">XXXXX XXXXX XXXXX XXXXX XXXXX XXXXX</div>
              <div class="sizedToGridArea fourthRowFirstColumn" data-expected-width="50" data-expected-height="40"></div>
          </div>
      </div>

      <div style="width: 10px; height: 180px;">
          <div class="grid gridWithNonFlexingItems">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="40"></div>
              <div class="sizedToGridArea secondRowFirstColumn" data-expected-width="50" data-expected-height="40">XXXXX XXXXX XXXXX XXXXX</div>
              <div class="sizedToGridArea thirdRowFirstColumn" data-expected-width="50" data-expected-height="60">XXXXX XXXXX XXXXX XXXXX XXXXX XXXXX</div>
              <div class="sizedToGridArea fourthRowFirstColumn" data-expected-width="50" data-expected-height="80"></div>
          </div>
      </div>

      <div style="width: 10px; height: 400px;">
          <div class="grid gridWithNonFlexingItems" style="height: 100%">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="40"></div>
              <div class="sizedToGridArea secondRowFirstColumn" data-expected-width="50" data-expected-height="100">XXXXX XXXXX XXXXX XXXXX</div>
              <div class="sizedToGridArea thirdRowFirstColumn" data-expected-width="50" data-expected-height="60">XXXXX XXXXX XXXXX XXXXX XXXXX XXXXX</div>
              <div class="sizedToGridArea fourthRowFirstColumn" data-expected-width="50" data-expected-height="200"></div>
          </div>
      </div>

      <div style="width: 10px; height: 400px;">
          <div class="grid gridWithNonFlexingItems">
              <div class="sizedToGridArea firstRowFirstColumn" data-expected-width="50" data-expected-height="40"></div>
              <div class="sizedToGridArea secondRowFirstColumn" data-expected-width="50" data-expected-height="40">XXXXX XXXXX XXXXX XXXXX</div>
              <div class="sizedToGridArea thirdRowFirstColumn" data-expected-width="50" data-expected-height="60">XXXXX XXXXX XXXXX XXXXX XXXXX XXXXX</div>
              <div class="sizedToGridArea fourthRowFirstColumn" data-expected-width="50" data-expected-height="80"></div>
          </div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    checkLayout('.grid');
    asyncEnd();
  });
}
