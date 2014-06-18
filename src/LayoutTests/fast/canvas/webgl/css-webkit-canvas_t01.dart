/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
import "resources/webgl-test-utils.dart" as wtu;
import "../../../../Utils/async_utils.dart";

main() {
  var gl;

  var style = new Element.html('''
      <style>
          div {
              width:200px;
              height:200px;
              border:2px solid black;
              content: -webkit-canvas(triangle);
          }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
        <script id="vertexShader" type="x-shader/x-vertex">
            attribute vec4 vPosition;

            void main() {
                gl_Position = vPosition;
            }
        </script>

        <script id="fragmentShader" type="x-shader/x-fragment">
            void main() {
                gl_FragColor = vec4(0.8, 0.7, 0, 1.0);
            }
        </script>
        <div></div>
      ''', treeSanitizer: new NullTreeSanitizer());
 
  getShaderSource(shaderNode)
  {
    var shaderSource = shaderNode.text;
    return shaderSource;
  }

  getFragmentShader()
  {
    var shaderNode = document.getElementById("fragmentShader"); // fragmentShader has been defined at the top
    var shaderSource = getShaderSource(shaderNode);

    var shader = gl.createShader(wgl.FRAGMENT_SHADER);
    gl.shaderSource(shader, shaderSource);
    gl.compileShader(shader);

    return shader;
  }


  getVertexShader()
  {
    var shaderNode = document.getElementById("vertexShader");
    var shaderSource = getShaderSource(shaderNode);

    var shader = gl.createShader(wgl.VERTEX_SHADER);
    gl.shaderSource(shader, shaderSource);
    gl.compileShader(shader);

    return shader;
  }

  initialize()
  {
    gl = document.getCssCanvasContext("experimental-webgl", "triangle", 200, 200);

    var vertexShader = getVertexShader();
    var fragmentShader = getFragmentShader();

    var shaderProgram = gl.createProgram();
    gl.attachShader(shaderProgram, vertexShader);
    gl.attachShader(shaderProgram, fragmentShader);
    gl.bindAttribLocation(shaderProgram, 0, "vPosition"); // vPosition has been defined at the top
    gl.linkProgram(shaderProgram);

    gl.useProgram(shaderProgram);

    var buffer = gl.createBuffer();
    gl.bindBuffer(wgl.ARRAY_BUFFER, buffer);
  }

  draw(r, g, b)
  {
    var vertices = [ 0.0, 0.8, 0.0,
        -0.8, -0.8, 0.0,
        0.8, -0.8, 0.0 ]; 
    gl.bufferData(wgl.ARRAY_BUFFER, new Float32List.fromList(vertices), wgl.STATIC_DRAW);

    gl.vertexAttribPointer(0, 3, wgl.FLOAT, false, 0, 0); // Load the vertex data
    gl.enableVertexAttribArray(0);
    gl.clearColor(r, g, b, 1);
    gl.clear(wgl.COLOR_BUFFER_BIT);
    gl.drawArrays(wgl.TRIANGLES, 0, 3); 
  }

  initialize();
  draw(0, 0.5, 0);
}
