/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double log(num x)
 * Converts [x] to a double and returns the natural logarithm of the value.
 * @description Checks set of values.
 * @author msyabro
 */
import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  int vnum = 64;
  var x = new List<double>.filled(64, 0);
  x[0] = 0.00000000000000000001;
  x[1] = 0.25396825396825395000;
  x[2] = 0.50793650793650791000;
  x[3] = 0.76190476190476186000;
  x[4] = 1.01587301587301580000;
  x[5] = 1.26984126984126980000;
  x[6] = 1.52380952380952370000;
  x[7] = 1.77777777777777770000;
  x[8] = 2.03174603174603160000;
  x[9] = 2.28571428571428560000;
  x[10] = 2.53968253968253950000;
  x[11] = 2.79365079365079350000;
  x[12] = 3.04761904761904740000;
  x[13] = 3.30158730158730140000;
  x[14] = 3.55555555555555540000;
  x[15] = 3.80952380952380930000;
  x[16] = 4.06349206349206330000;
  x[17] = 4.31746031746031720000;
  x[18] = 4.57142857142857120000;
  x[19] = 4.82539682539682510000;
  x[20] = 5.07936507936507910000;
  x[21] = 5.33333333333333300000;
  x[22] = 5.58730158730158700000;
  x[23] = 5.84126984126984090000;
  x[24] = 6.09523809523809490000;
  x[25] = 6.34920634920634890000;
  x[26] = 6.60317460317460280000;
  x[27] = 6.85714285714285680000;
  x[28] = 7.11111111111111070000;
  x[29] = 7.36507936507936470000;
  x[30] = 7.61904761904761860000;
  x[31] = 7.87301587301587260000;
  x[32] = 8.12698412698412650000;
  x[33] = 8.38095238095238140000;
  x[34] = 8.63492063492063440000;
  x[35] = 8.88888888888888930000;
  x[36] = 9.14285714285714230000;
  x[37] = 9.39682539682539720000;
  x[38] = 9.65079365079365030000;
  x[39] = 9.90476190476190510000;
  x[40] = 10.15873015873015800000;
  x[41] = 10.41269841269841300000;
  x[42] = 10.66666666666666600000;
  x[43] = 10.92063492063492100000;
  x[44] = 11.17460317460317400000;
  x[45] = 11.42857142857142900000;
  x[46] = 11.68253968253968200000;
  x[47] = 11.93650793650793700000;
  x[48] = 12.19047619047619000000;
  x[49] = 12.44444444444444500000;
  x[50] = 12.69841269841269800000;
  x[51] = 12.95238095238095300000;
  x[52] = 13.20634920634920600000;
  x[53] = 13.46031746031746000000;
  x[54] = 13.71428571428571400000;
  x[55] = 13.96825396825396800000;
  x[56] = 14.22222222222222100000;
  x[57] = 14.47619047619047600000;
  x[58] = 14.73015873015872900000;
  x[59] = 14.98412698412698400000;
  x[60] = 15.23809523809523700000;
  x[61] = 15.49206349206349200000;
  x[62] = 15.74603174603174500000;
  x[63] = 16.00000000000000000000;

  var y = new List<double>.filled(64, 0);
  y[0] = -46.051701859880913680359;
  y[1] = -1.37054600415175140000;
  y[2] = -0.67739882359180614000;
  y[3] = -0.27193371548364181000;
  y[4] = 0.01574835696813911200;
  y[5] = 0.23889190828234888000;
  y[6] = 0.42121346507630347000;
  y[7] = 0.57536414490356180000;
  y[8] = 0.70889553752808443000;
  y[9] = 0.82667857318446791000;
  y[10] = 0.93203908884229414000;
  y[11] = 1.02734926864661900000;
  y[12] = 1.11436064563624870000;
  y[13] = 1.19440335330978530000;
  y[14] = 1.26851132546350720000;
  y[15] = 1.33750419695045860000;
  y[16] = 1.40204271808802970000;
  y[17] = 1.46266733990446450000;
  y[18] = 1.51982575374441310000;
  y[19] = 1.57389297501468910000;
  y[20] = 1.62518626940223940000;
  y[21] = 1.67397643357167160000;
  y[22] = 1.72049644920656440000;
  y[23] = 1.76494821177739820000;
  y[24] = 1.80750782619619410000;
  y[25] = 1.84832982071644910000;
  y[26] = 1.88755053386973050000;
  y[27] = 1.92529086185257750000;
  y[28] = 1.96165850602345240000;
  y[29] = 1.99674982583472250000;
  y[30] = 2.03065137751040400000;
  y[31] = 2.06344120033339480000;
  y[32] = 2.09518989864797510000;
  y[33] = 2.12596155731472880000;
  y[34] = 2.15581452046440970000;
  y[35] = 2.18480205733766210000;
  y[36] = 2.21297293430435850000;
  y[37] = 2.24037190849247290000;
  y[38] = 2.26704015557463420000;
  y[39] = 2.29301564197789490000;
  y[40] = 2.31833344996218480000;
  y[41] = 2.34302606255255650000;
  y[42] = 2.36712361413161700000;
  y[43] = 2.39065411154181100000;
  y[44] = 2.41364362976650960000;
  y[45] = 2.43611648561856820000;
  y[46] = 2.45809539233734360000;
  y[47] = 2.47960159755830700000;
  y[48] = 2.50065500675613930000;
  y[49] = 2.52127429395887500000;
  y[50] = 2.54147700127639450000;
  y[51] = 2.56127962857257430000;
  y[52] = 2.58069771442967570000;
  y[53] = 2.59974590940037050000;
  y[54] = 2.61843804241252310000;
  y[55] = 2.63678718108071930000;
  y[56] = 2.65480568658339780000;
  y[57] = 2.67250526368279880000;
  y[58] = 2.68989700639466770000;
  y[59] = 2.70699143975396780000;
  y[60] = 2.72379855807034900000;
  y[61] = 2.74032786002155990000;
  y[62] = 2.75658838089334020000;
  y[63] = 2.77258872223978110000;

  for (int i = 0; i < vnum; i++) {
    Expect.approxEquals(y[i], Math.log(x[i]), 1e14);
  }
}
