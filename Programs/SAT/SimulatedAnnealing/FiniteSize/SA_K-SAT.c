/* by FRT */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// #define K 3
// #define MAX_DEG 32
#define K 4
#define MAX_DEG 72
#define TEMP_MAX 0.2

#define FNORM   (2.3283064365e-10)
#define RANDOM  ((ira[ip++] = ira[ip1++] + ira[ip2++]) ^ ira[ip3++])
#define FRANDOM (FNORM * RANDOM)
#define pm1 ((FRANDOM > 0.5) ? 1 : -1)
#define sign(x) ((x) > 0 ? 1 : -1)
#define max(a,b) ((a) > (b) ? (a) : (b))

struct clause {
  int var[K], J[K], sat;
} *c;

struct var {
  int deg, cl[MAX_DEG], J[MAX_DEG], spin;
} *v;

int N, M, numUnsat;
double prob[MAX_DEG+1];
/* variabili globali per il generatore random */
unsigned myrand, ira[256];
unsigned char ip, ip1, ip2, ip3;

unsigned randForInit(void) {
  unsigned long long y;
  
  y = myrand * 16807LL;
  myrand = (y & 0x7fffffff) + (y >> 31);
  if (myrand & 0x80000000) {
    myrand = (myrand & 0x7fffffff) + 1;
  }
  return myrand;
}

void initRandom(void) {
  int i;
  
  ip = 128;    
  ip1 = ip - 24;    
  ip2 = ip - 55;    
  ip3 = ip - 61;
  
  for (i = ip3; i < ip; i++) {
    ira[i] = randForInit();
  }
}

float gaussRan(void) {
  static int iset = 0;
  static float gset;
  float fac, rsq, v1, v2;
  
  if (iset == 0) {
    do {
      v1 = 2.0 * FRANDOM - 1.0;
      v2 = 2.0 * FRANDOM - 1.0;
      rsq = v1 * v1 + v2 * v2;
    } while (rsq >= 1.0 || rsq == 0.0);
    fac = sqrt(-2.0 * log(rsq) / rsq);
    gset = v1 * fac;
    iset = 1;
    return v2 * fac;
  } else {
    iset = 0;
    return gset;
  }
}

void error(char *string) {
  fprintf(stderr, "ERROR: %s\n", string);
  exit(EXIT_FAILURE);
}

int initGraph(void) {
  int i,j, k, flag;

  for (i = 0; i < N; i++)
    v[i].deg = 0;
  for (i = 0; i < M; i++) {
    c[i].var[0] = (int)(FRANDOM * N);
    for (j = 1; j < K; j++)
      do {
	c[i].var[j] = (int)(FRANDOM * N);
	flag = 0;
	for (k = 0; k < j; k++)
	  if (c[i].var[k] == c[i].var[j]) flag = 1;
      } while (flag);
    for (j = 0; j < K; j++) {
      c[i].J[j] = pm1;
      if (v[c[i].var[j]].deg == MAX_DEG) return 1;
      v[c[i].var[j]].cl[v[c[i].var[j]].deg] = i;
      v[c[i].var[j]].J[v[c[i].var[j]].deg] = c[i].J[j];
      v[c[i].var[j]].deg++;
    }
  }
  return 0;
}

void initSpin(void) {
  int i;
  struct clause *pc;
  struct var *pv;

  for (pv = v; pv < v + N; pv++)
    pv->spin = pm1;
  numUnsat = 0;
  for (pc = c; pc < c + M; pc++) {
    pc->sat = 0;
    for (i = 0; i < K; i++)
      pc->sat += (1 + pc->J[i] * v[pc->var[i]].spin) / 2;
    numUnsat += (pc->sat == 0);
  }
}

void initProb(double temp) {
  int i;

  prob[0] = 1.0;
  if (temp <= 0.0)
    for (i = 1; i <= MAX_DEG; i++)
      prob[i] = 0.0;
  else
    for (i = 1; i <= MAX_DEG; i++)
      prob[i] = exp(-i /temp);
}     

void oneMCS(void) {
  struct var *pv;
  int i, dE;

  for (pv = v; pv < v + N; pv++) {
    dE = 0;
    for (i = 0; i < pv->deg; i++) {
      dE -= (c[pv->cl[i]].sat == 0);
      dE += (c[pv->cl[i]].sat == 1) * (1 + pv->spin * pv->J[i]) / 2;
    }
    if (dE <= 0 || FRANDOM < prob[dE]) {
      pv->spin = -pv->spin;
      numUnsat += dE;
      for (i = 0; i < pv->deg; i++)
	c[pv->cl[i]].sat += pv->spin * pv->J[i];
    }
  }
}

void checkEner(void) {
  struct clause *pc;
  int sum, tmp, i;

  sum = 0;
  for (pc = c; pc < c + M; pc++) {
    tmp = 0;
    for (i = 0; i < K; i++)
      tmp += (1 + v[pc->var[i]].spin * pc->J[i]) / 2;
    if (tmp != pc->sat) error("sat");
    sum += (tmp == 0);
  }
  if (sum != numUnsat) error("numUnsat");
}


int main(int argc, char *argv[]) {
  int i, nIter, is, numSamples, lowestUnsat;
  double alpha;
  FILE *devran = fopen("/dev/urandom","r");
  fread(&myrand, 4, 1, devran);
  fclose(devran);

  if (argc != 5) {
    fprintf(stderr, "usage: %s alpha log(N) log(nIter) numSamples\n", argv[0]);
    exit(EXIT_FAILURE);
  }
  alpha = atof(argv[1]);
  N = 1 << atoi(argv[2]);
  nIter = 1 << atoi(argv[3]);
  numSamples = atoi(argv[4]);

  M = (int)(alpha * N + 0.5);
  v = (struct var *)calloc(N, sizeof(struct var));
  c = (struct clause *)calloc(M, sizeof(struct clause));
  
  printf("# SA for random K-SAT\n");
  printf("# K = %i   N = %i   M = %i   seed = %u\n",
	 K, N, M, myrand);
  printf("# alpha = %f   nIter = %i  Tmax = %f\n", (float)M/N, nIter, TEMP_MAX);
  printf("# 1:lowestUnsat  2:runTime\n");
  initRandom();
  for (is = 0; is < numSamples; is++) {
    while(initGraph());
    initSpin();
    lowestUnsat = numUnsat;
    i = nIter;
    while (lowestUnsat && i > 0) {
      i--;
      initProb(TEMP_MAX * i / nIter);
      oneMCS();
      if (numUnsat < lowestUnsat)
	lowestUnsat = numUnsat;
    }
    printf("%i %i\n", lowestUnsat, nIter-i);
    fflush(stdout);
  }
  return EXIT_SUCCESS;
}
