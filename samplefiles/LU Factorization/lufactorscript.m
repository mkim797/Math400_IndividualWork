A = [1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0;
1	1	1	1	0	0	0	0	0	0	0	0	0	0	0	0;
1	0	0	0	1	1	1	0	0	0	0	0	0	0	0	0;
1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1;
0	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0;
0	1	2	3	0	0	0	0	0	0	0	0	0	0	0	0;
0	1	0	0	0	0	0	1	0	0	1	0	0	1	0	0;
0	1	2	3	0	0	0	1	2	3	1	2	3	1	2	3;
0	0	0	0	1	0	0	0	0	0	0	0	0	0	0	0;
0	0	0	0	1	0	0	1	1	1	0	0	0	0	0	0;
0	0	0	0	1	2	3	0	0	0	0	0	0	0	0	0;
0	0	0	0	1	2	3	1	1	1	2	2	2	3	3	3;
0	0	0	0	0	0	0	1	0	0	0	0	0	0	0	0;
0	0	0	0	0	0	0	1	2	3	0	0	0	0	0	0;
0	0	0	0	0	0	0	1	0	0	2	0	0	3	0	0;
0	0	0	0	0	0	0	1	2	3	2	4	6	3	6	9]
b = p;
[lu, pvt, lupivoted] = LUfactor(A);
x = LUsolve(lu, b, pvt)