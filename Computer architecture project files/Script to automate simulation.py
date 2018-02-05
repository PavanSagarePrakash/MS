import os
cpu_type=["TimingSimpleCPU"]
l1d_assoc=["1","4","8"]#default 2
l1i_assoc=["1","4","8"]#default 2
l2_assoc=["1","2","4","8"]#default 1
lin_size=["64","128"]#default 64
L1D=["256"]
L1I=["256"]
x=288

#print "hello"
for cpu_t in range(len(cpu_type)):
	for l1d_as in range(len(l1d_assoc)):
		for l1i_as in range(len(l1i_assoc)):
			for l2_as in range(len(l2_assoc)):
				for blk_sz in range(len(lin_size)):
					for L1D_size in range(len(L1D)):
						for L1I_size in range(len(L1I)):
					
							ARG1 = "/home/Pavan/gem5"
							ARG2 = "/home/Pavan/gem5/Project1_SPEC-master/401.bzip2/src/benchmark"
							ARG3 = "/home/Pavan/gem5/Project1_SPEC-master/401.bzip2/data/input.program"
							ARG4 = "time "+ARG1+"/build/X86/gem5.opt -d /home/Pavan/gem5/Project1_SPEC-master/401.bzip2/results_bzip_512 --stats-file=stats_"+str(x)+".txt "+ARG1+"/configs/example/se.py -c "+ARG2+" -o \"%s\" -I 500000000 --cpu-type="%ARG3+str(cpu_type[cpu_t])+" --caches --l2cache --"
							ARG5 = "l1d_size=" + str(L1D[L1D_size]) + "kB --"
							ARG6 = "l1i_size=" + str(L1I[L1I_size]) + "kB --"
							ARG7 = "l2_size=1MB --l1d_assoc="+str(l1d_assoc[l1d_as])+" --l1i_assoc="+str(l1i_assoc[l1i_as])+" --l2_assoc="+str(l2_assoc[l2_as])+" --cacheline_size="+str(lin_size[blk_sz])
							retvalue = ARG4 + ARG5 + ARG6 + ARG7
							#print retvalue 
							x+=1
							os.system("%s" %retvalue)
