include Make.defines

all: get_ifi_info_plus.o prifinfo_plus.o server client testClient testClient2 testChunkFile CircularBufferNode
	${CC} -o prifinfo_plus prifinfo_plus.o get_ifi_info_plus.o ${LIBS}

get_ifi_info_plus.o: get_ifi_info_plus.c
	${CC} ${CFLAGS} -c get_ifi_info_plus.c ${UNP}

prifinfo_plus.o: prifinfo_plus.c
	${CC} ${CFLAGS} -c prifinfo_plus.c ${UNP}

server: server.o input.o dtghdr.o
	${CC} ${FLAGS} -o server server.o  input.o dtghdr.o ${LIBS}
server.o: server.c
	${CC} ${FLAGS} -c server.c ${UNP}	
client: client.o input.o ifs.o dtghdr.o
	${CC} ${FLAGS} -o client client.o input.o ifs.o dtghdr.o ${LIBS}
client.o: client.c 
	${CC} ${FLAGS} -c client.c ${UNP}	
input.o: input.c
	${CC} ${FLAGS} -c input.c ${UNP}
dtghdr.o: dtghdr.c
	${CC} ${FLAGS} -c dtghdr.c ${UNP}

testChunkFile: testChunkFile.o
	${CC} ${FLAGS} -o testChunkFile testChunkFile.o ${LIBS}
testChunkFile.o: testChunkFile.c
	${CC} ${FLAGS} -c testChunkFile.c ${UNP}

CircularBufferNode: CircularBufferNode.o
	${CC} ${FLAGS} -o CircularBufferNode CircularBufferNode.o  dtghdr.o ${LIBS}
CircularBufferNode.o: CircularBufferNode.c
	${CC} ${FLAGS} -c CircularBufferNode.c dtghdr.o ${UNP}	

testClient: testClient.o
	${CC} ${FLAGS} -o testClient testClient.o ${LIBS}
testClient.o: testClient.c
	${CC} ${FLAGS} -c testClient.c ${UNP}

testClient2: testClient2.o
	${CC} ${FLAGS} -o testClient2 testClient2.o ${LIBS}
testClient2.o: testClient2.c
	${CC} ${FLAGS} -c testClient2.c ${UNP}

clean:
	rm prifinfo_plus prifinfo_plus.o get_ifi_info_plus.o server server.o client client.o testClient testClient.o input.o testClient2.o testClient2 testChunkFile testChunkFile.o ifs.o CircularBufferNode.o CircularBufferNode
