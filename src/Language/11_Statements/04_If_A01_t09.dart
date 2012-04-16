/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The if statement allows for conditional execution of statements.
 * ifStatement:
 * if '(' expression ')' statement ( else statement)?
 * ;
 * @description Checks that nested if-else statements are allowed and work correctly.
 * @author hlodvig
 * @reviewer iefremov
 */

main() {
  var x = 0;

  if(true)
    if (false) x = 1;
    else ;
  else
    if (true) x = 1;
    else x = 1;

  Expect.equals(0, x);

  if(true)
    if (true) ;
    else x = 1;
  else 
    if (false) x = 1;
    else x = 1;
  
  Expect.equals(0, x);

  if(false)
    if (true) x = 1;
    else x = 1;
  else 
    if (true) ;
    else x = 1;

  Expect.equals(0, x);

  if(false)
    if (true) x = 1;
    else x = 1;
  else 
    if (false) x = 1;
    else ;

  Expect.equals(0, x);
}

