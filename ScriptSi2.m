entradas = xlsread('SIBD.xlsx','ENTRADAS')';
salidasDeseadas = xlsread('SIBD.xlsx','SALIDAS')';

arquitectura = [9 7 10 3 6];

rna = patternnet(arquitectura);
rna = train(rna, entradas, salidasDeseadas);