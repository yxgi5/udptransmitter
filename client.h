#include "clientCircularBuffer.h"

#ifndef __client_h
#define __client_h

struct threadArgs {
	uint32_t sockfd;
	int sockOptions;
	char* fileName;	
	uint32_t fin;
	int seed;
	int mean;
	float dropRate;
};

typedef struct threadArgs ThreadArgs;

#endif