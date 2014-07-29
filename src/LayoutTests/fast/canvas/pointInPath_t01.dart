/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Series of tests for Canvas.isPointInPath
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <canvas id="canvas"></canvas>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var ctx = getContext2d("canvas");
  ctx.save();
  debug("Rectangle at (0,0) 20x20");
  ctx.rect(0, 0, 20, 20);
  shouldBe(ctx.isPointInPath(5, 5), true);
  shouldBe(ctx.isPointInPath(10, 10), true);
  shouldBe(ctx.isPointInPath(19, 19), true);
  shouldBe(ctx.isPointInPath(30, 30), false);
  shouldBe(ctx.isPointInPath(-1, 10), false);
  shouldBe(ctx.isPointInPath(10, -1), false);
  debug("Translate context (10,10)");
  ctx.translate(10,10);
  shouldBe(ctx.isPointInPath(5, 5), true);
  shouldBe(ctx.isPointInPath(10, 10), true);
  shouldBe(ctx.isPointInPath(19, 19), true);
  shouldBe(ctx.isPointInPath(30, 30), false);
  shouldBe(ctx.isPointInPath(-1, 10), false);
  shouldBe(ctx.isPointInPath(10, -1), false);
  debug("Collapse ctm to non-invertible matrix");
  ctx.scale(0,0);
  shouldBe(ctx.isPointInPath(5, 5), false);
  shouldBe(ctx.isPointInPath(10, 10), false);
  shouldBe(ctx.isPointInPath(20, 20), false);
  shouldBe(ctx.isPointInPath(30, 30), false);
  shouldBe(ctx.isPointInPath(-1, 10), false);
  shouldBe(ctx.isPointInPath(10, -1), false);
  debug("Resetting context to a clean state");
  ctx.restore();

  ctx.save();
  ctx.beginPath();
  debug("Translate context (10,10)");
  ctx.translate(10,10);
  debug("Rectangle at (0,0) 20x20");
  ctx.rect(0, 0, 20, 20);
  shouldBe(ctx.isPointInPath(5, 5), false);
  shouldBe(ctx.isPointInPath(10, 10), true);
  shouldBe(ctx.isPointInPath(20, 20), true);
  shouldBe(ctx.isPointInPath(29, 29), true);
  shouldBe(ctx.isPointInPath(-1, 10), false);
  shouldBe(ctx.isPointInPath(10, -1), false);
  ctx.restore();

  ctx.save();
  ctx.beginPath();
  debug("Translate context (10,20)");
  ctx.translate(10,20);
  debug("Transform context (1, 0, 0, -1, 0, 0)");
  ctx.transform(1, 0, 0, -1, 0, 0);
  debug("Rectangle at (0,0) 20x20");
  ctx.rect(0, 0, 20, 20);
  // After the flip, rect is actually 10, 0, 20, 20
  shouldBe(ctx.isPointInPath(5, 5), false);
  shouldBe(ctx.isPointInPath(10, 0), true);
  shouldBe(ctx.isPointInPath(29, 0), true);
  shouldBe(ctx.isPointInPath(10, 19), true);
  shouldBe(ctx.isPointInPath(21, 10), true);
  shouldBe(ctx.isPointInPath(29, 19), true);
  ctx.strokeStyle = 'green';
  ctx.stroke();
  ctx.restore();
}
